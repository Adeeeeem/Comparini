/* When Clicking on Login Button */
$(function()
{
	$("#login-form").submit(function(e)
	{
		e.preventDefault(); // Prevent From Loading the Page

		var username = $("#username"); // Get Username
		var password = $("#password"); // Get Password

		var username_error = $("#empty-username-error");
		var password_error = $("#empty-password-error");

		CheckInput(username, username_error);
		CheckInput(password, password_error);
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