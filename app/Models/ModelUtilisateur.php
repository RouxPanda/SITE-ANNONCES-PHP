<?php namespace app\Models;
use CodeIgniter\Model;
use Exception;

class ModelUtilisateur extends Model{
	
	public function getUsers(){
		$reponse = [];
        $user = "SELECT * FROM T_utilisateur";
    	$q = $this->db->query($user);
    	$reponse = $q->result_array();

    	return $reponse;
	}


    public function inscriptionBDD($data){
        $requete = "INSERT INTO T_utilisateur(U_mail, U_mdp, U_pseudo, U_nom, U_prenom) VALUES('" . $data['mail'] . "','" . $data['mdp'] . "','" . $data['pseudo'] . "','" . $data['nom'] . "','" . $data['nom'] . "')";
	    try {
	    	//$existmail = "SELECT count(*) FROM T_utilisateur WHERE adresse_mail = '".$data['mail']."'";
	    	//$mailo = $this->db->query($existmail);
	    	//$mail = $mailo->fetchAll();
	    	//$nombre = $mail[0][0];
	    	//if ($nombre > 0) {
	    	//	return "Erreur : Mail déjà existant";
	    	//} else {
				$db = db_connect();
	    		$res = $db->query($requete);
	    	//}
	    } catch (Exception $e) {
	    	return $e;
	    }
    }
}