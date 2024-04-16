<?php

use Phalcon\Autoload\Loader;
use Test\TestClass;

include("vendor/autoload.php");

$loader = new Loader();
$loader->setNamespaces([
    'Test' => __DIR__ . "/app/"
]);
$loader->register();

var_dump(memprof_enabled());

$mysql = new TestClass();
$mysql->test();