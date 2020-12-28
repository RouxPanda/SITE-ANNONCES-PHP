<?php namespace app\Models;
use Codeigniter\Model;

class ModelUtilisateur extends Model{
    private $champs;

    function __construct($data){
        $this->champs = array(
            'pseudo' => $data['pseudo'],
			'nom' => $data['nom'],
			'prenom' => $data['prenom'],
			'mail' => $data['mail'],
			'mdp' => $data['mdp']
        );
    }

    public function getModel(){
        return $this->champs;
    }

    public function inscriptionBDD(){
        /*$requete = "INSERT INTO T_utilisateur(U_mail, U_mdp, U_pseudo, U_nom, U_prenom) VALUES('" .  . "','" . $date_naissance . "','" . $email_adresse . "','" . $mdp . "',DEFAULT)";
	    try {
	    	$existmail = "SELECT count(*) FROM UTILISATEUR WHERE adresse_mail = '$email_adresse' or pseudo = '$pseudo'";
	    	$mailo = $dbh->query($existmail);
	    	$mail = $mailo->fetchAll();
	    	$nombre = $mail[0][0];
	    	if ($nombre > 0) {
	    		$result = json_encode(array('success' => false, 'msg' => "Le mail ou pseudo existe deja dans la base de donnees"));
	    	} else {
	    		$res = $dbh->query($requete);
	    		if ($res) {
	    			$result = json_encode(array('success' => true, 'msg' => "Inscription fini !"));
	    		} else {
	    			$result = json_encode(array('success' => false, 'msg' => "Inscription raté"));
	    		}
	    	}
	    } catch (Exception $e) {
	    	$result = json_encode(array('success' => false, 'msg' => "Fail : $e"));
	    }*/
    }
}