<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>
	<% if (0 == TIME)
		TIME = DMGetTime();
	%>
	<style nolinkunderline>
		<!--
			A:link   { text-decoration: underline;}
			A:active { text-decoration: underline;}
			A:visited{ text-decoration: underline;}
		//-->
	</style>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   	<!--
   	function verifyClear()
   	{
   		return confirm("<% DMTranslate( "Please Confirm...Clear all log entries?");%>");
   	}

   	function refreshPage()
   	{
   		window.location = window.location;
   	}

	function doRequest(col, sortcol, sortord)
	{
		//sortord=1: ascending sortord=2: descending
		if ( col == sortcol && "1" ==  sortord )
		{
			top.main.window.location = "ups_eventLogs.asp?SORTCOL=" + col + "&SORTORD=2" + "&TIME=" + <%write(TIME);%> + "&PAGE=1&ITEMSPERPAGE=" + <%write(ITEMSPERPAGE);%>;
		}
		else
		{
			top.main.window.location = "ups_eventLogs.asp?SORTCOL=" + col + "&SORTORD=1" + "&TIME=" + <%write(TIME);%> + "&PAGE=1&ITEMSPERPAGE=" + <%write(ITEMSPERPAGE);%>;
		}
	}

	function doExport()
	{
		//generalDialog = openCenteredWindow('exportLogs.asp?logType=Event', 'exportEventLogs', 550, 225, '', 'true', '', 'opener');
		window.location = 'exportLogs.asp?logType=Event';
	}

   	//-->
   </script>

</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>


		<% DMPrintIfAdmin( "<form action=/goform/formPurgeEventLog name='eventlog' method=post onSubmit=\'return verifyClear();\'>"); %>


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
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "UPS Detailed"); %></td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'UPS Detailed Log')";>
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

								<table width=100% align=center cellspacing=1 cellpadding=2 border=0 class=dialogCellLine>
								  <tr class=dialogColHeader>
									<td align=center>
										<a style=nolinkunderline class=dialogColHeader href="javascript:doRequest('0', '<%write(SORTCOL);%>', '<%write(SORTORD);%>');"><b><% DMTranslate( "Severity"); %></b></a>
									</td>
									<td align=center>
										<a style=nolinkunderline class=dialogColHeader href="javascript:doRequest('1', '<%write(SORTCOL);%>', '<%write(SORTORD);%>');"><b><% DMTranslate( "Description"); %></b></a>
									</td>
									<td align=center>
										<a style=nolinkunderline class=dialogColHeader href="javascript:doRequest('2', '<%write(SORTCOL);%>', '<%write(SORTORD);%>');"><b><% DMTranslate( "Date"); %></b></a>
									</td>
									<td align=center>
										<a style=nolinkunderline class=dialogColHeader href="javascript:doRequest('2', '<%write(SORTCOL);%>', '<%write(SORTORD);%>');"><b><% DMTranslate( "Time"); %></b></a>
									</td>
								  </tr>

								  <!-- *** rows of various events *** -->

										<% DMPrintLastAlarms( TIME,
											"<tr class=dialogLineItem>
												<td align=center>
													<img src=\'../../CImage/icon_news$1.gif\'>
												</td>
												<td align=center>
													<a href=\'javascript:alarmHelp(\"$+0\");\'>
														$2
													</a>
												</td>
												<td align=center>
													$3
												</td>
												<td align=center>
													$6
												</td>
											</tr>"); %>
								</table>

							</td>
						 </tr>

						 <tr>
						 	<td align=center width=100%>
							<table>
							<tr>
						 	<td align=left nowrap>
						 		<% DMPrintIfAdmin( "<input type=submit style=\"font-size:8pt; color:black;;\" value=\'#Clear Logs#\' name=clearLogs>"); %>
							 <input type=button  style="font-size:8pt; color:black;;" value='<% DMTranslate( "Refresh Page"); %>' name=refresh onclick='top.main.window.location = "ups_eventLogs.asp?SORTCOL=" + <%write(SORTCOL);%> + "&SORTORD=" + <%write(SORTORD);%> + "&TIME=0" + "&PAGE=1&ITEMSPERPAGE=" + <%write(ITEMSPERPAGE);%>'>
							 <input type=button style="font-size:8pt; color:black;;" value='<%DMTranslate( "Export Logs"); %> ' name=export onClick="doExport();">
						 	</td>
						 	<td align=right width=100%>
							 <%
								pages = DMGetAlarmPageCount( TIME);
								if (1 != PAGE)
								{
								write( "<input type=button style='font-size:8pt; color:black;' value=");
								DMTranslate( "First");
								write( " onclick=top.main.window.location='ups_eventLogs.asp?SORTCOL=")
								write( SORTCOL);
								write( "&SORTORD=");
								write( SORTORD);
								write( "&TIME=");
								write( TIME);
								write( "&PAGE=1");
								write( "&ITEMSPERPAGE=");
								write( ITEMSPERPAGE);
								write( "';>");
								}
								if (PAGE > 10)
								{
								write( "<input type=button style='font-size:8pt; color:black;' value='<<'  onclick=top.main.window.location='ups_eventLogs.asp?SORTCOL=")
								write( SORTCOL);
								write( "&SORTORD=");
								write( SORTORD);
								write( "&TIME=");
								write( TIME);
								write( "&PAGE=");
								write( PAGE - 10);
								write( "&ITEMSPERPAGE=");
								write( ITEMSPERPAGE);
								write( "';>");
								}
								if (PAGE > 1)
								{
								write( "<input type=button style='font-size:8pt; color:black;' value=' < '  onclick=top.main.window.location='ups_eventLogs.asp?SORTCOL=")
								write( SORTCOL);
								write( "&SORTORD=");
								write( SORTORD);
								write( "&TIME=");
								write( TIME);
								write( "&PAGE=");
								write( PAGE - 1);
								write( "&ITEMSPERPAGE=");
								write( ITEMSPERPAGE);
								write( "';>");
								}
								if (PAGE < pages)
								{
								write( "<input type=button style='font-size:8pt; color:black;' value=' > '  onclick=top.main.window.location='ups_eventLogs.asp?SORTCOL=")
								write( SORTCOL);
								write( "&SORTORD=");
								write( SORTORD);
								write( "&TIME=");
								write( TIME);
								write( "&PAGE=");
								write( PAGE + 1);
								write( "&ITEMSPERPAGE=");
								write( ITEMSPERPAGE);
								write( "';>");
								}
								if (PAGE < (pages - 9))
								{
								write( "<input type=button style='font-size:8pt; color:black;' value='>>'  onclick=top.main.window.location='ups_eventLogs.asp?SORTCOL=")
								write( SORTCOL);
								write( "&SORTORD=");
								write( SORTORD);
								write( "&TIME=");
								write( TIME);
								write( "&PAGE=");
								write( PAGE + 10);
								write( "&ITEMSPERPAGE=");
								write( ITEMSPERPAGE);
								write( "';>");
								}
								if (PAGE < pages)
								{
								write( "<input type=button style='font-size:8pt; color:black;' value='");
								DMTranslate( "Last");
								write( "'  onclick=top.main.window.location='ups_eventLogs.asp?SORTCOL=")
								write( SORTCOL);
								write( "&SORTORD=");
								write( SORTORD);
								write( "&TIME=");
								write( TIME);
								write( "&PAGE=");
								write( pages);
								write( "&ITEMSPERPAGE=");
								write( ITEMSPERPAGE);
								write( "';>");
								}
							 %>
						 	</td>
							</tr>
							</table>
						 </tr>

					 	  <tr>
					 		 <td>

								<table width=500 align=center cellspacing=0 cellpadding=0 border=0>
								  <tr>
									 <td valign=center><img src='../../CImage/icon_newsCritical.gif'>&nbsp;&nbsp;</td>
									 <td align=left width=25%><% DMTranslate( "Critical"); %></td>
									 <td valign=center><img src='../../CImage/icon_newsWarning.gif'>&nbsp;&nbsp;</td>
									 <td align=left width=25%><% DMTranslate( "Warning"); %></td>
									 <td valign=center><img src='../../CImage/icon_newsInformation.gif'>&nbsp;&nbsp;</td>
									 <td align=left width=25%><% DMTranslate( "Information"); %></td>
									 <td valign=center><img src='../../CImage/icon_newsGood.gif'>&nbsp;&nbsp;</td>
									 <td align=left width=25%><% DMTranslate( "Cleared"); %></td>
								  </tr>
								</table>

<!--
								<table width=400 align=center cellspacing=0 cellpadding=0 border=0>
								  <tr>
									 <td align=center colspan=4><hr size=1 noshade></td>
								  </tr>
								  <tr>
									 <td align=center width=25%><img src='../../CImage/icon_newsCritical.gif'>&nbsp;&nbsp;<% DMTranslate( "Critical"); %></td>
									 <td align=center width=25%><img src='../../CImage/icon_newsWarning.gif'>&nbsp;&nbsp;<% DMTranslate( "Warning"); %></td>
									 <td align=center width=25%><img src='../../CImage/icon_newsInformation.gif'>&nbsp;&nbsp;<% DMTranslate( "Information"); %></td>
									 <td align=center width=25%><img src='../../CImage/icon_newsGood.gif'>&nbsp;&nbsp;<% DMTranslate( "Cleared"); %></td>
								  </tr>
								</table>

-->

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

	</center>

</body>
</html>




