<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;
use Phalcon\Security;

use Its\Example\Dashboard\Presentation\Web\Models\Users;
use Its\Example\Dashboard\Presentation\Web\Models\Barter;
use Its\Example\Dashboard\Presentation\Web\Models\Tawaran;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;


class BarterController extends Controller
{


    public function initialize(){

        $this->barter = new Barter();

    }

   
    public function indexAction()
    {
        $barters = $this->db->query("SELECT barter.id as idbarter,barter.status as barterstatus,tawaran.*,barangpemilik.nama as namabarang,barangpenawar.nama as namabarangpenawar,barangpemilik.username as usernamepemilikbarang,barangpenawar.username as usernamepenawarbarang from barter,tawaran,(SELECT barang.nama,barang.id,users.username FROM barang,users WHERE barang.idpemilik = users.id ) as barangpemilik,(SELECT barang.nama,barang.id,users.username FROM barang,users WHERE barang.idpemilik = users.id) as barangpenawar WHERE barter.idtawaran = tawaran.id AND tawaran.idbarang = barangpemilik.id AND tawaran.idbarangtawaran = barangpenawar.id AND barter.username = '".$this->session->get('user-name')."'")->fetchAll();

        $this->view->setVars([
            "barters" =>$barters,



    ]);
    
        return $this->view;

    }

    public function infoAction()
    {
        $id = $this->request->getQuery('id');

        $barters = $this->db->query("SELECT barter.*,barang.nama as namabarang FROM barter,barang WHERE barter.idbarang = barang.id AND barter.idtawaran = '".$id."'")->fetchAll();

       
        $this->view->setVars([
            "barters" =>$barters,



    ]);
    
        return $this->view;

    }

    public function kirimAction()
    {

        $this->barter = Barter::findFirst($this->request->getPost('idbarter'));
        // return $this->request->getPost('id');
        // var_dump($this->request->getPost());
        $this->barter->noresi = $this->request->getPost('noresi');
        $this->barter->status = $this->request->getPost('status');
        $this->barter->date = $date_string = (new \DateTime('now'))->format('Y-m-d H:i:s');
        if ($this->request->hasFiles() == true) {
            //Print the real file names and their sizes
            $file = file_get_contents($_FILES['buktitransfer']['tmp_name']);
            $file = base64_encode($file);
            $this->barter->buktitransfer = $file;
            
        }
        //  return var_dump($this->request->getPost());
        
        //  return var_dump($this->barter);
        if($this->barter->update()){
            return $this->response->redirect('/dashboard/barter');
        }
        else{
            return "update gagal";
        }

    }

    public function terimaAction()
    {

        $this->barter = Barter::findFirst($this->request->getQuery('idbarter'));
        // return $this->request->getPost('id');
        // var_dump($this->request->getPost());
        $this->barter->status = "Barang Diterima";
     
        $this->barter->date = $date_string = (new \DateTime('now'))->format('Y-m-d H:i:s');

        if($this->barter->update()){
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        }
        else{
            return "update gagal";
        }

    }
  

  

}