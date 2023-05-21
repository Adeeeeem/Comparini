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
		/* Database & JWT Configuraitons */
		require_once "configuration/database.php";
		require_once "configuration/core.php";
		require_once "configuration/security.php";

		/* Include the Admin Class */
		require_once "entities/Admin.php";

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
				/* If Username is not Empty */
				if ( isset($data["username"]) && !empty($data["username"]) )
				{
					/* If Password is not Empty */
					if ( isset($data["password"]) && !empty($data["password"]) )
					{
						/* Sanitize input data */
						$data = array_map("Security", $data);

						/* Get BD connection */
						$database = new Database();
						$connection = $database->getConnection();

						/* Get Admin Class */
						$admin = new Admin($connection);

						/* Avoid any XSS or SQL Injection Function */
						$username = Security($data["username"]);
						$password = Security($data["password"]);

						/* Generate the token is case if success */
						$token = $admin->login($username, $password);
						
						switch ($token)
						{
							case "USERNAME_NOT_FOUND":
									/* Encode to Json Format */
									$response = array("success" => false, "message" => "USERNAME_NOT_FOUND");
									/* Return as Json Format */
									echo json_encode($response);
									exit;
								break;
							case "WRONG_PASSWORD":
									/* Encode to Json Format */
									$response = array("success" => false, "message" => "WRONG_PASSWORD");
									/* Return as Json Format */
									echo json_encode($response);
									exit;
								break;
							default:
									/* Start Session */
									session_start();
									/* Save Admin Object */
									$_SESSION["admin"] = serialize($admin);
									/* Save Token */
									$_SESSION["token"] = $token;
									/* Encode to Json Format */
									$response = array("success" => true, "redirect" => "index.html", "message" => $token);
									/* Return as Json Format */
									echo json_encode($response);
									/* Redirect to Dashboard */
									//header("Location: ../admin/index.html");
									exit;
								break;
						}

						/* Close Connection */
						$database->closeConnection();
					}

					/* Encode to Json Format */
					$response = array("success" => false, "message" => "EMPTY_PASSWORD");
					/* Return as Json Format */
					echo json_encode($response);
					exit;
				}
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