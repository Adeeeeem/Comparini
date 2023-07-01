<?php
	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		class SubCategory
		{
			/* Table Name */
			private $table = "Sub_Category";
			/* Object Properties */
			private $id;
			private $isEnabled;
			private $label;
			private $name;
			private $Category;
			/* Category Table Name */
			private $categoryTable = "Category";
			/* Product Table Name */
			private $productTable = "Product";
			/* Connection */
			private $connection;

			public function __construct($connection = null)
			{
				$this->connection = $connection;
			}

			public function getAllSubCategories()
			{
				// Prepare the SQL statement to fetch all sub categories
				$request = "SELECT * FROM {$this->table} WHERE is_enabled = true;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Execute Query
				$statement->execute();
				/* Retrieve Categories */
				$subCategories = $statement->fetchAll(PDO::FETCH_ASSOC);

				return $subCategories;
			}

			public function getAllSubCategoriesDetailed()
			{
				// Prepare the SQL statement to fetch all sub categories
				$request = "SELECT
					C.label AS category_label,
					C.name AS category_name,
					(SELECT COUNT(P2.id) FROM {$this->productTable} P2 INNER JOIN {$this->table} SC2 ON P2.sub_category_id = SC2.id WHERE P2.is_enabled = true AND SC2.category_id = SC.category_id) AS category_product_count,
					SC.label AS sub_category_label,
					SC.name AS sub_category_name,
					(SELECT COUNT(SC2.category_id) FROM {$this->table} SC2 WHERE SC2.is_enabled = true AND SC2.category_id = SC.category_id) AS sub_category_count,
					(SELECT COUNT(P2.id) FROM {$this->productTable} P2 WHERE P2.is_enabled = true AND P2.sub_category_id = SC.id) AS sub_category_product_count,
					P.manufacture,
					(SELECT COUNT(P2.id) FROM Product P2 WHERE P2.is_enabled = true AND P2.manufacture = P.manufacture) AS manufacture_product_count,
					P.description,
					(SELECT COUNT(P2.id) FROM {$this->productTable} P2 WHERE P2.is_enabled = true AND P2.description = P.description) AS description_product_count
				FROM {$this->categoryTable} C
				LEFT JOIN {$this->table} SC
					ON C.id = SC.category_id
				LEFT JOIN {$this->productTable} P
					ON SC.id = P.sub_category_id
				WHERE SC.is_enabled AND C.is_enabled
				GROUP BY
					C.label,
					SC.label,
					P.manufacture,
					P.description
				ORDER BY
					C.id ASC,
					SC.id ASC,
					CASE WHEN P.description = 'Others' THEN 2 ELSE 1 END ASC;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Execute Query
				$statement->execute();
				/* Retrieve Categories */
				$subCategories = $statement->fetchAll(PDO::FETCH_ASSOC);

				return $subCategories;
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