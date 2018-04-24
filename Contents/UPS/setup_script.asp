<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>

	<% var Section = Type + "_Notification"; %>
	<% var Help = Type + " Notification"; %>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   	<!--
   	function ValidateData()
   	{

		if ( isNaN(parseInt(document.formSetupScript.Critical_Delay.value, 0)) || isNaN(parseInt(document.formSetupScript.Warning_Delay.value, 0))
		|| isNaN(parseInt(document.formSetupScript.Information_Delay.value, 0)) || isNaN(parseInt(document.formSetupScript.User1_Delay.value, 0))
		|| isNaN(parseInt(document.formSetupScript.User2_Delay.value, 0)) || (document.formSetupScript.Critical_Delay.value < 0)
		|| (document.formSetupScript.Warning_Delay.value < 0) || (document.formSetupScript.Information_Delay.value < 0)
		|| (document.formSetupScript.User1_Delay.value < 0) || (document.formSetupScript.User2_Delay.value < 0) )
		{
			alert("<%DMTranslate("Delays must be positive numeric values.");%>");
			return false;
		}

		if (document.formSetupScript.CRITICAL_ENABLED.checked)
			document.formSetupScript.Critical_Enabled.value = "1";
		if (document.formSetupScript.WARNING_ENABLED.checked)
			document.formSetupScript.Warning_Enabled.value = "1";
		if (document.formSetupScript.INFORMATION_ENABLED.checked)
			document.formSetupScript.Information_Enabled.value = "1";
		if (document.formSetupScript.USER1_ENABLED.checked)
			document.formSetupScript.User1_Enabled.value = "1";
		if (document.formSetupScript.USER2_ENABLED.checked)
			document.formSetupScript.User2_Enabled.value = "1";

   		return true;
   	}

   	//-->
   </script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
	<form name=formSetupScript method=get action='/goform/formSetupScript' OnSubmit='return ValidateData();'>

	<input type=hidden name=Section value="<% write( Section); %>">
	<input type=hidden name=Redirect value="/Contents/UPS/event_actions.asp">
	<input type=hidden name=Critical_Enabled value ="0">
	<input type=hidden name=Warning_Enabled value ="0">
	<input type=hidden name=Information_Enabled value ="0">
	<input type=hidden name=User1_Enabled value ="0">
	<input type=hidden name=User2_Enabled value ="0">

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
									<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
										<tr class=dialogColHeader>
											<td align=center><b><% DMTranslate( "Enabled"); %></b></td>
											<td align=center><b><% DMTranslate( "Event"); %></b></td>
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
											<input type=text name=Critical_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "Critical_Delay", 10); %>">
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
											<input type=text name=Warning_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "Warning_Delay", 10); %>">
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
											<input type=text name=Information_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "Information_Delay", 10); %>">
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
											<input type=text name=User1_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "User1_Delay", 10); %>">
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
											<input type=text name=User2_Delay size=5 maxlength=5 value="<% DMPrintIniString( Section, "User2_Delay", 10); %>">
										</td>
									</tr>
								</table>

							 </td>
							</tr>
							<tr>
								<td align=center valign=top>
									<input type=submit value="<% DMTranslate( "Save Changes"); %>">
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
