<?php namespace app\Models;
use CodeIgniter\Model;

class AnnonceModel extends Model {

    protected $table      = 'T_annonce';
    protected $primaryKey = 'A_idannonce';

    protected $returnType     = 'array';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = ['A_titre', 'A_description'];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

}