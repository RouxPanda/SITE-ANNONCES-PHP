<?php namespace app\Models;
use CodeIgniter\Model;

class TypeModel extends Model {

    protected $table      = 'T_typeMaison';
    protected $primaryKey = 'T_type ';

    protected $returnType     = 'array';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = [];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

}