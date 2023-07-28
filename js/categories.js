/*==================================================
			on Window Reload
==================================================*/
$(window).on("load", function()
{
	//resetFilters();
/*==================================================
		Load Sub Categories & Left Menu
==================================================*/
	$.ajax
	({
		url: "php/get_sub_categories.php",
		type: "POST",
		dataType: "json",
		contentType: "application/json",
		data: {},
		success: function(response)
		{
			console.log(response);

			if (response.success)
			{
				var existingCategories = [];

				$.each(response.subCategories, function(index, category)
				{
					if (existingCategories.indexOf(category.category_label) === -1)
					{
						/* Top Navbar */
						var menuItem = document.createElement("li");
						menuItem.id = category.category_label;
						menuItem.className = "category";

						var menuItemLink = document.createElement("a");
						menuItemLink.className = "uk-text-center";
						menuItemLink.href = "#";

						var spanElement = document.createElement("span");
						spanElement.setAttribute("data-language-tag", category.category_label);
						spanElement.textContent = category.category_name;

						menuItemLink.appendChild(spanElement);
						menuItem.appendChild(menuItemLink);

						var dropdownDiv = document.createElement("div");
						if (category.sub_category_count > 3)
							dropdownDiv.className = "uk-navbar-dropdown uk-navbar-dropdown-width-3";
						else
							dropdownDiv.className = "uk-navbar-dropdown uk-navbar-dropdown-width-" + category.sub_category_count;

						var gridDiv = document.createElement("div");
						if (category.sub_category_count > 3)
							gridDiv.className = "uk-drop-grid uk-child-width-1-3";
						else
							gridDiv.className = "uk-drop-grid uk-child-width-1-" + category.sub_category_count;
						gridDiv.setAttribute("uk-grid", "");

						dropdownDiv.appendChild(gridDiv);
						menuItem.appendChild(dropdownDiv);
						$("nav#categories_nav ul").append(menuItem);
						
						existingCategories.push(category.category_label);
					}
				});

				var existingSubCategories = [];

				$.each(response.subCategories, function(index, subCategory)
				{
					if (existingSubCategories.indexOf(subCategory.sub_category_label) === -1)
					{
						/* Top Navbar */
						var subCategoryDiv = document.createElement("div");

						var subCategoryUl = document.createElement("ul");
						subCategoryUl.id = subCategory.sub_category_label;
						subCategoryUl.className = "uk-nav uk-navbar-dropdown-nav";

						var subCategoryHeader = document.createElement("li");
						subCategoryHeader.id = subCategory.sub_category_label;
						subCategoryHeader.className = "uk-nav-header sub_category";

						var subSpanElement = document.createElement("span");
						subSpanElement.setAttribute("data-language-tag", subCategory.sub_category_label);
						subSpanElement.textContent = subCategory.sub_category_name;

						subCategoryHeader.appendChild(subSpanElement);
						subCategoryUl.appendChild(subCategoryHeader);
						subCategoryDiv.appendChild(subCategoryUl);

						$("nav#categories_nav ul li#" + subCategory.category_label + " div.uk-navbar-dropdown div.uk-drop-grid").append(subCategoryDiv);

						existingSubCategories.push(subCategory.sub_category_label);

						var existingDescription = [];

						$.each(response.subCategories, function(index, subDescription)
						{
							if (subDescription.description !== null && existingDescription.indexOf(subDescription.description) === -1 && subDescription.sub_category_label === subCategory.sub_category_label)
							{
								/* Top Navbar */
								var subCategoryDescription = document.createElement("li");
								subCategoryDescription.id = subDescription.description;
								subCategoryDescription.className = "type";

								var subSpanDescription = document.createElement("span");
								subSpanDescription.setAttribute("data-language-tag", subDescription.description);
								subSpanDescription.textContent = subDescription.description;

								subCategoryDescription.appendChild(subSpanDescription);
								subCategoryUl.appendChild(subCategoryDescription);

								/* Left Menu */
								var flexDiv = document.createElement("div");
								flexDiv.className = "uk-flex uk-flex-between";
								flexDiv.id = subDescription.description;

								var label = document.createElement("label");
								label.className = "uk-text-left";

								var checkbox = document.createElement("input");
								checkbox.className = "uk-checkbox";
								checkbox.type = "checkbox";
								checkbox.value = subDescription.description;
								label.appendChild(checkbox);

								var space = document.createElement("span");
								space.innerHTML = "&nbsp;";
								label.appendChild(space);

								var labelText = document.createElement("span");
								labelText.setAttribute("data-language-tag", subDescription.description);
								labelText.textContent = subDescription.description;
								label.appendChild(labelText);
								flexDiv.appendChild(label);

								var countSpan = document.createElement("span");
								countSpan.className = "uk-text-right";
								countSpan.textContent = subDescription.description_product_count;

								flexDiv.appendChild(countSpan);

								$("#types_filter").append(flexDiv);
								$("#types_filter").append(document.createElement("br"));

								existingDescription.push(subDescription.description);
							}
						});

						/* Left Menu */
						var flexDiv = document.createElement("div");
						flexDiv.className = "uk-flex uk-flex-between";
						flexDiv.id = subCategory.sub_category_label;

						var label = document.createElement("label");
						label.className = "uk-text-left";

						var checkbox = document.createElement("input");
						checkbox.className = "uk-checkbox";
						checkbox.type = "checkbox";
						checkbox.value = subCategory.sub_category_label;
						label.appendChild(checkbox);

						var space = document.createElement("span");
						space.innerHTML = "&nbsp;";
						label.appendChild(space);

						var labelText = document.createElement("span");
						labelText.setAttribute("data-language-tag", subCategory.sub_category_label);
						labelText.textContent = subCategory.sub_category_name;
						label.appendChild(labelText);
						flexDiv.appendChild(label);

						var countSpan = document.createElement("span");
						countSpan.className = "uk-text-right";
						countSpan.textContent = subCategory.sub_category_product_count;

						flexDiv.appendChild(countSpan);

						$("#sub_categories_filter").append(flexDiv);
						$("#sub_categories_filter").append(document.createElement("br"));
					}
				});

				var existingManufactures = [];

				$.each(response.subCategories, function(index, manufacture)
				{
					if (existingManufactures.indexOf(manufacture.manufacture) === -1)
					{
						/* Left Menu */
						var flexDiv = document.createElement("div");
						flexDiv.className = "uk-flex uk-flex-between";
						flexDiv.id = manufacture.manufacture;

						var label = document.createElement("label");
						label.className = "uk-text-left";

						var checkbox = document.createElement("input");
						checkbox.className = "uk-checkbox";
						checkbox.type = "checkbox";
						checkbox.value = manufacture.manufacture;
						label.appendChild(checkbox);

						var space = document.createElement("span");
						space.innerHTML = "&nbsp;";
						label.appendChild(space);

						var labelText = document.createElement("span");
						labelText.textContent = manufacture.manufacture;
						label.appendChild(labelText);
						flexDiv.appendChild(label);

						var countSpan = document.createElement("span");
						countSpan.className = "uk-text-right";
						countSpan.textContent = manufacture.manufacture_product_count;

						flexDiv.appendChild(countSpan);

						$("#manufactures_filter").append(flexDiv);
						$("#manufactures_filter").append(document.createElement("br"));
						
						existingManufactures.push(manufacture.manufacture);
					}
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
		url: "php/get_products.php",
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

					$("div#products_container ul#products").append(liElement);
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
			Filter Products by Category
==================================================*/
	$("#categories_nav ul.uk-navbar-nav").on("click", "li.category", function(e)
	{
		var category_id = $(this).attr("id");

		loadFilteredProductsByCategoriesNavbar(category_id);

		// Stop event propagation to prevent triggering the parent click handler
		e.stopPropagation();
	});
/*==================================================
		Filter Products by Sub Category
==================================================*/
	$("#categories_nav ul.uk-navbar-nav").on("click", "li.sub_category", function(e)
	{
		var sub_category_id = $(this).attr("id");
		var category_id = $(this).closest("li.category").attr("id");

		loadFilteredProductsByCategoriesNavbar(category_id, sub_category_id);

		// Stop event propagation to prevent triggering the parent click handler
		e.stopPropagation();
	});
/*==================================================
		Filter Products by Type
==================================================*/
	$("#categories_nav ul.uk-navbar-nav").on("click", "li.type", function(e)
	{
		var type_id = $(this).attr("id");
		var sub_category_id = $(this).siblings("li.sub_category").attr("id");
		var category_id = $(this).closest("li.category").attr("id");

		loadFilteredProductsByCategoriesNavbar(category_id, sub_category_id, type_id);

		// Stop event propagation to prevent triggering the parent click handler
		e.stopPropagation();
	});
/*==================================================
			Product Details
==================================================*/
	$("div#products_container ul#products").on("click", "li div.uk-card", function()
	{
		var product_id = $(this).attr("id");
		var url = "product.html?product_id=" + product_id;
		window.location.href = url;
	});
});

// Function to display filters options
function loadFilteredProductsByCategoriesNavbar(category_id, sub_category_id = "", type_id = "")
{
	$.ajax
	({
		url: "php/filter_products_url.php",
		type: "POST",
		dataType: "json",
		contentType: "application/json",
		data: {category_id: category_id, sub_category_id: sub_category_id, type_id: type_id},
		success: function(response)
		{
			console.log(response);

			$("div#products_container ul#products").empty();

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

					$("div#products_container ul#products").append(liElement);
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
}

// Function to get selected values
function getSelectedValues(filterBlockId)
{
	var selectedCheckboxes = $(filterBlockId + " input.uk-checkbox:checked");
	var selectedValues = selectedCheckboxes.map(function()
	{
		return $(this).val();
	}).get();
	return selectedValues;
}

// Function to retrieve URL query string parameters
function getUrlParameter(parameterName)
{
	name = name.replace(/[[]/, '\\[').replace(/[\]]/, '\\]');
	var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
	var results = regex.exec(location.search);
	return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
}
// Hide all Filters on Default
function resetFilters()
{
	$("#menu .filters #sub_categories_filter_title").hide();
	$("#menu .filters #sub_categories_filter").hide();
	$("#menu .filters #manufactures_filter_title").hide();
	$("#menu .filters #manufactures_filter").hide();
	$("#menu .filters #types_filter_title").hide();
	$("#menu .filters #types_filter").hide();
	$("div#products_container ul#products").empty();
}