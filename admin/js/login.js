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

		$.ajax
		({
			url: "../php/login.php",
			type: "POST",
			dataType: "json",
			contentType: "application/json",
			data: {username: username, password: password},
			success: function(response)
			{
				if (response.success)
				{
					console.log(response.token);
				}
				else
				{
					console.log("Login failed");
				}
			},
			error: function(xhr, textStatus, errorThrown)
			{
				console.log(xhr.responseText);
			}
		});
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
		input.css("border", "1px solid #F32013");
		error.show();
	}
	else
	{
		input.css("border", "1px solid var(--secondary-color)");
		error.hide();
	}
}
/* Reset Login Form */
function ResetLoginForm()
{
	$("#login-username").css("border", "none");
	$("#login-username-error").hide();
	$("#login-password").css("border", "none");
	$("#login-password-error").hide();
	$("#wrong-username-error").hide();
	$("#wrong-password-error").hide();
}