<?php

namespace app\frontend\controllers;

use app\common\models\Cart;
use app\common\models\Product;
use app\common\models\Order;
use system\components\App;
use system\components\Controller;

class CartController extends Controller {
  
  public function actionIndex() {
    if (!isset($_SESSION['cart'])) {
      $_SESSION['cart'] = array();
    }
    // s($_SESSION);
    $cart = $_SESSION['cart'];
    return $this->render('index',
            ['cart' => $cart]
    );
  }
  
  public function actionAdd() {
    if (!isset($_SESSION['cart'])) {
      $_SESSION['cart'] = array();
    }
    
    $posted = App::$current->request->post();
    
    $found = false;
    foreach ($_SESSION['cart'] as $index => &$product) {
      if ($product['id'] === $posted['id']) {
        $product['quantity'] += $posted['quantity'];
        $product['quantity'] = strval($product['quantity']);
        $found = true;
      }
    }
    if (!$found) {
      $_SESSION['cart'][] = $posted;
    }
  }
  
  public function actionDelete() {
    $product = App::$current->request->post();
    var_dump($product);
    foreach ($_SESSION['cart'] as $key => $value) {
      if(array_search($product['id'], $value)) {
        if (!!(array_search($product['id'], $value))) {
              array_splice($_SESSION['cart'], $key ,1);
        };
      };
    }
    
    App::$current->request->redirect('/cart');
  }
}