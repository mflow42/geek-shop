<?php


namespace app\frontend\controllers;

use system\components\Controller;

class CartController extends Controller {
    
    public function actionIndex() {
        $cart = $_SESSION(['cart']);
        return $this->render('index', ['cart' => $cart,]
        );
    }
}