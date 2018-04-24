<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   	<!--
   		
		//-->
	</script>

   </script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
	<form name=formSetSeverity method=post action='/goform/formSetSeverity'>
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
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Event Severities"); %>
								</td>
								<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Event+Severities');">
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
											<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
 												<tr class=dialogColHeader>
													<td align=center width=28%><% DMTranslate( "Event"); %></td>
													<td align=center width=12%><% DMTranslate( "Critical"); %></td>
													<td align=center width=12%><% DMTranslate( "Warning"); %></td>
													<td align=center width=12%><% DMTranslate( "Information"); %></td>
													<td align=center width=12%><% DMPrintIniString( "Event_Severities", "User1Name", "#User Defined 1#"); %></td>
													<td align=center width=12%><% DMPrintIniString( "Event_Severities", "User2Name", "#User Defined 2#"); %></td>
													<td align=center width=12%><% DMTranslate( "None"); %>
												</tr>
												<% DMPrintEventPage(); %>
 												
											</table>
										</td>
									</tr>
									<tr>
										<td align=center colspan=7 valign=top>
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
