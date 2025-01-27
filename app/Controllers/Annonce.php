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
        if(!isset($session->pseudo)) return redirect()->to(base_url() . '/Account/login');

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
                'type' => 'required|validateType[type]',
                'energie' => 'validateEnergie[energie]'
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
                ],
                'energie' => [
                    'validateEnergie' => 'Energie invalide.'
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
                    'A_CP' => strip_tags($this->request->getVar('cp')),
                    'A_energie' => null,
                    'A_type' => strip_tags($this->request->getVar('type')),
                    'A_etat' => strip_tags($this->request->getVar('action')),
                    'A_auteur' => $session->mail
                );

                if(strip_tags($this->request->getVar('chauffage')) == 'individuel') {
                    $annonce_data['A_energie'] = strip_tags($this->request->getVar('energie'));
                }

                $model->insert($annonce_data);


                // Gestion des images
                $img_model = new \App\Models\ImageModel();
                
                // TODO => VERIFIER SI QUE 5 images max

                if($this->validate(['images' => 'uploaded[images.0]|is_image[images]'])) {
                    $files = $this->request->getFiles();
                    foreach($files['images'] as $file) {
                        if($file->isValid() && !$file->hasMoved()) {
                            $fname = $file->getRandomName();
                            $file->move('./public/uploads/annonces', $fname);
                            $img_data = [
                                'P_annonce' => $model->getInsertID(),
                                'P_titre' => "Photo",
                                'P_nom' => $fname
                            ];
                            $img_model->insert($img_data);
                        }
                    }
                }

                if($annonce_data['A_type'] == 1){
                    $session->setFlashdata('success', 'Votre annonce est bien sauvegardé en brouillon');
                }
                else if($annonce_data['A_type'] == 2){
                    $session->setFlashdata('success', 'Votre annonce a bien été publiée.');
                }
                
                return redirect()->to(base_url() . '/Account/manage');
			}

			$session->setFlashdata("error", $erreur);
        }

        $model = new \App\Models\TypeModel();
        $types = $model->findAll();
        $this->smarty->assign("types", $types);

        $model = new \App\Models\EnergyModel();
        $energies = $model->findAll();
        $this->smarty->assign("energies", $energies);

        $this->smarty->assign("title", ucfirst($page));
		return $this->smarty->view('pages/annonce/'.$page.'.tpl');  
    }

    public function view($id) {
        $page = 'annonce';
        $session = session();

		if (!is_file(APPPATH.'/Views/pages/annonce/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));
		
		$annonceModel = new \App\Models\AnnonceModel();
		$datas = array();

        $datas = $annonceModel->find($id);

        if(!$datas){
            $session->setFlashdata("error", array("L'annonce n'existe pas"));
        }

        if($datas['A_etat'] != 2 && ((isset($session->mail) && $session->mail != $datas['A_auteur']) || !isset($session->mail) )) {
            return redirect()->to(base_url() . '/Home');
        }else if ($datas['A_blocked'] == true) {
            return redirect()->to(base_url() . '/Home');
        }

        if(isset($datas['A_energie'])) {
            $eng_model = new \App\Models\EnergyModel();
            $eng = $eng_model->find($datas['A_energie']);
            if($eng) $datas['A_energie'] = $eng['E_description'];
        }

		$this->smarty->assign("datas", $datas);

        $img_model = new \App\Models\ImageModel();
        $images = $img_model->where('P_annonce', $id)->findAll();

        $this->smarty->assign("images", $images);

		return $this->smarty->view('pages/annonce/'.$page.'.tpl'); 
    }
    
    public function edit($id = 0) {
        $page = 'new_annonce';
        $erreur = [];

        $session = session();
        if(!isset($session->pseudo)) return redirect()->to(base_url() . '/Account/login');

		if (!is_file(APPPATH.'/Views/pages/annonce/'.$page.'.tpl')) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
        }

        $this->smarty = service('SmartyEngine');

        // Si l'utilisateur n'est pas connecter, on le redirige
        
            
        $model = new \App\Models\AnnonceModel();
        $annonce = $model->find($id);

        if(!$annonce) {
            array_push($erreur, "L annonce n existe pas.");
        }else{

            if($annonce['A_auteur'] != $session->mail && !$session->admin) {
                array_push($erreur, "Vous n etes pas le proprietaire de cette annonce.");
            }else{
                
                if ($this->request->getMethod() == 'post' && isset($session->pseudo)) {

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

                        $annonce_data = array(
                            'A_titre' => strip_tags($this->request->getVar('titre')),
                            'A_cout_loyer' => strip_tags($this->request->getVar('loyer')),
                            'A_cout_charges' => strip_tags($this->request->getVar('cout_charge')),
                            'A_type_chauffage' => strip_tags($this->request->getVar('chauffage')),
                            'A_superfice' => strip_tags($this->request->getVar('superficie')),
                            'A_description' => strip_tags($this->request->getVar('desc')),
                            'A_adresse' => strip_tags($this->request->getVar('adresse')),
                            'A_ville' => strip_tags($this->request->getVar('ville')),
                            'A_CP' => strip_tags($this->request->getVar('cp')),
                            'A_energie' => null,
                            'A_type' => strip_tags($this->request->getVar('type'))
                        );
        
                        $model->update($id, $annonce_data);
                        $session->setFlashdata('success', 'Votre annonce a bien été modifiée.');
                        $annonce = $model->find($id);
                    }
        
                    $session->setFlashdata("error", $erreur);
                }
             
                $this->smarty->assign("images", $this->get_all_images($id));
                $this->smarty->assign("data", $annonce);
            }

        }

        $model = new \App\Models\TypeModel();
        $types = $model->findAll();
        $this->smarty->assign("types", $types);

        $model = new \App\Models\EnergyModel();
        $energies = $model->findAll();
        $this->smarty->assign("energies", $energies);

        $this->smarty->assign("title", ucfirst($page));
        $session->setFlashdata("error", $erreur);
		return $this->smarty->view('pages/annonce/'.$page.'.tpl'); 
    }

    public function delete($id = null) {
        $erreur = [];

        $session = session();
        if(!isset($session->pseudo)) return redirect()->to(base_url() . '/Account/login');

        $model = new \App\Models\AnnonceModel();
        $annonce = $model->find($id);

        if(!$annonce) {
            array_push($erreur, "L annonce n existe pas.");
        }else{
            if($annonce['A_auteur'] != $session->mail && !$session->admin) {
                array_push($erreur, "Vous ne pouvez pas supprimer cette annonce.");
            }else{
                // Suppression des images
                $this->remove_images($id);

                // Suppression des messages associé (normalement c'est fait avec des triggers mais on peut en creer sur le serveur)
                $this->remove_messages($id);

                // Suppression de l'annonce
                $model->delete($id);
                $session->setFlashdata("success", "L'annonce a bien été supprimée.");
            }
        }

        $session->setFlashdata("error", $erreur);
        return redirect()->to(base_url() . '/Home');
    }

    private function remove_messages($id) {
        $model = new \App\Models\MessageModel();
        $msgs = $model->where('M_idannonce', $id)->findAll();

        foreach($msgs as $m) {
            $model->delete($m['M_id']);
        }
    }

    private function remove_images($id) {
        $img_model = new \App\Models\ImageModel();
        $images = $img_model->where('P_annonce', $id)->findAll();

        foreach($images as $img) {
            if(file_exists("./public/uploads/annonces/".$img['P_nom'])) unlink("./public/uploads/annonces/".$img['P_nom']);
            $img_model->delete($img['P_idphoto']);
        }
    }

    private function get_all_images($id) {
        $img_model = new \App\Models\ImageModel();
        $images = $img_model->where('P_annonce', $id)->findAll();
        return $images;
    }

    public function publish($id){
        $session = session();
        if(!isset($session->pseudo)) return redirect()->to(base_url() . '/Account/login');

        $model = new \App\Models\AnnonceModel();
        $annonce = $model->find($id);

        $erreur = [];

        if(!$annonce) {
            array_push($erreur, "L annonce n existe pas.");
        }else{
            
            if($annonce['A_auteur'] != $session->mail) {
                array_push($erreur, "Vous ne pouvez pas modifier cette annonce.");
            }else{
                $model = new \App\Models\AnnonceModel();
                $model->set('A_etat',2);
                $model->where('A_idannonce',$id);
                $model->update();

                $session->setFlashdata('success', 'Votre annonce a bien été publié');
            }

        }

        $session->setFlashdata("error", $erreur);

        return redirect()->to(base_url() . '/Account/manage/annonces');
    }

    public function archive($id){
        $session = session();
        if(!isset($session->pseudo)) return redirect()->to(base_url() . '/Account/login');

        $model = new \App\Models\AnnonceModel();
        $annonce = $model->find($id);

        $erreur = [];

        if(!$annonce) {
            array_push($erreur, "L annonce n existe pas.");
        }else{
            
            if($annonce['A_auteur'] != $session->mail) {
                array_push($erreur, "Vous ne pouvez pas modifier cette annonce.");
            }else{
                $model = new \App\Models\AnnonceModel();

                $model->set('A_etat',3);
                $model->where('A_idannonce',$id);
                $model->update();
        
                $session->setFlashdata('success', 'Votre annonce a bien été archivé');
            }

        }

        $session->setFlashdata("error", $erreur);
        
        return redirect()->to(base_url() . '/Account/manage/annonces');
    }

}