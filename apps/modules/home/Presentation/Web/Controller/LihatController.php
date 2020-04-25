<?php

namespace Its\Example\Home\Presentation\Web\Controller;

use Its\Example\Home\Presentation\Web\Models\Barang;
use Its\Example\Home\Presentation\Web\Models\Inbox;
use Its\Example\Home\Presentation\Web\Models\Users;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class LihatController extends Controller
{
    public function initialize(){

    $this->inbox = new Inbox();
    
      
   
    }

    public function indexAction()
    {
        $id =$this->request->getQuery('id');
        $barang = $this->db->query("SELECT users.username,barang.*
        FROM users,barang
        WHERE users.id = barang.idpemilik AND barang.id ='".$id."'")->fetchAll();
        $userid = $this->session->get('user-id');
        $user = Barang::find("idpemilik='".$userid."'");

        $this->view->setVars([
            "barangs" =>$barang,
            "userinfos" =>$user,


         ]);

        

    
    
    }

    public function kirimAction()
    {
        if($this->request->isPost()){
            $this->inbox->assign($this->request->getPost(),[
                "judul",
                "usernamepengirim",
                "usernamepenerima",
                "pesan",


            ]);
             
        $this->inbox->usernamepenerima =  $this->request->getPost('usernamepenerima');
    
        if($this->inbox->save()){
            return $this->response->redirect();
        }

        else{
            var_dump($this->inbox);

        }
    }

    }
    
}