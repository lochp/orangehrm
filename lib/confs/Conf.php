<?php
class Conf {

	var $smtphost;
	var $dbhost;
	var $dbport;
	var $dbname;
	var $dbuser;
	var $version;

	function Conf() {

		$this->dbhost	= 'localhost';
		$this->dbport 	= '3306';
		if(defined('ENVIRNOMENT') && ENVIRNOMENT == 'test'){
		$this->dbname    = 'ohm_vn';		
		}else {
		$this->dbname    = 'ohm_vn';
		}
		$this->dbuser    = 'root';
		$this->dbpass	= '123456';
		$this->version = '3.3.1';

		$this->emailConfiguration = dirname(__FILE__).'/mailConf.php';
		$this->errorLog =  realpath(dirname(__FILE__).'/../logs/').'/';
	}
}
?>