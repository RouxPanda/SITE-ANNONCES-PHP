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

		if ($this->request->getMethod() == 'post') {
			$recup = $this->request->getVar('rchr');
			return redirect()->to(base_url()."/Home/search/$recup");
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
	
	public function search($recherche) {
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
		$datas = $annonceModel->where("A_titre LIKE '%$recherche%'")->orderBy('A_idannonce', 'desc')->findAll();

		if(empty($datas)){
			$session->setFlashdata("error", array('Aucunes annonce trouvé'));
		}

		$this->smarty->assign("total", count($datas));
		$this->smarty->assign("datas", $datas);
		$this->smarty->assign("numero", $numero);

		return $this->smarty->view('pages/home/'.$page.'.tpl'); 
	}

}
