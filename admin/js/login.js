/* Check if the Admin is already connected */
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
/* When Clicking on Login Button */
$(function()
{
	$("#login-form").submit(function(e)
	{
		e.preventDefault(); // Prevent From Loading the Page

		// Hide the errors
		ResetLoginForm();

		var username = $("#username").val(); // Get Username
		var password = $("#password").val(); // Get Password

		CheckInput($("#username"), $("#empty-username-error"));
		CheckInput($("#password"), $("#empty-password-error"));

		if (typeof username !== "undefined" && username !== "" && typeof password !== "undefined" && password !== "")
		{
			$.ajax
			({
				url: "../php/login.php",
				type: "POST",
				dataType: "json",
				contentType: "application/json",
				data: {username: username, password: password},
				success: function(response)
				{
					console.log(response);

					if (response.success)
					{
						window.location.href = response.redirect;
					}
					else
					{
						switch(response.message)
						{
							case "EMPTY_DATA":
									CheckInput($("#username"), $("#empty-username-error"));
									CheckInput($("#password"), $("#empty-password-error"));
									$.growl.error({ message: "Whoops! Looks like you forgot to fill in some important details. Don't worry, we won't tell anyone." });
								break;
							case "USERNAME_NOT_FOUND":
									$("#username").css("border-color",  "var(--error-color)");
									$("#password").css("border-color",  "var(--error-color)");
									$("#wrong-username-error").show();
									$.growl.error({ message: "Oops, looks like you misspelled your username! Try again or create a new account." });
								break;
							case "WRONG_PASSWORD":
									$("#password").css("border-color",  "var(--error-color)");
									$("#wrong-password-error").show();
									$.growl.error({ message: "Oops, it looks like the password you entered is a secret we can't keep." });
								break;
						}
					}
				},
				error: function(xhr, textStatus, errorThrown)
				{
					$.growl.error({ message: "Our hamsters are working hard to fix the issue. Please bear with us and try again soon." });
					$("#username").css("border-color",  "var(--error-color)");
					$("#password").css("border-color",  "var(--error-color)");
					console.log(xhr.responseText);
				}
			});
		}
		else
		{
			$.growl.error({ message: "Whoops! Looks like you forgot to fill in some important details. Don't worry, we won't tell anyone." });
		}
	});
});
/* Check Input */
function CheckInput(input, error)
{
	if (!input.val())
	{
		input.css("border-color",  "var(--error-color)");
		error.show();
	}
	else
	{
		input.css("border-color", "var(--secondary-color)");
		error.hide();
	}
}
/* Reset Login Form */
function ResetLoginForm()
{
	$("#username").css("border-color", "var(--secondary-color)");
	$("#password").css("border-color", "var(--secondary-color)");
	$("small.error").hide();
}