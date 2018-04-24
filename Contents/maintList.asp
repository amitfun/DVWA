<html>
<head>

	<title>Maintenance Log</title>

	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script language="javascript1.1" src="UI_lib.js"></script>
	<script language="javascript1.1">
	  <!--

		function setActionType(type)
		{
			document.maintList.actionType.value = type;
		}

		function VerifyData()
		{
			return true;
		}

	  //-->
	</script>

</head>

<body topmargin=10 leftmargin=10 rightmargin=5 class=content>

		<br>
		<!-- *** maintenance list form ****************************************************** -->

		<form method="post" action="/goform/formMaintList" name=maintList onSubmit="return VerifyData();">

		<table width=700 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
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
									<input type=button value="&nbsp;&nbsp;<%DMTranslate("Help");%>&nbsp;&nbsp;" onClick="pageHelp( 'UPS+Maintenance+Log');">
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
							 			<td align=center valign=top>

												<table width=100% cellspacing=1 cellpadding=4 border="0" class=dialogCellLine>

													<tr class=dialogColHeader>
													  <td align=center><b>&nbsp;</b></td>
													  <td align=center><b><%DMTranslate("Date");%></b></td>
													  <td align=center><b><%DMTranslate("Performed By");%></b></td>
													  <td align=center><b><%DMTranslate("Work Type");%></b></td>
													  <td align=center><b><%DMTranslate("Status");%></b></td>
													  <% if ("true" == DMIsAdmin())
													  {
														  write( "<td align=center><b>");
														  DMTranslate("Delete");
														  write( "</b></td>");
													  }%>
													</tr>

													  <% if ("true" == DMIsAdmin())
													  {
														  DMPrintMaintLogs( -1,
															"<tr class=dialogLineItem>
															<td align=center><img src='/CImage/$1'></td>
															<td align=center>$2</td>
															<td align=center>$3</td>
															<td align=center><a href=maintAddEdit.asp?ID=$0>$4</a></td>
															<td align=center>$5</td>
															<td align=center ><input type=checkbox name=delete_$0 value=true></td>
															</tr>");
													  }
													  else
													  {
														  DMPrintMaintLogs( -1,
															"<tr class=dialogLineItem>
															<td align=center><img src='/CImage/$1'></td>
															<td align=center>$2</td>
															<td align=center>$3</td>
															<td align=center><a href=maintAddEdit.asp?ID=$0>$4</a></td>
															<td align=center>$5</td>
															</tr>");
													  }%>

												 </table>

											</td>
										</tr>

										<tr>
											<td align=center colspan=7>
												<input type=hidden name=actionType>
												<input type=button value="<%DMTranslate("Add New Record");%>" onClick="window.location = 'maintAddEdit.asp?ID=-1';">&nbsp;&nbsp;
												<% if ("true" == DMIsAdmin())
													  {
														  write( "<input type=submit value='");
														  DMTranslate("Delete Selected Records");
														  write( "' onClick='setActionType(2);'>&nbsp;&nbsp;");
													  }%>
												<input type=button value="<%DMTranslate("Print Records...");%>" onClick="window.location = 'maintPrint.asp';">
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


