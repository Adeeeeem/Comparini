/*==================================================
			on Window Reload
==================================================*/
$(window).on("load", function()
{
	// Extract the product_id from the URL
	var product_id = getProductIdFromUrl();
/*==================================================
			Load Categories
==================================================*/
	$.ajax
	({
		url: "php/product_details.php",
		type: "GET",
		dataType: "json",
		contentType: "application/json",
		data: {product_id: product_id},
		success: function(response)
		{
			console.log(response);

			if (response.success)
			{
				var productDetailsHTML = '<div class="uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@s uk-margin" uk-grid><div class="uk-card-media-left uk-cover-container"><img src="' + response.products[0].image + '" alt="' + response.products[0].product_name + ' - ' + response.products[0].manufacture + '" uk-cover><canvas width="400" height="400"></canvas></div><div class="details-body"><div class="uk-card-body"><h4><span class="uk-text-muted">' + response.products[0].manufacture + '</span></h4><h3 class="uk-card-title">' + response.products[0].product_name + '</h3><p>' + response.products[0].quantity + ' ' + response.products[0].unit + ' ' + response.products[0].flavor + '</p><h5><span data-language-tag="from">From</span> <span class="price"><span class="price_min">' + response.products[0].price + '</span> DT</span> <span data-language-tag="to">to</span> <span class="price"><span class="price_max">' + response.products[response.products.length - 1].price + '</span> DT</span> <span class="price economy">(<span data-language-tag="save">Save</span> <span class="price_difference">' + eval(response.products[response.products.length - 1].price - response.products[0].price).toFixed(3) + '</span> DT)</span></h5></div></div></div>';
				$("div#product_details ").append(productDetailsHTML);

				$.each(response.products, function(index, product)
				{
					var categoryHTML = '<tr><td><img class="uk-preserve-width uk-border-circle" src="img/providers/' + product.provider_name.toLowerCase() +'.jpg" width="100" height="100" alt="' + product.provider_name + '"></td><td>' + product.manufacture + '</td><td class="uk-text-left"><a href="' + product.product_link + '" target="_blank">' + product.product_name + ' ' + product.quantity + ' ' + product.unit + ' ' + product.flavor + '</a></td><td>' + product.price + ' DT<p><small class="uk-text-muted">' + product.last_updated_date + '</small></p></td><td><a href="' + product.provider_link + '" target="_blank">' + product.provider_name + '<br>' + product.adresse + '</a></td></tr>';
					$("div#product_comparison table tbody").append(categoryHTML);
				});
			}
			else
			{
				var productDetailsHTML = '<div class="uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@s uk-margin" uk-grid><div class="uk-card-media-left uk-cover-container"><img src="img/icons/product_not_found.jpg" alt="Not Found" uk-cover><canvas width="400" height="400"></canvas></div><div class="details-body"><div class="uk-card-body"><h3 class="uk-card-title">Product Not Found</h3><p>Product Description Not Found</p><h5><span data-language-tag="from">From</span> <span class="price"><span class="price_min">0</span> DT</span> <span data-language-tag="to">to</span> <span class="price"><span class="price_max">0</span> DT</span> <span class="price economy">(<span data-language-tag="save">Save</span> <span class="price_difference">0</span> DT)</span></h5></div></div></div>';
				$("div#product_details ").append(productDetailsHTML);
				$.growl.error({ message: "Oh no! It seems like all the categories are on a vacation and have left us stranded here! We apologize for the inconvenience and hope they come back soon." });
			}

			translate(localStorage.getItem("COMPARINI_LANGUAGE"), "data-language-tag");
		},
		error: function(xhr, textStatus, errorThrown)
		{
			$.growl.error({ message: "Our hamsters are working hard to fix the issue. Please bear with us and try again soon." });
			console.log(xhr.responseText);
		}
	});
});
/*==================================================
	Extract product_id from URL query parameters
==================================================*/
function getProductIdFromUrl()
{
	var urlParams = new URLSearchParams(window.location.search);
	return urlParams.get("product_id");
}