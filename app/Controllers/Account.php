<?php namespace App\Controllers;

use App\Models\ModelUtilisateur;

class Account extends BaseController
{
	
	private $smarty;
	
	public function login()
	{
		helper(['form']);

		$page = "login";
		$this->smarty = service('SmartyEngine');

		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		if ($this->request->getMethod() == 'post') {
			$erreur = [];

			$rules = [
				'mail' => 'required|valid_email',
				'mdp' => 'required|validateUser[mail,mdp]',
			];

			$errors = [
				'mail' => [
					'required' => 'Veuillez saisir un mail.',
					'valid_email' => 'Veuillez saisir un mail valide.'
				],
				'mdp' => [
					'required' => 'Veuillez saisir un mot de passe.',
					'validateUser' => 'Le mail et/ou le mot de passe ne correspond pas.'
				]
			];


			if (!$this->validate($rules, $errors)) {
				$erreur = array_values($this->validator->getErrors());
			}else{
				$model = new \App\Models\UserModel();
				$user = $model->where('U_mail', $this->request->getVar('mail'))->first();

				$conn_data = [
					'mail' => $user['U_mail']
				];

				session()->set($conn_data);

				return redirect()->to('/Home/view/home');
			}

			$this->smarty->assign("error", $erreur);
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
				'pseudo' => strip_tags($this->request->getVar('pseudo')),
				'nom' => strip_tags($this->request->getVar('nom')),
				'prenom' => strip_tags($this->request->getVar('prenom')),
				'mail' => strip_tags($this->request->getVar('mail')),
				'mdp' => strip_tags($this->request->getVar('mdp')),
				'mdp_confirm' => strip_tags($this->request->getVar('mdp_confirm'))
			);

			if(empty($donnee['pseudo'])){
				array_push($erreur, 'Veuillez renseigner un pseudo.');
			}
			else if(empty($donnee['prenom'])){
				array_push($erreur, 'Veuillez renseigner un prenom.');
			}
			else if(empty($donnee['nom'])){
				array_push($erreur, 'Veuillez renseigner un nom.');
			}
			else if(empty($donnee['mail'])){
				array_push($erreur, 'Veuillez renseigner un email.');
			}
			else if(empty($donnee['mdp'])){
				array_push($erreur, 'Veuillez renseigner un mot de passe.');
			}
			else if(empty($donnee['mdp_confirm'])){
				array_push($erreur, 'Veuillez renseigner confirmer votre mot de passe.');
			}
			else {

				if($donnee['mdp'] !== $donnee['mdp_confirm']) {
					array_push($erreur, 'Les mots de passe ne correspondent pas.');
				}else{

					// Verifier si l'email n'est pas deje enregistré

					// Encryption du mdp

					// Creation du compte

				}

			}

			$this->smarty->assign("error", $erreur);
		}

		$this->smarty->assign("title", ucfirst($page));
		
		return $this->smarty->view('pages/'.$page.'.tpl'); 
	}
	
	public function deconnexion(){
		$session = session();
		$session->destroy();

		return redirect()->to('/Home/view/home'); 
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

	public function nouvelle_annonce(){
		$page = 'nouvelle_annonce';

		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		if ($this->request->getMethod() == 'post') {
			$donnee = array(
				'titre' => $this->request->getVar('titre'),
				'desc' => $this->request->getVar('desc'),
				'loyer' => $this->request->getVar('loyer'),
				'cout_charge' => $this->request->getVar('cout_charge'),
				'superficie' => $this->request->getVar('superficie'),
				'chauffage' => $this->request->getVar('chauffage'),
				'adresse' => $this->request->getVar('adresse'),
				'ville' => $this->request->getVar('ville'),
				'cp' => $this->request->getVar('cp')
			);
			
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));
		$session = session();
		$this->smarty->assign('pseudo', $session->get('pseudo'));	

		return $this->smarty->view('pages/'.$page.'.tpl'); 
	}
}
