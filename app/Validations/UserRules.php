<?php
namespace App\Validations;
use App\Models\UserModel;

class UserRules {

  public function validateUser(string $str, string $fields, array $data){
    $model = new UserModel();
    $user = $model->where('U_mail', $data['mail'])->first();

    if(!$user)
      return false;

    return password_verify($data['mdp'], $user['U_mdp']);
  }

}