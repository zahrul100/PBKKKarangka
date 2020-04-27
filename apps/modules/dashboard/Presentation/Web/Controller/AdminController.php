<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;
use Phalcon\Security;
use Its\Example\Dashboard\Presentation\Web\Models\Users;

use Its\Example\Dashboard\Presentation\Web\Models\Barang;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;


class AdminController extends Controller
{
   
    public function initialize(){

        if($this->session->get('user-admin') == 0 ){
            return $this->response->redirect('/dashboard/');
        }
    }

    public function indexAction()
    {
        $check = $this->db->query("SELECT id FROM  users WHERE username = '".$this->session->get('user-name')."'")->fetchAll();
        $id = $check[0]['id'];
        $barang = $this->db->query("SELECT * FROM  barang ")->fetchAll();
        $users = $this->db->query("SELECT * FROM  users where isadmin != 1")->fetchAll();

        $this->view->setVars([
            "barangs" =>$barang,
            "users" =>$users,



    ]);

    }

    public function barangAction()
    {
          
        $barangs = $this->db->query("SELECT barang.*,users.username FROM  barang,users where users.id = barang.idpemilik")->fetchAll();

        $this->view->setVars([
            "barangs" =>$barangs,



    ]);

    }

    public function userAction()
    {
        
        $users = $this->db->query("SELECT * FROM  users Where isadmin != 1")->fetchAll();

        $this->view->setVars([
            "users" =>$users,



    ]);


    }

    public function bannedAction($id)
    {
        
        $users = Users::findFirst($id);
        $this->flashSession->success($users->username.' Telah Berhasil Dibanned');
        $users->banned = 1;
        $users->update();
        return $this->response->redirect('/dashboard/admin/user');


    }


    public function unbannedAction($id)
    {
        
        $this->flashSession->success('Mengaktifkan User Berhasil');
        $users = Users::findFirst($id);
        $users->banned = 0;
        $users->update();
        return $this->response->redirect('/dashboard/admin/user');


    }

    public function blokirAction($id)
    {
        
        $barang = Barang::findFirst($id);
        $barang->blokir = 1;
        $barang->update();
        return $this->response->redirect('/dashboard/admin/barang');


    }


    public function unblokirAction($id)
    {
        
        $barang = Barang::findFirst($id);
        $barang->blokir = 0;
        $barang->update();
        return $this->response->redirect('/dashboard/admin/barang');


    }



  

  

}