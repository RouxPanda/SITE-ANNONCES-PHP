<?php
namespace App\Validations;
use App\Models\TypeModel;
use App\Models\EnergyModel;

class AnnonceRules {

  public function validateType(string $type){
    $model = new TypeModel();
    $type_db = $model->where('T_type', $type)->first();

    if(!$type_db)
      return false;

    return true;
  }

  public function validateEnergie(string $eng){
    $model = new EnergyModel();
    $eng_db = $model->where('E_id_engie', $eng)->first();

    if(!$eng_db)
      return false;

    return true;
  }
  

}