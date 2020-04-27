<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Its\Example\Dashboard\Presentation\Web\Models\Barang;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class IndexController extends Controller
{
    public function initialize(){
       
    $this->users = new Barang();
     if(!$this->session->get('user-name')){
         return $this->response->redirect('/home');
     }
    if($this->session->get('user-admin') == 1){
        return $this->response->redirect('/dashboard/admin/');
    }
   
    }
    public function indexAction()
    {    
        // $this->flash->success('The carrier was successfully activated');
    
        $check = $this->db->query("SELECT id FROM  users WHERE username = '".$this->session->get('user-name')."'")->fetchAll();
        $id = $check[0]['id'];
        $barang = $this->db->query("SELECT * FROM  barang WHERE idpemilik = '".$id."' AND blokir = 0")->fetchAll();
        $barter = $this->db->query("SELECT * FROM  barter WHERE username = '".$this->session->get('user-name')."'")->fetchAll();
        $tawaran = $this->db->query("SELECT * FROM  tawaran WHERE usernamepemilik = '".$this->session->get('user-name')."'")->fetchAll();

        $this->view->setVars([
            "barangs" =>$barang,
            "tawarans" =>$tawaran,
            "barters" =>$barter,



    ]);
    
    }

    
}