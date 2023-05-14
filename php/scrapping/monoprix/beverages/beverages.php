<?php
	/* Add the necessary HTTP headers */
	header("Access-Control-Allow-Origin: http://127.0.0.1/Comparini/");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

	$URL = "https://courses.monoprix.tn/ezzahra/13-boissons";
	/* Enable internal error handling */
	libxml_use_internal_errors(true);

	$dom = new DOMDocument();
	$dom->loadHTMLFile($URL, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);

	/* Disable internal error handling */
	libxml_use_internal_errors(false);

	$xpath = new DOMXPath($dom);

	$productElements = $xpath->query("//li[contains(@class, 'product_item')]");

	if ($productElements->length > 0)
	{
		foreach ($productElements as $productElement)
		{
			$titleElement = $xpath->query(".//a[@itemprop='name']", $productElement)->item(0);
			$title = $titleElement !== null ? $titleElement->nodeValue : "N/A";

			$manufacturerElement = $xpath->query(".//div[@class='div_manufacturer_name']/span", $productElement)->item(0);
			$manufacturer = $manufacturerElement !== null ? $manufacturerElement->nodeValue : "N/A";

			$priceElement = $xpath->query(".//span[@itemprop='price']", $productElement)->item(0);
			$price = $priceElement !== null ? $priceElement->nodeValue : "N/A";

			$imageElement = $xpath->query(".//img[@alt]", $productElement)->item(0);
			$imageUrl = $imageElement !== null ? $imageElement->getAttribute("src") : "N/A";

			echo "Title: $title<br>";
			echo "Manufacturer: $manufacturer<br>";
			echo "Price: $price<br>";
			echo "Image URL: $imageUrl<br><br>";
		}
	}
	else
	{
		echo "No product elements found.\n";
	}
?>