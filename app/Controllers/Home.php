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
		$this->smarty->assign('pseudo', $session->get('pseudo'));
		
		return $this->smarty->view('pages/home/'.$page.'.tpl'); 
    }
}
