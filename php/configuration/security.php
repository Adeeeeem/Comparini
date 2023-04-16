<?php
	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		function Security($value)
		{
			// Remove leading and trailing whitespace
			$value = trim($value);

			// Remove any HTML tags
			$value = strip_tags($value);

			// Remove backslashes
			$value = stripslashes($value);
			
			// Convert special characters to HTML entities
			$value = htmlentities($value, ENT_QUOTES | ENT_HTML5, "UTF-8");
			//$value = htmlspecialchars($value, ENT_QUOTES | ENT_HTML5, "UTF-8");
			
			// Replace single quotes with two single quotes to prevent SQL injection attacks
			$value = str_replace("'", "''", $value);
			
			// Escape any backslashes to prevent SQL injection attacks
			$value = str_replace("\\", "\\\\", $value);
			
			return $value;
		}
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