<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>

   <script language="javascript1.1" src="../UI_lib.js"></script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
<form action='/goform/formScheduledShutdown' method='POST' name=theForm>

		<center>
		<table width=100% align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
		  <tr>
			 <td valign=top>

				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				  <!-- *** header bar *** -->
				  <tr>
					<td>
						<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
							<tr>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Scheduled Shutdown"); %></td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'UPS Scheduled Shutdown')";>
							</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <tr>
					<td align=center>
					<br>
						<input type=hidden name=actionType>
						<% DMPrintIfAdmin( "<input type=submit style=\"font-size:8pt; color:black;;\" value=\'#Add New Scheduled Shutdown#\' name=addNew onClick='setActionType(1);'>"); %>
						<% DMPrintIfAdmin( "<input type=submit style=\"font-size:8pt; color:black;;\" value=\'#Delete Selection(s)#\' name=delete onClick='setActionType(2);'>"); %>
					</td>
				 </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
					 	<table width=100% cellspacing=10 cellpadding=0 border=0 class=dialogBackground>
					 	  <tr>
					 		 <td>
								<table width=100% align=center cellspacing=1 cellpadding=2 border=0 class=dialogCellLine>
								  <tr class=dialogColHeader>
									<td align=center width=200>
										<b><% DMTranslate( "Frequency"); %></b>&nbsp;
									</td>
									<td align=center width=200>
										<b><% DMTranslate( "Shutdown"); %></b>&nbsp;
									</td>
									<td align=center width=200>
										<b><% DMTranslate( "Restart"); %></b>&nbsp;
									</td>
									<td align=center>
										<b><% DMTranslate( "Delete"); %></b>&nbsp;
								  </tr>
								  <% DMPrintSheduledShutdowns( "<tr><td>$2</td><td>$4</td><td>$6</td><td><input type=checkbox name=del_$0 value=false></td></tr>"); %>
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





