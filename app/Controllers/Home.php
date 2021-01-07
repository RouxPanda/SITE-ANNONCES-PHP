<?php namespace App\Controllers;

class Home extends BaseController
{
	
	private $smarty;
	

	public function view($page = 'home')
	{
		$session = session();

		if ( ! is_file(APPPATH.'/Views/pages/home/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));
		
		$annonceModel = new \App\Models\AnnonceModel();
		$datas = array();

		if($page = 'home') {
			$datas = $annonceModel->orderBy('A_idannonce', 'desc')->findAll(6, 0);
			$img_model = new \App\Models\ImageModel();
			foreach($datas as $key => $ann) {
				$img = $img_model->where('P_annonce', $ann['A_idannonce'])->findAll();
				if($img) {
					$datas[$key]['image'] = $img[0]['P_nom'];
				}
			}
		}

		$this->smarty->assign("datas", $datas);

		return $this->smarty->view('pages/home/'.$page.'.tpl'); 
	}

	
    public function annonces($numero = 0) {
        $page = 'annonces';
        $session = session();

		if ( ! is_file(APPPATH.'/Views/pages/home/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));
		$annonceModel = new \App\Models\AnnonceModel();
		$datas = array();

		$datas = $annonceModel->orderBy('A_idannonce', 'desc')->findAll(16, $numero*16);

		$img_model = new \App\Models\ImageModel();
		foreach($datas as $key => $ann) {
			$img = $img_model->where('P_annonce', $ann['A_idannonce'])->findAll();
			if($img) {
				$datas[$key]['image'] = $img[0]['P_nom'];
			}
		}

		$this->smarty->assign("datas", $datas);
		$this->smarty->assign("numero", $numero);
		$this->smarty->assign("total", count($datas));

		return $this->smarty->view('pages/home/'.$page.'.tpl'); 
	}

	public function search() {
        $page = 'annonces';
		$session = session();
		$numero = 0;

		if (!is_file(APPPATH.'/Views/pages/home/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));
		
		$annonceModel = new \App\Models\AnnonceModel();

		$datas = array();

		if ($this->request->getMethod() == 'get') {
			$recup = array(
				'rchr' => $this->request->getVar('rchr'),
				'loyer_min' => $this->request->getVar('loyer_min'),
				'loyer_max' => $this->request->getVar('loyer_max'),
				'ville' => $this->request->getVar('ville'),
				'type' => $this->request->getVar('type'),
				'chauffage' => $this->request->getVar('chauffage'),
				'super_min' => $this->request->getVar('super_min'),
				'super_max' => $this->request->getVar('super_max'),
			);

			if(empty($recup['loyer_min'])){
				$recup['loyer_min'] = 0;
			}
			if(empty($recup['loyer_max'])){
				$recup['loyer_max'] = 999999999;
			}
			if(isset($recup['loyer_min']) && isset($recup['loyer_max'])){
				$annonceModel->where("A_cout_loyer BETWEEN'".$recup['loyer_min']."'AND'".$recup['loyer_max']."'");
			}
			
			if(empty($recup['super_min'])){
				$recup['super_min'] = 0;
			}
			if(empty($recup['super_max'])){
				$recup['super_max'] = 999999999;
			}
			if(isset($recup['super_min']) && isset($recup['super_max'])){
				$annonceModel->where("A_superfice BETWEEN'".$recup['super_min']."'AND'".$recup['super_max']."'");
			}

			if(isset($recup['rchr'])){
				$annonceModel->where("A_titre LIKE '%".$recup['rchr']."%'");
			}
			if(isset($recup['ville'])){
				$annonceModel->where("A_ville LIKE '%".$recup['ville']."%'");
			}
			if(isset($recup['type'])){
				$annonceModel->where("A_type LIKE '%".$recup['type']."%'");
			}
			if(isset($recup['chauffage'])){
				$annonceModel->where("A_type_chauffage LIKE '%".$recup['chauffage']."%'");
			}
			
			$datas = $annonceModel->orderBy('A_idannonce', 'desc')->findAll();
		}

		if(empty($datas)){
			$session->setFlashdata("error", array('Aucunes annonce trouvé'));
		}

		$img_model = new \App\Models\ImageModel();
		foreach($datas as $key => $ann) {
			$img = $img_model->where('P_annonce', $ann['A_idannonce'])->findAll();
			if($img) {
				$datas[$key]['image'] = $img[0]['P_nom'];
			}
		}

		$this->smarty->assign("total", count($datas));
		$this->smarty->assign("datas", $datas);
		$this->smarty->assign("numero", $numero);

		return $this->smarty->view('pages/home/'.$page.'.tpl'); 
	}
}
