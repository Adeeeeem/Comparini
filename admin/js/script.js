/* Check if the Admin session */
$(function()
{
	$.ajax
	({
		url: "../php/check_session.php",
		type: "POST",
		dataType: "json",
		contentType: "application/json",
		data: {},
		success: function(response)
		{
			console.log(response);

			if (!response.success)
			{
				window.location.href = response.redirect;
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
				Logout
==================================================*/
/*/ Logout Button */
$(function ()
{
	$("#logout-btn").click(function()
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
					window.location.href = response.redirect;
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