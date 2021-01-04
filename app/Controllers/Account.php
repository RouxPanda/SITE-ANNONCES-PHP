<?php namespace App\Controllers;

use App\Models\ModelUtilisateur;

class Account extends BaseController
{
	
	private $smarty;
	
	public function login()	{
		$page = "login";
		$this->smarty = service('SmartyEngine');

		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl')) {
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
					'validateUser' => 'Le mail et/ou le mot de passe ne correspondent pas.'
				]
			];


			if (!$this->validate($rules, $errors)) {
				$erreur = array_values($this->validator->getErrors());
			}else{
				$model = new \App\Models\UserModel();
				$user = $model->where('U_mail', $this->request->getVar('mail'))->first();

				$conn_data = [
					'pseudo' => $user['U_pseudo'],
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
	
	public function register() {
		$page = "register";
		$this->smarty = service('SmartyEngine');

		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		if ($this->request->getMethod() == 'post') {
			$erreur = [];

			$rules = [
				'pseudo' => 'required',
				'nom' => 'required',
				'prenom' => 'required',
				'mail' => 'required|valid_email|is_unique[T_utilisateur.U_mail]',
				'mdp' => 'required',
				'mdp_confirm' => 'required|matches[mdp]',
			];

			$errors = [
				'pseudo' => [
					'required' => 'Veuillez saisir un pseudo.',
				],
				'nom' => [
					'required' => 'Veuillez saisir votre nom.',
				],
				'prenom' => [
					'required' => 'Veuillez saisir votre prenom.',
				],
				'mail' => [
					'required' => 'Veuillez saisir un mail.',
					'valid_email' => 'Veuillez saisir un mail valide.',
					'is_unique' => 'Le mail est déjà utilisé.'
				],
				'mdp' => [
					'required' => 'Veuillez saisir un mot de passe.',
				],
				'mdp_confirm' => [
					'required' => 'Veuillez confirmer votre mot de passe.',
					'matches' =>  'Les mots de passe ne correspondent pas.'
				]
			];


			if (!$this->validate($rules, $errors)) {
				$erreur = array_values($this->validator->getErrors());
			}else{
				$model = new \App\Models\UserModel();

				$register_data = [
					'U_mail' => strip_tags($this->request->getVar('mail')),
					'U_mdp' => sha1($this->request->getVar('mdp')),
					'U_pseudo' => strip_tags($this->request->getVar('pseudo')),
					'U_nom' => strip_tags($this->request->getVar('nom')),
					'U_prenom' => strip_tags($this->request->getVar('prenom')),
					'U_admin' => false
				];

				$model->insert($register_data);

				$session = session();
				$session->setFlashdata('success', 'Votre compte a été créér avec succes.');

				return redirect()->to('/Home/view/home');
			}

			$this->smarty->assign("error", $erreur);
		}

		$this->smarty->assign("title", ucfirst($page));
		return $this->smarty->view('pages/'.$page.'.tpl'); 
	}
	
	public function logout(){
		$session = session();
		$session->destroy();

		return redirect()->to('/Home/view/home'); 
	}

	public function manage($page = 'index_gestion') {
		
		$session = session();
        // Si l'utilisateur n'est pas connecter, on le redirige
        if(!isset($session->pseudo)) return redirect()->to('/Account/login');

		if (!is_file(APPPATH.'/Views/pages/manage/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));
		
		if($page == 'profil') {
			
		}
		

		$this->smarty->assign('pseudo', $session->get('pseudo'));	
		$this->smarty->assign('nom', $session->get('nom'));	
		$this->smarty->assign('prenom', $session->get('prenom'));	
		return $this->smarty->view('pages/manage/'.$page.'.tpl'); 
	}

}
