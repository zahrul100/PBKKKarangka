<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Its\Example\Dashboard\Presentation\Web\Models\Detailuser;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class ProfilController extends Controller
{
    public function initialize(){

    $this->detailuser = new detailuser();
     
      
   
    }
    public function indexAction()
    {
        
        $detailuser = $this->db->fetchOne("SELECT * FROM  detailuser WHERE username = '".$this->session->get('user-name')."'");
        //  return $detailuser['username'];
        $this->view->setVars([
            "detailuser" =>$detailuser,
        



    ]);
    
    }
    public function umumAction()
    {
        
        $detailuser = $this->db->fetchOne("SELECT * FROM  detailuser WHERE username = '".$this->request->getQuery('username')."'");
        
        $this->view->setVars([
            "detailuser" =>$detailuser,
        



    ]);
    
    }

    public function editpostAction()
    { 
        // return var_dump($this->request->getPost());
        $this->detailuser = Detailuser::findFirst("username =  '".$this->request->getPost('username')."'");
        // return $this->request->getPost('id');
        $this->detailuser->assign($this->request->getPost(),[
            "username",
            "namalengkap",
            "nohp",
            "kodepos",
            "alamat",
            "norek",
            "bank",


        ]);
        // return $this->request->getPost('username');
        if ($this->request->hasFiles() == true) {
            //Print the real file names and their sizes
            // return "adafile";
            $file = file_get_contents($_FILES['foto']['tmp_name']);
            $file = base64_encode($file);
            $this->detailuser->foto = $file;
            // $this->barang->save();
        }
        if($this->detailuser->update()){


            return $this->response->redirect($_SERVER['HTTP_REFERER']);
           // return $this->response->redirect("/dashboard");
        }
        else{
            return "Update Gagal";
        }

    }

    
}