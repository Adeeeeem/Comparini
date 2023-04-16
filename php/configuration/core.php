<?php
	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		/* The Key used to sign and verify tokens */
		define("JWT_SECRET", "comparini");
		/* The Algorithm used for signing and verifying tokens */
		define("JWT_ALGORITHM", "HS256");
		/* The amount of time (in seconds) that a token is valid for */
		define("JWT_EXPIRATION_TIME", 3600); // 1 hour
		/* The issuer of the token (typically your website or application) */
		define("JWT_ISSUER", "http://Comparini.tn");
		/* The timezone used for token expiration */
		date_default_timezone_set("Africa/Tunis");
		/* Show error reports */
		error_reporting(E_ALL); 
	}
	/* This file is being accessed directly */
	else
	{
		header("HTTP/1.0 404 Not Found");
		http_response_code(401);
		include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/404.html");
		//readfile("../../404.html");
		exit();
	}
?>