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

					$baseURL = "https://courses.monoprix.tn/ezzahra/76-boissons-gazeuses";

					/* Create a new instance of the DOMDocument class */
					$dom = new DOMDocument();

					/* Enable internal error handling */
					libxml_use_internal_errors(true);

					$page = isset($_GET["page"]) ? $_GET["page"] : 1;
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
					$product->disableAllProducts("Monoprix");

					do
					{
						$queryParameters = ["page" => $page];
						$URL = $baseURL . '?' . http_build_query($queryParameters);

						/* Load the HTML from the URL */
						$dom->loadHTMLFile($URL, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);

						/* Create a new instance of the DOMXPath class */
						$xpath = new DOMXPath($dom);

						/* Find the product elements using XPath */
						$productElements = $xpath->query("//li[contains(@class, 'product_item')]");

						if ($productElements->length > 0)
						{
							foreach ($productElements as $productElement)
							{
								$linkElement = $xpath->query(".//div[@class='h3 product-title']/a", $productElement)->item(0);
								$link = $linkElement !== null ? trim($linkElement->getAttribute("href")) : null;

								/* Create a new instance of the DOMDocument class */
								$productDom = new DOMDocument();

								/* Load the HTML from the URL */
								$productDom->loadHTMLFile($link, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);

								/* Create a new instance of the DOMXPath class */
								$productXPath = new DOMXPath($productDom);

								$nameElement = $productXPath->query("//h1[contains(@class, 'productpage_title')]")->item(0);
								$name = $nameElement !== null ? trim($nameElement->textContent) : null;

								$name = strtolower($name);
								$name = preg_replace_callback("/(?<=\s)\w/u", function($match)
								{
									return strtoupper($match[0]);
								}, $name);
								$name = preg_replace_callback("/\b\w/u", function($match)
								{
									return strtoupper($match[0]);
								}, $name);

								$manufactureElement = $productXPath->query("//div[contains(@class, 'marque')]/span")->item(0);
								$manufacture = $manufactureElement !== null ? trim($manufactureElement->textContent) : null;

								$priceElement = $productXPath->query("//div[contains(@class, 'current-price')]/span[@itemprop='price']")->item(0);
								$price = $priceElement !== null ? str_replace(["DT", ","], ["", "."], trim($priceElement->textContent)) : null;

								$imageElement = $productXPath->query("//img[contains(@class, 'js-qv-product-cover')]")->item(0);
								$image = $imageElement !== null ? trim($imageElement->getAttribute("src")) : null;

								$quantityElement = $productXPath->query("//dd[contains(@class, 'value')]")->item(0);
								$quantity = $quantityElement !== null ? trim(preg_replace("/[^0-9]/", "", $quantityElement->textContent)) : null;
								$quantityText = $quantityElement !== null ? trim($quantityElement->textContent) : null;
								$quantity = null;

								preg_match("/\d+(\.\d+)?/", $quantityText, $matches);
								if (!empty($matches))
									$quantity = $matches[0];

								$unit = $quantityElement !== null ? trim(preg_replace("/[^A-Z]/", "", strtoupper($quantityElement->textContent))) : null;
								$unit = strtoupper($unit);

								$flavorElement = $productXPath->query("//dd[contains(@class, 'value')]")->item(1);
								$flavor = $flavorElement !== null ? trim($flavorElement->textContent) : null;
								$flavor = trim(preg_replace(["/(\w+)\s*-\s*(\w+)/", "/(\w+)\s* -\s*(\w+)/", "/(\w+)\s*- \s*(\w+)/"], "$1 $2", $flavor));
								$flavor = trim(preg_replace("/\b(?:DE|AU|D'|A'|LA|LE|ET)\b\s*/i", "", $flavor));
								$flavor = trim(str_replace([" DE ", " AU ", " D'", " A'", " LA ", " LE ", " ET "], " ", strtoupper($flavor)));
								$flavor = trim(str_replace([" /", "/ ", "/"], " ", $flavor));
								$flavor = trim(str_replace("  ", " ", $flavor));
								
								$flavor = strtolower($flavor);

								$flavorWords = explode(" ", $flavor);
								sort($flavorWords);
								$flavor = implode(" ", $flavorWords);

								$flavor = preg_replace_callback("/(?<=\s)\w/u", function($match)
								{
									return strtoupper($match[0]);
								}, $flavor);
								$flavor = preg_replace_callback("/\b\w/u", function($match)
								{
									return strtoupper($match[0]);
								}, $flavor);

								$description = null;

								if (strpos($name, "Gazeuse") !== false)
									$description = "Soda";
								elseif (strpos($name, "Bière") !== false)
									$description = "Alcohol-Free Beer";
								elseif (strpos($name, "Tea") !== false)
									$description = "Tea";
								else
									$description = "Others";

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
								$product->setSubCategory("soda");
								$product->setProvider("Monoprix");

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
				$response = array("success" => false, "message" => $e->getMessage());
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