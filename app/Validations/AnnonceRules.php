<?php
namespace App\Validations;
use App\Models\TypeModel;

class AnnonceRules {

  public function validateType(string $type){
    $model = new TypeModel();
    $type_db = $model->where('T_type', $type)->first();

    if(!$type_db)
      return false;

    return true;
  }

}