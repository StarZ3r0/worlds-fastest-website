<?php

use Phalcon\Mvc\Controller;

class IndexController extends Controller
{
    public function indexAction()
    {
        $headerCollection = $this->assets
          ->collection('header')
          ->setTargetPath('css/app.css')
          ->setTargetUri('css/app.css')
          ->addCss('css/pure-min.css')
          ->addCss('css/grids-responsive-min.css')
          ->addCss('css/blog.css')
          ->join(true)
          ->addFilter(new Phalcon\Assets\Filters\Cssmin());
    }
}