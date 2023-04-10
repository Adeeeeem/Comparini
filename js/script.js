/* Turn ON and OFF Dark Theme */
$(function()
{
	$("#light_theme").click(function()
	{
		localStorage.setItem("COMPARINI_THEME", "LIGHT");
		$(document.body).css("--body-color", "#F8F8F8");
		$(document.body).css("--text-color", "#333333");
		$(document.body).css("--nav-color", "#FFFFFF");
		$(document.body).css("--nav-text-color", "#046DB5");
	});

	$("#dark_theme").click(function()
	{
		localStorage.setItem("COMPARINI_THEME", "DARK");
		$(document.body).css("--body-color", "#18191A");
		$(document.body).css("--text-color", "#FFFFFF");
		$(document.body).css("--nav-color", "#242526");
		$(document.body).css("--nav-text-color", "#00A8DE");
	});
});