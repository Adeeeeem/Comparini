<?php

	/* Database & JWT Configuraitons */
	$host = "127.0.0.1";
	$database = "Comparini";
	$username = "root";
	$password = "";
	$charset = "utf8";
	$options =
	[
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Enable exceptions
		PDO::ATTR_EMULATE_PREPARES => false, // Disable prepared statement emulation
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Set the default fetch mode to associative array
	];
	/* Get BD connection */
	$dsn = "mysql:host=$host;dbname=$database;charset=$charset";
	$connection = new PDO($dsn, $username, $password, $options);

	/* Define the admin details */
	$is_enabled = true;
	$username = "admin";
	$password = "changeit";
	$hashed_password = password_hash($password, PASSWORD_DEFAULT);
	$first_name = "Mohamed Adem";
	$last_name = "Ben Mouss";
	$email = "MohamedAdemBenMoussa@Gmail.com";

	/* Define the SQL query to insert a new admin */
	$request = "INSERT INTO Admin (is_enabled, username, password, first_name, last_name, email) VALUES (:is_enabled, :username, :password, :first_name, :last_name, :email);";
	/* Preparing Statement */
	$statement = $connection->prepare($request);
	/* Binding Parameter */
	$statement->bindParam(":is_enabled", $is_enabled, PDO::PARAM_BOOL);
	$statement->bindParam(":username", $username, PDO::PARAM_STR, 25);
	$statement->bindParam(":password", $hashed_password, PDO::PARAM_STR, 255);
	$statement->bindParam(":first_name", $first_name, PDO::PARAM_STR, 50);
	$statement->bindParam(":last_name", $last_name, PDO::PARAM_STR, 50);
	$statement->bindParam(":email", $email, PDO::PARAM_STR, 100);
	/* Execute Query */
	if($statement->execute())
		echo "New admin added successfully !";
	else
		echo "Error adding new admin : " . $statement->errorInfo()[2];

	/* Close the database connection */
	$connection = null;
?>