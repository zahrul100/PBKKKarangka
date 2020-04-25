<?php

namespace Its\Example\Dashboard\Presentation\Web\Models;

use Phalcon\Mvc\Model;

class Users extends Model
{
    public $username;
    public $nama;
    public $password;
    public $email;
    public $isadmin;
    public $banned;    
}
