<?php namespace app\Models;
use CodeIgniter\Model;

class EnergyModel extends Model {

    protected $table      = 'T_energie';
    protected $primaryKey = 'E_id_engie';

    protected $returnType     = 'array';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = ['E_description'];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

}