<?php
	/* Add the necessary HTTP headers */
	header("Access-Control-Allow-Origin: http://127.0.0.1/Comparini/");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

	/* This is an AJAX request */
	if (!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
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
					$titleElement = $xpath->query(".//h2[@class='h3 product-title']/a", $productElement)->item(0);
					$title = $titleElement !== null ? trim($titleElement->nodeValue) : "N/A";
					$manufactureElement = $xpath->query(".//p[@class='manufacturer_product text-xs-left']", $productElement)->item(0);
					$manufacture = $manufactureElement !== null ? trim($manufactureElement->nodeValue) : "N/A";

					$priceElement = $xpath->query(".//span[@itemprop='price']", $productElement)->item(0);
					$price = $priceElement !== null ? str_replace(["DT", ","], ["", "."], trim($priceElement->nodeValue)) : "N/A";

					$imageElement = $xpath->query(".//img[@class='img-responsive center-block']", $productElement)->item(0);
					$image = $imageElement !== null ? trim($imageElement->getAttribute("data-full-size-image-url")) : "N/A";

					$descriptionElement = $xpath->query(".//div[@class='listds product_short']", $productElement)->item(0);
					$description = $descriptionElement !== null ? trim($descriptionElement->nodeValue) : "N/A";
					$description = trim(preg_replace_callback('/(?i)(\d+(?:\.\d+)?)\s*([a-z]+)(.*)/', function($matches)
					{
						$number = $matches[1];
						$unit = strtoupper($matches[2]);
						$flavor = preg_replace('/\s*-\s*/', ' ', ucwords(trim($matches[3], " -")));
						return $number . ' ' . $unit . ' ' . $flavor;
					}, $description));

					$linkElement = $xpath->query(".//h2[@class='h3 product-title']/a", $productElement)->item(0);
					$link = $linkElement !== null ? trim($linkElement->getAttribute("href")) : "N/A";

					/* Get Product Class */
					$product = new Product($connection);

					$product->setName($title);
					$product->setManufacture($manufacture);
					$product->setPrice($price);
					$product->setImage($image);
					$product->setDescription($description);
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