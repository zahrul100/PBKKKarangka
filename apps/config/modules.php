<?php

return array(
    
    'home' => [
        'namespace' => 'Its\Example\Home',
        'webControllerNamespace' => 'Its\Example\Home\Presentation\Web\Controller',
        'apiControllerNamespace' => '',
        'className' => 'Its\Example\Home\Module',
        'path' => APP_PATH . '/modules/home/Module.php',
        'defaultRouting' => true,
        'defaultController' => 'index',
        'defaultAction' => 'index'
    ],
    
    'dashboard' => [
        'namespace' => 'Its\Example\Dashboard',
        'webControllerNamespace' => 'Its\Example\Dashboard\Presentation\Web\Controller',
        'apiControllerNamespace' => '',
        'className' => 'Its\Example\Dashboard\Module',
        'path' => APP_PATH . '/modules/dashboard/Module.php',
        'defaultRouting' => true,
        'defaultController' => 'index',
        'defaultAction' => 'index'
    ],
    'auth' => [
        'namespace' => 'Its\Example\Dashboard',
        'webControllerNamespace' => 'Its\Example\Auth\Presentation\Web\Controller',
        'apiControllerNamespace' => '',
        'className' => 'Its\Example\Auth\Module',
        'path' => APP_PATH . '/modules/auth/Module.php',
        'defaultRouting' => true,
        'defaultController' => 'index',
        'defaultAction' => 'index'
    ],

);