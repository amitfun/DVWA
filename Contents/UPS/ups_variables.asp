<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<meta http-equiv="Refresh" content="30">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script language="javascript1.1" src="../UI_lib.js"></script>
</head>

<body class='content' topmargin='10' leftmargin='10' rightmargin='5'>

	<center>
	<table width='10%' align='center' cellspacing='0' cellpadding='0' border='1' class='dialogBackground' bordercolor="#000000">
	  <tr>
		 <td valign='top'>

			<table width='600' align='center' cellspacing='0' cellpadding='0' border='0'>

			  <!-- *** param header *** -->
			  <tr>
				<td>
					<table width='100%' align='center' cellspacing='0' cellpadding='2' border='0'>
						<tr>
							<td align='left' class='dialogHeader'><p style="padding:0px 5px 0px 5px;;">
								<%DMTranslate("UPS Parameters");%>
							</td>
							<td align='right' class='dialogHeader'>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'UPS Parameters')";>
							</td>
						</tr>
					</table>
				</td>
			  </tr>

			  <!-- *** param content *** -->
			  <tr>
				 <td>
					<table width='100%' cellspacing='0' cellpadding='10' border='0'  class='dialogBackground'>
						<tr>
							<td>
								<table width='100%' cellspacing='1' cellpadding='5' border='0'  class='dialogCellLine'>

									<% DMWriteVarDataHtml("<tr><td colspan='3' class='dialogColHeader'><b>$0</b></td></tr>
													",
									               "<tr>
												    <td width='10%' class='dialogLineItem'><img src='$1'></td>
													<td width='60%' class='dialogLineItem'>$2</td>
													<td width='30%' class='dialogLineItem' align='center'>$3</td>
													</tr>
													");
									%>
									

								</table>
							</td>
						</tr>
					</table>
				</td>
			  </tr>

			  <!-- *** legend *** -->
			  <tr>
				 <td>
					<table width='100%' cellspacing='0' cellpadding='10' border='0'  class='dialogBackground'>
						<tr>
					 		<td>
								<table width='400' align='center' cellspacing='0' cellpadding='0' border='0'>
								  <tr>
									 <td align='center' width='33%'><img src='../../CImage/icon_newsCritical.gif'>&nbsp;&nbsp;<% DMTranslate( "Critical"); %></td>
									 <td align='center' width='34%'><img src='../../CImage/icon_newsWarning.gif'>&nbsp;&nbsp;<% DMTranslate( "Warning"); %></td>
									 <td align='center' width='33%'><img src='../../CImage/icon_newsGood.gif'>&nbsp;&nbsp;<% DMTranslate( "Normal"); %></td>
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

</body>
</html>




