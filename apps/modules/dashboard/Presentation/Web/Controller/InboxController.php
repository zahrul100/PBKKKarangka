<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;
use Phalcon\Security;

use Its\Example\Dashboard\Presentation\Web\Models\Inbox;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;


class InboxController extends Controller
{
    public function initialize(){

        $this->inbox = new Inbox();

    }


    public function indexAction()
    {
        $inboxs = $this->db->query("SELECT * FROM  inbox WHERE usernamepenerima = '".$this->session->get('user-name')."' ORDER BY time DESC")->fetchAll();

        $this->view->setVars([
                    "inboxs" =>$inboxs



            ]);
    }

    public function terkirimAction()
    {
        $outboxs = $this->db->query("SELECT * FROM  inbox WHERE usernamepengirim = '".$this->session->get('user-name')."' ORDER BY time DESC")->fetchAll();

        $this->view->setVars([
                    "outboxs" =>$outboxs



            ]);
    }


    public function bacaAction($id){

        $pesan = $this->db->query("SELECT * FROM  inbox WHERE id = '".$id."'")->fetchAll();
        $pesan = $pesan[0];
        $this->view->setVars([
            "pesan" =>$pesan



    ]);

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
    public function kirimAction()  {
        if($this->request->isPost()){
            $this->inbox->assign($this->request->getPost(),[
                "judul",
                "usernamepengirim",
                "usernamepenerima",
                "pesan",


            ]);
             
        $this->inbox->usernamepenerima =  $this->request->getPost('usernamepenerima');
    
        if($this->inbox->save()){
            return $this->response->redirect("/dashboard/inbox/terkirim/");
        }

        else{
            var_dump($this->inbox);

        }
    }

    }

  

}