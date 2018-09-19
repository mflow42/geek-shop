<?php


namespace app\frontend\controllers;

use app\common\models\Product;
use app\common\models\Category;
use system\components\Controller;

class ProductController extends Controller {
    
    public function actionIndex() {
        $products = Product::findAll();
        
        return $this->render('index', [
            'products' => $products,
        ]);
    }
    
    // SQL Injection
    public function actionView($id) {
        $product = Product::findById($id);
        //magic
        //$product->category->name = 'Updated';
        //$product->category->save();
        
        $category = Category::findOne([
            'id' => $product->shop_category_id
        ]);
        
        $this->render('view', [
            'product' => $product,
            'category' => $product ->getCategory(),
        ]);
    }
    
}