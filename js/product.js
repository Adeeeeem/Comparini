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
				var productDetailsDiv = document.createElement("div");
				productDetailsDiv.className = "uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@s uk-margin";
				productDetailsDiv.setAttribute("uk-grid", "");

				var mediaLeftDiv = document.createElement("div");
				mediaLeftDiv.className = "uk-card-media-left uk-cover-container";

				var imageElement = document.createElement("img");
				imageElement.src = response.products[0].image;
				imageElement.alt = response.products[0].product_name + " - " + response.products[0].manufacture;
				imageElement.setAttribute("uk-cover", "");

				var canvasElement = document.createElement("canvas");
				canvasElement.width = "400";
				canvasElement.height = "400";

				mediaLeftDiv.appendChild(imageElement);
				mediaLeftDiv.appendChild(canvasElement);

				var detailsBodyDiv = document.createElement("div");
				detailsBodyDiv.className = "details-body";

				var cardBodyDiv = document.createElement("div");
				cardBodyDiv.className = "uk-card-body";

				var manufactureHeader = document.createElement("h4");
				manufactureHeader.innerHTML = "<span class='uk-text-muted'>" + response.products[0].manufacture + "</span>";

				var productTitle = document.createElement("h3");
				productTitle.className = "uk-card-title";
				productTitle.textContent = response.products[0].product_name;

				var productDescription = document.createElement("p");
				productDescription.textContent = response.products[0].quantity + " " + response.products[0].unit + " " + response.products[0].flavor;

				var priceHeader = document.createElement("h5");
				priceHeader.innerHTML = "<span data-language-tag='from'>From</span> <span class='price'><span class='price_min'>" + response.products[0].price + "</span> DT</span> <span data-language-tag='to'>to</span> <span class='price'><span class='price_max'>" + response.products[response.products.length - 1].price + "</span> DT</span> <span class='price economy'>(<span data-language-tag='save'>Save</span> <span class='price_difference'>" + (response.products[response.products.length - 1].price - response.products[0].price).toFixed(3) + "</span> DT)</span>";

				cardBodyDiv.appendChild(manufactureHeader);
				cardBodyDiv.appendChild(productTitle);
				cardBodyDiv.appendChild(productDescription);
				cardBodyDiv.appendChild(priceHeader);

				detailsBodyDiv.appendChild(cardBodyDiv);

				productDetailsDiv.appendChild(mediaLeftDiv);
				productDetailsDiv.appendChild(detailsBodyDiv);

								$("div#product_details ").append(productDetailsDiv);

				$.each(response.products, function(index, product)
				{
					var categoryTableRow = document.createElement("tr");

					var providerImageCell = document.createElement("td");
					var providerImage = document.createElement("img");
					providerImage.className = "uk-preserve-width uk-border-circle";
					providerImage.src = "img/providers/" + product.provider_name.toLowerCase() + ".jpg";
					providerImage.width = "100";
					providerImage.height = "100";
					providerImage.alt = product.provider_name;
					providerImageCell.appendChild(providerImage);

					var manufactureCell = document.createElement("td");
					manufactureCell.textContent = product.manufacture;

					var productNameCell = document.createElement("td");
					var productNameLink = document.createElement("a");
					productNameLink.href = product.product_link;
					productNameLink.target = "_blank";
					productNameLink.textContent = product.product_name + " " + product.quantity + " " + product.unit + " " + product.flavor;
					productNameCell.appendChild(productNameLink);

					var priceCell = document.createElement("td");
					priceCell.textContent = product.price + " DT";
					var smallElement = document.createElement("small");
					smallElement.className = "uk-text-muted";
					smallElement.textContent = product.last_updated_date;
					priceCell.appendChild(smallElement);

					var providerInfoCell = document.createElement("td");
					var providerLink = document.createElement("a");
					providerLink.href = product.provider_link;
					providerLink.target = "_blank";
					providerLink.textContent = product.provider_name + (product.adresse ? "\n" + product.adresse : "");
					providerInfoCell.appendChild(providerLink);

					categoryTableRow.appendChild(providerImageCell);
					categoryTableRow.appendChild(manufactureCell);
					categoryTableRow.appendChild(productNameCell);
					categoryTableRow.appendChild(priceCell);
					categoryTableRow.appendChild(providerInfoCell);

					$("div#product_comparison table tbody").append(categoryTableRow);
				});
			}
			else
			{
				var divElement = document.createElement("div");
				divElement.className = "uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@s uk-margin";
				divElement.setAttribute("uk-grid", "");

				var divMediaLeft = document.createElement("div");
				divMediaLeft.className = "uk-card-media-left uk-cover-container";

				var imgElement = document.createElement("img");
				imgElement.src = "img/icons/product_not_found.jpg";
				imgElement.alt = "Not Found";
				imgElement.setAttribute("uk-cover", "");

				var canvasElement = document.createElement("canvas");
				canvasElement.width = "400";
				canvasElement.height = "400";

				divMediaLeft.appendChild(imgElement);
				divMediaLeft.appendChild(canvasElement);

				var divDetailsBody = document.createElement("div");
				divDetailsBody.className = "details-body";

				var divCardBody = document.createElement("div");
				divCardBody.className = "uk-card-body";

				var h3Element = document.createElement("h3");
				h3Element.className = "uk-card-title";
				h3Element.textContent = "Product Not Found";

				var pElement = document.createElement("p");
				pElement.textContent = "Product Description Not Found";

				var h5Element = document.createElement("h5");

				var spanFrom = document.createElement("span");
				spanFrom.setAttribute("data-language-tag", "from");
				spanFrom.textContent = "From";

				var spanPrice = document.createElement("span");
				spanPrice.className = "price";

				var spanPriceMin = document.createElement("span");
				spanPriceMin.className = "price_min";
				spanPriceMin.textContent = "0";

				var spanPriceMax = document.createElement("span");
				spanPriceMax.className = "price_max";
				spanPriceMax.textContent = "0";

				var spanTo = document.createElement("span");
				spanTo.setAttribute("data-language-tag", "to");
				spanTo.textContent = "to";

				var spanPriceEconomy = document.createElement("span");
				spanPriceEconomy.className = "price economy";

				var spanSave = document.createElement("span");
				spanSave.setAttribute("data-language-tag", "save");
				spanSave.textContent = "Save";

				var spanPriceDifference = document.createElement("span");
				spanPriceDifference.className = "price_difference";
				spanPriceDifference.textContent = "0";

				spanPriceEconomy.appendChild(spanSave);
				spanPriceEconomy.appendChild(spanPriceDifference);

				spanPrice.appendChild(spanPriceMin);
				spanPrice.appendChild(document.createTextNode(" DT"));
				spanPrice.appendChild(document.createTextNode(" "));
				spanPrice.appendChild(spanTo);
				spanPrice.appendChild(document.createTextNode(" "));
				spanPrice.appendChild(spanPriceMax);
				spanPrice.appendChild(document.createTextNode(" DT"));
				spanPrice.appendChild(document.createTextNode(" "));
				spanPrice.appendChild(spanPriceEconomy);

				h5Element.appendChild(spanFrom);
				h5Element.appendChild(document.createTextNode(" "));
				h5Element.appendChild(spanPrice);

				divCardBody.appendChild(h3Element);
				divCardBody.appendChild(pElement);
				divCardBody.appendChild(h5Element);

				divDetailsBody.appendChild(divCardBody);

				divElement.appendChild(divMediaLeft);
				divElement.appendChild(divDetailsBody);

				$("div#product_details ").append(divElement);

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