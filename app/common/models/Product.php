<?php

namespace app\common\models;

use system\components\ActiveRecord;

/**
 * Class Page
 * @package app\common\models
 * @property int $id
 */
class Product extends ActiveRecord {
  
  // private $_category;
  
  protected static function tableName() {
    return 'shop_product';
  }
  
  public function getCategory() {
    return Category::findOne([
      'id' => $this->shop_category_id,
    ]);
  }
  
}