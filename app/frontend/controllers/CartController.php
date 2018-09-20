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
    //    array_pop($_SESSION['cart']);
        s($_SESSION['cart']);
        // unset($_SESSION);
        // session_destroy();
        // $_SESSION['cart'] = null;
        $cart = $_SESSION['cart'];
        return $this->render('index', ['cart' => $cart]);
        var_dump($_SESSION['cart'].length);
    }
    
    public function actionAddtocart() {
        
        App::$current->request->redirect(
            'product/view?id='.$product['id']
        );
        // App::$current->request->goBack();
    }
    
    public function actionAdd() {
        if(!isset($_SESSION['cart'])){
            $_SESSION['cart'] = array();
        }
        
        // $product = App::$current->request->post()['product'];
        // var_dump($product);
        // var_dump($_SESSION['cart']);
        // var_dump(array_values($_SESSION['cart']));
        
        // if ($key = array_search($product['id'], $_SESSION['cart'])) {
            // $product[$key]['quantity']++;
        // } else {
        // }
//        App::$current->request->redirect(
//            'product/view?id='.$product['id']
//        );
        // App::$current->request->goBack();
        $productId = App::$current->request->post();
        foreach ($_SESSION['cart'] as $index => $cartPosition) {
            
            for ($i=0; $i < sizeof($cartPosition); $i++) { 
                var_dump($cartPosition[$i]);
            }
            // foreach ($cartPosition as $id => $value) {
            //     var_dump($value);
            // };
        };
        // $_SESSION['cart'][] = $productId;
        // var_dump($_SESSION);
        
        
    }
    
    public function actionDelete() {
        $product = App::$current->request->post();
        
        App::$current->request->redirect(
            '/cart'
        );
    }
}