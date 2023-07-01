/*==================================================
			on Window Reload
==================================================*/
$(window).on("load", function()
{
/*==================================================
			Load Sub Categories Menu
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

						/* Left Menu */
						var flexDiv = document.createElement("div");
						flexDiv.className = "uk-flex uk-flex-between";
						flexDiv.id = category.category_label;

						var label = document.createElement("label");
						label.className = "uk-text-left";

						var checkbox = document.createElement("input");
						checkbox.className = "uk-checkbox";
						checkbox.type = "checkbox";
						label.appendChild(checkbox);

						var space = document.createElement("span");
						space.innerHTML = "&nbsp;";
						label.appendChild(space);

						var labelText = document.createElement("span");
						labelText.setAttribute("data-language-tag", category.category_label);
						labelText.textContent = category.category_name;
						label.appendChild(labelText);
						flexDiv.appendChild(label);

						var countSpan = document.createElement("span");
						countSpan.className = "uk-text-right";
						countSpan.textContent = category.category_product_count;

						flexDiv.appendChild(countSpan);

						$("#categories_filter").append(flexDiv);
						$("#categories_filter").append(document.createElement("br"));
						
						existingCategories.push(category.category_label);
					}
				});

				var existingSubCategories = [];
				var existingDescription = [];

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
						subCategoryHeader.className = "uk-nav-header";

						var subSpanElement = document.createElement("span");
						subSpanElement.setAttribute("data-language-tag", subCategory.sub_category_label);
						subSpanElement.textContent = subCategory.sub_category_name;

						subCategoryHeader.appendChild(subSpanElement);
						subCategoryUl.appendChild(subCategoryHeader);
						subCategoryDiv.appendChild(subCategoryUl);

						$("nav#categories_nav ul li#" + subCategory.category_label + " div.uk-navbar-dropdown div.uk-drop-grid").append(subCategoryDiv);

						existingSubCategories.push(subCategory.sub_category_label);

						$.each(response.subCategories, function(index, subDescription)
						{
							if (subDescription.description !== null && existingDescription.indexOf(subDescription.description) === -1 && subDescription.sub_category_label === subCategory.sub_category_label)
							{
								/* Top Navbar */
								var subCategoryDescription = document.createElement("li");

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
});