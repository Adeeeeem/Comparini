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
			private $lastUpdatedDate;
			private $name;
			private $quantity;
			private $unit;
			private $flavor;
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

			public function getId()
			{
				return $this->id;
			}

			public function setId($id)
			{
				$this->id = $id;
			}

			public function getIsEnabled()
			{
				return $this->isEnabled;
			}

			public function setIsEnabled($isEnabled)
			{
				$this->isEnabled = $isEnabled;
			}

			public function getName()
			{
				return $this->name;
			}

			public function setName($name)
			{
				$this->name = $name;
			}

			public function getQuantity()
			{
				return $this->quantity;
			}

			public function setQuantity($quantity)
			{
				$this->quantity = $quantity;
			}

			public function getUnit()
			{
				return $this->unit;
			}

			public function setUnit($unit)
			{
				$this->unit = $unit;
			}

			public function getFlavor()
			{
				return $this->flavor;
			}

			public function setFlavor($flavor)
			{
				$this->flavor = $flavor;
			}

			public function getDescription()
			{
				return $this->description;
			}

			public function setDescription($description)
			{
				$this->description = $description;
			}

			public function getImage()
			{
				return $this->image;
			}

			public function setImage($image)
			{
				$this->image = $image;
			}

			public function getManufacture()
			{
				return $this->manufacture;
			}

			public function setManufacture($manufacture)
			{
				$this->manufacture = $manufacture;
			}

			public function getPrice()
			{
				return $this->price;
			}

			public function setPrice($price)
			{
				$this->price = $price;
			}

			public function getLink()
			{
				return $this->link;
			}

			public function setLink($link)
			{
				$this->link = $link;
			}

			public function getCategory()
			{
				return $this->category;
			}

			public function setCategory($category)
			{
				$this->category = $category;
			}

			public function getSubCategory()
			{
				return $this->subCategory;
			}

			public function setSubCategory($subCategory)
			{
				$this->subCategory = $subCategory;
			}

			public function getViewed()
			{
				return $this->viewed;
			}

			public function setViewed($viewed)
			{
				$this->viewed = $viewed;
			}

			public function getProvider()
			{
				return $this->provider;
			}

			public function setProvider($provider)
			{
				$this->provider = $provider;
			}

			private function enableProduct()
			{
				// Prepare the SQL statement to update the product's is_enabled flag
				$request = "UPDATE {$this->table} SET is_enabled = true WHERE id = :product_id;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":product_id", $this->getId(), PDO::PARAM_INT);
				// Execute Query
				$statement->execute();
			}

			private function enableProductProvider()
			{
				// Prepare the SQL statement to update the product provider's is_enabled flag
				$request = "UPDATE {$this->productProviderTable} SET is_enabled = true WHERE product_id = :product_id AND provider_id = :provider_id;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameters
				$statement->bindParam(":product_id", $this->getId(), PDO::PARAM_INT);
				$statement->bindParam(":provider_id", $this->getProviderIdByName($this->getProvider()), PDO::PARAM_INT);
				// Execute Query
				$statement->execute();

				// Update the product's is_enabled flag
				$this->enableProduct();
			}

			public function disableAllProducts($provider)
			{
				$provider_id = $this->getProviderIdByName($provider);

				// Prepare the SQL statement to update the is_enabled flag for product providers
				$request = "UPDATE {$this->productProviderTable} SET is_enabled = false WHERE provider_id = :provider_id;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":provider_id", $provider_id, PDO::PARAM_INT);
				// Execute Query
				$productProviderResult = $statement->execute();

				return $productResult && $productProviderResult;
			}

			public function addProduct()
			{
				// Check if the Product exists
				if ($this->productExists())
				{
					// Check if the Provider of this Product exists
					if ($this->providerExists())
					{
						// Check if the price is different
						$existingPrice = $this->getExistingPrice();

						if ($existingPrice !== $this->getPrice())
						{
							$this->updatePrice($this->getPrice());
						}

						// Update Link and Image in case it's changed
						$this->updateProduct();

						// Set the product provider as enabled
						$this->enableProductProvider();

						return false;
					}
					else
					{
						// Retrieve the provider ID based on the provider name
						$providerId = $this->getProviderIdByName($this->getProvider());

						// Prepare the SQL statement to insert a new product
						$request = "INSERT INTO {$this->productProviderTable}
						(last_updated_date, price, image, link, product_id, provider_id)
						VALUES
						(CURDATE(), :price, :image, :link, :product_id, :provider_id);";
						// Preparing Statement
						$statement = $this->connection->prepare($request);
						// Binding Parameter
						$statement->bindParam(":price", $this->getPrice(), PDO::PARAM_STR);
						$statement->bindParam(":image", $this->getImage(), PDO::PARAM_STR, 255);
						$statement->bindParam(":link", $this->getLink(), PDO::PARAM_STR, 255);
						$statement->bindParam(":product_id", $this->getId(), PDO::PARAM_INT);
						$statement->bindParam(":provider_id", $providerId, PDO::PARAM_INT);
						// Execute Query
						$result = $statement->execute();

						return $result;
					}
				}

				// Retrieve the subcategory ID based on the subcategory name
				$subCategoryId = $this->getSubCategoryIdByName($this->getSubCategory());

				// Prepare the SQL statement to insert a new product
				$request = "INSERT INTO {$this->table}
				(name, quantity, unit, flavor, description, manufacture, sub_category_id)
				VALUES
				(:name, :quantity, :unit, :flavor, :description, :manufacture, :sub_category_id);";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":name", $this->getName(), PDO::PARAM_STR, 255);
				$statement->bindParam(":quantity", $this->getQuantity(), PDO::PARAM_STR, 50);
				$statement->bindParam(":unit", $this->getUnit(), PDO::PARAM_STR, 50);
				$statement->bindParam(":flavor", $this->getFlavor(), PDO::PARAM_STR, 255);
				$statement->bindParam(":description", $this->getDescription(), PDO::PARAM_STR, 255);
				$statement->bindParam(":manufacture", $this->getManufacture(), PDO::PARAM_STR, 255);
				$statement->bindParam(":sub_category_id", $subCategoryId, PDO::PARAM_INT);
				// Execute Query
				$result = $statement->execute();

				if ($result)
				{
					// Retrieve the newly inserted product ID
					$this->setId($this->connection->lastInsertId());
					// Retrieve the provider ID based on the provider name
					$providerId = $this->getProviderIdByName($this->getProvider());

					// Prepare the SQL statement to insert a new product
					$request = "INSERT INTO {$this->productProviderTable}
					(last_updated_date, price, image, link, product_id, provider_id)
					VALUES
					(CURDATE(), :price, :image, :link, :product_id, :provider_id);";
					// Preparing Statement
					$statement = $this->connection->prepare($request);
					// Binding Parameter
					$statement->bindParam(":price", $this->getPrice(), PDO::PARAM_STR);
					$statement->bindParam(":image", $this->getImage(), PDO::PARAM_STR, 255);
					$statement->bindParam(":link", $this->getLink(), PDO::PARAM_STR, 255);
					$statement->bindParam(":product_id", $this->getId(), PDO::PARAM_INT);
					$statement->bindParam(":provider_id", $providerId, PDO::PARAM_INT);
					// Execute Query
					$result = $statement->execute();

					return $result;
				}

				return false;
			}

			private function productExists()
			{
				// Prepare the SQL statement
				$request = "SELECT P.id FROM {$this->table} P
				WHERE (
						UPPER(P.name) LIKE CONCAT('%', UPPER(:name1), '%')
						OR UPPER(:name2) LIKE CONCAT('%', UPPER(P.name), '%')
					)
					AND UPPER(P.quantity) = UPPER(:quantity)
					AND UPPER(P.unit) = UPPER(:unit)
					AND
					(
						UPPER(P.flavor) LIKE CONCAT('%', UPPER(:flavor1), '%')
						OR UPPER(:flavor2) LIKE CONCAT('%', UPPER(P.flavor), '%')
					)
					AND
					(
						UPPER(P.manufacture) LIKE CONCAT('%', UPPER(:manufacture1), '%')
						OR UPPER(:manufacture2) LIKE CONCAT('%', UPPER(P.manufacture), '%')
					)
					AND P.sub_category_id = :sub_category_id
				LIMIT 0, 1;";

				// Preparing Statement
				$statement = $this->connection->prepare($request);

				// Binding Parameters
				$statement->bindParam(":name1", $this->getName(), PDO::PARAM_STR, 255);
				$statement->bindParam(":name2", $this->getName(), PDO::PARAM_STR, 255);
				$statement->bindParam(":quantity", $this->getQuantity(), PDO::PARAM_STR, 50);
				$statement->bindParam(":unit", $this->getUnit(), PDO::PARAM_STR, 50);
				$statement->bindParam(":flavor1", $this->getFlavor(), PDO::PARAM_STR, 255);
				$statement->bindParam(":flavor2", $this->getFlavor(), PDO::PARAM_STR, 255);
				$statement->bindParam(":manufacture1", $this->getManufacture(), PDO::PARAM_STR, 255);
				$statement->bindParam(":manufacture2", $this->getManufacture(), PDO::PARAM_STR, 255);
				$statement->bindParam(":sub_category_id", $this->getSubCategoryIdByName($this->getSubCategory()), PDO::PARAM_INT);

				// Execute Query
				$statement->execute();

				if ($statement->rowCount() > 0)
				{
					// Retrieve the product ID
					$row = $statement->fetch(PDO::FETCH_ASSOC);
					$this->setId($row["id"]);

					return true;
				}

				return false;
			}

			public function productExistsById($productId)
			{
				// Prepare the SQL statement
				$request = "SELECT id FROM {$this->table}
				WHERE id = :product_id
				LIMIT 1;";

				// Preparing Statement
				$statement = $this->connection->prepare($request);

				// Binding Parameter
				$statement->bindParam(":product_id", $productId, PDO::PARAM_INT);

				// Execute Query
				$statement->execute();

				return $statement->rowCount() > 0;
			}

			private function providerExists()
			{
				// Prepare the SQL statement
				$request = "SELECT provider_id FROM {$this->productProviderTable}
				WHERE product_id = :product_id
					AND provider_id = :provider_id
				LIMIT 0, 1;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":product_id", $this->getId(), PDO::PARAM_INT);
				$statement->bindParam(":provider_id", $this->getProviderIdByName($this->getProvider()), PDO::PARAM_INT);
				// Execute Query
				$statement->execute();

				if ($statement->rowCount() > 0)
				{
					// Get the existing price
					$result = $statement->fetch(PDO::FETCH_ASSOC);

					return $result["provider_id"];
				}

				return null;
			}

			private function getExistingPrice()
			{
				// Prepare the SQL statement
				$request = "SELECT PP.price FROM {$this->table} PC
				INNER JOIN {$this->productProviderTable} PP
					ON PC.id = PP.product_id
				INNER JOIN {$this->providerTable} PV
					ON PV.id = PP.provider_id
				WHERE PC.is_enabled = true AND PV.is_enabled = true
					AND UPPER(PC.name) = UPPER(:product_name)
					AND UPPER(PC.quantity) = UPPER(:quantity)
					AND UPPER(PC.unit) = UPPER(:unit)
					AND UPPER(PC.flavor) = UPPER(:flavor)
					AND UPPER(PC.manufacture) = UPPER(:manufacture)
					AND PC.sub_category_id = :sub_category_id
					AND UPPER(PV.name) = UPPER(:provider_name)
				LIMIT 0, 1;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":product_name", $this->getName(), PDO::PARAM_STR, 255);
				$statement->bindParam(":quantity", $this->getQuantity(), PDO::PARAM_STR, 50);
				$statement->bindParam(":unit", $this->getUnit(), PDO::PARAM_STR, 50);
				$statement->bindParam(":flavor", $this->getFlavor(), PDO::PARAM_STR, 255);
				$statement->bindParam(":manufacture", $this->getManufacture(), PDO::PARAM_STR, 255);
				$statement->bindParam(":sub_category_id", $this->getSubCategoryIdByName($this->getSubCategory()), PDO::PARAM_INT);
				$statement->bindParam(":provider_name", $this->getProvider(), PDO::PARAM_STR, 255);
				// Execute Query
				$statement->execute();

				if ($statement->rowCount() > 0)
				{
					// Get the existing price
					$result = $statement->fetch(PDO::FETCH_ASSOC);

					return $result["price"];
				}

				return null;
			}

			private function updatePrice($new_price)
			{
				$providerId = $this->getProviderIdByName($this->getProvider());

				// Prepare the SQL statement to update the price
				$request = "UPDATE {$this->productProviderTable}
				SET price = :new_price, last_updated_date = CURDATE()
				WHERE product_id = :product_id
				AND provider_id = :provider_id;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":new_price", $new_price, PDO::PARAM_STR);
				$statement->bindParam(":product_id", $this->getId(), PDO::PARAM_INT);
				$statement->bindParam(":provider_id", $providerId, PDO::PARAM_INT);
				// Execute Query
				$result = $statement->execute();

				return $result;
			}

			private function updateProduct()
			{
				// Retrieve the product ID and provider ID
				$productId = $this->getId();
				$providerId = $this->getProviderIdByName($this->getProvider());

				// Prepare the SQL statement to update the link and image
				$request = "UPDATE {$this->productProviderTable}
				SET link = :link, image = :image
				WHERE product_id = :product_id AND provider_id = :provider_id;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":link", $this->getLink(), PDO::PARAM_STR, 255);
				$statement->bindParam(":image", $this->getImage(), PDO::PARAM_STR, 255);
				$statement->bindParam(":product_id", $productId, PDO::PARAM_INT);
				$statement->bindParam(":provider_id", $providerId, PDO::PARAM_INT);
				// Execute Query
				$statement->execute();
			}

			private function getProviderIdByName($providerName)
			{
				// Prepare the SQL statement to fetch the provider ID by name
				$request = "SELECT id FROM {$this->providerTable} WHERE UPPER(name) = UPPER(:provider_name) LIMIT 0, 1;";
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
				$request = "SELECT id FROM {$this->subCategoryTable} WHERE UPPER(name) = UPPER(:sub_category_name) LIMIT 0, 1;";
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

			public function getTopProducts()
			{
				// Prepare the SQL statement to fetch top products limited
				$request = "SELECT P.id, P.name, P.quantity, P.unit, P.flavor, P.manufacture, PP.image, MIN(PP.price) AS price
				FROM {$this->table} P
				INNER JOIN {$this->productProviderTable} PP
					ON P.id = PP.product_id
				WHERE P.is_enabled = true AND PP.is_enabled = true
				GROUP BY P.name, P.quantity, P.unit, P.flavor, P.manufacture
				ORDER BY viewed DESC;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Execute Query
				$statement->execute();
				/* Retrieve Products */
				$products = $statement->fetchAll(PDO::FETCH_ASSOC);

				return $products;
			}

			public function getTopProductsLimited($number)
			{
				// Prepare the SQL statement to fetch top products limited
				$request = "SELECT P.id, P.name, P.quantity, P.unit, P.flavor, P.manufacture, PP.image, MIN(PP.price) AS price
				FROM {$this->table} P
				INNER JOIN {$this->productProviderTable} PP
					ON P.id = PP.product_id
				WHERE P.is_enabled = true AND PP.is_enabled = true
				GROUP BY P.name, P.quantity, P.unit, P.flavor, P.manufacture
				ORDER BY viewed DESC LIMIT :number;";
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
				$request = "SELECT P.id, P.name, PP.image, P.quantity, P.unit, P.flavor, P.manufacture, MIN(PP.price) AS price
				FROM {$this->table} P
				INNER JOIN {$this->productProviderTable} PP
					ON P.id = PP.product_id
				INNER JOIN {$this->subCategoryTable} SC
					ON P.sub_category_id = SC.id
				INNER JOIN {$this->categoryTable} C
					ON SC.category_id = C.id
				WHERE P.is_enabled = true AND PP.is_enabled = true AND C.is_enabled = true AND SC.is_enabled = true
					AND C.label = :category
				GROUP BY P.name, P.quantity, P.unit, P.flavor, P.manufacture
				ORDER BY P.viewed DESC
				LIMIT :number;";
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

			public function searchProducts($value)
			{
				if (!empty($value))
				{
					// Prepare the SQL statement to fetch products limited
					$request = "SELECT P.id, P.name, P.quantity, P.unit, P.flavor, P.manufacture, PP.image, MIN(PP.price) AS price
					FROM {$this->table} P
					INNER JOIN {$this->productProviderTable} PP
						ON P.id = PP.product_id
					WHERE P.is_enabled = true AND PP.is_enabled = true
					AND (UPPER(P.name) LIKE '%" . strtoupper($value) . "%'
					OR UPPER(P.quantity) LIKE '%" . strtoupper($value) . "%'
					OR UPPER(P.unit) LIKE '%" . strtoupper($value) . "%'
					OR UPPER(P.flavor) LIKE '%" . strtoupper($value) . "%'
					OR UPPER(P.manufacture) LIKE '%" . strtoupper($value) . "%')
					GROUP BY P.name, P.quantity, P.unit, P.flavor, P.manufacture
					ORDER BY viewed DESC;";
					// Preparing Statement
					$statement = $this->connection->prepare($request);
					// Execute Query
					$statement->execute();
					/* Retrieve Products */
					$products = $statement->fetchAll(PDO::FETCH_ASSOC);

					return $products;
				}

				return this->getTopProductsLimited(24);
			}

			public function getProductDetails($product_id)
			{
				// Prepare the SQL statement to fetch product details
				$request = "SELECT PC.id AS product_id, PC.name AS product_name, PC.quantity, PC.unit, PC.flavor, PC.manufacture, PP.last_updated_date, PP.price, PP.image, PP.link AS product_link, PV.name AS provider_name, PV.adresse, PV.link AS provider_link
				FROM {$this->table} PC
				INNER JOIN {$this->productProviderTable} PP
					ON PC.id = PP.product_id
				INNER JOIN {$this->providerTable} PV
					ON PP.provider_id = PV.id
				WHERE PC.is_enabled = true
					AND PV.is_enabled = true
					AND PP.is_enabled = true
					AND PC.id = :product_id
				ORDER BY PP.price ASC;";
				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				$statement->bindParam(":product_id", $product_id, PDO::PARAM_INT);
				// Execute Query
				$statement->execute();
				/* Retrieve Products */
				$details = $statement->fetchAll(PDO::FETCH_ASSOC);

				return $details;
			}

			public function getFilteredProducts($category, $sub_category, $type)
			{
				// Prepare the SQL statement to fetch product details
				$request = "SELECT P.id, P.name, PP.image, P.quantity, P.unit, P.flavor, P.manufacture, MIN(PP.price) AS price
				FROM {$this->table} P
				INNER JOIN {$this->productProviderTable} PP
					ON P.id = PP.product_id
				INNER JOIN {$this->subCategoryTable} SC
					ON P.sub_category_id = SC.id
				INNER JOIN {$this->categoryTable} C
					ON SC.category_id = C.id
				WHERE P.is_enabled = true AND PP.is_enabled = true AND C.is_enabled = true AND SC.is_enabled = true";

				if (!empty($category))
					$request .= " AND UPPER(C.label) = UPPER(:category_id)";

				if (!empty($sub_category))
					$request .= " AND UPPER(SC.label) = UPPER(:sub_category_id)";

				if (!empty($type))
					$request .= " AND UPPER(P.description) = UPPER(:type)";

				$request .= " GROUP BY P.id, P.name, P.quantity, P.unit, P.flavor, P.manufacture
				ORDER BY P.viewed DESC";

				// Preparing Statement
				$statement = $this->connection->prepare($request);
				// Binding Parameter
				if (!empty($category))
					$statement->bindParam(":category_id", $category, PDO::PARAM_STR, 255);

				if (!empty($sub_category))
						$statement->bindParam(":sub_category_id", $sub_category, PDO::PARAM_STR, 255);

				if (!empty($type))
						$statement->bindParam(":type", $type, PDO::PARAM_STR, 255);
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