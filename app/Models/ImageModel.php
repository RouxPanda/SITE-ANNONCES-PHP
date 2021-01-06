<?php namespace app\Models;
use CodeIgniter\Model;

class ImageModel extends Model {

    protected $table      = 'T_photo';
    protected $primaryKey = 'P_idphoto';

    protected $returnType     = 'array';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = ['P_annonce', 'P_titre', 'P_nom'];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

}