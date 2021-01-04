<?php namespace app\Models;
use CodeIgniter\Model;

class AnnonceModel extends Model {

    protected $table      = 'T_annonce';
    protected $primaryKey = 'A_idannonce';

    protected $returnType     = 'array';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = ['A_titre', 'A_cout_loyer', 'A_cout_charges', 'A_type_chauffage', 'A_superfice', 'A_description', 'A_adresse', 'A_ville', 'A_CP', 'A_energie', 'A_type', 'A_etat', 'A_auteur'];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

}