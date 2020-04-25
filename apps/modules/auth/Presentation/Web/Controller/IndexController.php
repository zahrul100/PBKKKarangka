<?php

namespace Its\Example\Auth\Presentation\Web\Controller;

use Its\Example\Auth\Presentation\Web\Form\SignupForm;

use Its\Example\Auth\Presentation\Web\Models\Users;
use Phalcon\Mvc\Controller;
use Phalcon\Security;
use Phalcon\Session\Manager;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Url;
use Phalcon\Validation\Validator\Regex as RegexValidation;


class indexController extends Controller
{
     

    public function indexAction()
    {
        return $this->response->redirect("/home");
    }




}