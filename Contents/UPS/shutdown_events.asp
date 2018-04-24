<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">

	<%
		count = DMGetUPSVariableSupported( "0", "Load Segment Count");
		countsd = 0;
		for (i = 0; i <= count; i++)
		{
			if ("true" == DMIsShutdownSupported( i))
				countsd++;
		}
	%>
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script language="javascript1.1" src="../UI_lib.js"></script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
	<br>
	<form method="post" action="/goform/formShutdownEvents" name=theForm>
		<center>
		<table width=400 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
		  <tr>
			 <td valign=top>

				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				  <!-- *** header bar *** -->
				  <tr>
					<td class=dialogHeader>
						<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
							<tr>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;">
									<% DMTranslate( "Shutdown Events"); %>
								</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Shutdown+Events')";>
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

											  <!-- *** rows of various controls *** -->

											  <tr class=dialogColHeader>
												<td align=left width=100%>
													<% DMTranslate( "Event"); %>
												</td>
												<td align=center>
													<% DMTranslate( "Shutdown?"); %>
												</td>
												<td align=center>
													<% DMTranslate( "Delay (Minutes)"); %>
												</td>
											  </tr>

											  <% DMPrintShutdownEvents(
													"<tr class=dialogLineItem>
														<td align=left>$1</td>
														<td align=center><input type=checkbox name=Shutdown_On_$_0 value=1 $2?checked??></td>
														<td align=center><input type=text maxlength=3 size=5 name=$_0_Delay value=$3></td>
													</tr>");
											  %>
											</table>
										</td>
									</tr>
								    <tr>
										 <td colspan=6 align=center>
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




