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

		if ($_SERVER["REQUEST_METHOD"] == "GET")
		{
			/* Retrieve the product_id from the query string */
			$product_id = isset($_GET["product_id"]) ? intval($_GET["product_id"]) : 0;

			if ( $product_id > 0 )
			{
				/* Avoid any XSS or SQL Injection Function */
				$product_id = Security($product_id);

				/* Get BD connection */
				$database = new Database();
				$connection = $database->getConnection();

				/* Get Product Class */
				$product = new Product($connection);

				/* Check if the product exists */
				$exists = $product->productExistsById($product_id);

				if ($exists)
				{
					/* Retrieve the product details */
					$product_details = $product->getProductDetails($product_id);

					/* Encode to Json Format */
					$response = array("success" => true, "products" => $product_details);
					/* Return as Json Format */
					echo json_encode($response);
					exit;
				}

				/* Encode to Json Format */
				$response = array("success" => false, "message" => "INVALID_ID");
				/* Return as Json Format */
				echo json_encode($response);
				exit;
			}
			/* Encode to Json Format */
			$response = array("success" => false, "message" => "INVALID_DATA");
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