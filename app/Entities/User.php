<?php namespace App\Entities;

use CodeIgniter\Entity;

class User extends Entity {
    
    protected $attributes = [
        'email' => null,
        'password' => null,        // Represents a username
        'username' => null,
        'name' => null,
        'firstname' => null,
        'admin' => null,
    ];

    protected $datamap = [
        'U_mail' => 'email',
        'U_mdp' => 'password',
        'U_pseudo' => 'username',
        'U_nom' => 'name',
        'U_prenom' => 'firstname',
        'U_admin' => 'admin'
    ],

}