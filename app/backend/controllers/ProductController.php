<?php

namespace app\backend\controllers;

use app\common\models\Shop_product;
use system\components\App;
use system\components\Controller;

class ProductController extends Controller {
    public function actionIndex() {
        $products = Shop_product::findAll();
        
        return $this->render('index', ['products' => $products,]
        );
    }
    
    public function actionAdd() {
        $order = App::$current->request->post();
        if (isset($_COOKIE['order'])) {
            echo "Полученные cookie уже существуют в локальной базе данных";
        } else {
            setcookie('order', $order, time() + 60 * 60 * 24 * 15);
        }
    }
    
    public function actionViewOrder() {
        $sessionOrder = $_COOKIE['order'];
        return $this->render('viewOrder', ['sessionOrder' => $sessionOrder,]
        );
    }
}