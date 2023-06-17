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

					$baseURL = "https://www.geantdrive.tn/azur-city/18-jus";

					/* Create a new instance of the DOMDocument class */
					$dom = new DOMDocument();

					/* Enable internal error handling */
					libxml_use_internal_errors(true);

					$page = isset($_GET["page"]) ? $_GET["page"] : 1;
					$productsFound = false;

					do
					{
						$queryParameters = ["page" => $page];
						$URL = $baseURL . '?' . http_build_query($queryParameters);

						/* Use cURL to fetch the HTML content */
						$curl = curl_init();
						curl_setopt($curl, CURLOPT_URL, $URL);
						curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
						/* Disable SSL certificate verification */
						curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
						$htmlContent = curl_exec($curl);
						curl_close($curl);

						/* Load the HTML content into the DOMDocument */
						$dom->loadHTML($htmlContent, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);

						/* Create a new instance of the DOMXPath class */
						$xpath = new DOMXPath($dom);

						/* Find the product elements using XPath */
						$productElements = $xpath->query("//div[contains(@class, 'item-product')]");

						if ($productElements->length > 0)
						{
							/* Database Configuraitons */
							require_once "../configuration/database.php";

							/* Include the Product Class */
							require_once "../entities/Product.php";

							/* Get BD connection */
							$database = new Database();
							$connection = $database->getConnection();

							foreach ($productElements as $productElement)
							{
								$linkElement = $xpath->query(".//h2[@class='h3 product-title']/a", $productElement)->item(0);
								$link = $linkElement !== null ? trim($linkElement->getAttribute("href")) : null;

								/* Use cURL to fetch the HTML content */
								$curl = curl_init();
								curl_setopt($curl, CURLOPT_URL, $link);
								curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
								/* Disable SSL certificate verification */
								curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
								$htmlContent = curl_exec($curl);
								curl_close($curl);

								/* Load the HTML content into the DOMDocument */
								$productDom = new DOMDocument();
								$productDom->loadHTML($htmlContent, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);

								/* Create a new instance of the DOMXPath class */
								$productXPath = new DOMXPath($productDom);

								$nameElement = $productXPath->query("//h1[@class='h1 product-head1']")->item(0);
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

								$manufactureElement = $productXPath->query("//p[@class='manufacturer_product']/a")->item(0);
								$manufacture = $manufactureElement !== null ? trim($manufactureElement->textContent) : null;

								if ($manufacture == "DÉLICE DE FRUITS" || $manufacture == "DELICE")
									$manufacture = "DÉLICE";

								if ($manufacture == "AL MARAI")
									$manufacture = "ALMARAI";

								if ($manufacture == "BNINO STIL" || $manufacture == "ENERGY STIL")
									$manufacture = "STIL";

								$priceElement = $productXPath->query("//div[@class='current-price']/span[@itemprop='price']");
								$price = $priceElement !== null ? str_replace(["DT", ","], ["", "."], trim($priceElement->item(0)->textContent)) : null;

								$imageElement = $productXPath->query("//img[@id='zoom']");
								$image = $imageElement !== null ? trim($imageElement->item(0)->getAttribute("src")) : null;

								$descriptionElement = $productXPath->query("//div[contains(@class, 'prodes')]");
								$description = $descriptionElement !== null ? trim($descriptionElement->item(0)->nodeValue) : null;

								$matches = [];
								preg_match('/(?i)(\d+(?:\.\d+)?)\s*([a-z]+)(.*)/', $description, $matches);

								$quantity = isset($matches[1]) ? $matches[1] : null;
								
								$unit = isset($matches[2]) ? strtoupper($matches[2]) : null;

								$flavor = isset($matches[3]) ? ucwords(trim($matches[3], " -")) : null;
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

								if ($name == "Boisson Instantannée")
									$name = "Boisson Instantanée";

								if ($name == "Nectar" && $manufacture == "LA FRUITIERE" && $quantity == "250" && $unit == "ML")
									$name = "Boisson Au Jus";

								if  ($name == "Nectar" && $manufacture == "OH" && $quantity == "1" && $unit == "L")
									$name = "Boisson Au Jus";

								if ($name == "Nectar" && $manufacture == "OH" && $quantity == "25" && $unit == "CL")
									$name = "Boisson Au Jus";

								if ($flavor == "Multi Vitaminée")
									$flavor = "Multivitaminé";

								if (strpos($flavor , "Bnino ") !== false)
									$flavor  = trim(str_replace("Bnino ", "", $flavor ));

								if ($flavor == "Cocktail" && $name == "Boisson Au Jus" && $manufacture == "TROPICO" && $quantity == "20" && $unit == "CL")
									$flavor = "Cocktail Fruits";

								/* Get Product Class */
								$product = new Product($connection);

								$product->setName($name);
								$product->setManufacture($manufacture);
								$product->setPrice($price);
								$product->setImage($image);
								$product->setQuantity($quantity);
								$product->setUnit($unit);
								$product->setFlavor($flavor);
								$product->setLink($link);
								$product->setCategory("beverages");
								$product->setSubCategory("juice");
								$product->setProvider("Géant");

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