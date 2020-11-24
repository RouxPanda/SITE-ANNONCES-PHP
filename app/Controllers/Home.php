<?php namespace App\Controllers;

class Home extends BaseController
{
	
	private $smarty;
	
	public function index()
	{
		return view('welcome_message');
	}

	//--------------------------------------------------------------------
	public function view($page = 'home')
	{
		if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.php'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$this->smarty = service('SmartyEngine');

		$data['title'] = ucfirst($page); // Capitalize the first letter

		/*
		echo view('templates/header', $data);
		echo view('pages/'.$page, $data);
		echo view('templates/footer', $data);
		*/
		return $this->smarty->view('pages/home.tpl', $data); 
    }
}
