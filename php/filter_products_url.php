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
		require_once "configuration/security.php";

		/* Include the Product Class */
		require_once "entities/Product.php";

		if ($_SERVER["REQUEST_METHOD"] == "POST")
		{
			/* Retrieve DATA from the HTML form */
			$dataJSON = file_get_contents("php://input");

			if ($_SERVER["CONTENT_TYPE"] === "application/json")
			{
				$data = array();
				parse_str($dataJSON, $data);
			}
			elseif ($_SERVER["CONTENT_TYPE"] === "application/x-www-form-urlencoded")
			{
				$data = json_decode($dataJSON, true);
			}
			else
			{
				/* Encode to Json Format */
				$response = array("success" => false, "message" => "INVALID_REQUEST");
				/* Return as Json Format */
				echo json_encode($response);
				exit;
			}

			if ( isset($data) && !empty($data) )
			{
				/* Sanitize input data */
				$data = array_map("Security", $data);

				/* Get BD connection */
				$database = new Database();
				$connection = $database->getConnection();

				/* Get Product Class */
				$product = new Product($connection);

				/* Avoid any XSS or SQL Injection Function */
				$category_id = isset($data["category_id"]) ? Security($data["category_id"]) : null;
				$sub_category_id = isset($data["sub_category_id"]) ? Security($data["sub_category_id"]) : null;
				$type_id = isset($data["type_id"]) ? Security($data["type_id"]) : null;

				/* Get filtered products based on the parameters */
				$products = $product->getFilteredProducts($category_id, $sub_category_id, $type_id);

				/* Encode to Json Format */
				$response = array("success" => true, "products" => $products);
				/* Return as Json Format */
				echo json_encode($response);
				exit;

				/* Close Connection */
				$database->closeConnection();
			}

			/* Encode to Json Format */
			$response = array("success" => false, "message" => "EMPTY_DATA");
			/* Return as Json Format */
			echo json_encode($response);
			exit;
		}
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