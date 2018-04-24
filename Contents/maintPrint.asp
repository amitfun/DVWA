<html>
<head>

	<title>Maintenance Log</title>
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>

</head>

<body topmargin=10 leftmargin=10 rightmargin=5 class=content onLoad="window.print();">

		<br>
		<!-- *** maintenance printout ****************************************************** -->

		<table width=100% align=center cellspacing=0 cellpadding=0 border=1 bordercolor="#000000">
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
									<%DMTranslate("UPS Maintenance Records");%>
								</td>
								<td align=right class=dialogHeader><p style="padding:0px 5x 0px 5px;;">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
						<table width=100% align=center cellspacing=5 cellpadding=0 border=0>
						  <tr>
							 <td align=center width=100% valign=top>

							 	<table width=100% cellspacing=5 cellpadding=0 border=0>
							 		<tr>
							 			<td align=center valign=top>

												<table width=100% cellspacing=1 cellpadding=4 border="0">

													<tr>
													  <td align=center><b>&nbsp;</b></td>
													  <td align=center><b><%DMTranslate("Date");%></b></td>
													  <td align=center><b><%DMTranslate("Performed By");%></b></td>
													  <td align=center><b><%DMTranslate("Work Type");%></b></td>
													  <td align=center><b><%DMTranslate("Status");%></b></td>
													</tr>
													<tr>
													  <td colspan=5><hr size=1 noshade></td>
													</tr>

													<!-- *** begin record line item *** -->
													<% DMPrintMaintLogs( -1,
														"<tr>
															<td align=center><img src='/CImage/$1'></td>
															<td align=center>$2</td>
															<td align=center>$3</td>
															<td align=center>$4</td>
															<td align=center>$5</td>
														</tr>
														<tr>
														  <td align=left colspan=5>$6</td>
														</tr>
														<tr>
														  <td colspan=5><hr size=1 noshade></td>
														</tr>"); %>
													<!-- *** end record line item *** -->

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

			</td>
		  </tr>
		</table>

</body>
</html>
