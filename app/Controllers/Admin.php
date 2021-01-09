<?php namespace App\Controllers;

class Admin extends BaseController
{
	
	private $smarty;

	private function verif_admin() {
		$session = session();
		if(!isset($session->admin) || $session->admin == 0) {
			return false;
		}
		return true;
	}
	
	public function admin() {
		$session = session();
		$page = "admin";
		
		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		if (!is_file(APPPATH.'/Views/pages/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		return $this->smarty->view('pages/'.$page.'.tpl');  
	}
	
	public function users() {
		$session = session();
		$page = "users";

		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		if (!is_file(APPPATH.'/Views/pages/admin/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		$model = new \App\Models\UserModel();
		$datas = $model->findAll();
		$this->smarty->assign("datas", $datas);

		return $this->smarty->view('pages/admin/'.$page.'.tpl');  
	}

	public function uedit($mail = null) {
		$session = session();
		$page = "uedit";

		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		if (!is_file(APPPATH.'/Views/pages/admin/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		$model = new \App\Models\UserModel();
		$user = $model->find($mail);

		if(!$user) {
			session()->setFlashdata("error", array("L'utilisateur $mail n'existe pas !"));
			return redirect()->to(base_url() . '/Admin/users');
		}

		if($this->request->getMethod() == 'post') {
			$field = $this->request->getVar('type');

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
					'mdp_new' => 'required',
					'mdp_confirm' => 'required|matches[mdp_new]'
				];
	
				$errors = [
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
					$session->setFlashdata('success', 'Le pseudo a été modifié.');
				}else if($field == 'infos') {
					$user_data = [
						'U_nom' => strip_tags($this->request->getVar('nom')),
						'U_prenom' => strip_tags($this->request->getVar('prenom'))
					];
					$session->setFlashdata('success', 'Les informations ont été modifié.');
				}else if($field == 'password') {
					$user_data = [
						'U_mdp' => password_hash($this->request->getVar('mdp_new'), PASSWORD_BCRYPT)
					];
					$session->setFlashdata('success', 'Le mot de passe a été modifié.');
				}

				if(!empty($user_data)){
					$model->update($mail, $user_data);
					$user = $model->find($mail);
				}
			}

		}

		$this->smarty->assign("user", $user);

		return $this->smarty->view('pages/admin/'.$page.'.tpl'); 
	}

	public function udelete($mail = null) {
		$session = session();

		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		$erreur = [];

		$model = new \App\Models\UserModel();
		$datas = $model->find($mail);

		if(!$mail) {
			array_push($erreur, "L'utilisateur n'existe pas.");
		}else{

			if($session->mail == $mail) {
				array_push($erreur, "Vous ne pouvez pas vous supprimer.");
			}else{
				$model->delete($mail);
				$session->setFlashdata('success', "L'utilisateur $mail a été supprimé.");
			}

		}

		$session->setFlashdata('error', $erreur);

		return redirect()->to(base_url() . '/Admin/users');
	}

	public function annonces() {
		$session = session();
		$page = "annonces";

		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');
		
		if (!is_file(APPPATH.'/Views/pages/admin/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		$model = new \App\Models\AnnonceModel();
		$datas = $model->findAll();
		$this->smarty->assign("datas", $datas);

		return $this->smarty->view('pages/admin/'.$page.'.tpl');  
	}

	public function sendMail() {
		$session = session();
		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		$erreur = [];

		if($this->request->getMethod() == 'post') {
			$rules = [
				'dest' => 'required|valid_email',
				'msg' => 'required'
			];

			$errors = [
				'dest' => [
					'required' => 'Veuillez saisir un mail.',
					'valid_email' => 'Veuillez saisir un mail valide.'
				],
				'msg' => [
					'required' => 'Veuillez saisir un message.'
				]
			];

			if (!$this->validate($rules, $errors)) {
				$erreur = array_values($this->validator->getErrors());
			}else{
				$mail = strip_tags($this->request->getVar('dest'));

				$model = new \App\Models\UserModel();
				$user = $model->find($mail);

				if(!$user) {
					array_push($erreur, "Il n'y a pas d'utilisateur associé a ce mail.");
				}else{
					helper('Email');
					sendMail($mail, 'Administration', strip_tags($this->request->getVar('msg')));
					$session->setFlashdata("success", "Le mail a bien été envoyé.");
				}

			}
		}

		$session->setFlashdata("error", $erreur);
		return redirect()->to(base_url() . '/Admin/users');
	}

	public function blockAnnonce($id = null) {
		$session = session();
		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		$erreur = [];

		if(!$id || $id == null) {
			array_push($erreur, "Veuillez selectionner une annonce.");
		}else{
			$model = new \App\Models\AnnonceModel();
			$ann = $model->find($id);

			if(!$ann) {
				array_push($erreur, "L'annonce n'existe pas.");
			}else{
				$ann_data = [ 'A_blocked' => true ];
				$model->update($id, $ann_data);
				$session->setFlashdata("success", "L'annonce a été bloquée.");
			}
		}

		$session->setFlashdata("error", $erreur);
		return redirect()->to(base_url() . '/Admin/annonces');
	}

	public function unblockAnnonce($id = null) {
		$session = session();
		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		$erreur = [];

		if(!$id || $id == null) {
			array_push($erreur, "Veuillez selectionner une annonce.");
		}else{
			$model = new \App\Models\AnnonceModel();
			$ann = $model->find($id);

			if(!$ann) {
				array_push($erreur, "L'annonce n'existe pas.");
			}else{
				$ann_data = [ 'A_blocked' => false ];
				$model->update($id, $ann_data);
				$session->setFlashdata("success", "L'annonce a été débloquée.");
			}
		}

		$session->setFlashdata("error", $erreur);
		return redirect()->to(base_url() . '/Admin/annonces');
	}

	public function blockAllAnnonces($mail = null) {
		$session = session();
		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		$erreur = [];

		if(!$mail || $mail == null) {
			array_push($erreur, "Veuillez selectionner un utilisateur.");
		}else{
			$model = new \App\Models\UserModel();
			$user = $model->find($mail);

			if(!$user) {
				array_push($erreur, "L'utilisateur n'existe pas.");
			}else{
				$ann_model = new \App\Models\AnnonceModel();
				$ann_model->where('A_auteur', $mail)->set(['A_blocked' => true])->update();

				$session->setFlashdata("success", "Les annonces de l'utilisateur ont été bloqués.");
			}
		}

		$session->setFlashdata("error", $erreur);
		return redirect()->to(base_url() . '/Admin/users');
	}

	public function unblockAllAnnonces($mail = null) {
		$session = session();
		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		$erreur = [];

		if(!$mail || $mail == null) {
			array_push($erreur, "Veuillez selectionner un utilisateur.");
		}else{
			$model = new \App\Models\UserModel();
			$user = $model->find($mail);

			if(!$user) {
				array_push($erreur, "L'utilisateur n'existe pas.");
			}else{
				$ann_model = new \App\Models\AnnonceModel();
				$ann_model->where('A_auteur', $mail)->set(['A_blocked' => false])->update();

				$session->setFlashdata("success", "Les annonces de l'utilisateur ont été débloqués.");
			}
		}

		$session->setFlashdata("error", $erreur);
		return redirect()->to(base_url() . '/Admin/users');
	}

	public function removeAllMessages($id = null) {
		$session = session();
		if(!$this->verif_admin()) return redirect()->to(base_url() . '/Home');

		$erreur = [];

		if(!$id || $id == null) {
			array_push($erreur, "Veuillez selectionner une annonce.");
		}else{
			$model = new \App\Models\AnnonceModel();
			$ann = $model->find($id);

			if(!$ann) {
				array_push($erreur, "L'annonce n'existe pas.");
			}else{
				$msg_model = new \App\Models\MessageModel();
				$msg_model->where('M_idannonce', $id)->delete();
				$session->setFlashdata("success", "Les messages ont bien été supprimés.");
			}
		}

		$session->setFlashdata("error", $erreur);
		return redirect()->to(base_url() . '/Admin/annonces');
	}

}
