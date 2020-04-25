<?php


namespace Its\Example\Auth\Presentation\Web\Controller;

use Its\Example\Auth\Presentation\Web\Form\SignupForm;

use Its\Example\Auth\Presentation\Web\Models\Users;
use Its\Example\Auth\Presentation\Web\Models\Detailuser;

use Phalcon\Mvc\Controller;
use Phalcon\Security;
use Phalcon\Session\Manager;
//validation
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Url;
use Phalcon\Validation\Validator\Regex as RegexValidation;



class RegisterController extends Controller
{
    public $validator;

    public function initialize(){

    $this->detailuser = new Detailuser(); 
    $this->users = new Users();
    $this->security = new Security();
    
    $this->validator = new Validation();

    $this->validator->add('username',
    new PresenceOf([
        'message'=> 'username required'
    ])
    );

    $this->validator->add('password', new RegexValidation([
        'message' => 'Password paling sedikit terdiri dari
         8 karakter dan harus memiliki kombinasi huruf dan angka',

         'pattern' => '/^\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])\S*$/',
    
    ]));
    $this->validator->add('email',
    new PresenceOf([
        'message'=> 'email required'
    ])
    );
    $this->validator->add('email',
    new Email([
        'message' => 'Email tidak valid'
    ])
    );

   
}
 
    public function indexAction()
    {
        // insert data ke table pegawai
        $this->view->form = new SignupForm();  
        if($this->request->isPost()){
            $keluaran = "<br>";
         
            $this->users->assign(
                $this->request->getPost(),
                [
                    'username',
                    'nama',
                    'email',
                    'password'
                ]
            );
        $this->users->isadmin = 0;
        $check = $this->db->query("select * from  users where username = '".$this->users->username."'")->fetchAll();
        $checkemail = $this->db->query("select * from  users where email = '".$this->users->email."'")->fetchAll();
       
        
        if($check || $checkemail){
            if($check){
                $this->view->message = $this->view->message."Username Telah Digunakan<br>";
             }

             if($checkemail){
               $this->view->message = $this->view->message."Email Telah Digunakan";
            }
            return $this->view;
        }
        
        else{



            if(count($this->validator->validate($_POST))){
                foreach ($this->validator->validate($_POST) as $message)
                    $keluaran = $keluaran.$message . "<br>";
                $this->view->message = $keluaran;
                return $this->view;
            }

            $this->users->password = $this->security->hash($this->users->password);
        
            if($success = $this->users->save()){

                $this->view->message = "Pendaftaran berhasil";
                $sesi = $this->db->query("select * from  users where username = '".$this->users->username."'")->fetchAll();
                $sesi = $sesi[0];
                // return $sesi['username'];
                $this->session->set('user-name',$sesi['username']);
                $this->session->set('user-id',$sesi['id']);

                $this->detailuser->username = $sesi['username'];
                $this->detailuser->namalengkap = " ";
                $this->detailuser->nohp = " ";
                $this->detailuser->alamat = " ";
                $this->detailuser->kodepos =" ";
                $this->detailuser->foto = " ";
                $this->detailuser->norek = " ";
                $this->detailuser->bank = " ";
                $this->detailuser->save();
                return $this->response->redirect("/dashboard/profil");
            }
            else{
                $this->view->message = "Maaf Pendaftaran Gagal";
                return $this->view;
            }
        }
        
        
        }

    
    }
  

  

}