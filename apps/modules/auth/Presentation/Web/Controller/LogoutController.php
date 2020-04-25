<?php

namespace Its\Example\Auth\Presentation\Web\Controller;

use Its\Example\Auth\Presentation\Web\Models\Barang;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class LogoutController extends Controller
{

    public function indexAction()
    {
        $this->session->destroy();
        return $this->response->redirect("/home");
    }
    

    
}