<?php namespace App\Controllers;

class Member extends BaseController
{
	
	private $smarty;
	
	public function profil()
	{
		$page = "profil";
		
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		return $this->smarty->view('pages/'.$page.'.tpl'); 
    }
	
	public function gestion()
	{
		$page = "gestion";
		
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		return $this->smarty->view('pages/'.$page.'.tpl'); 
    }
	
	public function chat()
	{
		$page = "chat";
		
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		return $this->smarty->view('pages/'.$page.'.tpl'); 
    }
}
