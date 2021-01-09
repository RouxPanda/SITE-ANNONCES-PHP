<?php

// Valid PHP Version?
$minPHPVersion = '7.2';
if (phpversion() < $minPHPVersion)
{
	die("Your PHP version must be {$minPHPVersion} or higher to run CodeIgniter. Current version: " . phpversion());
}
unset($minPHPVersion);

if(!file_exists('../config.json')) {
	// Lancer l'installateur
	$need_install = true;
	require('install.php');
}else{
	define('FCPATH', __DIR__ . DIRECTORY_SEPARATOR);

	$pathsPath = realpath(FCPATH . '../app/Config/Paths.php');
	chdir(__DIR__);

	require $pathsPath;
	$paths = new Config\Paths();

	// Chargement du fichier de configuration de la base de donnée
	$jsonConfigFile = file_get_contents("../config.json");
	$config = json_decode($jsonConfigFile, true);

	$_ENV['db_hostname'] = $config['hostname'];
	$_ENV['db_username'] = $config['db_user'];
	$_ENV['db_password'] = $config['db_pass'];
	$_ENV['db_name'] = $config['db_name'];

	// Lancement de l'application
	$app = require rtrim($paths->systemDirectory, '/ ') . '/bootstrap.php';
	$app->run();
}

