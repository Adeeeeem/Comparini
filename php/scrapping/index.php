<?php
	/* This file is created to prevent direct access to the php directory */
	header("HTTP/1.0 404 Not Found");
	http_response_code(404);
	header("Content-Type: text/html; charset=UTF-8");
	readfile("../../404.html");
	exit();
?>