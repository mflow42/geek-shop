<?php

namespace app\common\models;

use system\components\ActiveRecord;

/**
 * Class Page
 * @package app\common\models
 * @property int $id
 */
class Category extends ActiveRecord {
  
  protected static function tableName() {
    return 'shop_category';
  }
  
  public function getProducts() {
    return Products::findAll();
  }
  
}