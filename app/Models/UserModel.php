<?php namespace app\Models;
use CodeIgniter\Model;

class UserModel extends Model {

    protected $table      = 'T_utilisateur';
    protected $primaryKey = 'U_mail';

    protected $returnType    = 'array';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = ['U_mail', 'U_pseudo', 'U_mdp', 'U_nom', 'U_prenom', 'U_admin'];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

    protected $beforeInsert = ['beforeInsert'];
    protected $beforeUpdate = ['beforeUpdate'];


    protected function beforeInsert(array $data){
        $data = $this->passwordHash($data);
        return $data;
    }

    protected function beforeUpdate(array $data){
        $data = $this->passwordHash($data);
        return $data;
    }

    protected function passwordHash(array $data){
        if(isset($data['data']['password']))
            $data['data']['password'] = sha1($data['data']['password']);

        return $data;
    }

}