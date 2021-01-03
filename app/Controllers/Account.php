<?php namespace App\Controllers;

use App\Models\ModelUtilisateur;

class Account extends BaseController
{
	
	private $smarty;
	
	public function login()
	{
		$page = "login";
		$this->smarty = service('SmartyEngine');
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		if ($this->request->getMethod() == 'post') {
			$session = session();
			$donnee = array(
				'mail' => $this->request->getVar('mail'),
				'mdp' => $this->request->getVar('mdp')
			);
			//$cookie = model('ModelUtilisateur')->Authentification($donnee);
			//Parce que j'ai pas pu tester j'ai créer mon cookie
			$cookie = array(
				'pseudo' => 'moi',
				'nom' => 'pas',
				'prenom' => 'grand',
				'mail' => 'a@a.a',
				'mdp' => '1234'			
			);
			$session->set($cookie);
			echo $session->get('pseudo');
			$this->smarty->assign('pseudo', $session->get('pseudo'));
			return redirect()->to('./Home/view'); 
		}

		
		$this->smarty->assign("title", ucfirst($page));

		return $this->smarty->view('pages/'.$page.'.tpl'); 
    }
	
	public function register()
	{
		$page = "register";

		$erreur = [];
		$donnee = [];
		
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');

		if ($this->request->getMethod() == 'post') {
			$donnee = array(
				'pseudo' => $this->request->getVar('pseudo'),
				'nom' => $this->request->getVar('nom'),
				'prenom' => $this->request->getVar('prenom'),
				'mail' => $this->request->getVar('mail'),
				'mdp' => $this->request->getVar('mdp')
			);
			if(empty($donnee['pseudo'])){
				array_push($erreur, 'pseudo pas remplis');
			}
			else if(empty($donnee['prenom'])){
				array_push($erreur, 'prenom pas remplis');
			}
			else if(empty($donnee['nom'])){
				array_push($erreur, 'nom pas remplis');
			}
			else if(empty($donnee['mail'])){
				array_push($erreur, 'mail pas remplis');
			}
			else if(empty($donnee['mdp'])){
				array_push($erreur, 'mdp pas remplis');
			}
			else {
				//$modele = new ModelUtilisateur($donnee);
				//print_r($modele->getModel());
			}

			$this->smarty->assign("error", $erreur);
		}

		$this->smarty->assign("title", ucfirst($page));
		

		return $this->smarty->view('pages/'.$page.'.tpl'); 
		
	}
	
	public function deconnexion(){
		$session = session();
		$session->destroy();

		return redirect()->to('./Home/view'); 
	}

	public function gestion($page = 'index_gestion'){
		
		if ( ! is_file(APPPATH.'/Views/pages/gestion/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));
		$session = session();
		$this->smarty->assign('pseudo', $session->get('pseudo'));	
		$this->smarty->assign('nom', $session->get('nom'));	
		$this->smarty->assign('prenom', $session->get('prenom'));	

		return $this->smarty->view('pages/gestion/'.$page.'.tpl'); 
	}
}
