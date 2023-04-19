<?php
	/* Add the necessary HTTP headers */
	header("Access-Control-Allow-Origin: http://127.0.0.1/Comparini/");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

	/* Include the Admin Class */
	require_once "entities/Admin.php";

	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		/* Check if the admin is already connected */
		session_start();

		/* Retreive Connected Admin details */
		$adminSerialized = $_SESSION["admin"];
		$admin = unserialize($adminSerialized);

		if ($admin->logout())
		{
			/* Empty Sessions */
			unset($_SESSION["admin"]);
			unset($_SESSION["token"]);

			/* Encode to Json Format */
			$response = array("success" => true, "redirect" => "../", "message" => "LOGOUT");
			/* Return as Json Format */
			echo json_encode($response);
			exit;
		}
		else
		{
			/* Encode to Json Format */
			$response = array("success" => false, "redirect" => "../", "message" => "ERROR");
			/* Return as Json Format */
			echo json_encode($response);
			exit;
		}
	}
	/* This file is being accessed directly */
	else
	{
		header("HTTP/1.0 404 Not Found");
		http_response_code(401);
		include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/404.html");
		//readfile("../404.html");
		exit();
	}
?>