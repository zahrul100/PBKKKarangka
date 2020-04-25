<?php

namespace Its\Example\Auth;

use Phalcon\Di\DiInterface;
use Phalcon\Loader;
use Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces([

            'Its\Example\Auth\Core\Domain\Event' => __DIR__ . '/Core/Domain/Event',
            'Its\Example\Auth\Core\Domain\Model' => __DIR__ . '/Core/Domain/Model',
            'Its\Example\Auth\Core\Domain\Repository' => __DIR__ . '/Core/Domain/Repository',
            'Its\Example\Auth\Core\Domain\Service' => __DIR__ . '/Core/Domain/Service',

            'Its\Example\Auth\Core\Application\Service' => __DIR__ . '/Core/Application/Service',
            'Its\Example\Auth\Core\Application\EventSubscriber' => __DIR__ . '/Core/Application/EventSubscriber',

            'Its\Example\Auth\Infrastructure\Persistence' => __DIR__ . '/Core/Infrastructure/Persistence',

            'Its\Example\Auth\Presentation\Web\Controller' => __DIR__ . '/Presentation/Web/Controller',
            'Its\Example\Auth\Presentation\Web\Models' => __DIR__ . '/Presentation/Web/Models',
            'Its\Example\Auth\Presentation\Web\Form' => __DIR__ . '/Presentation/Web/Form',
            
            'Its\Example\Auth\Presentation\Web\Validator' => __DIR__ . '/Presentation/Web/Validator',
            'Its\Example\Auth\Presentation\Api\Controller' => __DIR__ . '/Presentation/Api/Controller',
            
        ]);

        $loader->register();
    }

    public function registerServices(DiInterface $di = null)
    {
        $moduleConfig = require __DIR__ . '/config/config.php';

        $di->get('config')->merge($moduleConfig);

        include_once __DIR__ . '/config/services.php';
    }
}