<html>
<head>
	<title><% DMPrintAppName(); %></title>

	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">

	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>

   <script language="javascript1.1" src="pickdate.js"></script>
   <script language="javascript1.1" src="UI_lib.js"></script>
   <script language="javascript1.1">
   <!--
		function closeExportWin()
		{
			//if (document.ExportForm.LogType.value == "Application")
				window.location = 'ApplicationLogs.asp?SORTCOL=2&SORTORD=2';
			//else
				//window.location = 'maintList.asp';
		}

		function verifyData()
		{
			var iChars = "!@#$%^&*()+=-[]\\\';,/{}|\":<>?";

			if (document.ExportForm.actionType.value == 1 || document.ExportForm.actionType.value == "1;")
			{

				for (var i = 0; i < document.ExportForm.fileName.value.length; i++) 
				{
				  	if (iChars.indexOf(document.ExportForm.fileName.value.charAt(i)) != -1) 
					{
					  	alert ("Invalid File Name.");
					  	return false;
				  	}
				}
			}
			
			if (document.ExportForm.startDate.value == "")
			{
				alert( '<%DMTranslate("Entry Error...\\n\\nPlease enter a Start Date for the Data Log Export."); %> ');
				return false;
			}
			else if (document.ExportForm.endDate.value == "")
			{
				alert( '<%DMTranslate("Entry Error...\\n\\nPlease enter an End Date for the Data Log Export."); %> ');
				return false;
			}
			else if ((document.ExportForm.actionType.value == 1 || document.ExportForm.actionType.value == "1;") && document.ExportForm.fileName.value == "")
			{
				alert( '<%DMTranslate("Entry Error...\\n\\nPlease enter a File Name for the Data Log Export."); %> ');
				document.ExportForm.fileName.focus();
				return false;
			}
			else
			{
				beginOn = document.ExportForm.startDate.value;
				imonthdaysep = 0;
				idayyearsep = 0;

				imonthdaysep = beginOn.indexOf("/");
				beginOn = beginOn.substring(imonthdaysep + 1);
				idayyearsep = beginOn.indexOf("/");
				idayyearsep = idayyearsep + imonthdaysep + 1;

				beginOn = document.ExportForm.startDate.value;

				document.ExportForm.bMonth.value = beginOn.substring(0,imonthdaysep);
				document.ExportForm.bDay.value = beginOn.substring(imonthdaysep+1,idayyearsep);
				document.ExportForm.bYear.value = beginOn.substring(idayyearsep+1,beginOn.length);

				endOn = document.ExportForm.endDate.value;

				imonthdaysep = endOn.indexOf("/");
				beginOn = endOn.substring(imonthdaysep + 1);
				idayyearsep = endOn.indexOf("/");
				idayyearsep = idayyearsep + imonthdaysep + 1;

				endOn = document.ExportForm.endDate.value;

				document.ExportForm.eMonth.value = endOn.substring(0,imonthdaysep);
				document.ExportForm.eDay.value = endOn.substring(imonthdaysep+1,idayyearsep);
				document.ExportForm.eYear.value = endOn.substring(idayyearsep+1,endOn.length);

				if (document.ExportForm.bYear.value > document.ExportForm.eYear.value)
				{
					alert( '<%DMTranslate("Entry Error...\\n\\nThe starting date must be either before or the same as the end date."); %> ');
					return false;
				}
				else if (document.ExportForm.bYear.value == document.ExportForm.eYear.value)
				{
					if (document.ExportForm.bMonth.value > document.ExportForm.eMonth.value)
					{
						alert( '<%DMTranslate("Entry Error...\\n\\nThe starting date must be either before or the same as the end date."); %> ');
						return false;
					}
					else if (document.ExportForm.bMonth.value == document.ExportForm.eMonth.value)
					{
						if (document.ExportForm.bDay.value > document.ExportForm.eDay.value)
						{
							alert( '<%DMTranslate("Entry Error...\\n\\nThe starting date must be either before or the same as the end date."); %> ');
							return false;
						}
					}
				}


				return true;
			}
			return false; //just in case
		}

		function doActive(selection)
		{
			switch (selection)
			{
				case 1: document.ExportForm.fileName.disabled = false;
						document.ExportForm.actionType.value = 1;
				break;

				case 2: document.ExportForm.fileName.disabled = true;
						document.ExportForm.actionType.value = 2;
				break;

				default:
				break;
			}
		}

	//-->
	</script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

	<!-- *** identification page ****************************************************** -->
<form method=post action='/goform/formExportDataLogs' name=ExportForm onSubmit="return verifyData();">
	<center>
	<table width=550 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
	  <tr>
		 <td valign=top>

			<!-- *** begin dialog box *** -->

			<table width=100% align=center cellspacing=0 cellpadding=0 bordercolor="#000000" border=0>

			  <!-- *** header bar *** -->
			  <tr>
				<td>
					<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
						<tr>
							<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><%DMTranslate(logType);%>&nbsp;<% DMTranslate( "Log Export"); %>
							</td>
							<td align=right class=dialogHeader><p style="padding:0px 5px 0px 5px;;">
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Export+<%write(logType);%>+Logs');">
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
										<table width=100% border=0 cellspacing=1 cellpadding=5 class=dialogCellLine>
											<tr class=dialogLineItem>
												<td align=center>
													<%DMTranslate( "Export data from");%>&nbsp;
													<input type=text name=startDate maxLength=19 size=15 disabled>
													<a href="javascript:show_calendar('ExportForm.startDate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
														<img src="Images/mini_cal.gif" width=21 height=17 border=0></a>
													&nbsp;<%DMTranslate( "to");%>&nbsp;
													<input type=text name=endDate maxLength=19 size=15 disabled>
													<a href="javascript:show_calendar('ExportForm.endDate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
														<img src="Images/mini_cal.gif" width=21 height=17 border=0></a>
													<br>
													<i><%DMTranslate("(Please select start and end dates with the provided calendars.)");%></i>
												</td>
											</tr>

											<tr class=dialogLineItem>
												<td align=center>
													<%DMTranslate( "Data Format:");%>&nbsp;
													<input type=radio name=dataFormat value=comma checked><%DMTranslate( "Comma-Separated");%>&nbsp;&nbsp;
													<input type=radio name=dataFormat value=tab><%DMTranslate( "Tab Delimited");%>
												</td>
											</tr>

											<tr class=dialogLineItem>
												<td align=center>
													<input type=radio name=exportto value=file onclick="doActive(1);" checked><%DMTranslate( "Save to File");%>&nbsp;&nbsp;
													<input type=text name=fileName value="logs.txt" maxLength=50 size=20>
													<img src='/CImage/blank.gif' width=5 height=1><input type=radio name=exportto value=browserwin onclick="doActive(2);"><%DMTranslate( "Download Document");%><br>
													<i><%DMTranslate("(Note: When saving to a file, the file will be saved to the Management Server)");%></i><br>
												</td>
											</tr>
										</table>
									</td>
							 	</tr>
								<tr class=dialogColHeader>
									<td align=center>
										<input type=hidden name=bMonth>
										<input type=hidden name=bDay>
										<input type=hidden name=bYear>
										<input type=hidden name=eMonth>
										<input type=hidden name=eDay>
										<input type=hidden name=eYear>
										<input type=hidden name=LogType value=<%write(logType);%>>
										<input type=hidden name=actionType value=1;>
										<input type=submit value="<% DMTranslate( "Do Export"); %>">
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

