<?php namespace app\Models;
use CodeIgniter\Model;

class MessageModel extends Model {

    protected $table      = 'T_message';
    protected $primaryKey = 'M_id';

    protected $returnType     = 'array';
    //protected $useSoftDeletes = true;

    // Ce qui peut etre modif avec insert update 
    protected $allowedFields = ['M_idannonce', 'M_mail', 'M_mail_dest', 'M_dateheure_message', 'M_texte_message'];

    protected $useTimestamps = false;

    // How to save your rules 
    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

}