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

		if($page == 'annonces') {
			$datas = $annonceModel->findAll();
		}else if($page = 'home') {
			$datas = $annonceModel->findAll(6, 0);
		}

		$this->smarty->assign("datas", $datas);

		return $this->smarty->view('pages/home/'.$page.'.tpl'); 
	}

}
