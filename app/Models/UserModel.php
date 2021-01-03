<?php namespace app\Models;
use CodeIgniter\Model;

class UserModel extends Model {

    protected $table      = 'T_utilisateur';
    protected $primaryKey = 'U_mail';

    protected $returnType    = 'App\Entities\User';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = [];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

}