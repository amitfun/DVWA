<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">

	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>

   <script language="javascript1.1" src="../pickdate.js"></script>
   <script language="javascript1.1" src="../UI_lib.js"></script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

	<!-- *** identification page ****************************************************** -->
<form method=post action='/goform/formSetUPSSettings' name=SettingsForm name=theForm>
	<input type=hidden name=EncrName value=<%write( DMGetEncryptedName());%>>
	<center>
	<table width=600 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
	  <tr>
		 <td valign=top>

			<!-- *** begin dialog box *** -->

			<table width=100% align=center cellspacing=0 cellpadding=0 bordercolor="#000000" border=0>

			  <!-- *** header bar *** -->
			  <tr>
				<td>
					<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
						<tr>
							<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Settings"); %>
							</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Settings')";>
								</td>
						</tr>
					</table>
				</td>
			  </tr>

			  <!-- *** dialog box content *** -->
			  <tr>
				 <td>
					<table width=100% align=center cellspacing=5 cellpadding=0 border=0>

					  <!-- *** rows of various controls *** -->

					  <tr>
						 <td align=center width=100% valign=top>

							<table width=100% cellspacing=5 cellpadding=0 border=0>
							 	<tr>
							 		<td align=center valign=top>
										<table width=100% border=0 cellspacing=1 cellpadding=5 class=dialogCellLine>
											<tr class=dialogColHeader>
												<td><b><% DMTranslate( "Variable"); %></b></td>
												<td><b><% DMTranslate( "Value"); %></b></td>
												<td><b><% DMTranslate( "Notes"); %></b></td>
											</tr>

											<%
													DMPrintUPSSetVariables(
														"<tr class=dialogLineItem><td>$1</td><td>",
														"<select name=\"$_0\">",
														"<option $1?selected??>$0</option>",
														"</select> $2",
														"$3",
														"<input maxlength=50 type=text size=20 name=\"$_0\" onBlur='return validateData(name, this)' value=\"$3\"> $2",
														"<input type=text size=20 name=\"$_0\" value=\"$3\" onFocus='javascript:vDateType=1' onKeyUp='DateFormat(this,this.value,event,false,1)' onBlur='DateFormat(this,this.value,event,true,1)'><a href=\"javascript:show_calendar(\'SettingsForm.$_0\');\" onmouseover=\"window.status=\'Date Picker\';return true;\" onmouseout=\"window.status=\'\';return true;\"><img src=../Images/mini_cal.gif width=21 height=17 border=0></a>",
														"</td><td>",
														"#Enter a number from $0 to $1.#",
														"#Enter a string from $0 to $1 characters.#",
														"#Select a new $1 from the list.#",
														"#Enter a new date or select the calendar icon to pick a date.#",
														"#Enter a new $1 in the box provided.#",
														"#Device Name has been configured with Enterprise Edition.#",
														"</td></tr>");
												%>

										</table>
									</td>
							 	</tr>
								<tr>
									<td align=center>
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
		</td>
	  </tr>
	</table>
</center>
</form>
</body>
</html>

