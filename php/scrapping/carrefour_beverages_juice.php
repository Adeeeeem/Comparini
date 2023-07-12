<?php
	/* Add the necessary HTTP headers */
	header("Access-Control-Allow-Origin: http://127.0.0.1/Comparini/");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

	/* Generate Web Json Token */
	include_once "../jwt/src/BeforeValidException.php";
	include_once "../jwt/src/ExpiredException.php";
	include_once "../jwt/src/SignatureInvalidException.php";
	include_once "../jwt/src/JWT.php";

	use \Firebase\JWT\JWT;

	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
	{
		/* Database & JWT Configurations */
		require_once "../configuration/core.php";

		/* Check if the admin is already connected */
		session_start();

		if (isset($_SESSION["admin"]) && !empty($_SESSION["admin"]) && isset($_SESSION["token"]) && !empty($_SESSION["token"]))
		{
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
					$response = array("success" => false, "message" => "EXPIRED_TOKEN");
					/* Return as Json Format */
					echo json_encode($response);
					exit;
				}
				else
				{
					error_reporting(E_ERROR | E_PARSE);

					/* Set the time limit to 300 seconds */
					set_time_limit(300);

					$baseURL = "https://www.carrefour.tn/default/mes-courses-alimentaires/boissons/jus.html";

					/* Create a new instance of the DOMDocument class */
					$dom = new DOMDocument();

					/* Enable internal error handling */
					libxml_use_internal_errors(true);

					$page = isset($_GET["p"]) ? $_GET["p"] : 1;
					$productsFound = false;

					/* Database Configuraitons */
					require_once "../configuration/database.php";

					/* Include the Product Class */
					require_once "../entities/Product.php";

					/* Get BD connection */
					$database = new Database();
					$connection = $database->getConnection();

					/* Get Product Class */
					$product = new Product($connection);

					/* Disable all existing products and product providers */
					$product->disableAllProducts("Carrefour");

					do
					{
						$queryParameters = ["p" => $page];
						$URL = $baseURL . '?' . http_build_query($queryParameters);

						/* Load the HTML from the URL */
						$dom->loadHTMLFile($URL, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);

						/* Create a new instance of the DOMXPath class */
						$xpath = new DOMXPath($dom);

						/* Find the product elements using XPath */
						$productElements = $xpath->query("//li[contains(@class, 'product-item')]");

						if ($productElements->length > 0)
						{
							foreach ($productElements as $productElement)
							{
								$nameElement = $xpath->query(".//strong[@class='product name']/a", $productElement)->item(0);
								$name = $nameElement !== null ? trim($nameElement->nodeValue) : null;

								$manufactureElement = $xpath->query(".//a[@class='cr-brand-name']", $productElement)->item(0);
								$manufacture = $manufactureElement !== null ? trim($manufactureElement->nodeValue) : null;

								$priceElement = $xpath->query(".//span[@class='price']", $productElement)->item(0);
								$priceText = $priceElement !== null ? trim($priceElement->textContent) : null;
								$price = str_replace([" ", "\n", "dt"], "", $priceText);
								$price = substr_replace($price, ".", -3, 0);

								$imageElement = $xpath->query(".//img[@alt]", $productElement)->item(0);
								$image = $imageElement !== null ? trim($imageElement->getAttribute("src")) : null;

								$descriptionElement = $xpath->query(".//p[@class='cr-product-list-short-description-grid']", $productElement)->item(0);
								$description = $descriptionElement !== null ? trim($descriptionElement->nodeValue) : null;
								$description = preg_replace("/^.*?de /i", "", $description);
								$description = strtoupper($description);
								$description = preg_replace("/(\d+)([A-Z]+)/", "$1 $2", $description);
								$description = str_replace("G", "GR", $description);

								$matches = [];
								preg_match('/(?i)(\d+(?:\.\d+)?)\s*([a-z]+)(.*)/', $description, $matches);

								$quantity = isset($matches[1]) ? $matches[1] : null;
								$unit = isset($matches[2]) ? strtoupper($matches[2]) : null;

								$linkElement = $xpath->query(".//strong[@class='product name']/a[@class='product-item-link']", $productElement)->item(0);
								$link = $linkElement !== null ? trim($linkElement->getAttribute("href")) : null;

								if (strpos($name, " de " . $quantity . $unit) !== false)
									$name = trim(str_replace(" de " . $quantity . $unit, "", $name));

								if (strpos($name, "Fruzzy") !== false)
								{
									$name = trim(str_replace("Fruzzy", "", $name));
									$manufacture = "Fruzzy";
								}

								if (strpos($name, $manufacture) !== false)
									$name = trim(str_replace($manufacture, "", $name));

								if ($manufacture == "DÉLICE DE FRUITS" || $manufacture == "DELICE")
									$manufacture = "DÉLICE";

								if ($manufacture == "OH!")
									$manufacture = "OH";

								$manufacture = trim(str_replace("'", "", $manufacture));

								$name = strtolower($name);
								$flavor = null;

								if (strpos($name, "boisson au jus") === 0)
									$flavor = str_ireplace("boisson au jus", "", $name);
								elseif (strpos($name, "jus") === 0)
									$flavor = str_ireplace("jus", "", $name);
								elseif (strpos($name, "boisson instantanée") === 0)
									$flavor = str_ireplace("boisson instantanée", "", $name);
								elseif (strpos($name, "nectar") === 0)
									$flavor = str_ireplace("nectar", "", $name);

								$name = trim(str_ireplace($flavor, "", $name));
								$flavor = trim(strtolower($flavor));

								if (strpos($flavor , "nectar") !== false)
									$flavor  = trim(str_replace("nectar", "", $flavor ));

								if (strpos($flavor , "100% naturel") !== false)
								{
									$flavor  = trim(str_replace("100% naturel", "", $flavor ));
									$name = $name . " 100% naturel";
								}

								if (strpos($flavor, "multi-vitaminée") !== false || strpos($flavor, "multivitaminée") !== false || strpos($flavor, "multi-vitaminé") !== false)
									$flavor = "multivitaminé";

								$flavor = trim(str_replace(["à la ", "de ", " de ", " et ", "d'", "au ", " /", "/ ", "/", "-"], " ", $flavor));
								$flavor = trim(str_replace("  ", " ", $flavor));

								$flavorWords = explode(" ", $flavor);
								sort($flavorWords);
								$flavor = implode(" ", $flavorWords);

								$name = preg_replace_callback("/(?<=\s)\w/u", function($match)
								{
									return strtoupper($match[0]);
								}, $name);
								$name = preg_replace_callback("/\b\w/u", function($match)
								{
									return strtoupper($match[0]);
								}, $name);

								$flavor = preg_replace_callback("/(?<=\s)\w/u", function($match)
								{
									return strtoupper($match[0]);
								}, $flavor);
								$flavor = preg_replace_callback("/\b\w/u", function($match)
								{
									return strtoupper($match[0]);
								}, $flavor);

								if ($name == "Boisson Au Jus" && $manufacture == "DÉLICE" && $flavor == "Tropical" && $quantity == "1" && $unit == "L")
									$name = "Nectar";

								if ($name == "Boisson Au Jus" && $manufacture == "DÉLICE" && $flavor == "Multivitaminé" && $quantity == "1" && $unit == "L")
									$name = "Nectar";

								if ($name == "Boisson Au Jus" && $manufacture == "DÉLICE" && $flavor == "Mangue" && $quantity == "1" && $unit == "L")
									$name = "Nectar";

								if ($name == "Boisson Au Jus" && $manufacture == "DÉLICE" && $flavor == "Mangue" && $quantity == "20" && $unit == "CL")
									$name = "Nectar";

								if ($name == "Jus" && $manufacture == "DÉLICE" && $flavor == "Multivitaminé" && $quantity == "20" && $unit == "CL")
									$name = "Nectar";

								if ($name == "Boisson Au Jus" && $manufacture == "ALMARAI" && $quantity == "1" && $unit == "L")
									$name = "Nectar";

								if ($flavor == "Float Orange" && $name == "Boisson Au Jus" && $manufacture == "RANI" && $quantity == "24" && $unit == "CL")
									$flavor = "Orange Pulpe";

								if ($flavor == "Multivitaminé" && $name == "Boisson Au Jus" && $manufacture == "TROPICO" && $quantity == "20" && $unit == "CL")
									$flavor = "Cocktail Fruits";

								$description = null;

								switch ($name)
								{
									case "Nectar": $description = "Nectar"; break;
									case "Boisson Instantanée": $description = "Instant Drink"; break;
									case "Boisson Concentrée": $description = "Concentrated Drink"; break;
									case "Sirop": $description = "Syrup"; break;
									default: if (strpos($name, "Jus") !== false) $description = "Juice"; else $description = "Others"; break;
								}

								$product->setName($name);
								$product->setManufacture($manufacture);
								$product->setPrice($price);
								$product->setImage($image);
								$product->setQuantity($quantity);
								$product->setUnit($unit);
								$product->setFlavor($flavor);
								$product->setDescription($description);
								$product->setLink($link);
								$product->setCategory("beverages");
								$product->setSubCategory("juice");
								$product->setProvider("Carrefour");

								$product->addProduct();
							}

							$productsFound = true;
							$page++;
						}
						else
						{
							$productsFound = false;
						}
					} while ($productsFound);

					/* Disable internal error handling */
					libxml_use_internal_errors(false);

					/* Encode to Json Format */
					$response = array("success" => true, "message" => "OK");
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
		}

		/* Encode to Json Format */
		$response = array("success" => false, "message" => "INVALID_TOKEN");
		/* Return as Json Format */
		echo json_encode($response);
		exit;
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