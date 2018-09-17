<?php


namespace app\frontend\controllers;

use app\common\models\Shop_product;
use system\components\App;
use system\components\Controller;

class ProductController extends Controller {
    
    public function actionIndex() {
        $products = Shop_product::findAll();
        
        return $this->render('index', ['products' => $products,]
        );
    }
    
    // SQL Injection
    public function actionView($id) {
        $product = Shop_product::findById($id);
        
        $this->render('view', ['product' => $product,]
        );
    }
    
    public function actionViewCart() {
        $cart = $_SESSION['cart'];
        return $this->render('cart', ['cart' => $cart,]
        );
    }
    
    public function actionAddToCart() {
        $good = App::$current->request->post();
        var_dump(App::$current->request->post());
        $_SESSION['cart'][] = $good;
    }
    
}