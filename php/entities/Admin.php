<?php
	/* Generate Web Json Token */
	include_once "jwt/src/BeforeValidException.php";
	include_once "jwt/src/ExpiredException.php";
	include_once "jwt/src/SignatureInvalidException.php";
	include_once "jwt/src/JWT.php";

	use \Firebase\JWT\JWT;

	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		class Admin
		{
			/* Table Name */
			private $table = "Admin";
			/* Object Properties */
			private $id;
			private $isEnabled;
			private $username;
			private $password;
			private $firstName;
			private $lastName;
			private $email;
			/* Connection */
			private $connection;

			public function __construct($connection = null)
			{
				$this->connection = $connection;
			}

			public static function withAdminObject($admin)
			{
				$instance = new self($admin->getConnection());
				$instance->id = $admin->getId();
				$instance->isEnabled = $admin->getIsEnabled();
				$instance->username = $admin->getUsername();
				$instance->password = $admin->getPassword();
				$instance->firstName = $admin->getFirstName();
				$instance->lastName = $admin->getLastName();
				$instance->email = $admin->getEmail();
				return $instance;
			}

			public function __get($attribute)
			{
				return $this->$attribute;
			}

			public function __set($attribute, $value)
			{
				switch($attribute)
				{
					case "isEnabled":
						$this->isEnabled = $value;
						break;
					case "username":
						$this->username = $value;
						break;
					case "password":
						$this->password = $value;
						break;
					case "firstName":
						$this->firstName = $value;
						break;
					case "lastName":
						$this->lastName = $value;
						break;
					case "email":
						$this->email = $value;
						break;
					default:
						throw new Exception($attribute . "Not Found !");
				}
			}

			// mark the PDO object as transient
			public function __sleep()
			{
				return array("id", "username", "firstName", "lastName");
			}

			public function login($username, $password)
			{
				// Prepare the SQL statement to fetch the admin by username and password
				$request = "SELECT * FROM {$this->table} WHERE LOWER(username) = LOWER(:username) LIMIT 0, 1;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":username", $username, PDO::PARAM_STR, 25);
				// Execute Query
				$statement->execute();
				if ($statement->rowCount() == 1)
				{
					/* Retrieve Details */
					$admin = $statement->fetch(PDO::FETCH_ASSOC);
					/* Assign the values of attributes */
					$this->id = $admin["id"];
					$this->isEnabled = $admin["is_enabled"];
					$this->username = $admin["username"];
					$this->password = $admin["password"];
					$this->firstName = $admin["first_name"];
					$this->lastName = $admin["last_name"];
					$this->email = $admin["email"];

					$hashedPassword = $admin["password"];
					$isValidPassword = password_verify($password, $hashedPassword);

					if (!$isValidPassword)
					{
						return "WRONG_PASSWORD";
					}

					$payload = array
					(
						"iss" => JWT_ISSUER,
						"sub" => $admin["id"],
						"iat" => time(),
						"exp" => time() + JWT_EXPIRATION_TIME
					);

					return JWT::encode($payload, JWT_SECRET);
				}

				return "USERNAME_NOT_FOUND";
			}

			public function logout()
			{
				/* Destroy Session */
				session_unset();
				session_destroy();
				$this->connection = null;
				/* Check if session is destroyed */
				if(session_status() === PHP_SESSION_NONE)
					return true; // Logout successful
				return false; // Logout failed
			}
		}
	}
	/* This file is being accessed directly */
	else
	{
		header("HTTP/1.0 404 Not Found");
		http_response_code(401);
		include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/404.html");
		//readfile("../../404.html");
		exit();
	}
?>