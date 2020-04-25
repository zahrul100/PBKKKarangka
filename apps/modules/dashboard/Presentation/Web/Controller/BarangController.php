<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;
use Phalcon\Security;

use Its\Example\Dashboard\Presentation\Web\Models\Users;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;


class BarangController extends Controller
{
   
    public function indexAction()
    {
        $check = $this->db->query("SELECT id FROM  users WHERE username = '".$this->session->get('user-name')."'")->fetchAll();
        $id = $check[0]['id'];
        $barang = $this->db->query("SELECT * FROM  barang WHERE idpemilik = '".$id."' AND blokir = 0")->fetchAll();

        $this->view->setVars([
            "barangs" =>$barang,
            "userid" => $id



    ]);
    
        return $this->view;

    }


  

  

}