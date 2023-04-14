<?php
	function Security($value)
	{
		// Remove leading and trailing whitespace
		$value = trim($value);

		// Remove any HTML tags
		$value = strip_tags($value);

		// Remove backslashes
		$value = stripslashes($value);
		
		// Convert special characters to HTML entities
		$value = htmlentities($value, ENT_QUOTES | ENT_HTML5, "UTF-8");
		//$value = htmlspecialchars($value, ENT_QUOTES | ENT_HTML5, "UTF-8");
		
		// Replace single quotes with two single quotes to prevent SQL injection attacks
		$value = str_replace("'", "''", $value);
		
		// Escape any backslashes to prevent SQL injection attacks
		$value = str_replace("\\", "\\\\", $value);
		
		// Encode special characters to prevent XSS attacks
		$value = filter_var($value, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW | FILTER_FLAG_ENCODE_HIGH);
		
		return $value;
	}
?>