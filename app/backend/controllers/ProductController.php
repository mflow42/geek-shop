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
}