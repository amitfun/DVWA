<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">

	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1" src="../pickdate.js"></script>

</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

	<!-- *** identification page ****************************************************** -->

	<center>
	<table width=600 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
	  <tr>
		 <td valign=top>

			<!-- *** begin dialog box *** -->

			<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

			  <!-- *** header bar *** -->
			  <tr>
				<td>
					<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
						<tr>
							<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Identification"); %>
							</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Identification')";>
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
								<table width=100%% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>

<%
				DMPrintUPSCategoryVariables( "Identification", "<tr class=dialogLineItem><td align=center width=50%% valign=top>$1</td><td align=center valign=top>&nbsp;$2&nbsp;</b></td></tr>");
%>
								</table>
							</td>
						</tr>
					</table>

				</td>
			 </tr>
		  </table>

	</table>
	</center>

</body>
</html>
