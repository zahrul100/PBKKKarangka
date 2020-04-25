<?php

namespace Its\Example\Home\Presentation\Web\Controller;

use Its\Example\Home\Presentation\Web\Models\Barang;
use Its\Example\Home\Presentation\Web\Models\Users;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class IndexController extends Controller
{
    public function initialize(){

    $this->barang = new Barang();
    $this->users = new Users();
     
      
   
    }
    public function indexAction()
    {
        $nama = $this->request->getQuery('nama');
        $kategori = $this->request->getQuery('kategori');
        $barangkita = $this->request->getQuery('barang');
    
        if(strlen($nama)>0){
       
        $barang = $this->db->query("SELECT users.username,barang.*
        FROM users,barang
        WHERE users.id = barang.idpemilik AND barang.nama LIKE '%".$nama."%' AND barang.blokir = 0")->fetchAll();
        }

        else if(strlen($barangkita)>0){
       
            $barang = $this->db->query("SELECT users.username,barang.*
            FROM users,barang
            WHERE users.id = barang.idpemilik AND barang.target_tukar LIKE '%".$barangkita."%' AND barang.blokir = 0")->fetchAll();
            }
    


        else if(strlen($kategori)>0){


        $barang = $this->db->query("SELECT users.username,barang.*
        FROM users,barang
        WHERE users.id = barang.idpemilik AND barang.kategori = '".$kategori."' AND barang.blokir = 0")->fetchAll();

        }

        else{
        $barang = $this->db->query("SELECT users.username,barang.*
        FROM users,barang
        WHERE users.id = barang.idpemilik AND barang.blokir = 0 ")->fetchAll();
        }
        // return $barang['idpemilik'];
        // $users = Users::find("id = [7,63]");
       // return $barang['id'];
        
        $this->view->setVars([
            "barangs" =>$barang,
            "users" =>$users,


    ]);
    
    }
    public function cariAction()
    {
        return $this->request->getQuery('asd');
        $barang = $this->db->query("SELECT * FROM  barang")->fetchAll();
    }
}