<?php
	/* This file is created to prevent direct access to the php directory */
	header("HTTP/1.0 404 Not Found");
	http_response_code(401);
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/404.html");
	//readfile("../404.html");
	exit();
?>