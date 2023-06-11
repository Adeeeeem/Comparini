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
		url: "php/get_all_categories.php",
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
					var categoryHTML = '<li><center><div id="' + category.label + '" class="uk-card uk-card-default uk-card-small"><div class="uk-card-body"><img src="img/categories/' + category.label + '.png"></div><div class="uk-card-footer"><span language-tag="' + category.label + '">' + category.name + '</span></div></div></center></li>';
					$("div#categories_filter div#categories ul").append(categoryHTML);
				});
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
					var productHTML = '<li><div id="' + product.id + '" class="uk-card uk-card-default uk-card-body"><span class="uk-position-top-right favorite-icon"><svg width="30" height="30" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path class="favorite-heart" fill="none" stroke="#000" stroke-width="1.03" d="M10,4 C10,4 8.1,2 5.74,2 C3.38,2 1,3.55 1,6.73 C1,8.84 2.67,10.44 2.67,10.44 L10,18 L17.33,10.44 C17.33,10.44 19,8.84 19,6.73 C19,3.55 16.62,2 14.26,2 C11.9,2 10,4 10,4 L10,4 Z"></path></svg></span><h6>' + product.manufacture + '</h6><img src="' + product.image + '"><h4>' + product.name + '</h4><p>' + product.quantity + ' ' + product.unit + ' ' + product.flavor + '</p><h5>' + product.price + ' DT</h5></div></li>';
						$("div#categories_filter ul#products").append(productHTML);
				});
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
						var productHTML = '<li><div id="' + product.id + '" class="uk-card uk-card-default uk-card-body"><span class="uk-position-top-right favorite-icon"><svg width="30" height="30" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path class="favorite-heart" fill="none" stroke="#000" stroke-width="1.03" d="M10,4 C10,4 8.1,2 5.74,2 C3.38,2 1,3.55 1,6.73 C1,8.84 2.67,10.44 2.67,10.44 L10,18 L17.33,10.44 C17.33,10.44 19,8.84 19,6.73 C19,3.55 16.62,2 14.26,2 C11.9,2 10,4 10,4 L10,4 Z"></path></svg></span><h6>' + product.manufacture + '</h6><img src="' + product.image + '"><h4>' + product.name + '</h4><p>' + product.quantity + ' ' + product.unit + ' ' + product.flavor + '</p><h5>' + product.price + ' DT</h5></div></li>';
						$("div#categories_filter ul#products").append(productHTML);
					});
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
						var productHTML = '<li><div id="' + product.id + '" class="uk-card uk-card-default uk-card-body"><span class="uk-position-top-right favorite-icon"><svg width="30" height="30" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path class="favorite-heart" fill="none" stroke="#000" stroke-width="1.03" d="M10,4 C10,4 8.1,2 5.74,2 C3.38,2 1,3.55 1,6.73 C1,8.84 2.67,10.44 2.67,10.44 L10,18 L17.33,10.44 C17.33,10.44 19,8.84 19,6.73 C19,3.55 16.62,2 14.26,2 C11.9,2 10,4 10,4 L10,4 Z"></path></svg></span><h6>' + product.manufacture + '</h6><img src="' + product.image + '"><h4>' + product.name + '</h4><p>' + product.quantity + ' ' + product.unit + ' ' + product.flavor + '</p><h5>' + product.price + ' DT</h5></div></li>';
						$("div#categories_filter ul#products").append(productHTML);
					});
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