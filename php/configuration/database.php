<?php

	class Database
	{
		/* Host IP or Name */
		private $host = "127.0.0.1";
		/* Database Name */
		private $database = "Comparini";
		/* MySQL Username */
		private $username = "root";
		/* MySQL User Password */
		private $password = "";
		/* Charset Encoding */
		private $charset = "utf8";
		/* PDO options */
		private $options =
			[
				PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Enable exceptions
				PDO::ATTR_EMULATE_PREPARES => false, // Disable prepared statement emulation
				PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Set the default fetch mode to associative array
			];
		/* PDO connection */
		private $connection;

		public function __construct()
		{
			// Create a new PDO connection
			try
			{
				/* Data Source Name */
				$dsn = "mysql:host={$this->host};dbname={$this->database};charset={$this->charset}";
				$this->connection = new PDO($dsn, $this->username, $this->password, $this->options);
			}
			catch (PDOException $e)
			{
				error_log("Connection failed: " . $e->getMessage(), 0);
				throw new Exception("Database connection failed");
			}
		}

		public function getConnection()
		{
			// Return the PDO Connection
			return $this->connection;
		}

		public function closeConnection()
		{
			// Set the PDO Connection to null to close it
			$this->connection = null;
		}
}