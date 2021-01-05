<?php namespace App\Controllers;

class Admin extends BaseController
{
	
	private $smarty;

	private function verif_admin() {

	}
	
	public function admin() {
		$session = session();
		$page = "admin";
		
		$this->verif_admin();

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

		$this->verif_admin();

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

		$this->verif_admin();

		if (!is_file(APPPATH.'/Views/pages/admin/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		$model = new \App\Models\UserModel();
		$user = $model->find($mail);

		if(!$user) {
			session()->setFlashdata("error", array("L'utilisateur $mail n'existe pas !"));
			return redirect()->to('/Admin/users');
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
						'U_mdp' => sha1($this->request->getVar('mdp_new'))
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

}
