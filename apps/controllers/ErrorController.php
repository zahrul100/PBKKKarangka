<?php

namespace Its\Common\Controller;
use Phalcon\Mvc\Controller;

class ErrorController extends Controller
{

    public function route404Action()
    {
        // return '404 - not found';
    }

    public function serverErrorAction()
    {
        echo 'Server Error';
    }

    public function errorAction()
    {
        echo 'Terjadi Error';
    }

}