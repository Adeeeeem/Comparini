<?php
	/* Add the necessary HTTP headers */
	header("Access-Control-Allow-Origin: http://127.0.0.1/Comparini/");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

	/* Database & JWT Configuraitons */
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/php/configuration/database.php");
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/php/configuration/core.php");
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/php/configuration/security.php");

	/* Include the Admin Class */
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/php/entities/Admin.php");

	if ($_SERVER["REQUEST_METHOD"] == "POST")
	{
		/* Retrieve DATA from the HTML form */
		$dataJSON = file_get_contents("php://input");
		$data = array();
		parse_str($dataJSON, $data);

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
								/* Encode to Json Format */
								$response = array("success" => true, "message" => $token);
								/* Return as Json Format */
								echo json_encode($response);
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
?>