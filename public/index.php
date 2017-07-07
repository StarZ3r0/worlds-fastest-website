<?php

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Mvc\Application;
use Phalcon\Di\FactoryDefault;
use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;

// Register an autoloader
$loader = new Loader();

$loader->registerDirs(
    [
        '../app/controllers/',
        '../app/models/',
    ]
);

$loader->register();

// Create a DI
$di = new FactoryDefault();

// Register Volt as a service
$di->set(
    'voltService',
    function ($view, $di) {
        $volt = new Volt($view, $di);

        $volt->setOptions(
            [
                'compiledPath'      => '../app/compiled-templates/',
                'compiledExtension' => '.compiled',
                //'compileAlways'     => true,
            ]
        );

        return $volt;
    }
);

// Register Volt as template engine
$di->set(
    'view',
    function () {
        $view = new View();
        $view->setViewsDir('../app/views/');
        $view->registerEngines(
            [
                '.volt' => 'voltService',
            ]
        );
        return $view;
    }
);

$di->set(
    'url',
    function () {
        $url = new UrlProvider();
        $url->setBaseUri('/');
        //$url->setStaticBaseUri('http://phalcon-12a2.kxcdn.com');
        return $url;
    }
);

$application = new Application($di);

try {
    // Handle the request
    $response = $application->handle();

    $response->send();
} catch (\Exception $e) {
    echo 'Exception: ', $e->getMessage();
}