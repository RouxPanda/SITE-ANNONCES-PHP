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
				$this->user_to_session($this->request->getVar('mail'));
				return redirect()->to('/Home/view/home');
			}

			session()->setFlashdata("error", $erreur);
		}

		$this->smarty->assign("title", ucfirst($page));
		return $this->smarty->view('pages/'.$page.'.tpl'); 
	}
	
	private function user_to_session($mail) {
		$model = new \App\Models\UserModel();
		$user = $model->where('U_mail', $mail)->first();

		$conn_data = [
			'pseudo' => $user['U_pseudo'],
			'mail' => $user['U_mail'],
			'nom' => $user['U_nom'],
			'prenom' => $user['U_prenom'],
			'admin' => $user['U_admin']
		];

		session()->set($conn_data);
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
				'pseudo' => 'required|is_unique[T_utilisateur.U_pseudo]',
				'nom' => 'required',
				'prenom' => 'required',
				'mail' => 'required|valid_email|is_unique[T_utilisateur.U_mail]',
				'mdp' => 'required',
				'mdp_confirm' => 'required|matches[mdp]',
			];

			$errors = [
				'pseudo' => [
					'required' => 'Veuillez saisir un pseudo.',
					'is_unique' => 'Ce pseudo est déjà utilisé.'
				],
				'nom' => [
					'required' => 'Veuillez saisir votre nom.'
				],
				'prenom' => [
					'required' => 'Veuillez saisir votre prenom.'
				],
				'mail' => [
					'required' => 'Veuillez saisir un mail.',
					'valid_email' => 'Veuillez saisir un mail valide.',
					'is_unique' => 'Le mail est déjà utilisé.'
				],
				'mdp' => [
					'required' => 'Veuillez saisir un mot de passe.'
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

				session()->setFlashdata('success', 'Votre compte a été créér avec succes.');

				return redirect()->to('/Home/view/home');
			}

			session()->setFlashdata("error", $erreur);
		}

		$this->smarty->assign("title", ucfirst($page));
		return $this->smarty->view('pages/'.$page.'.tpl'); 
	}
	
	public function logout(){
		$session = session();
		$session->destroy();

		return redirect()->to('/Home/view/home'); 
	}

	public function manage($page = 'index') {
		$session = session();
        // Si l'utilisateur n'est pas connecter, on le redirige
        if(!isset($session->pseudo)) return redirect()->to('/Account/login');

		if (!is_file(APPPATH.'/Views/pages/manage/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		if($page == 'annonces') {
			$model = new \App\Models\AnnonceModel();
			$datas = $model->where('A_auteur', $session->mail)->findAll();
			$this->smarty->assign("datas", $datas);
		}

		return $this->smarty->view('pages/manage/'.$page.'.tpl'); 
	}

	public function change($field) {
		$session = session();
		if(!isset($session->pseudo)) return redirect()->to('/Account/login');


		if ($this->request->getMethod() == 'post') {
			$rules = [];
			$errors = [];

			if($field == 'pseudo') {
				$rules = [
					'pseudo' => 'required|is_unique[T_utilisateur.U_pseudo]',
				];
	
				$errors = [
					'pseudo' => [
						'required' => 'Veuillez saisir un pseudo.',
						'is_unique' => 'Ce pseudo est déjà utilisé.'
					]
				];
			}else if($field == 'infos') {
				$rules = [
					'nom' => 'required',
					'prenom' => 'required'
				];
	
				$errors = [
					'nom' => [
						'required' => 'Veuillez saisir un nom.',
					],
					'prenom' => [
						'required' => 'Veuillez saisir un prenom.',
					]
				];
			}else if($field == 'password') {
				$rules = [
					'mdp' => 'required',
					'mdp_new' => 'required',
					'mdp_confirm' => 'required|matches[mdp_new]'
				];
	
				$errors = [
					'mdp' => [
						'required' => 'Veuillez saisir votre mot de passe.'
					],
					'mdp_new' => [
						'required' => 'Veuillez saisir un nouveau mot de passe.',
					],
					'mdp_confirm' => [
						'required' => 'Veuillez confirmer le mot de passe.',
						'matches' =>  'Les mots de passe ne correspondent pas.'
					]
				];
			}


			if (!$this->validate($rules, $errors)) {
				$erreur = array_values($this->validator->getErrors());
				$session->setFlashdata("error", $erreur);
			}else{

				$model = new \App\Models\UserModel();
				$user_data = [];

				if($field == 'pseudo') {
					$user_data = [
						'U_pseudo' => strip_tags($this->request->getVar('pseudo'))
					];
					$session->setFlashdata('success', 'Votre pseudo a été modifié.');
				}else if($field == 'infos') {
					$user_data = [
						'U_nom' => strip_tags($this->request->getVar('nom')),
						'U_prenom' => strip_tags($this->request->getVar('prenom'))
					];
					$session->setFlashdata('success', 'Vos informations ont été modifié.');
				}else if($field == 'password') {

					$user = $model->find($session->mail);

					if(sha1($this->request->getVar('mdp')) === $user['U_mdp']) {

						$user_data = [
							'U_mdp' => sha1($this->request->getVar('mdp_new'))
						];
						$session->setFlashdata('success', 'Votre mot de passe ont été modifié.');

					}else{
						$session->setFlashdata("error", array('Le mot de passe est incorrect.'));
					}

				}

				if(!empty($user_data)){
					$model->update($session->mail, $user_data);
					$this->user_to_session($session->mail);
				}
			}

		}

		return redirect()->to('/Account/manage/profil'); 
	}

	public function chat($id = null) {
		$page = "chat";

		$session = session();
        // Si l'utilisateur n'est pas connecter, on le redirige
		if(!isset($session->pseudo)) return redirect()->to('/Account/login');

		if (!is_file(APPPATH.'/Views/pages/manage/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');

		$model = new \App\Models\MessageModel();
		$ann_model = new \App\Models\AnnonceModel();

		// Recuperation des conversations
		$convs = $model->where('M_mail', $session->mail)->findColumn('M_idannonce');

		if($convs){
			$convs = array_unique($convs);

			$annonces = array();

			foreach($convs as $c) {
				$ann = $ann_model->find($c);
				array_push($annonces, $ann);
			}

			if (isset($id) && $id != null) $this->smarty->assign("current", $id);
			$this->smarty->assign("convs", $annonces);
		}

		// Recuperation des messages liees a l'annonce
		if($id) {
			$msg = $model->where('M_idannonce', $id)->where('M_mail', $session->mail)->findAll();
			
		}



		$this->smarty->assign("title", ucfirst($page));
		return $this->smarty->view('pages/manage/'.$page.'.tpl'); 
	}

	public function post_msg() {
		$session = session();
        // Si l'utilisateur n'est pas connecter, on le redirige
		if(!isset($session->pseudo)) return redirect()->to('/Account/login');

		if ($this->request->getMethod() == 'post') {
			$rules = [
				'id' => 'required',
				'dest' => 'required',
				'msg' => 'required'
			];

			$errors = [
				'id' => [
					'required' => 'Veuillez saisir une annonce.'
				],
				'dest' => [
					'required' => 'Veuillez saisir un destinataire.',
				],
				'msg' => [
					'required' => 'Veuillez saisir un message.'
				]
			];

			if ($this->validate($rules, $errors)) {
				$id = $this->request->getVar('id');
				$dest = $this->request->getVar('dest');

				$ann_model = new \App\Models\AnnonceModel();
				$annonce = $ann_model->find($id);

				$erreur = [];

				if(!$annonce) {
					array_push($erreur, "L'annonce n'existe pas.");
				}else{
					if($session->mail == $annonce['A_auteur'] || $session->mail == $dest) {
						array_push($erreur, "Vous ne pouvez pas envoyer un message a vous même.");
					}else{
						$user_model = new \App\Models\UserModel();
						$user = $user_model->find($dest);

						if(!$user) {
							array_push($erreur, "L'utilisateur n'existe pas.");
						}else{
							$msg_model = new \App\Models\MessageModel(); 

							$msg_data = [
								'M_idannonce' => $id,
								'M_mail' => $session->mail,
								'M_mail_dest' => $dest,
								'M_dateheure_message' => date("Y-m-d H:i:s"),
								'M_texte_message' => strip_tags($this->request->getVar('msg'))
							];

							$msg_model->inset($msg_data);
							$session->setFlashdata("success", "Votre message a bien été envoyé.");
						}

					}
				}
			}
		}

		$session->setFlashdata("error", $erreur);
		return redirect()->to('/Account/manage/profil'); 
	}

}
