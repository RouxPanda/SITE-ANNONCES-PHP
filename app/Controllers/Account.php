<?php namespace App\Controllers;

class Account extends BaseController
{
	
	private $smarty;
	
	public function login()
	{
		$page = "login";
		
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		return $this->smarty->view('pages/'.$page.'.tpl'); 
    }
	
	public function register()
	{
		$page = "register";
		
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		return $this->smarty->view('pages/'.$page.'.tpl'); 
    }
}
