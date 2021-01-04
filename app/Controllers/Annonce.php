<?php namespace App\Controllers;

class Annonce extends BaseController
{
	
	private $smarty;
	
	public function new() {
		$page = 'new_annonce';

		if (!is_file(APPPATH.'/Views/pages/annonce/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
        }
        
        $session = session();
        $this->smarty = service('SmartyEngine');

        // Si l'utilisateur n'est pas connecter, on le redirige
        if(!isset($session->pseudo)) return redirect()->to('/Home/view/home');

        if ($this->request->getMethod() == 'post' && isset($session->pseudo)) {
            $erreur = [];

            $rules = [
				'titre' => 'required',
                'desc' => 'required',
                'loyer' => 'required',
                'cout_charge' => 'required',
                'superficie' => 'required',
                'chauffage' => 'required',
                'adresse' => 'required',
                'ville' => 'required',
                'cp' => 'required',
                'type' => 'required|validateType[type]'
			];

			$errors = [
                'titre' => [
                    'required' => 'Veuillez saisir un titre.'
                ],
                'desc' => [
                    'required' => 'Veuillez saisir une description.'
                ],
                'loyer' => [
                    'required' => 'Veuillez renseigner le loyer.'
                ],
                'cout_charge' => [
                    'required' => 'Veuillez renseigner les charges.'
                ],
                'superficie' => [
                    'required' => 'Veuillez renseigner la superficie.'
                ],
                'chauffage' => [
                    'required' => 'Veuillez spécifier le chauffage.'
                ],
                'adresse' => [
                    'required' => 'Veuillez renseigner l adresse.'
                ],
                'ville' => [
                    'required' => 'Veuillez renseigner la ville.'
                ],
                'cp' => [
                    'required' => 'Veuillez renseigner le code postale.'
                ],
                'type' => [
                    'required' => 'Veuillez renseigner le type de logement.',
                    'validateType' => 'Le type de logement est invalide'
                ]
			];

            if (!$this->validate($rules, $errors)) {
				$erreur = array_values($this->validator->getErrors());
			}else{
                $model = new \App\Models\AnnonceModel();

				$annonce_data = array(
                    'A_titre' => strip_tags($this->request->getVar('titre')),
                    'A_cout_loyer' => strip_tags($this->request->getVar('loyer')),
                    'A_cout_charges' => strip_tags($this->request->getVar('cout_charge')),
                    'A_type_chauffage' => strip_tags($this->request->getVar('chauffage')),
                    'A_superfice' => strip_tags($this->request->getVar('superficie')),
                    'A_description' => strip_tags($this->request->getVar('desc')),
                    'A_adresse' => strip_tags($this->request->getVar('adresse')),
                    'A_ville' => strip_tags($this->request->getVar('ville')),
                    'A_cp' => strip_tags($this->request->getVar('cp')),
                    'A_energie' => null,
                    'A_type' => strip_tags($this->request->getVar('type')),
                    'A_etat' => false,
                    'A_auteur' => $session->mail
                );

                $model->insert($annonce_data);

                $session->setFlashdata('success', 'Votre annonce a bien été publiée.');
                return redirect()->to('/Account/manage');
			}

			$this->smarty->assign("error", $erreur);
        }

        $this->smarty->assign("title", ucfirst($page));
		return $this->smarty->view('pages/annonce/'.$page.'.tpl');  
    }

    public function id($id) {
        $page = 'annonce';
        $session = session();

		if ( ! is_file(APPPATH.'/Views/pages/annonce/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));
		
		$annonceModel = new \App\Models\AnnonceModel();
		$datas = array();

        $datas = $annonceModel->find($id);
        if(!$datas){
            $this->smarty->assign("error", array("L'annonce n'existe pas"));
        }

		$this->smarty->assign("datas", $datas);

		return $this->smarty->view('pages/annonce/'.$page.'.tpl'); 
    }
}