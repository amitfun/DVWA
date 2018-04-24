<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
  <script language="javascript1.1" src="../UI_lib.js"></script>
  <script language="javascript1.1">
  <!--
	function setActionType( type)
	{
		document.userForm.actionType.value = type;
	}

	function checkNow()
	{
		var url = "<% DMPrintSkinString( "UpgradeURLUser", "http://www.taglim.com/upgrade/beupgradeUser.asp");%>" +
				"?MFG=" + escape( "<% DMPrintSkinString( "Company");%>") +
				"&VER=" + escape( "<% DMPrintSkinString( "Version");%>");


		openFullChromeWindow( url, "new", "old");
	}
  //-->
  </script>

</head>

<body topmargin=10 leftmargin=10 rightmargin=5 class=content>

		<br>
		<!-- *** system user form ****************************************************** -->

		<form method="post" action="/goform/formUpgradeSettings" name=userForm>

		<table width=300 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
		  <tr>
			 <td valign=top>

				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				  <!-- *** header bar *** -->
				  <tr>
					<td>
						<table width=100% align=center cellspacing=0 cellpadding=1 border=0>
							<tr class=dialogHeader>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;">
									<% DMTranslate( "Upgrade Settings"); %>
								</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Upgrade')";>
								</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
						<table width=100% align=center cellspacing=5 cellpadding=1 border=0>

						  <!-- *** rows of various controls *** -->

						  <tr>
							 <td align=center width=100% valign=top>

							 	<table width=100% cellspacing=5 cellpadding=0 border=0>
							 		<tr>
											<td align=center ><input type=checkbox name=autoCheck value=true 
											<%
												if ("1" == DMGetIniString( "Upgrade",  "AutoCheck"))
													write( "checked");
												write( ">");
												DMTranslate( "Automatically check for upgrades?");
											%>
											</td>
									</tr>
									<tr><td>&nbsp;</td></tr>
										<tr>
											<td align=center colspan=4>
												<input type=hidden name=actionType>
												<input type=submit value="<% DMTranslate( "Save Changes"); %>" onClick="setActionType(1);">&nbsp;&nbsp;
												<input type=button value="<% DMTranslate( "Check Now"); %>" onClick="checkNow();">&nbsp;&nbsp;
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

		</form>

</body>
</html>

