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
			private $manufacture;
			private $price;
			private $link;
			private $category;
			private $subCategory;
			private $viewed;
			private $provider;
			/* Category Table Name */
			private $categoryTable = "Category";
			/* Sub Category Table Name */
			private $subCategoryTable = "Sub_Category";
			/* Provider Table Name */
			private $providerTable = "Provider";
			/* Product Provider Table Name */
			private $productProviderTable = "Product_Provider";
			/* Connection */
			private $connection;

			public function __construct($connection = null)
			{
				$this->connection = $connection;
			}

			public function setId($id)
			{
				$this->id = $id;
			}

			public function getId()
			{
				return $this->id;
			}

			public function setIsEnabled($isEnabled)
			{
				$this->isEnabled = $isEnabled;
			}

			public function getIsEnabled()
			{
				return $this->isEnabled;
			}

			public function setName($name)
			{
				$this->name = $name;
			}

			public function getName()
			{
				return $this->name;
			}

			public function setDescription($description)
			{
				$this->description = $description;
			}

			public function getDescription()
			{
				return $this->description;
			}

			public function setImage($image)
			{
				$this->image = $image;
			}

			public function getImage()
			{
				return $this->image;
			}

			public function setManufacturer($manufacture)
			{
				$this->manufacture = $manufacture;
			}

			public function getManufacturer()
			{
				return $this->manufacture;
			}

			public function setPrice($price)
			{
				$this->price = $price;
			}

			public function getPrice()
			{
				return $this->price;
			}

			public function setLink($link)
			{
				$this->link = $link;
			}

			public function getLink()
			{
				return $this->link;
			}

			public function setCategory($category)
			{
				$this->category = $category;
			}

			public function getCategory()
			{
				return $this->category;
			}

			public function setSubCategory($subCategory)
			{
				$this->subCategory = $subCategory;
			}

			public function getSubCategory()
			{
				return $this->subCategory;
			}

			public function setViewed($viewed)
			{
				$this->viewed = $viewed;
			}

			public function getViewed()
			{
				return $this->viewed;
			}

			public function setProvider($provider)
			{
				$this->provider = $provider;
			}

			public function getProvider()
			{
				return $this->provider;
			}

			public function addProduct()
			{
				if ($this->productExists())
					return false;

				// Prepare the SQL statement to insert a new product
				$request = "INSERT INTO {$this->table}
				(name, description, image, manufacture)
				VALUES
				(:name, :description, :image, :manufacture);";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":name", $this->getName(), PDO::PARAM_STR, 255);
				$statement->bindParam(":description", $this->getDescription(), PDO::PARAM_STR, 255);
				$statement->bindParam(":image", $this->getImage(), PDO::PARAM_STR, 255);
				$statement->bindParam(":manufacture", $this->getManufacturer(), PDO::PARAM_STR, 255);
				// Execute Query
				$result = $statement->execute();

				if ($result)
				{
					// Retrieve the newly inserted product ID
					$this->setId($this->connection->lastInsertId());
					// Retrieve the provider ID based on the provider name
					$providerId = $this->getProviderIdByName($this->provider);
					// Retrieve the subcategory ID based on the subcategory name
					$subCategoryId = $this->getSubCategoryIdByName($this->subCategory);

					// Prepare the SQL statement to insert a new product
					$request = "INSERT INTO {$this->productProviderTable}
					(price, link, product_id, provider_id, sub_category_id)
					VALUES
					(:price, :link, :product_id, :provider_id, :sub_category_id);";
					// Preparing Statement
					$statement = $this->connection->prepare($request);
					// Binding Parameter
					$statement->bindParam(":price", $this->getPrice(), PDO::PARAM_STR);
					$statement->bindParam(":link", $this->getLink(), PDO::PARAM_STR, 255);
					$statement->bindParam(":product_id", $this->getId(), PDO::PARAM_INT);
					$statement->bindParam(":provider_id", $providerId, PDO::PARAM_INT);
					$statement->bindParam(":sub_category_id", $subCategoryId, PDO::PARAM_INT);
					// Execute Query
					$result = $statement->execute();

					return $result;
				}

				return false;
			}

			private function productExists()
			{
				// Prepare the SQL statement
				$request = "SELECT PC.id FROM {$this->table} PC
				INNER JOIN {$this->productProviderTable} PP
					ON PC.id = PP.product_id
				INNER JOIN {$this->providerTable} PV
					ON PV.id = PP.provider_id
				WHERE PC.is_enabled = true AND PV.is_enabled = true
					AND LOWER(PC.name) = LOWER(:product_name)
					AND LOWER(PC.description) = LOWER(:description)
					AND LOWER(PC.manufacture) = LOWER(:manufacture)
					AND LOWER(PV.name) = LOWER(:provider_name)
				LIMIT 0, 1;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":product_name", $this->getName(), PDO::PARAM_STR, 255);
				$statement->bindParam(":description", $this->getDescription(), PDO::PARAM_STR, 255);
				$statement->bindParam(":manufacture", $this->getManufacturer(), PDO::PARAM_STR, 255);
				$statement->bindParam(":provider_name", $this->getProvider(), PDO::PARAM_STR, 255);
				// Execute Query
				$statement->execute();

				if ($statement->rowCount() > 0)
					return true;
				return false;
			}

			private function getProviderIdByName($providerName)
			{
				// Prepare the SQL statement to fetch the provider ID by name
				$request = "SELECT id FROM {$this->providerTable} WHERE LOWER(name) = LOWER(:provider_name) LIMIT 0, 1;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":provider_name", $providerName, PDO::PARAM_STR, 255);
				// Execute Query
				$statement->execute();

				$result = $statement->fetch(PDO::FETCH_ASSOC);

				if ($result)
					// Return the provider ID
					return $result["id"];
				// Provider not found
				return false;
			}

			private function getSubCategoryIdByName($subCategoryName)
			{
				// Prepare the SQL statement to fetch the provider ID by name
				$request = "SELECT id FROM {$this->subCategoryTable} WHERE LOWER(name) = LOWER(:sub_category_name) LIMIT 0, 1;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":sub_category_name", $subCategoryName, PDO::PARAM_STR, 255);
				// Execute Query
				$statement->execute();

				$result = $statement->fetch(PDO::FETCH_ASSOC);

				if ($result)
					// Return the subcategory ID
					return $result["id"];
				// Subcategory not found
				return false;
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