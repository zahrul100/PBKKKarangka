<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;
use Phalcon\Security;

use Its\Example\Dashboard\Presentation\Web\Models\Barang;
use Its\Example\Dashboard\Presentation\Web\Models\Tawaran;
use Its\Example\Dashboard\Presentation\Web\Models\Barter;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;


class TawaranController extends Controller
{
    public function initialize(){

        $this->tawaran = new Tawaran();
        $this->barter = new Barter();

    }


    public function indexAction()
    {
        $tawarans = $this->db->query("SELECT tawaran.*,barang.nama ,baranga.nama as namabarang
        FROM tawaran,barang,(SELECT barang.nama,tawaran.id FROM tawaran,barang WHERE barang.id = tawaran.idbarangtawaran) as baranga 
        WHERE barang.id = tawaran.idbarang AND tawaran.id = baranga.id AND usernamepemilik = '".$this->session->get('user-name')."'")->fetchAll();
        

        $tawarkans = $this->db->query("SELECT tawaran.*,barang.nama ,baranga.nama as namabarang
        FROM tawaran,barang,(SELECT barang.nama,tawaran.id FROM tawaran,barang WHERE barang.id = tawaran.idbarangtawaran) as baranga 
        WHERE barang.id = tawaran.idbarang AND tawaran.id = baranga.id AND usernamepenawar = '".$this->session->get('user-name')."'")->fetchAll();
        
        // $tawarkans = $this->db->query("SELECT * FROM  tawaran WHERE usernamepenawar = '".$this->session->get('user-name')."'")->fetchAll();
        
        $this->view->setVars([
            "tawarans" =>$tawarans,
            "tawarkans" =>$tawarkans,



            ]);
    }

    public function tolakAction($id)
    {
        
        $this->tawaran = Tawaran::findFirst($id);
        $this->tawaran->status = "Ditolak";
        if($this->tawaran->update()){
        return $this->response->redirect("/dashboard/tawaran/");
        }
        else{
            return "update gagal";
        }
    }


    public function dealAction($id)
    {
        
        $this->tawaran = Tawaran::findFirst($id);
        $this->tawaran->status = "Deal";
        if($this->tawaran->update()){
            $this->barter->idtawaran = $id;
            $this->barter->username = $this->tawaran->usernamepemilik;
            $this->barter->idbarang = $this->tawaran->idbarang;
            $this->barter->save();
            
            $this->barang = Barang::findFirst($this->tawaran->idbarang);
            $this->barang->blokir = 1;
            if($this->barang->update()){


              return $this->response->redirect("/dashboard/tawaran/deal2/".$id);
            }
            else{
                return "Update barang1 Gagal";
            }

        }
        else{
            return "Save Barter1 Gagal";
        }
    }

    public function deal2Action($id)
    {
        
        $this->barter->idtawaran = $id;
        $this->tawaran = Tawaran::findFirst($id);
        $this->barter->username = $this->tawaran->usernamepenawar;
        $this->barter->idbarang = $this->tawaran->idbarangtawaran;
      
        if(  $this->barter->save()){
         

            $this->barang = Barang::findFirst($this->tawaran->idbarangtawaran);
            $this->barang->blokir = 1;
            if($this->barang->update()){
                return $this->response->redirect("/dashboard/tawaran/");
            }
            else{
                return "Update Barang2 Gagal";
            }
        }
        else{
            return "Save Barter2 gagal";
        }
    }




    public function editAction(){

        $this->tawaran = Tawaran::findFirst($this->request->getPost('id'));
        // return $this->request->getPost('id');
        $this->tawaran->tambahan =$this->request->getPost('tambahan');

        $this->tawaran->idbarangtawaran =$this->request->getPost('idbarang');
        $this->tawaran->idbarang =$this->request->getPost('idbarangtawaran');

        $this->tawaran->usernamepemilik =$this->request->getPost('usernamepemilik');
        $this->tawaran->usernamepenawar =$this->request->getPost('usernamepenawar');
        $this->tawaran->status ='Menunggu Konfirmasi Perubahan';
        
        $this->tawaran->date = $date_string = (new \DateTime('now'))->format('Y-m-d H:i:s');
        if($this->tawaran->update()){
        return $this->response->redirect("/dashboard/tawaran/");
        }
        else{
            return "update gagal";
        }

    }

    public function tulisAction(){

        $kepada = $this->request->getQuery('kepada');
        // return $kepada;
        // $pesan = $this->db->query("SELECT * FROM  inbox WHERE id = '".$id."'")->fetchAll();
        // $pesan = $pesan[0];

        // return $kepada;
        $this->view->setVars([
            "kepada" =>$kepada



    ]);

    }
    public function TawarAction()  {
        if($this->request->isPost()){
            $this->tawaran->assign($this->request->getPost(),[
                "usernamepemilik",
                "idbarang",
                "usernamepenawar",
                "idbarangtawaran",
                "tambahan",
                "status",


            ]);
             
        $this->tawaran->usernamepemilik =  $this->request->getPost('usernamepemilik');
                
        if($this->tawaran->save()){
        //   return "berhasil";
          return $this->response->redirect("/dashboard/tawaran/");
        }

        else{
            var_dump($this->tawaran);

        }
    }

    }

  

}