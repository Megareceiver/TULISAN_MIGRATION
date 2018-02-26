<?php
	define('db_host', "localhost");
	define('db_user', "root");
	define('db_pass', "root");
	define('db_name', "tulisan_migration_8");

	//email
	define('e_host', "palbapang.idwebhost.com");
	define('e_name', "Mailer");
	define('e_user', "mailer@syncardtech.com");
	define('e_pass', "syncard1234mailer");
	define('e_path', "www.tulisan.local");

	define('domain', "www.tulisan.local");

	function openGate(){
		$gate = new PDO("mysql:host=".db_host.";dbname=".db_name, db_user, db_pass);
		$gate->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $gate;
	}

	function closeGate($gate){
		mysqli_close($gate);
	}

	function basePath(){
		return $_SERVER['SERVER_NAME'].'';
	}
?>
