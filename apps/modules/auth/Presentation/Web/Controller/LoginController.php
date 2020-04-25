<?php

namespace Its\Example\Auth\Presentation\Web\Controller;

use Its\Example\Auth\Presentation\Web\Form\SignupForm;

use Its\Example\Auth\Presentation\Web\Models\Users;
use Phalcon\Mvc\Controller;
use Phalcon\Security;
use Phalcon\Session\Manager;
//validation
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Url;
use Phalcon\Validation\Validator\Regex as RegexValidation;
class LoginController extends Controller
{

    public function initialize(){
        $this->users = new Users();
        $this->security = new Security();
    }
   
  
    public function indexAction(){
        
        if($this->request->isPost()){

            $this->users->assign(
                $this->request->getPost(),
                [
                    'username',
                    'password'
                ]
            );

            
            $check = $this->db->query("select * from  users where username = '".$this->users->username."'")->fetchAll();
            if($check){
                foreach($check as $cek){

                    if($this->security->checkHash($this->users->password,$cek['password'])){

                        if($cek['banned'] == 1){

                            $this->view->message = "User Telah Dibanned Oleh Admin";
                    
                            return $this->view;    

                        }





                        $this->session->set('user-name', $cek['username']);
                        $this->session->set('user-id', $cek['id']);
                        $this->session->set('user-admin', $cek['isadmin']);
                        return $this->response->redirect("/dashboard");
                    }

                    else {
                    
                        $this->security->hash(rand());

                        $this->view->message = "password salah";
                    
                        return $this->view;    
                    
                    }

                }
                
            }



            else{

                $this->view->message = "username tidak ditemukan";
                return $this->view;        
                 
            }




        }


    }

  

  

}