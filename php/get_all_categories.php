<?php
	/* Add the necessary HTTP headers */
	header("Access-Control-Allow-Origin: http://127.0.0.1/Comparini/");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		/* Database Configuraitons */
		require_once "configuration/database.php";

		/* Include the Category Class */
		require_once "entities/Category.php";

		/* Get BD connection */
		$database = new Database();
		$connection = $database->getConnection();

		/* Get Category Class */
		$category = new Category($connection);
		/* Get All Categories */
		$categories = $category->getAllCategories();

		/* Encode to Json Format */
		$response = array("success" => true, "categories" => $categories);
		/* Return as Json Format */
		echo json_encode($response);
		exit;
	}
	/* This file is being accessed directly */
	else
	{
		header("HTTP/1.0 404 Not Found");
		http_response_code(404);
		header("Content-Type: text/html; charset=UTF-8");
		readfile("../404.html");
		exit();
	}
?>