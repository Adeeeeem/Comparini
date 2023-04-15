<?php
	/* Generate Web Json Token */
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/php/libs/php-jwt-master/src/BeforeValidException.php");
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/php/libs/php-jwt-master/src/ExpiredException.php");
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/php/libs/php-jwt-master/src/SignatureInvalidException.php");
	include_once($_SERVER["DOCUMENT_ROOT"]."/Comparini/php/libs/php-jwt-master/src/JWT.php");
	use \Firebase\JWT\JWT;

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

		public function __construct($connection)
		{
			$this->connection = $connection;
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
					echo $attribute . "Not Found !";
			}
		}

		public function login($username, $password)
		{
			/* Start Session */
			session_start();
			// Prepare the SQL statement to fetch the admin by username and password
			$request = "SELECT * FROM {$this->table} WHERE LOWER(username) = LOWER(:username) LIMIT 0, 1;";
			// Preparing Statement
			$statement = $this->connection->prepare($request);
			// Avoid any XSS or SQL Injection Function
			//$username = Security($username);
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
			session_destroy();
		}
	}
?>