/*==================================================
			on Window Reload
==================================================*/
$(window).on("load", function()
{
/*==================================================
			Load Categories
==================================================*/
	$.ajax
	({
		url: "php/get_categories.php",
		type: "POST",
		dataType: "json",
		contentType: "application/json",
		data: {},
		success: function(response)
		{
			console.log(response);

			if (response.success)
			{
				$.each(response.categories, function(index, category)
				{
					var liElement = document.createElement("li");

					var centerElement = document.createElement("center");

					var divElement = document.createElement("div");
					divElement.id = category.label;
					divElement.className = "uk-card uk-card-default uk-card-small";
  
					var divCardBody = document.createElement("div");
					divCardBody.className = "uk-card-body";
  
					var imgElement = document.createElement("img");
					imgElement.src = "img/categories/" + category.label + ".png";
  
					divCardBody.appendChild(imgElement);
					divElement.appendChild(divCardBody);
  
					var divCardFooter = document.createElement("div");
					divCardFooter.className = "uk-card-footer";
  
					var spanElement = document.createElement("span");
					spanElement.setAttribute("data-language-tag", category.label);
					spanElement.textContent = category.name;
  
					divCardFooter.appendChild(spanElement);
					divElement.appendChild(divCardFooter);
  
					centerElement.appendChild(divElement);
					liElement.appendChild(centerElement);
  
					$("div#categories_filter div#categories ul").append(liElement);
				});

				translate(localStorage.getItem("COMPARINI_LANGUAGE"), "data-language-tag");
			}
			else
				$.growl.error({ message: "Oh no! It seems like all the categories are on a vacation and have left us stranded here! We apologize for the inconvenience and hope they come back soon." });
		},
		error: function(xhr, textStatus, errorThrown)
		{
			$.growl.error({ message: "Our hamsters are working hard to fix the issue. Please bear with us and try again soon." });
			console.log(xhr.responseText);
		}
	});
/*==================================================
			Load Products
==================================================*/
	$.ajax
	({
		url: "php/get_top_products_limited.php",
		type: "POST",
		dataType: "json",
		contentType: "application/json",
		data: {},
		success: function(response)
		{
			console.log(response);

			if (response.success)
			{
				$.each(response.products, function(index, product)
				{
					var liElement = document.createElement("li");

					var divElement = document.createElement("div");
					divElement.id = product.id;
					divElement.className = "uk-card uk-card-default uk-card-body";

					var favoriteIcon = document.createElement("span");
					favoriteIcon.className = "uk-position-top-right favorite-icon";

					var svgElement = document.createElementNS("http://www.w3.org/2000/svg", "svg");
					svgElement.setAttribute("width", "30");
					svgElement.setAttribute("height", "30");
					svgElement.setAttribute("viewBox", "0 0 20 20");

					var pathElement = document.createElementNS("http://www.w3.org/2000/svg", "path");
					pathElement.className = "favorite-heart";
					pathElement.setAttribute("fill", "none");
					pathElement.setAttribute("stroke", "#000");
					pathElement.setAttribute("stroke-width", "1.03");
					pathElement.setAttribute("d", "M10,4 C10,4 8.1,2 5.74,2 C3.38,2 1,3.55 1,6.73 C1,8.84 2.67,10.44 2.67,10.44 L10,18 L17.33,10.44 C17.33,10.44 19,8.84 19,6.73 C19,3.55 16.62,2 14.26,2 C11.9,2 10,4 10,4 L10,4 Z");
  
					svgElement.appendChild(pathElement);
					favoriteIcon.appendChild(svgElement);
  
					var h6Element = document.createElement("h6");
					h6Element.textContent = product.manufacture;
  
					var imgElement = document.createElement("img");
					imgElement.src = product.image;
  
					var h4Element = document.createElement("h4");
					h4Element.textContent = product.name;
  
					var pElement = document.createElement("p");
					pElement.textContent = product.quantity + " " + product.unit + " " + product.flavor;
  
					var h5Element = document.createElement("h5");
					h5Element.textContent = product.price + " DT";
  
					divElement.appendChild(favoriteIcon);
					divElement.appendChild(h6Element);
					divElement.appendChild(imgElement);
					divElement.appendChild(h4Element);
					divElement.appendChild(pElement);
					divElement.appendChild(h5Element);
					liElement.appendChild(divElement);
  
					$("div#categories_filter ul#products").append(liElement);
				});

				translate(localStorage.getItem("COMPARINI_LANGUAGE"), "data-language-tag");
			}
			else
				$.growl.error({ message: "Oops! Our products seem to have gone on a spontaneous vacation. We're working hard to bring them back. Please check back later for some amazing deals!" });
		},
		error: function(xhr, textStatus, errorThrown)
		{
			$.growl.error({ message: "Our hamsters are working hard to fix the issue. Please bear with us and try again soon." });
			console.log(xhr.responseText);
		}
	});
});
/*==================================================
			on Document Ready
==================================================*/
$(function()
{
/*==================================================
			Filter by Category
==================================================*/
	$("div#categories_filter div#categories").on("click", "div.uk-card", function()
	{
		var category_id = $(this).attr("id");

		$.ajax
		({
			url: "php/get_top_products_by_category_limited.php",
			type: "POST",
			dataType: "json",
			contentType: "application/json",
			data: {category_id, category_id},
			success: function(response)
			{
				console.log(response);

				if (response.success)
				{
					$("div#categories_filter ul#products").empty();

					$.each(response.products, function(index, product)
					{
						var liElement = document.createElement("li");

						var divElement = document.createElement("div");
						divElement.id = product.id;
						divElement.className = "uk-card uk-card-default uk-card-body";

						var favoriteIcon = document.createElement("span");
						favoriteIcon.className = "uk-position-top-right favorite-icon";

						var svgElement = document.createElementNS("http://www.w3.org/2000/svg", "svg");
						svgElement.setAttribute("width", "30");
						svgElement.setAttribute("height", "30");
						svgElement.setAttribute("viewBox", "0 0 20 20");

						var pathElement = document.createElementNS("http://www.w3.org/2000/svg", "path");
						pathElement.className = "favorite-heart";
						pathElement.setAttribute("fill", "none");
						pathElement.setAttribute("stroke", "#000");
						pathElement.setAttribute("stroke-width", "1.03");
						pathElement.setAttribute("d", "M10,4 C10,4 8.1,2 5.74,2 C3.38,2 1,3.55 1,6.73 C1,8.84 2.67,10.44 2.67,10.44 L10,18 L17.33,10.44 C17.33,10.44 19,8.84 19,6.73 C19,3.55 16.62,2 14.26,2 C11.9,2 10,4 10,4 L10,4 Z");
	  
						svgElement.appendChild(pathElement);
						favoriteIcon.appendChild(svgElement);
	  
						var h6Element = document.createElement("h6");
						h6Element.textContent = product.manufacture;
	  
						var imgElement = document.createElement("img");
						imgElement.src = product.image;
	  
						var h4Element = document.createElement("h4");
						h4Element.textContent = product.name;
	  
						var pElement = document.createElement("p");
						pElement.textContent = product.quantity + " " + product.unit + " " + product.flavor;
	  
						var h5Element = document.createElement("h5");
						h5Element.textContent = product.price + " DT";
	  
						divElement.appendChild(favoriteIcon);
						divElement.appendChild(h6Element);
						divElement.appendChild(imgElement);
						divElement.appendChild(h4Element);
						divElement.appendChild(pElement);
						divElement.appendChild(h5Element);
						liElement.appendChild(divElement);
	  
						$("div#categories_filter ul#products").append(liElement);
					});

					translate(localStorage.getItem("COMPARINI_LANGUAGE"), "data-language-tag");
				}
			},
			error: function(xhr, textStatus, errorThrown)
			{
				$.growl.error({ message: "Our hamsters are working hard to fix the issue. Please bear with us and try again soon." });
				console.log(xhr.responseText);
			}
		});
	});
/*==================================================
			Search for a Product
==================================================*/
	$("div#categories_filter div#search form.uk-search").submit(function(e)
	{
		e.preventDefault();
	});

	$("div#categories_filter div#search input").keydown(function(e)
	{
		var search_value = $(this).val();

		if (e.keyCode === 13 || (e.keyCode === 8 && search_value === ''))
		{
			e.preventDefault();
			return false;
		}

		$.ajax
		({
			url: "php/search_product.php",
			type: "POST",
			dataType: "json",
			contentType: "application/json",
			data: {search_value, search_value},
			success: function(response)
			{
				console.log(response);

				if (response.success)
				{
					$("div#categories_filter ul#products").empty();

					$.each(response.products, function(index, product)
					{
						var liElement = document.createElement("li");

						var divElement = document.createElement("div");
						divElement.id = product.id;
						divElement.className = "uk-card uk-card-default uk-card-body";

						var favoriteIcon = document.createElement("span");
						favoriteIcon.className = "uk-position-top-right favorite-icon";

						var svgElement = document.createElementNS("http://www.w3.org/2000/svg", "svg");
						svgElement.setAttribute("width", "30");
						svgElement.setAttribute("height", "30");
						svgElement.setAttribute("viewBox", "0 0 20 20");

						var pathElement = document.createElementNS("http://www.w3.org/2000/svg", "path");
						pathElement.className = "favorite-heart";
						pathElement.setAttribute("fill", "none");
						pathElement.setAttribute("stroke", "#000");
						pathElement.setAttribute("stroke-width", "1.03");
						pathElement.setAttribute("d", "M10,4 C10,4 8.1,2 5.74,2 C3.38,2 1,3.55 1,6.73 C1,8.84 2.67,10.44 2.67,10.44 L10,18 L17.33,10.44 C17.33,10.44 19,8.84 19,6.73 C19,3.55 16.62,2 14.26,2 C11.9,2 10,4 10,4 L10,4 Z");
	  
						svgElement.appendChild(pathElement);
						favoriteIcon.appendChild(svgElement);
	  
						var h6Element = document.createElement("h6");
						h6Element.textContent = product.manufacture;
	  
						var imgElement = document.createElement("img");
						imgElement.src = product.image;
	  
						var h4Element = document.createElement("h4");
						h4Element.textContent = product.name;
	  
						var pElement = document.createElement("p");
						pElement.textContent = product.quantity + " " + product.unit + " " + product.flavor;
	  
						var h5Element = document.createElement("h5");
						h5Element.textContent = product.price + " DT";
	  
						divElement.appendChild(favoriteIcon);
						divElement.appendChild(h6Element);
						divElement.appendChild(imgElement);
						divElement.appendChild(h4Element);
						divElement.appendChild(pElement);
						divElement.appendChild(h5Element);
						liElement.appendChild(divElement);
	  
						$("div#categories_filter ul#products").append(liElement);
					});

					translate(localStorage.getItem("COMPARINI_LANGUAGE"), "data-language-tag");
				}
			},
			error: function(xhr, textStatus, errorThrown)
			{
				$.growl.error({ message: "Our hamsters are working hard to fix the issue. Please bear with us and try again soon." });
				console.log(xhr.responseText);
			}
		});
	});
/*==================================================
			Product Details
==================================================*/
	$("div#categories_filter ul#products").on("click", "li div.uk-card", function()
	{
		var product_id = $(this).attr("id");
		var url = "product.html?product_id=" + product_id;
		window.location.href = url;
	});
});