<?php namespace App\Controllers;

class Admin extends BaseController
{
	
	private $smarty;
	
	public function admin()
	{
		$page = "admin";
		
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.tpl'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');
		$this->smarty->assign("title", ucfirst($page));

		return $this->smarty->view('pages/'.$page.'.tpl');  
    }
}
