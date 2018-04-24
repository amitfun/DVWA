<html>
<head>

	<title>Maintenance Record</title>

	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script language="javascript1.1" src="UI_lib.js"></script>
	<script language="javascript1.1" src="pickdate.js"></script>
	<script language="javascript1.1">
	  <!--

		function CurDate1()
		{
			if (-1 == <% write( ID); %>)
			{
				dt = new Date;
			 	var yy = dt.getYear();
				var year = (yy < 1000) ? new Number(yy + 1900) : yy;
				document.maintFormAddEdit.Date.value =
					dt.getMonth() + 1 + "/" +
					dt.getDate() + "/" +
					year;
			}
		}

		function CurDate2()
		{
			dt = new Date;
			var yy = dt.getYear();
			var year = (yy < 1000) ? new Number(yy + 1900) : yy;
			document.maintFormAddEdit.Date.value =
				dt.getMonth() + 1 + "/" +
				dt.getDate() + "/" +
				year;
		}

		function setActionType(type)
		{
			document.maintFormAddEdit.actionType.value = type;
		}

		function VerifyData()
		{
			if (document.maintFormAddEdit.Date.value == "")
			{
				alert( '<%DMTranslate("Entry Error: Please enter a Date."); %> ');
				return false;
			}
			else
			{
				document.maintFormAddEdit.hDate.value = document.maintFormAddEdit.Date.value;
				return true;
			}
		}

	  //-->
	</script>

</head>

<body topmargin=10 leftmargin=10 rightmargin=5 class=content onLoad='CurDate1()'>
<br>
	<!-- *** ups maintenance form ****************************************************** -->
	<form method="post" action="/goform/formMaintList" name=maintFormAddEdit onSubmit="return VerifyData();">
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
											<% if (-1 == ID) DMTranslate( "Add Maintenance Record"); else DMTranslate( "Add/Edit Maintenance Record"); %>
										</td>
										<td align=right class=dialogHeader><p style="padding:0px 5x 0px 5px;;">
											<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help");%>&nbsp;&nbsp;" onClick="pageHelp( 'Add Maintenance Record');">
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
																<td align=center><b><% DMTranslate( "Date");%></b></td>
																<td align=center><b><% DMTranslate( "Performed By");%></b></td>
																<td align=center><b><% DMTranslate( "Work Type");%></b></td>
																<td align=center><b><% DMTranslate( "Complete");%></b></td>
															</tr>

<%
if (-1 == ID)
{
write( "
															<tr class=dialogLineItem>
																<td align=center>
																	<input type=text name=Date maxLength=19 size=15 disabled>
																	<a href=\"javascript:show_calendar('maintFormAddEdit.Date');\" onmouseover=\"window.status='Date Picker';return true;\" onmouseout=\"window.status='';return true;\">
																	<img src=\"Images/mini_cal.gif\" width=21 height=17 border=0></a>
																</td>
																<td align=center ><input type=text name=completeBy size=25 maxlength=50></td>
																<td align=center ><select name=workType>
");
																	DMPrintIniArray( "Maint", "Type_List", "<option>$0");
write( "
																	</select>
																</td>
																<td align=center ><input type=checkbox name=complete value=true onClick=\"CurDate2();\"></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<table width=100% cellspacing=5 cellpadding=0 border=0>
												<tr>
													<td align=center valign=top>
														<table width=100% cellspacing=1 cellpadding=4 border=0 class=dialogCellLine>
															<tr class=dialogColHeader>
																<td align=center colspan=4><b>");
																	DMTranslate( "Notes / Comments / Work Description
");
write( "
																	</b>
																</td>
															</tr>
															<tr class=dialogLineItem>
																<td align=center colspan=4><textarea name=notes cols=80 rows=4 size=254></textarea></td>
");
}
else
{
DMPrintMaintLogs( ID, "
															<tr class=dialogLineItem>
																<td align=center>
																	<input type=text name=Date value='$2' maxLength=19 size=15 disabled>
																	<a href=\"javascript:show_calendar('maintFormAddEdit.Date');\" onmouseover=\"window.status='Date Picker';return true;\" onmouseout=\"window.status='';return true;\">
																	<img src=\"Images/mini_cal.gif\" width=21 height=17 border=0></a>
																</td>
																<td align=center ><input type=text name=completeBy value='$3' size=25 maxlength=50></td>
																<td align=center ><select name=workType value='$4'>
");
																	DMPrintMaintLogTypes( ID, "<option>$0", "<option selected>$0");
DMPrintMaintLogs( ID, "
																	</select>
																</td>
																<td align=center ><input type=checkbox name=complete value=true onClick=\"CurDate2();\" $7?checked??></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<table width=100% cellspacing=5 cellpadding=0 border=0>
												<tr>
													<td align=center valign=top>
														<table width=100% cellspacing=1 cellpadding=4 border=0 class=dialogCellLine>
															<tr class=dialogColHeader>
																<td align=center colspan=4><b>#Notes / Comments / Work Description#</b></td>
															</tr>
															<tr class=dialogLineItem>
																<td align=center colspan=4><textarea name=notes cols=80 rows=4 size=254>$6</textarea></td>
");
}
%>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td align=center colspan=4>
											<input type=hidden name=actionType>
											<input type=hidden name=hDate>
											<input type=hidden name=ID value=<% write( ID); %>>
											<input type=submit value="<% DMTranslate( "Save Changes");%>" onClick="setActionType(1);">&nbsp;&nbsp;
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


