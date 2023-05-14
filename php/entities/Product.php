<?php
	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		class Product
		{
			/* Table Name */
			private $table = "Product";
			/* Object Properties */
			private $id;
			private $isEnabled;
			private $name;
			private $description;
			private $image;
			private $viewed;
			/* Category Table Name */
			private $categoryTable = "Category";
			/* Sub Category Table Name */
			private $subCategoryTable = "Sub_Category";
			/* Product Provider Table Name */
			private $productProviderTable = "Product_Provider";
			/* Connection */
			private $connection;

			public function __construct($connection = null)
			{
				$this->connection = $connection;
			}

			public function getTopProductsLimited($number)
			{
				// Prepare the SQL statement to fetch top products limited
				$request = "SELECT * FROM {$this->table} WHERE is_enabled = true ORDER BY viewed DESC LIMIT :number;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":number", $number, PDO::PARAM_INT);
				// Execute Query
				$statement->execute();
				/* Retrieve Products */
				$products = $statement->fetchAll(PDO::FETCH_ASSOC);

				return $products;
			}

			public function getTopProductsByCategoryLimited($category, $number)
			{
				// Prepare the SQL statement to fetch top products limited
				$request = "SELECT P.id, P.name, P.image, PP.price FROM {$this->table} P INNER JOIN {$this->productProviderTable} PP ON P.id = PP.product_id INNER JOIN {$this->subCategoryTable} SC ON PP.sub_category_id = SC.id INNER JOIN {$this->categoryTable} C ON SC.category_id = C.id WHERE P.is_enabled = true AND C.is_enabled = true AND SC.is_enabled = true AND PP.is_enabled AND C.label = :category ORDER BY P.viewed DESC LIMIT :number;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":category", $category, PDO::PARAM_STR, 255);
				$statement->bindParam(":number", $number, PDO::PARAM_INT);
				// Execute Query
				$statement->execute();
				/* Retrieve Products */
				$products = $statement->fetchAll(PDO::FETCH_ASSOC);

				return $products;
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