/* When Clicking on Login Button */
$(function()
{
	$("#login-form").submit(function(e)
	{
		e.preventDefault(); // Prevent From Loading the Page

		var username = $("#username").val(); // Get Username
		var password = $("#password").val(); // Get Password

		CheckInput($("#username"), $("#empty-username-error"));
		CheckInput($("#password"), $("#empty-password-error"));

		if (typeof username !== "undefined" && username !== "" && typeof password !== "undefined" && password !== "")
		{
			// Hide the errors
			ResetLoginForm();

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
						window.location.href = "index.html";
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


		/*.done(function(response)
		{
			switch (response.result)
				{
					case "Error": // Error
						ResetLoginForm();
						$.growl.error({ message: "Oops, There was an Error!" });
						$("#login-username").css("border", "1px solid #F32013");
						$("#login-password").css("border", "1px solid #F32013");
					break;

					case "Empty": // Empty
						$.growl.error({ message: "Please fill in the required fields !" });
					break;

					case "NotFound": // User Not Found
						ResetLoginForm();
						$.growl.error({ message: "Sorry, we couldn't find an account with that username. Please try again !" });
						$("#login-username").css("border", "1px solid #F32013");
						$("#login-password").css("border", "1px solid #F32013");
						$("#wrong-username-error").show();
					break;

					case "Wrong": // Wrong Password
						ResetLoginForm();
						$.growl.error({ message: "Sorry, that password doesn't match your username." });
						$("#login-password").css("border", "1px solid #F32013");
						$("#wrong-password-error").show();
					break;

					case "User": // Normal User
						window.location.href="user/";
						localStorage.setItem("LightWays_SECTION", "#lights-btn"); // Reset Saved Tabs
					break;

					case "Admin": // Admin
						window.location.href="admin/";
						localStorage.setItem("LightWays_ADMIN_SECTION", "#lights-btn"); // Reset Saved Tabs
					break;
				}
		})
		.fail(function()
		{
			ResetLoginForm();
			$.growl.error({ message: "Oops, There was an Error!" });
			$("#login-username").css("border", "1px solid #F32013");
			$("#login-password").css("border", "1px solid #F32013");
		});*/
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