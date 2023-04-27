<?php
	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		class Category
		{
			/* Table Name */
			private $table = "Category";
			/* Object Properties */
			private $id;
			private $isEnabled;
			private $label;
			private $name;
			/* Connection */
			private $connection;

			public function __construct($connection = null)
			{
				$this->connection = $connection;
			}

			public function getAllCategories()
			{
				// Prepare the SQL statement to fetch all categories
				$request = "SELECT * FROM {$this->table} WHERE is_enabled = true;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Execute Query
				$statement->execute();
				/* Retrieve Categories */
				$categories = $statement->fetchAll(PDO::FETCH_ASSOC);

				return $categories;
			}
		}
	}
	/* This file is being accessed directly */
	else
	{
		header("HTTP/1.0 404 Not Found");
		http_response_code(404);
		header("Content-Type: text/html; charset=UTF-8");
		readfile("../../404.html");
		exit();
	}
?>