<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   	<!--
		function getDataFreq()
		{
			var selection = <% DMGetLogFreq("$0"); %>;

			document.write("<select name=dataLogFreq>");
			document.write("  <option value=15");
			if (selection == 15)
			{
				document.write(" selected");
			}
			document.write(">15 <% DMTranslate( "sec"); %>");
			document.write("  <option value=30");
			if (selection == 30)
			{
				document.write(" selected");
			}
			document.write(">30 <% DMTranslate( "sec"); %>");
			document.write("  <option value=60");
			if (selection == 60)
			{
				document.write(" selected");
			}
			document.write(">1 <% DMTranslate( "min"); %>");
			document.write("  <option value=180");
			if (selection == 180)
			{
				document.write(" selected");
			}
			document.write(">3 <% DMTranslate( "min"); %>");
			document.write("  <option value=300");
			if (selection == 300)
			{
				document.write(" selected");
			}
			document.write(">5 <% DMTranslate( "min"); %>");
			document.write("  <option value=600");
			if (selection == 600)
			{
				document.write(" selected");
			}
			document.write(">10 <% DMTranslate( "min"); %>");
			document.write("  <option value=900");
			if (selection == 900)
			{
				document.write(" selected");
			}
			document.write(">15 <% DMTranslate( "min"); %>");
			document.write("  <option value=1200");
			if (selection == 1200)
			{
				document.write(" selected");
			}
			document.write(">20 <% DMTranslate( "min"); %>");
			document.write("  <option value=1800");
			if (selection == 1800)
			{
				document.write(" selected");
			}
			document.write(">30 <% DMTranslate( "min"); %>");
			document.write("  <option value=3600");
			if (selection == 3600)
			{
				document.write(" selected");
			}
			document.write(">1 <% DMTranslate( "hr"); %>");

			document.write("</select>");
		}

   	//-->
   </script>



</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
<form action='/goform/formLogSettings' method='POST' name=theForm >

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
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Log Settings"); %></td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Log Settings')";>
							</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
					 	<table width=100% cellspacing=10 cellpadding=0 border=0 class=dialogBackground>
					 	  <tr>
					 		 <td>

								<br>
								<table width=100% align=center cellspacing=1 cellpadding=2 border=0  class=dialogCellLine>
								  <tr class=dialogColHeader>
									<td align=left width=200><b><% DMTranslate( "Variable"); %></b>&nbsp;</td>
									<td align=left width=200><b><% DMTranslate( "Value"); %></b>&nbsp;</td>
									<td align=left><b><% DMTranslate( "Notes"); %></b>&nbsp;</td>
								  </tr>
								  <tr class=dialogColHeader>
									<td align=left width=200><% DMTranslate( "Log interval"); %>&nbsp;</td>
										 
									<td align=left width=200><% write('<script language=javascript>getDataFreq();</script>'); %>&nbsp;</td>
									<td align=left><% DMTranslate( "Enter a logging interval"); %>&nbsp;</td>
								  </tr>
								  <tr class=dialogLineItem>
									<td align=left width=200>
									  <% DMTranslate( "Log"); %><br>
									  <% DMTranslate( "Parameters"); %>&nbsp;
									</td>
									<td align=left colspan=2>
									  <% DMPrintUPSLogVariablesSettings(); %>
									  
									</td>
								  
								  </tr>
								</table>

							</td>
						 </tr>
					   </table>
					 </td>
				  </tr>
		  <tr><td>
		  <center>
		  <input type=submit  style="font-size:8pt; color:black;;" value='<% DMTranslate( "Save Changes"); %>' name=submit>
		  <br>&nbsp;
		  </center>
		  </td></tr>

				</table>
			</td>
		  </tr>
		</table>
	</center>

	</form>
</body>
</html>





