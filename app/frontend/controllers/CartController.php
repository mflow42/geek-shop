<?php

namespace app\frontend\controllers;

use app\common\models\Cart;
use system\components\App;
use system\components\Controller;

class CartController extends Controller {
    
    public function actionIndex() {
        if(!isset($_SESSION['cart'])){
            $_SESSION['cart'] = array();
        }
        // s($_SESSION['cart']);
        // unset($_SESSION);
        // session_destroy();
        // $_SESSION['cart'] = null;
        // var_dump($_SESSION['cart']);
        $cart = $_SESSION['cart'];
        return $this->render('index', ['cart' => $cart]);
    }
    
    public function actionAddtocart() {
        if(!isset($_SESSION['cart'])){
            $_SESSION['cart'] = array();
        }
        
        $product = App::$current->request->post();
        $_SESSION['cart'][] = $product;
        App::$current->request->redirect(
            'product/view?id='.$product['id']
        );
        // App::$current->request->goBack();
    }
    
    public function actionDelete() {
        $product = App::$current->request->post();
        
        App::$current->request->redirect(
            '/cart'
        );
    }
}