<?php namespace app\Models;
use CodeIgniter\Model;

class RecoveryModel extends Model {

    protected $table      = 'T_recovery';
    protected $primaryKey = 'R_mail ';

    protected $returnType     = 'array';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = ['R_mail', 'R_token'];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

}