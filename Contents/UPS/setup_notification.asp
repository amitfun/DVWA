<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>

	<% var Section = Type + "_Notification"; %>
	<% var Help = Type + " Notification"; %>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   	<!--

		function SendTestMessage()
		{
			if (!ValidateData())
				return;

			var URL = '/goform/formSendTestNotify?Type=<% write(Type); %>';
   		if ("<% write(Type); %>" == "EMail")
			{
				URL += '&Server=' + document.formSetNotificationRecip.Server.value;
				URL += '&From_Address=' + document.formSetNotificationRecip.From_Address.value;
				/*
				URL += '&Username=' + document.formSetNotificationRecip.Username.value;
				URL += '&Password=' + document.formSetNotificationRecip.Password.value;
				*/
			}
			else if ("<% write(Type); %>" == "SNMP")
			{
				URL += '&Community_String=' + document.formSetNotificationRecip.Community_String.value;
			}

			URL += '&Section=' + document.formSetNotificationRecip.Section.value;
			URL += '&Redirect=' + document.formSetNotificationRecip.Redirect.value;
			URL += '&Critical_Enabled=' + document.formSetNotificationRecip.Critical_Enabled.value;
			URL += '&Warning_Enabled=' + document.formSetNotificationRecip.Warning_Enabled.value;
			URL += '&Information_Enabled=' + document.formSetNotificationRecip.Information_Enabled.value;
			URL += '&User1_Enabled=' + document.formSetNotificationRecip.User1_Enabled.value;
			URL += '&User2_Enabled=' + document.formSetNotificationRecip.User2_Enabled.value;
			URL += '&Critical_List_Count=' + document.formSetNotificationRecip.Critical_List_Count.value;
			URL += '&Warning_List_Count=' + document.formSetNotificationRecip.Warning_List_Count.value;
			URL += '&Information_List_Count=' + document.formSetNotificationRecip.Information_List_Count.value;
			URL += '&User1_List_Count=' + document.formSetNotificationRecip.User1_List_Count.value;
			URL += '&User2_List_Count=' + document.formSetNotificationRecip.User2_List_Count.value;
			URL += '&Critical_List_0=' + document.formSetNotificationRecip.Critical_List_0.value;
			URL += '&Critical_List_1=' + document.formSetNotificationRecip.Critical_List_1.value;
			URL += '&Critical_List_2=' + document.formSetNotificationRecip.Critical_List_2.value;
			URL += '&Critical_List_3=' + document.formSetNotificationRecip.Critical_List_3.value;
			URL += '&Critical_List_4=' + document.formSetNotificationRecip.Critical_List_4.value;
			URL += '&Critical_List_5=' + document.formSetNotificationRecip.Critical_List_5.value;
			URL += '&Critical_Delay=' + document.formSetNotificationRecip.Critical_Delay.value;
			URL += '&Warning_List_0=' + document.formSetNotificationRecip.Warning_List_0.value;
			URL += '&Warning_List_1=' + document.formSetNotificationRecip.Warning_List_1.value;
			URL += '&Warning_List_2=' + document.formSetNotificationRecip.Warning_List_2.value;
			URL += '&Warning_List_3=' + document.formSetNotificationRecip.Warning_List_3.value;
			URL += '&Warning_List_4=' + document.formSetNotificationRecip.Warning_List_4.value;
			URL += '&Warning_List_5=' + document.formSetNotificationRecip.Warning_List_5.value;
			URL += '&Warning_Delay=' + document.formSetNotificationRecip.Warning_Delay.value;
			URL += '&Information_List_0=' + document.formSetNotificationRecip.Information_List_0.value;
			URL += '&Information_List_1=' + document.formSetNotificationRecip.Information_List_1.value;
			URL += '&Information_List_2=' + document.formSetNotificationRecip.Information_List_2.value;
			URL += '&Information_List_3=' + document.formSetNotificationRecip.Information_List_3.value;
			URL += '&Information_List_4=' + document.formSetNotificationRecip.Information_List_4.value;
			URL += '&Information_List_5=' + document.formSetNotificationRecip.Information_List_5.value;
			URL += '&Information_Delay=' + document.formSetNotificationRecip.Information_Delay.value;
			URL += '&User1_List_0=' + document.formSetNotificationRecip.User1_List_0.value;
			URL += '&User1_List_1=' + document.formSetNotificationRecip.User1_List_1.value;
			URL += '&User1_List_2=' + document.formSetNotificationRecip.User1_List_2.value;
			URL += '&User1_List_3=' + document.formSetNotificationRecip.User1_List_3.value;
			URL += '&User1_List_4=' + document.formSetNotificationRecip.User1_List_4.value;
			URL += '&User1_List_5=' + document.formSetNotificationRecip.User1_List_5.value;
			URL += '&User1_Delay=' + document.formSetNotificationRecip.User1_Delay.value;
			URL += '&User2_List_0=' + document.formSetNotificationRecip.User2_List_0.value;
			URL += '&User2_List_1=' + document.formSetNotificationRecip.User2_List_1.value;
			URL += '&User2_List_2=' + document.formSetNotificationRecip.User2_List_2.value;
			URL += '&User2_List_3=' + document.formSetNotificationRecip.User2_List_3.value;
			URL += '&User2_List_4=' + document.formSetNotificationRecip.User2_List_4.value;
			URL += '&User2_List_5=' + document.formSetNotificationRecip.User2_List_5.value;
			URL += '&User2_Delay=' + document.formSetNotificationRecip.User2_Delay.value;

			dialog = openCenteredWindow( URL, 'TestSend', 500, 500, '', 'yes', 'opener');
		}

   	function ValidateData()
   	{
		if (document.formSetNotificationRecip.CRITICAL_ENABLED.checked && document.formSetNotificationRecip.Critical_List_0.value == ""
		&& document.formSetNotificationRecip.Critical_List_1.value == "" && document.formSetNotificationRecip.Critical_List_2.value == ""
		&& document.formSetNotificationRecip.Critical_List_3.value == "" && document.formSetNotificationRecip.Critical_List_4.value == ""
		&& document.formSetNotificationRecip.Critical_List_5.value == "")
		{
			if (!confirm("<%DMTranslate("Warning: Critical Event Notification has been enabled but no recipients have been entered.");%>"))
				return false;
		}

		if (document.formSetNotificationRecip.WARNING_ENABLED.checked && document.formSetNotificationRecip.Warning_List_0.value == ""
		&& document.formSetNotificationRecip.Warning_List_1.value == "" && document.formSetNotificationRecip.Warning_List_2.value == ""
		&& document.formSetNotificationRecip.Warning_List_3.value == "" && document.formSetNotificationRecip.Warning_List_4.value == ""
		&& document.formSetNotificationRecip.Warning_List_5.value == "")
		{
			if (!confirm("<%DMTranslate("Warning: Warning Event Notification has been enabled but no recipients have been entered.");%>"))
				return false;
		}

		if (document.formSetNotificationRecip.INFORMATION_ENABLED.checked && document.formSetNotificationRecip.Information_List_0.value == ""
		&& document.formSetNotificationRecip.Information_List_1.value == "" && document.formSetNotificationRecip.Information_List_2.value == ""
		&& document.formSetNotificationRecip.Information_List_3.value == "" && document.formSetNotificationRecip.Information_List_4.value == ""
		&& document.formSetNotificationRecip.Information_List_5.value == "")
		{
			if (!confirm("<%DMTranslate("Warning: Information Event Notification has been enabled but no recipients have been entered.");%>"))
				return false;
		}

		if (document.formSetNotificationRecip.USER1_ENABLED.checked && document.formSetNotificationRecip.User1_List_0.value == ""
		&& document.formSetNotificationRecip.User1_List_1.value == "" && document.formSetNotificationRecip.User1_List_2.value == ""
		&& document.formSetNotificationRecip.User1_List_3.value == "" && document.formSetNotificationRecip.User1_List_4.value == ""
		&& document.formSetNotificationRecip.User1_List_5.value == "")
		{
			if (!confirm("<%DMTranslate("Warning:");%> <% DMPrintIniString( "Event_Severities", "User1Name", "#User Defined 1#"); %> <%DMTranslate("Event Notification has been enabled but no recipients have been entered.");%>"))
				return false;
		}

		if (document.formSetNotificationRecip.USER2_ENABLED.checked && document.formSetNotificationRecip.User2_List_0.value == ""
		&& document.formSetNotificationRecip.User2_List_1.value == "" && document.formSetNotificationRecip.User2_List_2.value == ""
		&& document.formSetNotificationRecip.User2_List_3.value == "" && document.formSetNotificationRecip.User2_List_4.value == ""
		&& document.formSetNotificationRecip.User2_List_5.value == "")
		{
			if (!confirm("<%DMTranslate("Warning:");%> <% DMPrintIniString( "Event_Severities", "User2Name", "#User Defined 2#"); %> <%DMTranslate("Event Notification has been enabled but no recipients have been entered.");%>"))
				return false;
		}

		if ( isNaN(parseInt(document.formSetNotificationRecip.Critical_Delay.value, 0)) || isNaN(parseInt(document.formSetNotificationRecip.Warning_Delay.value, 0))
		|| isNaN(parseInt(document.formSetNotificationRecip.Information_Delay.value, 0)) || isNaN(parseInt(document.formSetNotificationRecip.User1_Delay.value, 0))
		|| isNaN(parseInt(document.formSetNotificationRecip.User2_Delay.value, 0)) || (document.formSetNotificationRecip.Critical_Delay.value < 0)
		|| (document.formSetNotificationRecip.Warning_Delay.value < 0) || (document.formSetNotificationRecip.Information_Delay.value < 0)
		|| (document.formSetNotificationRecip.User1_Delay.value < 0) || (document.formSetNotificationRecip.User2_Delay.value < 0) )
		{
			alert("<%DMTranslate("Delays must be positive numeric values.");%>");
			return false;
		}

		if ("EMail" == "<% write(Type); %>")
		{
			if (document.formSetNotificationRecip.Server.value == "" && (document.formSetNotificationRecip.Critical_List_0.value != ""
			|| document.formSetNotificationRecip.Critical_List_1.value != "" || document.formSetNotificationRecip.Critical_List_2.value != ""
			|| document.formSetNotificationRecip.Critical_List_3.value != "" || document.formSetNotificationRecip.Critical_List_4.value != ""
			|| document.formSetNotificationRecip.Critical_List_5.value != "" || document.formSetNotificationRecip.Warning_List_0.value != ""
			|| document.formSetNotificationRecip.Warning_List_1.value != "" || document.formSetNotificationRecip.Warning_List_2.value != ""
			|| document.formSetNotificationRecip.Warning_List_3.value != "" || document.formSetNotificationRecip.Warning_List_4.value != ""
			|| document.formSetNotificationRecip.Warning_List_5.value != "" || document.formSetNotificationRecip.Information_List_0.value != ""
			|| document.formSetNotificationRecip.Information_List_1.value != "" || document.formSetNotificationRecip.Information_List_2.value != ""
			|| document.formSetNotificationRecip.Information_List_3.value != "" || document.formSetNotificationRecip.Information_List_4.value != ""
			|| document.formSetNotificationRecip.Information_List_5.value != "" || document.formSetNotificationRecip.User1_List_0.value != ""
			|| document.formSetNotificationRecip.User1_List_1.value != "" || document.formSetNotificationRecip.User1_List_2.value != ""
			|| document.formSetNotificationRecip.User1_List_3.value != "" || document.formSetNotificationRecip.User1_List_4.value != ""
			|| document.formSetNotificationRecip.User1_List_5.value != "" || document.formSetNotificationRecip.User2_List_0.value != ""
			|| document.formSetNotificationRecip.User2_List_1.value != "" || document.formSetNotificationRecip.User2_List_2.value != ""
			|| document.formSetNotificationRecip.User2_List_3.value != "" || document.formSetNotificationRecip.User2_List_4.value != ""
			|| document.formSetNotificationRecip.User2_List_5.value != ""))
			{
				if (!confirm("<%DMTranslate("Warning: EMail Notification has been set up without an EMail Server.");%>"))
					return false;
			}

			if (document.formSetNotificationRecip.From_Address.value == "" && (document.formSetNotificationRecip.Critical_List_0.value != ""
			|| document.formSetNotificationRecip.Critical_List_1.value != "" || document.formSetNotificationRecip.Critical_List_2.value != ""
			|| document.formSetNotificationRecip.Critical_List_3.value != "" || document.formSetNotificationRecip.Critical_List_4.value != ""
			|| document.formSetNotificationRecip.Critical_List_5.value != "" || document.formSetNotificationRecip.Warning_List_0.value != ""
			|| document.formSetNotificationRecip.Warning_List_1.value != "" || document.formSetNotificationRecip.Warning_List_2.value != ""
			|| document.formSetNotificationRecip.Warning_List_3.value != "" || document.formSetNotificationRecip.Warning_List_4.value != ""
			|| document.formSetNotificationRecip.Warning_List_5.value != "" || document.formSetNotificationRecip.Information_List_0.value != ""
			|| document.formSetNotificationRecip.Information_List_1.value != "" || document.formSetNotificationRecip.Information_List_2.value != ""
			|| document.formSetNotificationRecip.Information_List_3.value != "" || document.formSetNotificationRecip.Information_List_4.value != ""
			|| document.formSetNotificationRecip.Information_List_5.value != "" || document.formSetNotificationRecip.User1_List_0.value != ""
			|| document.formSetNotificationRecip.User1_List_1.value != "" || document.formSetNotificationRecip.User1_List_2.value != ""
			|| document.formSetNotificationRecip.User1_List_3.value != "" || document.formSetNotificationRecip.User1_List_4.value != ""
			|| document.formSetNotificationRecip.User1_List_5.value != "" || document.formSetNotificationRecip.User2_List_0.value != ""
			|| document.formSetNotificationRecip.User2_List_1.value != "" || document.formSetNotificationRecip.User2_List_2.value != ""
			|| document.formSetNotificationRecip.User2_List_3.value != "" || document.formSetNotificationRecip.User2_List_4.value != ""
			|| document.formSetNotificationRecip.User2_List_5.value != ""))
			{
				if (!confirm("<%DMTranslate("Warning: EMail Notification has been set up without a From Address.");%>"))
					return false;
			}
		}

		if (document.formSetNotificationRecip.CRITICAL_ENABLED.checked)
			document.formSetNotificationRecip.Critical_Enabled.value = "1";
		if (document.formSetNotificationRecip.WARNING_ENABLED.checked)
			document.formSetNotificationRecip.Warning_Enabled.value = "1";
		if (document.formSetNotificationRecip.INFORMATION_ENABLED.checked)
			document.formSetNotificationRecip.Information_Enabled.value = "1";
		if (document.formSetNotificationRecip.USER1_ENABLED.checked)
			document.formSetNotificationRecip.User1_Enabled.value = "1";
		if (document.formSetNotificationRecip.USER2_ENABLED.checked)
			document.formSetNotificationRecip.User2_Enabled.value = "1";

		//move critical recipients to the top of the list
		iactualRecip = 0;
		for (i=0; i<6; i++)
		{
			if ( eval("document.formSetNotificationRecip.Critical_List_" + i + ".value") != "" )
			{
				eval( "document.formSetNotificationRecip.Critical_List_" + iactualRecip + ".value = document.formSetNotificationRecip.Critical_List_" + i + ".value" );
				iactualRecip++;
			}
		}
		for (i=0; i<(6-iactualRecip); i++)
		{
			eval( "document.formSetNotificationRecip.Critical_List_" + (iactualRecip + i) + ".value = ''");
		}


		//move warning recipients to the top of the list
		iactualRecip = 0;
		for (i=0; i<6; i++)
		{
			if ( eval("document.formSetNotificationRecip.Warning_List_" + i + ".value") != "" )
			{
				eval( "document.formSetNotificationRecip.Warning_List_" + iactualRecip + ".value = document.formSetNotificationRecip.Warning_List_" + i + ".value" );
				iactualRecip++;
			}
		}
		for (i=0; i<(6-iactualRecip); i++)
		{
			eval( "document.formSetNotificationRecip.Warning_List_" + (iactualRecip + i) + ".value = ''");
		}

		//move Information recipients to the top of the list
		iactualRecip = 0;
		for (i=0; i<6; i++)
		{
			if ( eval("document.formSetNotificationRecip.Information_List_" + i + ".value") != "" )
			{
				eval( "document.formSetNotificationRecip.Information_List_" + iactualRecip + ".value = document.formSetNotificationRecip.Information_List_" + i + ".value" );
				iactualRecip++;
			}
		}
		for (i=0; i<(6-iactualRecip); i++)
		{
			eval( "document.formSetNotificationRecip.Information_List_" + (iactualRecip + i) + ".value = ''");
		}

		//move User1 recipients to the top of the list
		iactualRecip = 0;
		for (i=0; i<6; i++)
		{
			if ( eval("document.formSetNotificationRecip.User1_List_" + i + ".value") != "" )
			{
				eval( "document.formSetNotificationRecip.User1_List_" + iactualRecip + ".value = document.formSetNotificationRecip.User1_List_" + i + ".value" );
				iactualRecip++;
			}
		}
		for (i=0; i<(6-iactualRecip); i++)
		{
			eval( "document.formSetNotificationRecip.User1_List_" + (iactualRecip + i) + ".value = ''");
		}

		//move User2 recipients to the top of the list
		iactualRecip = 0;
		for (i=0; i<6; i++)
		{
			if ( eval("document.formSetNotificationRecip.User2_List_" + i + ".value") != "" )
			{
				eval( "document.formSetNotificationRecip.User2_List_" + iactualRecip + ".value = document.formSetNotificationRecip.User2_List_" + i + ".value" );
				iactualRecip++;
			}
		}
		for (i=0; i<(6-iactualRecip); i++)
		{
			eval( "document.formSetNotificationRecip.User2_List_" + (iactualRecip + i) + ".value = ''");
		}

		document.formSetNotificationRecip.Critical_List_Count.value = "0";
		if (document.formSetNotificationRecip.Critical_List_0.value != "")
			document.formSetNotificationRecip.Critical_List_Count.value = "1";
		if (document.formSetNotificationRecip.Critical_List_1.value != "")
			document.formSetNotificationRecip.Critical_List_Count.value = "2";
		if (document.formSetNotificationRecip.Critical_List_2.value != "")
			document.formSetNotificationRecip.Critical_List_Count.value = "3";
		if (document.formSetNotificationRecip.Critical_List_3.value != "")
			document.formSetNotificationRecip.Critical_List_Count.value = "4";
		if (document.formSetNotificationRecip.Critical_List_4.value != "")
			document.formSetNotificationRecip.Critical_List_Count.value = "5";
		if (document.formSetNotificationRecip.Critical_List_5.value != "")
			document.formSetNotificationRecip.Critical_List_Count.value = "6";

		document.formSetNotificationRecip.Warning_List_Count.value = "0";
		if (document.formSetNotificationRecip.Warning_List_0.value != "")
			document.formSetNotificationRecip.Warning_List_Count.value = "1";
		if (document.formSetNotificationRecip.Warning_List_1.value != "")
			document.formSetNotificationRecip.Warning_List_Count.value = "2";
		if (document.formSetNotificationRecip.Warning_List_2.value != "")
			document.formSetNotificationRecip.Warning_List_Count.value = "3";
		if (document.formSetNotificationRecip.Warning_List_3.value != "")
			document.formSetNotificationRecip.Warning_List_Count.value = "4";
		if (document.formSetNotificationRecip.Warning_List_4.value != "")
			document.formSetNotificationRecip.Warning_List_Count.value = "5";
		if (document.formSetNotificationRecip.Warning_List_5.value != "")
			document.formSetNotificationRecip.Warning_List_Count.value = "6";

		document.formSetNotificationRecip.Information_List_Count.value = "0";
		if (document.formSetNotificationRecip.Information_List_0.value != "")
			document.formSetNotificationRecip.Information_List_Count.value = "1";
		if (document.formSetNotificationRecip.Information_List_1.value != "")
			document.formSetNotificationRecip.Information_List_Count.value = "2";
		if (document.formSetNotificationRecip.Information_List_2.value != "")
			document.formSetNotificationRecip.Information_List_Count.value = "3";
		if (document.formSetNotificationRecip.Information_List_3.value != "")
			document.formSetNotificationRecip.Information_List_Count.value = "4";
		if (document.formSetNotificationRecip.Information_List_4.value != "")
			document.formSetNotificationRecip.Information_List_Count.value = "5";
		if (document.formSetNotificationRecip.Information_List_5.value != "")
			document.formSetNotificationRecip.Information_List_Count.value = "6";

		document.formSetNotificationRecip.User1_List_Count.value = "0";
		if (document.formSetNotificationRecip.User1_List_0.value != "")
			document.formSetNotificationRecip.User1_List_Count.value = "1";
		if (document.formSetNotificationRecip.User1_List_1.value != "")
			document.formSetNotificationRecip.User1_List_Count.value = "2";
		if (document.formSetNotificationRecip.User1_List_2.value != "")
			document.formSetNotificationRecip.User1_List_Count.value = "3";
		if (document.formSetNotificationRecip.User1_List_3.value != "")
			document.formSetNotificationRecip.User1_List_Count.value = "4";
		if (document.formSetNotificationRecip.User1_List_4.value != "")
			document.formSetNotificationRecip.User1_List_Count.value = "5";
		if (document.formSetNotificationRecip.User1_List_5.value != "")
			document.formSetNotificationRecip.User1_List_Count.value = "6";

		document.formSetNotificationRecip.User2_List_Count.value = "0";
		if (document.formSetNotificationRecip.User2_List_0.value != "")
			document.formSetNotificationRecip.User2_List_Count.value = "1";
		if (document.formSetNotificationRecip.User2_List_1.value != "")
			document.formSetNotificationRecip.User2_List_Count.value = "2";
		if (document.formSetNotificationRecip.User2_List_2.value != "")
			document.formSetNotificationRecip.User2_List_Count.value = "3";
		if (document.formSetNotificationRecip.User2_List_3.value != "")
			document.formSetNotificationRecip.User2_List_Count.value = "4";
		if (document.formSetNotificationRecip.User2_List_4.value != "")
			document.formSetNotificationRecip.User2_List_Count.value = "5";
		if (document.formSetNotificationRecip.User2_List_5.value != "")
			document.formSetNotificationRecip.User2_List_Count.value = "6";

   		return true;
   	}

   	function isTypeEmail(type)
   	{
   		if (type == "EMail")
   		{
   			document.write('<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>');
   			document.write('<tr class=dialogColHeader>');
   			document.write('<td align=center colspan=2>');
   			document.write('<b><% DMTranslate( "EMail Server Setup"); %></b>');
   			document.write('</td>');
   			document.write('</tr>');
   			document.write('<tr class=dialogLineItem>');
			document.write('<td align=center>');
			document.write('<% DMTranslate( "SMTP Server"); %>');
			document.write('</td>');
			document.write('<td align=center width=50%>');
			document.write('<input maxLength="50" name="Server" size="20" value="<% DMPrintIniString( Section, "Server"); %>">');
			document.write('</td>');
		  	document.write('</tr>');
		  	document.write('<tr class=dialogLineItem>');
			document.write('<td align=center>');
			document.write('<% DMTranslate( "SMTP From Address"); %>');
			document.write('</td>');
			document.write('<td align=center>');
			document.write('<input maxLength="50" name="From_Address" size="20" value="<% DMPrintIniString( Section, "From_Address"); %>">');
			document.write('</td>');
			document.write('</tr>');
/*
		  	document.write('<tr class=dialogLineItem>');
			document.write('<td align=center>');
			document.write('<% DMTranslate( "SMTP Username"); %>');
			document.write('</td>');
			document.write('<td align=center>');
			document.write('<input maxLength="80" name="Username" size="20" value="<% DMPrintIniString( Section, "Username"); %>">');
			document.write('</td>');
			document.write('</tr>');
		  	document.write('<tr class=dialogLineItem>');
			document.write('<td align=center>');
			document.write('<% DMTranslate( "SMTP Password"); %>');
			document.write('</td>');
			document.write('<td align=center>');
			document.write('<input type="password" maxLength="80" name="Password" size="20" value="<% DMPrintIniString( Section, "Password"); %>">');
			document.write('</td>');
			document.write('</tr>');
			*/

			document.write('</table>');
			document.write('<br>');
		}
		else if (type == "SNMP")
		{
			document.write('<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>');
   			document.write('<tr class=dialogColHeader>');
   			document.write('<td align=center colspan=2>');
   			document.write('<b><% DMTranslate( "SNMP Setup"); %></b>');
   			document.write('</td>');
   			document.write('</tr>');
   			document.write('<tr class=dialogLineItem>');
			document.write('<td align=center>');
			document.write('<% DMTranslate( "Trap Community String"); %>');
			document.write('</td>');
			document.write('<td align=center width=50%>');
			document.write('<input maxLength="50" name="Community_String" size="20" value="<% DMPrintIniString( Section, "Community_String", "public"); %>">');
			document.write('</td>');
		  	document.write('</tr>');
			document.write('</table>');
			document.write('<br>');
		}
   	}
   	//-->
   </script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
	<form name=formSetNotificationRecip method=get action='/goform/formSetNotificationRecip' OnSubmit='return ValidateData();'>

	<input type=hidden name=Section value="<% write( Section); %>">
	<input type=hidden name=Redirect value="/Contents/UPS/event_actions.asp">
	<input type=hidden name=Critical_Enabled value ="0">
	<input type=hidden name=Warning_Enabled value ="0">
	<input type=hidden name=Information_Enabled value ="0">
	<input type=hidden name=User1_Enabled value ="0">
	<input type=hidden name=User2_Enabled value ="0">
	<input type=hidden name=Critical_List_Count value="">
	<input type=hidden name=Warning_List_Count value="">
	<input type=hidden name=Information_List_Count value="">
	<input type=hidden name=User1_List_Count value="">
	<input type=hidden name=User2_List_Count value="">

			<!-- *** notification form ****************************************************** -->

		<center>
		<table width=650 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
			<tr>
			 <td valign=top>

				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 bordercolor="#000000" border=0>

					<!-- *** header bar *** -->
					<tr>
					<td bgcolor=#c0c0c0>
						<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
							<tr>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;"><% DMTranslate( Type); %> <% DMTranslate( "Setup"); %>
								</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( '<% write( Help); %>')";>
								</td>
							</tr>
						</table>
					</td>
					</tr>

					<!-- *** dialog box content *** -->
					<tr>
					 <td>
						<table width=100% cellspacing=0 cellpadding=10 border=0 class=dialogBackground>
							<tr>
								<td>
									<script language="javascript1.1">
   									<!--
   										isTypeEmail("<%write(Type);%>");
   									//-->
   									</script>

									<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
										<tr class=dialogColHeader>
											<td align=center><b><% DMTranslate( "Enabled"); %></b></td>
											<td align=center><b><% DMTranslate( "Event"); %></b></td>
											<td align=center><b><% DMTranslate( Type); %>
											<%
											if ("Broadcast" == Type)
											{
												DMTranslate( "Hostname(s)/IP Address(es)")
											}
											else
											{
												DMTranslate( "Address(es)")
											}
											%>
											</b></td>
											<td align=center><b><% DMTranslate( "Delay"); %>&nbsp;(<% DMTranslate( "seconds"); %>)</b></td>
										</tr>
									<tr class=dialogLineItem>
										<td align=center valign=top>
											<input type="checkbox" name="CRITICAL_ENABLED" <% if ("1" == DMGetIniString( Section, "Critical_Enabled", "0")) write( "checked"); %>>
										</td>
										<td align=center valign=top>
											<% DMTranslate( "Critical"); %>
										</td>
										<td align=center valign=top>
											<% count = DMGetIniString( Section, "Critical_List_Count"); %>
											<input type="text" maxlength="50" size="20" name=Critical_List_0 value="<% if (count > 0) DMPrintIniString( Section, "Critical_List_0"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Critical_List_1 value="<% if (count > 1) DMPrintIniString( Section, "Critical_List_1"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Critical_List_2 value="<% if (count > 2) DMPrintIniString( Section, "Critical_List_2"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Critical_List_3 value="<% if (count > 3) DMPrintIniString( Section, "Critical_List_3"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Critical_List_4 value="<% if (count > 4) DMPrintIniString( Section, "Critical_List_4"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Critical_List_5 value="<% if (count > 5) DMPrintIniString( Section, "Critical_List_5"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
										</td>
										<td align=center valign=top>
											<input type=text maxlength=5 disabled="true" name=Critical_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "Critical_Delay", 10); %>">
										</td>
									</tr>
									<tr class=dialogLineItem>
										<td align=center valign=top>
											<input type="checkbox" name="WARNING_ENABLED" <% if ("1" == DMGetIniString( Section, "Warning_Enabled", "0")) write( "checked"); %>>
										</td>
										<td align=center valign=top>
											<% DMTranslate( "Warning"); %>
										</td>
										<td align=center valign=top>
											<% count = DMGetIniString( Section, "Warning_List_Count"); %>
											<input type="text" maxlength="50" size="20" name=Warning_List_0 value="<% if (count > 0) DMPrintIniString( Section, "Warning_List_0"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Warning_List_1 value="<% if (count > 1) DMPrintIniString( Section, "Warning_List_1"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Warning_List_2 value="<% if (count > 2) DMPrintIniString( Section, "Warning_List_2"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Warning_List_3 value="<% if (count > 3) DMPrintIniString( Section, "Warning_List_3"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Warning_List_4 value="<% if (count > 4) DMPrintIniString( Section, "Warning_List_4"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Warning_List_5 value="<% if (count > 5) DMPrintIniString( Section, "Warning_List_5"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
										</td>
										<td align=center valign=top>
											<input type=text maxlength=5 disabled="true" name=Warning_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "Warning_Delay", 10); %>">
										</td>
									</tr>
									<tr class=dialogLineItem>
										<td align=center valign=top>
											<input type="checkbox" name="INFORMATION_ENABLED" <% if ("1" == DMGetIniString( Section, "Information_Enabled", "0")) write( "checked"); %>>
										</td>
										<td align=center valign=top>
											<% DMTranslate( "Information"); %>
										</td>
										<td align=center valign=top>
											<% count = DMGetIniString( Section, "Information_List_Count"); %>
											<input type="text" maxlength="50" size="20" name=Information_List_0 value="<% if (count > 0) DMPrintIniString( Section, "Information_List_0"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Information_List_1 value="<% if (count > 1) DMPrintIniString( Section, "Information_List_1"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Information_List_2 value="<% if (count > 2) DMPrintIniString( Section, "Information_List_2"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Information_List_3 value="<% if (count > 3) DMPrintIniString( Section, "Information_List_3"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Information_List_4 value="<% if (count > 4) DMPrintIniString( Section, "Information_List_4"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=Information_List_5 value="<% if (count > 5) DMPrintIniString( Section, "Information_List_5"); %>">
										</td>
										<td align=center valign=top>
											<input type=text maxlength=5 disabled="true" name=Information_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "Information_Delay", 10); %>">
										</td>
									</tr>
									<tr class=dialogLineItem>
										<td align=center valign=top>
											<input type="checkbox" name="USER1_ENABLED" <% if ("1" == DMGetIniString( Section, "User1_Enabled", "0")) write( "checked"); %>>
										</td>
										<td align=center valign=top>
											<% DMPrintIniString( "Event_Severities", "User1Name", "#User Defined 1#"); %>
										</td>
										<td align=center valign=top>
											<% count = DMGetIniString( Section, "User1_List_Count"); %>
											<input type="text" maxlength="50" size="20" name=User1_List_0 value="<% if (count > 0) DMPrintIniString( Section, "User1_List_0"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User1_List_1 value="<% if (count > 1) DMPrintIniString( Section, "User1_List_1"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User1_List_2 value="<% if (count > 2) DMPrintIniString( Section, "User1_List_2"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User1_List_3 value="<% if (count > 3) DMPrintIniString( Section, "User1_List_3"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User1_List_4 value="<% if (count > 4) DMPrintIniString( Section, "User1_List_4"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User1_List_5 value="<% if (count > 5) DMPrintIniString( Section, "User1_List_5"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
										</td>
										<td align=center valign=top>
											<input type=text maxlength=5 disabled="true" name=User1_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "User1_Delay", 10); %>">
										</td>
									</tr>
									<tr class=dialogLineItem>
										<td align=center valign=top>
											<input type="checkbox" name="USER2_ENABLED" <% if ("1" == DMGetIniString( Section, "User2_Enabled", "0")) write( "checked"); %>>
										</td>
										<td align=center valign=top>
											<% DMPrintIniString( "Event_Severities", "User2Name", "#User Defined 2#"); %>
										</td>
										<td align=center valign=top>
											<% count = DMGetIniString( Section, "User2_List_Count"); %>
											<input type="text" maxlength="50" size="20" name=User2_List_0 value="<% if (count > 0) DMPrintIniString( Section, "User2_List_0"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User2_List_1 value="<% if (count > 1) DMPrintIniString( Section, "User2_List_1"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User2_List_2 value="<% if (count > 2) DMPrintIniString( Section, "User2_List_2"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User2_List_3 value="<% if (count > 3) DMPrintIniString( Section, "User2_List_3"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User2_List_4 value="<% if (count > 4) DMPrintIniString( Section, "User2_List_4"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
											<input type="text" maxlength="50" size="20" name=User2_List_5 value="<% if (count > 5) DMPrintIniString( Section, "User2_List_5"); %>" vtype="<% write(Type);%>" onBlur="verifyData(vtype, this)">
										</td>
										<td align=center valign=top>
											<input type=text maxlength=5 disabled="true" name=User2_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "User2_Delay", 10); %>">
										</td>
									</tr>
								</table>

							 </td>
							</tr>
							<tr>
								<td align=center valign=top>
									<input type=submit value="<% DMTranslate( "Save Changes"); %>">
									<%
										if ("true" == DMGetConfigVar("EnableTestNotify"))
										{
											write('&nbsp;&nbsp;');
											write('<input type=button OnClick=SendTestMessage(); value="');
											DMTranslate( "Send Test Message")
											write('">');
										}
									%>
								</td>
							</tr>
						</table>

					 </td>
					</tr>
				</table>

			</td>
			</tr>
		</table>
		</center>
	</form>
</body>
</html>
