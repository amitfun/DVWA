﻿
// ---------------------------------------------------------------------------------------------------------------
//
// UI_lib.js --- a base library of functions shared by most application pages
//
//	     SessionTimer --- determines when a user should be auto logged off
//	     EntryCheck   --- Password and verifyPassword must match
//	     PopUp        --- launch a pop-up box of the specified size
//	     RefreshPage  --- routine to refresh a page independent of the META refresh tag
//
// ---------------------------------------------------------------------------------------------------------------

// Variables that hold global scope for a given page instance


	nSessionLength = 20;
	nRemindValue = 1;
	nMinutesRemaining = nSessionLength;
	
	nSecondsToRefresh = 5;


// SessionTimer --- determines when a user should be auto logged off


	function SessionTimer()
	{
	  var id;
	  var id2;	  
	  if ( nMinutesRemaining <= 0 )
	  {
	     clearTimeout( id );
	     clearTimeout( id2 );
	     top.window.location = "index.asp"
	  }
	  else
	  {
	     id = setTimeout( "SessionTimer()", 60000 );
	     id2 = setTimeout( "remindTimer()", 1000 );
	     nMinutesRemaining = nMinutesRemaining - 1;
	  }
	}
	
	function remindTimer()
	{
	  if ( nMinutesRemaining == (nRemindValue - 1) )
	  {
	     this.dialog = openCenteredWindow('login_sessionReminder.asp', 'window6', 270, 175, '', '', 'opener');
	  }
	}
	


// EntryCheck --- Password and verifyPassword must match


	function EntryCheck( pwd, vfy_pwd )
	{
	  if ( pwd != vfy_pwd )
	  {
	     alert ( "ERROR  -  Your Input Values for ' Password ' and ' Verify Password ' do not match..." );
	     return false;
	  }
	  else
	     return true;
	}


// PopUp --- launch a pop-up box of the specified size


	function PopUp( pageURL, windowName, windowWidth, windowHeight )
	{
	    windowProperties = "toolbar=no, menubar=no, location=no, scrollbars=no, resize=no, width=" + windowWidth + ", height=" + windowHeight
	    OpenWin = this.open( pageURL, windowName, windowProperties );
	}
	

// RefreshPage  --- routine to refresh a page independent of the META refresh tag

	
	function RefreshPage()
	{
	    nSecondsToRefresh = nSecondsToRefresh - 1;
	    if ( nSecondsToRefresh < 0 )
	    {
	      window.location = window.location;
	    }
	    setTimeout( 'RefreshPage()', 1000 );
	}
	
// Verify dates ---------------------------------------------------------------------

	function isDate ( TestString )
	{
		var a = "01";
		var b = "12";
		var c = "28";
		var d = "29";
		var e = "30";
		var f = "31";
		var g = "0000";
		var h = "9999";

		if (TestString.length == 10)
		{
			if ((TestString.substring(0,2) >= a) && (TestString.substring(0,2) <= b))
			{
				if ((TestString.substring(0,2) == "01") || (TestString.substring(0,2) == "03") ||
					(TestString.substring(0,2) == "05") || (TestString.substring(0,2) == "07") ||
					(TestString.substring(0,2) == "08") || (TestString.substring(0,2) == "10") ||
					(TestString.substring(0,2) == "12"))
				{
					if ((TestString.substring(3,5) >= a) && (TestString.substring(3,5) <= f))
					{
						if ((TestString.substring(6,10) > g) && (TestString.substring(6,10) <=h))
						{
							return true;
						}
						else
						{
							return false;
						}
					}
					else
					{
						return false;
					}
				}
				else if (TestString.substring(0,2) == "02")
				{
					if ((TestString.substring(3,5) >= a) && (TestString.substring(3,5) <= c) && (((parseInt(TestString.substring(6,10))) % 4) != 0))
					{
						if ((TestString.substring(6,10) > g) && (TestString.substring(6,10) <=h))
						{
							return true;
						}
						else
						{
							return false;
						}
					}
					else if ((TestString.substring(3,5) >= a) && (TestString.substring(3,5) <= d) && (((parseInt(TestString.substring(6,10))) % 4) == 0))
					{
						if ((TestString.substring(6,10) > g) && (TestString.substring(6,10) <=h))
						{
							return true;
						}
						else
						{
							return false;
						}
					}
					else
					{
						return false;
					}
				}
				else if ((TestString.substring(0,2) == "04") || (TestString.substring(0,2) == "06") ||
						 (TestString.substring(0,2) == "09") || (TestString.substring(0,2) == "11"))
				{
					if ((TestString.substring(3,5) >= a) && (TestString.substring(3,5) <= e))
					{
						if ((TestString.substring(6,10) > g) && (TestString.substring(6,10) <=h))
						{
							return true;
						}
						else
						{
							return false;
						}
					}
					else
					{
						return false;
					}
				}
				else
				{
					return false;
				}
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}

// ------------------------------------------------------------------------------------------------

// Window functions  v1.01
// http://www.dithered.com/javascript/window/index.html
// code by Chris Nott (chris@dithered.com)

/*******************************************************************************
	Popup Window openers
*******************************************************************************/

var winReference = null;


// Open a window at a given position on the screen
function openPositionedWindow(url, name, width, height, x, y, status, scrollbars, moreProperties, openerName) {
	
	// ie4.5 mac - windows are 2 pixels too short; if a statusbar is used, the window will be an additional 15 pixels short
	var agent = navigator.userAgent.toLowerCase();
	if (agent.indexOf("mac")!=-1 && agent.indexOf("msie") != -1 && agent.indexOf("msie 5.0")==-1) {
		height += 2;
		if (status) height += 15;
	}

	// Adjust width if scrollbars are used (pc places scrollbars inside the content area; mac outside) 
	width += (scrollbars != '' && scrollbars != null && agent.indexOf("mac") == -1) ? 16 : 0;

	var properties = 'width=' + width + ',height=' + height + ',screenX=' + x + ',screenY=' + y + ',left=' + x + ',top=' + y + ((status) ? ',status' : '') + ',scrollbars' + ((scrollbars) ? '' : '=no') + ((moreProperties) ? ',' + moreProperties : '');
	var reference = openWindow(url, name, properties, openerName);
	
	// resize window in ie if we can resize in ns; very messy
	// commented out because openPositionedWindow() doesn't set the resizable attribute
	// left in for reference
	/*if (resizable && agent.indexOf("msie") != -1) {
		if (agent.indexOf("mac") != -1) {
			height += (status) ? 15 : 2;
			if (parseFloat(navigator.appVersion) > 5) width -= 11;
		}
		else {
			height += (status) ? 49 : 31;
			width += 13;
		}
		setTimeout('if (reference != null && !reference.closed) reference.resizeTo(' + width + ',' + height + ');', 150);
	}*/

	return reference;
}


// Open a window at the center of the screen
function openCenteredWindow(url, name, width, height, status, scrollbars, moreProperties, openerName) {
	var x = 0;
	var y = 0;
	if (screen) x = (screen.availWidth - width) / 2;
	if (screen) y = (screen.availHeight - height) / 2;
	if (!status) status == '';
	if (!openerName) openerName == '';
	var reference = openPositionedWindow(url, name, width, height, x, y, status, scrollbars, moreProperties, openerName);
	return reference;
}	


// Open a full-screen window (different from IE's fullscreen option)
function openMaxedWindow(url, name, scrollbars, openerName) {
	var width  = 600;
	var height = 800;
	if (screen) width  = screen.width - 10;
	if (screen) height = screen.height - 30;
	var reference = openPositionedWindow(url, name, width, height, 0, 0, false, scrollbars, openerName, moreProperties);
	return reference;
}


// Open a full-chrome (all GUI elements) window
// This is like using a target="_blank" in a normal link but allows focussing the window
function openFullChromeWindow(url, name, openerName) {
	return openWindow(url, name, 'directories,location,menubar,resizable,scrollbars,status,toolbar');
}


// Core utility function that actually creates the window and gives focus to it
function openWindow(url, name, properties, openerName) {

	// ie4.x pc can't give focus to windows containing documents from a different domain
	// in this case, initially load a local interstisial page to allow focussing before loading final url
	var agent = navigator.userAgent.toLowerCase();
	if (agent.indexOf("msie") != -1 && parseInt(navigator.appVersion) == 4 && agent.indexOf("msie 5") == -1 && agent.indexOf("msie5") == -1 && agent.indexOf("win") != -1 && url.indexOf('http://') == 0) {
		winReference = window.showModalDialog('about:blank', name, properties);
		
		setTimeout('if (winReference && !winReference.closed) winReference.location.replace("' + url + '")', 300);
	}
	else {
		winReference = window.showModalDialog(url, name, properties);
	}

	// ie doesn't like giving focus immediately (to new window in 4.5 on mac; to existing ones in 5 on pc)
	setTimeout('if (winReference && !winReference.closed) winReference.focus()', 200);
	
	if (openerName) self.name = openerName;
	return winReference;
}

// Open a window at a given position on the screen
function openPositionedWindow2(url, name, width, height, x, y, status, scrollbars, moreProperties, openerName) {
	
	// ie4.5 mac - windows are 2 pixels too short; if a statusbar is used, the window will be an additional 15 pixels short
	var agent = navigator.userAgent.toLowerCase();
	if (agent.indexOf("mac")!=-1 && agent.indexOf("msie") != -1 && agent.indexOf("msie 5.0")==-1) {
		height += 2;
		if (status) height += 15;
	}

	// Adjust width if scrollbars are used (pc places scrollbars inside the content area; mac outside) 
	width += (scrollbars != '' && scrollbars != null && agent.indexOf("mac") == -1) ? 16 : 0;

	var properties = 'width=' + width + ',height=' + height + ',screenX=' + x + ',screenY=' + y + ',left=' + x + ',top=' + y + ((status) ? ',status' : '') + ',scrollbars' + ((scrollbars) ? '' : '=no') + ((moreProperties) ? ',' + moreProperties : '');
	var reference = openWindow2(url, name, properties, openerName);
	
	// resize window in ie if we can resize in ns; very messy
	// commented out because openPositionedWindow() doesn't set the resizable attribute
	// left in for reference
	/*if (resizable && agent.indexOf("msie") != -1) {
		if (agent.indexOf("mac") != -1) {
			height += (status) ? 15 : 2;
			if (parseFloat(navigator.appVersion) > 5) width -= 11;
		}
		else {
			height += (status) ? 49 : 31;
			width += 13;
		}
		setTimeout('if (reference != null && !reference.closed) reference.resizeTo(' + width + ',' + height + ');', 150);
	}*/

	return reference;
}


// Open a window at the center of the screen
function openCenteredWindow2(url, name, width, height, status, scrollbars, moreProperties, openerName) {
	var x = 0;
	var y = 0;
	if (screen) x = (screen.availWidth - width) / 2;
	if (screen) y = (screen.availHeight - height) / 2;
	if (!status) status == '';
	if (!openerName) openerName == '';
	var reference = openPositionedWindow2(url, name, width, height, x, y, status, scrollbars, moreProperties, openerName);
	return reference;
}	

// Core utility function that actually creates the window and gives focus to it
function openWindow2(url, name, properties, openerName) {

	// ie4.x pc can't give focus to windows containing documents from a different domain
	// in this case, initially load a local interstisial page to allow focussing before loading final url
	var agent = navigator.userAgent.toLowerCase();
	if (agent.indexOf("msie") != -1 && parseInt(navigator.appVersion) == 4 && agent.indexOf("msie 5") == -1 && agent.indexOf("msie5") == -1 && agent.indexOf("win") != -1 && url.indexOf('http://') == 0) {
		winReference = window.open('about:blank', name, properties);
		
		setTimeout('if (winReference && !winReference.closed) winReference.location.replace("' + url + '")', 300);
	}
	else {
		winReference = window.open(url, name, properties);
	}

	// ie doesn't like giving focus immediately (to new window in 4.5 on mac; to existing ones in 5 on pc)
	setTimeout('if (winReference && !winReference.closed) winReference.focus()', 200);
	
	if (openerName) self.name = openerName;
	return winReference;
}

/*******************************************************************************
	Modal Dialog controls
*******************************************************************************/

// Close a dialog
// Call from onunload event handler of any page that can create a dialog
function closeDialog(dialog) {
	if (dialog && dialog.closed != true) dialog.close();
}


// Close parent popup
// Call from onload event handler of any page that could be created from a dialog
function closeParentDialog() {
	if (top.opener && isWindowPopup(top.opener)) {
		root = top.opener.top.opener;
		top.opener.close();
		top.opener = root;
	}
}


// Check if a window is a popup
function isWindowPopup(win) {
	return ((win.opener) ? true : false);
}

function alarmHelp( varId)
{
	url = 'AlarmHelp.asp?Id=' + varId;
	dialog = openCenteredWindow(url, 'window6', 638, 400, '', 'yes', 'opener');
}

function pageHelp( pageId)
{
	url = '/Contents/PageHelp.asp?Id=' + pageId;
	dialog = openCenteredWindow(url, 'window6', 750, 500, '', 'yes', 'opener');
}

function max( a, b)
{
	if (Number( a) < Number( b))
		return b;
	else
		return a;
}

<!-- Original:  Richard Gorremans (RichardG@spiritwolfx.com) -->
<!-- Web Site:  http://www.spiritwolfx.com -->

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->

<!-- Begin
// Check browser version
var isNav4 = false, isNav5 = false, isIE4 = false
var strSeperator = "/"; 
// If you are using any Java validation on the back side you will want to use the / because 
// Java date validations do not recognize the dash as a valid date separator.
var vDateType = 3; // Global value for type of date format
//                1 = mm/dd/yyyy
//                2 = yyyy/dd/mm  (Unable to do date check at this time)
//                3 = dd/mm/yyyy
var vYearType = 4; //Set to 2 or 4 for number of digits in the year for Netscape
var vYearLength = 2; // Set to 4 if you want to force the user to enter 4 digits for the year before validating.
var err = 0; // Set the error code to a default of zero
if(navigator.appName == "Netscape") {
if (navigator.appVersion < "5") {
isNav4 = true;
isNav5 = false;
}
else
if (navigator.appVersion > "4") {
isNav4 = false;
isNav5 = true;
   }
}
else {
isIE4 = true;
}
function DateFormat(vDateName, vDateValue, e, dateCheck, dateType) {
vDateType = dateType;
// vDateName = object name
// vDateValue = value in the field being checked
// e = event
// dateCheck 
// True  = Verify that the vDateValue is a valid date
// False = Format values being entered into vDateValue only
// vDateType
// 1 = mm/dd/yyyy
// 2 = yyyy/mm/dd
// 3 = dd/mm/yyyy
//Enter a tilde sign for the first number and you can check the variable information.
if (vDateValue == "~") {
alert("AppVersion = "+navigator.appVersion+" \nNav. 4 Version = "+isNav4+" \nNav. 5 Version = "+isNav5+" \nIE Version = "+isIE4+" \nYear Type = "+vYearType+" \nDate Type = "+vDateType+" \nSeparator = "+strSeperator);
vDateName.value = "";
vDateName.focus();
return true;
}
var whichCode = (window.Event) ? e.which : e.keyCode;
// Check to see if a seperator is already present.
// bypass the date if a seperator is present and the length greater than 8
if (vDateValue.length > 8 && isNav4) {
if ((vDateValue.indexOf("-") >= 1) || (vDateValue.indexOf("/") >= 1))
return true;
}
//Eliminate all the ASCII codes that are not valid
var alphaCheck = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/-";
if (alphaCheck.indexOf(vDateValue) >= 1) {
if (isNav4) {
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
else {
vDateName.value = vDateName.value.substr(0, (vDateValue.length-1));
return false;
   }
}
if (whichCode == 8) //Ignore the Netscape value for backspace. IE has no value
return false;
else {
//Create numeric string values for 0123456789/
//The codes provided include both keyboard and keypad values
var strCheck = '47,48,49,50,51,52,53,54,55,56,57,58,59,95,96,97,98,99,100,101,102,103,104,105';
if (strCheck.indexOf(whichCode) != -1) {
if (isNav4) {
if (((vDateValue.length < 6 && dateCheck) || (vDateValue.length == 7 && dateCheck)) && (vDateValue.length >=1)) {
alert('<% DMTranslate( "Invalid Date, Please Re-Enter" ); %>');
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
if (vDateValue.length == 6 && dateCheck) {
var mDay = vDateName.value.substr(2,2);
var mMonth = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
//Turn a two digit year into a 4 digit year
if (mYear.length == 2 && vYearType == 4) {
var mToday = new Date();
//If the year is greater than 30 years from now use 19, otherwise use 20
var checkYear = mToday.getFullYear() + 30; 
var mCheckYear = '20' + mYear;
if (mCheckYear >= checkYear)
mYear = '19' + mYear;
else
mYear = '20' + mYear;
}
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (!dateValid(vDateValueCheck)) {
alert('<% DMTranslate( "Invalid Date, Please Re-Enter" ); %>');
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
return true;
}
else {
// Reformat the date for validation and set date type to a 1
if (vDateValue.length >= 8  && dateCheck) {
if (vDateType == 1) // mmddyyyy
{
var mDay = vDateName.value.substr(2,2);
var mMonth = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
vDateName.value = mMonth+strSeperator+mDay+strSeperator+mYear;
}
if (vDateType == 2) // yyyymmdd
{
var mYear = vDateName.value.substr(0,4)
var mMonth = vDateName.value.substr(4,2);
var mDay = vDateName.value.substr(6,2);
vDateName.value = mYear+strSeperator+mMonth+strSeperator+mDay;
}
if (vDateType == 3) // ddmmyyyy
{
var mMonth = vDateName.value.substr(2,2);
var mDay = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
vDateName.value = mDay+strSeperator+mMonth+strSeperator+mYear;
}
//Create a temporary variable for storing the DateType and change
//the DateType to a 1 for validation.
var vDateTypeTemp = vDateType;
vDateType = 1;
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (!dateValid(vDateValueCheck)) {
alert('<% DMTranslate( "Invalid Date, Please Re-Enter" ); %>');
vDateType = vDateTypeTemp;
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
vDateType = vDateTypeTemp;
return true;
}
else {
if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >=1)) {
alert('<% DMTranslate( "Invalid Date, Please Re-Enter" ); %>');
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
         }
      }
   }
}
else {
// Non isNav Check
if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck) || (vDateValue.length > 10 && dateCheck)) && (vDateValue.length >=1)) {
alert('<% DMTranslate( "Invalid Date, Please Re-Enter" ); %>');
vDateName.value = "";
vDateName.focus();
return true;
}
// Reformat date to format that can be validated. mm/dd/yyyy
if (vDateValue.length >= 8 && dateCheck) {
// Additional date formats can be entered here and parsed out to
// a valid date format that the validation routine will recognize.
if (vDateType == 1) // mm/dd/yyyy
{
var mMonth = vDateName.value.substr(0,2);
var mDay = vDateName.value.substr(3,2);
var mYear = vDateName.value.substr(6,4)
}
if (vDateType == 2) // yyyy/mm/dd
{
var mYear = vDateName.value.substr(0,4)
var mMonth = vDateName.value.substr(5,2);
var mDay = vDateName.value.substr(8,2);
}
if (vDateType == 3) // dd/mm/yyyy
{
var mDay = vDateName.value.substr(0,2);
var mMonth = vDateName.value.substr(3,2);
var mYear = vDateName.value.substr(6,4)
}
if (vYearLength == 4) {
if (mYear.length < 4) {
alert('<% DMTranslate( "Invalid Date, Please Re-Enter" ); %>');
vDateName.value = "";
vDateName.focus();
return true;
   }
}
// Create temp. variable for storing the current vDateType
var vDateTypeTemp = vDateType;
// Change vDateType to a 1 for standard date format for validation
// Type will be changed back when validation is completed.
vDateType = 1;
// Store reformatted date to new variable for validation.
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (mYear.length == 2 && vYearType == 4 && dateCheck) {
//Turn a two digit year into a 4 digit year
var mToday = new Date();
//If the year is greater than 30 years from now use 19, otherwise use 20
var checkYear = mToday.getFullYear() + 30; 
var mCheckYear = '20' + mYear;
if (mCheckYear >= checkYear)
mYear = '19' + mYear;
else
mYear = '20' + mYear;
vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
// Store the new value back to the field.  This function will
// not work with date type of 2 since the year is entered first.
if (vDateTypeTemp == 1) // mm/dd/yyyy
vDateName.value = mMonth+strSeperator+mDay+strSeperator+mYear;
if (vDateTypeTemp == 3) // dd/mm/yyyy
vDateName.value = mDay+strSeperator+mMonth+strSeperator+mYear;
} 
if (!dateValid(vDateValueCheck)) {
alert('<% DMTranslate( "Invalid Date, Please Re-Enter" ); %>');
vDateType = vDateTypeTemp;
vDateName.value = "";
vDateName.focus();
return true;
}
vDateType = vDateTypeTemp;
return true;
}
else {
if (vDateType == 1) {
if (vDateValue.length == 2) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 5) {
vDateName.value = vDateValue+strSeperator;
   }
}
if (vDateType == 2) {
if (vDateValue.length == 4) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 7) {
vDateName.value = vDateValue+strSeperator;
   }
} 
if (vDateType == 3) {
if (vDateValue.length == 2) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 5) {
vDateName.value = vDateValue+strSeperator;
   }
}
return true;
   }
}
if (vDateValue.length == 10&& dateCheck) {
if (!dateValid(vDateName)) {
// Un-comment the next line of code for debugging the dateValid() function error messages
//alert(err);  
alert('<% DMTranslate( "Invalid Date, Please Re-Enter" ); %>');
vDateName.focus();
vDateName.select();
   }
}
return false;
}
else {
// If the value is not in the string return the string minus the last
// key entered.
if (isNav4) {
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
else
{
vDateName.value = vDateName.value.substr(0, (vDateValue.length-1));
return false;
         }
      }
   }
}
function dateValid(objName) {
var strDate;
var strDateArray;
var strDay;
var strMonth;
var strYear;
var intday;
var intMonth;
var intYear;
var booFound = false;
var datefield = objName;
var strSeparatorArray = new Array("-"," ","/",".");
var intElementNr;
// var err = 0;
var strMonthArray = new Array(12);
strMonthArray[0] = "Jan";
strMonthArray[1] = "Feb";
strMonthArray[2] = "Mar";
strMonthArray[3] = "Apr";
strMonthArray[4] = "May";
strMonthArray[5] = "Jun";
strMonthArray[6] = "Jul";
strMonthArray[7] = "Aug";
strMonthArray[8] = "Sep";
strMonthArray[9] = "Oct";
strMonthArray[10] = "Nov";
strMonthArray[11] = "Dec";
//strDate = datefield.value;
strDate = objName;
if (strDate.length < 1) {
return true;
}
for (intElementNr = 0; intElementNr < strSeparatorArray.length; intElementNr++) {
if (strDate.indexOf(strSeparatorArray[intElementNr]) != -1) {
strDateArray = strDate.split(strSeparatorArray[intElementNr]);
if (strDateArray.length != 3) {
err = 1;
return false;
}
else {
strDay = strDateArray[0];
strMonth = strDateArray[1];
strYear = strDateArray[2];
}
booFound = true;
   }
}
if (booFound == false) {
if (strDate.length>5) {
strDay = strDate.substr(0, 2);
strMonth = strDate.substr(2, 2);
strYear = strDate.substr(4);
   }
}
//Adjustment for short years entered
if (strYear.length == 2) {
strYear = '20' + strYear;
}
strTemp = strDay;
strDay = strMonth;
strMonth = strTemp;
intday = parseInt(strDay, 10);
if (isNaN(intday)) {
err = 2;
return false;
}
intMonth = parseInt(strMonth, 10);
if (isNaN(intMonth)) {
for (i = 0;i<12;i++) {
if (strMonth.toUpperCase() == strMonthArray[i].toUpperCase()) {
intMonth = i+1;
strMonth = strMonthArray[i];
i = 12;
   }
}
if (isNaN(intMonth)) {
err = 3;
return false;
   }
}
intYear = parseInt(strYear, 10);
if (isNaN(intYear)) {
err = 4;
return false;
}
if (intMonth>12 || intMonth<1) {
err = 5;
return false;
}
if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7 || intMonth == 8 || intMonth == 10 || intMonth == 12) && (intday > 31 || intday < 1)) {
err = 6;
return false;
}
if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) && (intday > 30 || intday < 1)) {
err = 7;
return false;
}
if (intMonth == 2) {
if (intday < 1) {
err = 8;
return false;
}
if (LeapYear(intYear) == true) {
if (intday > 29) {
err = 9;
return false;
   }
}
else {
if (intday > 28) {
err = 10;
return false;
      }
   }
}
return true;
}
function LeapYear(intYear) {
if (intYear % 100 == 0) {
if (intYear % 400 == 0) { return true; }
}
else {
if ((intYear % 4) == 0) { return true; }
}
return false;
}

function validateData(type, vData) { 
	
	if(vData.value != "" ) {
		if(type == "Contact_Phone") {
			var i;
			for( i=0; i<vData.value.length; i++ ) {
				var c = vData.value.charAt(i);
				if(((c<"0") || (c>"9"))) {
					alert("Invalid Number! Please Re-Enter")
					vData.value="";
					vData.focus();
					vData.select();

					return false;
				}
			}
			return true;	
		}
		if(type == "Contact_Email"){
			if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(vData.value)){
				return (true);
			}
			alert("Invalid E-mail Address! Please Re-Enter")
			vData.value="";
			vData.focus();
			vData.select();

			return (false)
		}
	}
}

function verifyData (TypeValue, vData) {

	vTheName = "IPaddress";
	var vIpPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
	var vIpArray = vData.value.match(vIpPattern);

	if (vData.value != "" ) {
		if (TypeValue == "SNMP") {
			if (vData.value == "0.0.0.0") {
				alert('<% DMTranslate( "Invalid IP Address! Please Re-Enter" ); %>');
				vData.value="";
				vData.focus();
				vData.select();
				return false;
			}
			else if (vData.value == "255.255.255.255") {
				alert('<% DMTranslate( "Invalid IP Address! Please Re-Enter" ); %>');
				vData.value="";
				vData.focus();
				vData.select();
				return false;
			}
			if (vIpArray == null) {
				alert('<% DMTranslate( "Invalid IP Address! Please Re-Enter" ); %>');
				vData.value="";
				vData.focus();
				vData.select();
				return false;
			}
			else {
				for (i = 1; i <= 4; i++) {
					thisSegment = vIpArray[i];
					if (thisSegment > 254 ) {
						alert('<% DMTranslate( "Invalid IP Address! Please Re-Enter" ); %>');
						vData.value="";
						vData.focus();
						vData.select();				
						i = 4;
					}
					if ((i == 1) && ((thisSegment > 254) || (thisSegment == 0))) {
						alert('<% DMTranslate( "Invalid IP Address! Please Re-Enter" ); %>');
						vData.value="";
						vData.focus();
						vData.select();
						i = 4;
      				}
   				}
			}
		}
		else if (TypeValue == "EMail") { 
			if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(vData.value)){
				return (true);
			}
			alert("Invalid E-mail Address! Please Re-Enter")
			vData.value="";
			vData.focus();
			vData.select();

			return (false)
		}
	}
}