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
					var categoryHTML ='<li><center><div id="' + category.label + '" class="uk-card uk-card-default uk-card-small"><div class="uk-card-body"><img src="img/categories/' + category.label + '.png"></div><div class="uk-card-footer"><span language-tag="' + category.label + '">' + category.name + '</span></div></div></center></li>';
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
});
/*==================================================
			Filter by Category
==================================================*/
/*/ Logout Button */
$(function()
{
	$("div#categories_filter div#categories ul li").click(function()
	{
		$.ajax
		({
			url: "../php/logout.php",
			type: "POST",
			dataType: "json",
			contentType: "application/json",
			data: {},
			success: function(response)
			{
				console.log(response);
				if (response.success)
				{
					
				}
			},
			error: function(xhr, textStatus, errorThrown)
			{
				$.growl.error({ message: "Our hamsters are working hard to fix the issue. Please bear with us and try again soon." });
				console.log(xhr.responseText);
			}
		});
	});
});