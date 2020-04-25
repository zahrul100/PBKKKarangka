<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Its\Example\Dashboard\Presentation\Web\Models\Barang;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class UploadController extends Controller
{
    public function initialize(){
        
        $this->barang = new Barang();

   
    }


    public function indexAction()
    {
        
        $check = $this->db->query("SELECT id FROM  users WHERE username = '".$this->session->get('user-name')."'")->fetchAll();
        $userid = $check[0]['id'];
        $this->view->setVars([
            "userid" =>$userid,



            ]
        );
    }
    public function uploadAction(){
        
        if($this->request->isPost()){
            
            $this->barang->assign(
                $this->request->getPost(),
                [
                    'nama',
                    'kategori',
                    'keterangan',
                    'foto',
                    'target_tukar',
                    'idpemilik'
                ]
            );

        }
        if ($this->request->hasFiles() == true) {
            //Print the real file names and their sizes
            $file = file_get_contents($_FILES['foto']['tmp_name']);
            $file = base64_encode($file);
            $this->barang->foto = $file;
            // $this->barang->save();
        }
  
    
        if($this->barang->save()){
            
             return $this->response->redirect($_SERVER['HTTP_REFERER']);
        }
        else{
            return "upload gagal";
        }

   
    }

    public function deleteAction($id){
      
        $id = Barang::findFirst($id);
        if($id->delete()){
            return $this->response->redirect($this->request->getHTTPReferer());
        }
   
    }

    public function editAction($id)
    {
       $barang = Barang::findFirst($id);
        
        $this->view->setVars([

            'barang' => $barang,
            'id'     => $id
        ]);
    }

    public function editpostAction()
    { 
        $this->barang = Barang::findFirst($this->request->getPost('id'));
        // return $this->request->getPost('id');
        $this->barang->assign(
            $this->request->getPost(),
        );
        if ($this->request->hasFiles() == true) {
            //Print the real file names and their sizes
            $file = file_get_contents($_FILES['foto']['tmp_name']);
            $file = base64_encode($file);
            $this->barang->foto = $file;
            // $this->barang->save();
        }
        if($this->barang->update()){


            return $this->response->redirect($_SERVER['HTTP_REFERER']);
           // return $this->response->redirect("/dashboard");
        }
        else{
            return "Update Gagal";
        }

    }

    
}