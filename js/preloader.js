$(window).on("load", function()
{
/*==================================================
				Preloader
==================================================*/
	$("#status").fadeOut();
	$("#preloader").delay(350).fadeOut("slow");
/*==================================================
				Theme
==================================================*/
	if (localStorage.getItem("COMPARINI_THEME") == null){localStorage.setItem("COMPARINI_THEME", "LIGHT");}

	if(localStorage.getItem("COMPARINI_THEME") == "LIGHT")
	{
		$(document.body).css("--body-color", "#F8F8F8");
		$(document.body).css("--text-color", "#333333");
		$(document.body).css("--nav-color", "#FFFFFF");
		$(document.body).css("--nav-text-color", "#046DB5");
	}
	else
	{
		$(document.body).css("--body-color", "#18191A");
		$(document.body).css("--text-color", "#FFFFFF");
		$(document.body).css("--nav-color", "#242526");
		$(document.body).css("--nav-text-color", "#00A8DE");
	}
/*==================================================
				Language
==================================================*/
	if (localStorage.getItem("COMPARINI_LANGUAGE") == null){localStorage.setItem("COMPARINI_LANGUAGE", "english");}

	translate(localStorage.getItem("COMPARINI_LANGUAGE"), "language-tag");
});
/*==================================================
			Language Translate Function
==================================================*/
function Translate()
{
	// Initialization
	this.init =  function(attribute, language)
	{
		this.attribute = attribute;
		this.language = language;	
	}
	// Translate 
	this.process = function(){
		_self = this;
		var xrhFile = new XMLHttpRequest();
		// Load content data 
		xrhFile.open("GET", "languages/" + this.language + ".json", false);
		xrhFile.onreadystatechange = function ()
		{
			if(xrhFile.readyState === 4)
			{
				if(xrhFile.status === 200 || xrhFile.status == 0)
				{
					var LanguageObject = JSON.parse(xrhFile.responseText);
					var allDom = document.getElementsByTagName("*");
					for(var i = 0; i < allDom.length; i++)
					{
						var elem = allDom[i];
						var key = elem.getAttribute(_self.attribute);
						if(key != null)
						{
							elem.innerHTML = LanguageObject[key];
						}
					}
				}
			}
		}
		xrhFile.send();
	}
}

function translate(language, tagAttr)
{
	var translate = new Translate();
	translate.init(tagAttr, language);
	translate.process();
}