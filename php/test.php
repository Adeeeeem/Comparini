<?php
	/* Add the necessary HTTP headers */
	header("Access-Control-Allow-Origin: http://127.0.0.1/Comparini/");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

	/* Database & JWT Configuraitons */
	require_once "configuration/database.php";
	require_once "configuration/core.php";
	require_once "configuration/security.php";

	/* Include the Admin Class */
	require_once "entities/Admin.php";

	/* Generate Web Json Token */
	include_once "jwt/src/BeforeValidException.php";
	include_once "jwt/src/ExpiredException.php";
	include_once "jwt/src/SignatureInvalidException.php";
	include_once "jwt/src/JWT.php";

	use \Firebase\JWT\JWT;

	/* Start Session */
	session_start();
	/* Retreive JWT Token */
	$token = $_SESSION["token"];
	/* Retreive Connected Admin details */
	$adminSerialized = $_SESSION["admin"];
	$admin = unserialize($adminSerialized);

	try
	{
		/* Decode the token */
		$decoded = JWT::decode($token, JWT_SECRET, array(JWT_ALGORITHM));
		/* Check if the token is expired */
		$now = new DateTimeImmutable();

		if ($decoded->exp < $now->getTimestamp())
		{
			/* Encode to Json Format */
			$response = array("success" => false, "redirect" => "../index.html", "message" => "EXPIRED_TOKEN");
			/* Return as Json Format */
			echo json_encode($response);
			exit;
		}
		else
		{
			/* Encode to Json Format */
			$response = array("success" => true, "redirect" => "index.html", "message" => $token);
			/* Return as Json Format */
			echo json_encode($response);
			exit;
		}
	}
	catch (Exception $e)
	{
		/* Encode to Json Format */
		$response = array("success" => false, "message" => "INVALID_TOKEN");
		/* Return as Json Format */
		echo json_encode($response);
		exit;
	}
?>