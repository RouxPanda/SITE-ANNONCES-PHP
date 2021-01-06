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
			$datas = $annonceModel->findAll(6, 0);
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

		$datas = $annonceModel->findAll(16, $numero*16);
		

		$this->smarty->assign("datas", $datas);
		$this->smarty->assign("numero", $numero);
		$this->smarty->assign("total", count($datas));

		return $this->smarty->view('pages/home/'.$page.'.tpl'); 
	}
	
	public function search($recherche) {
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
		$datas = $annonceModel->where("A_titre LIKE '%$recherche%'")->findAll();
		if(empty($datas)){
			$session->setFlashdata("error", array('Aucunes annonce trouvé'));
		}
		

		$this->smarty->assign("datas", $datas);
		$this->smarty->assign("total", count($datas));

		return $this->smarty->view('pages/home/'.$page.'.tpl'); 
	}

}
