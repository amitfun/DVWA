<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script language="javascript1.1" src="../UI_lib.js"></script>

	<script language="javascript1.1">
   	<!--
			function refreshPage()
   			{
   				window.location = window.location;
   			}


	//-->
	</script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

		<!-- *** news and announcements form ****************************************************** -->

	<center>
	<table width=650 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
	  <tr>
		 <td valign=top>

			<!-- *** begin dialog box *** -->

			<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				<!-- *** header bar *** -->
				<tr>
				<td>
					<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
						<tr>
							<td align=left class=dialogHeader>
								<p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Attached Devices"); %>
							</td>
							<td align=right class=dialogHeader>
								<input type=button value="<% DMTranslate( "Add New Device"); %>" onclick="window.location = 'edit_device.asp?Device=-1&CallingPage=Device';">
								<input type=button  style="font-size:8pt; color:black;;" value='<% DMTranslate( "Refresh Page"); %>' name=refresh onclick='refreshPage();'>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Attached+Device')";>
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

   								<%
								if ("true" == DMIsUPSVariableSupported( "Run Time Remaining"))
								{
									write( '<table width=40% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>');
									write( '<tr class=dialogLineItem>');
									write( '<td align=center>');
									write('<b>');
									DMTranslate("UPS Runtime:")
									write('&nbsp;');
									write(DMGetUPSVariableSupported( "0","Run Time Remaining"));
									write('&nbsp;');
									DMTranslate("Min")
									write( '</b>');
									write( '</td>');
									write( '</tr>');
									write('</table>');
									write('<br>');
								}
								%>

								<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
									<tr class=dialogColHeader>
										<%
										if ("true" == DMIsUPSVariableSupported( "Output Source"))
										{
											write( "<td align=center width=5% rowspan=2><img src=\"../Images/");
											if ("None" == DMGetUPSVariable( "Output Source"))
												write( "btn_red.gif");
											else
												write( "btn_green.gif");
											write( "\"></td><td align=center width=35% rowspan=2><b>");
										}
										else
											write( "<td align=center colspan=2 width=40% rowspan=2><b>");
										if ( "1" == DMGetLoadSegmentSupport())
											DMTranslate( "Unswitched Outlets");
										else
											DMTranslate( "Entire UPS");
										write( "</b></td>");

										if ( "2" != DMGetLoadSegmentSupport())
										{
											write( "<td align=center rowspan=2 width=10%% >");
											DMTranslate( "Command Procedure");
											write( "</td><td align=center colspan=2>");
											DMTranslate( "Estimated Time Required To");
											write( "</td><td align=center rowspan=2>");
											DMTranslate( "Total Time");
											write( "</td></tr><tr class=dialogColHeader><td align=center>");
											DMTranslate( "Execute Command");
											write( "</td><td align=center>");
											DMTranslate( "Shut Down OS");
											write( "</td></tr>");
											DMPrintAttachedDevices( 0, "
												<tr class=dialogLineItem>
												<td align=center>
													<img border=0 src=\"$9\" width=13 alt=\"$10\">
												</td>
												<td align=center><a href=\"edit_device.asp?Device=$0&CallingPage=Device\">$1</a></td>
												<td align=center>$5?<img src=../../CImage/enabled.gif>??</td>
												<td align=center>$7 #Min#</td>
												<td align=center>$6 #Min#</td>
												<td align=center>$8 #Min#</td>
												</tr>");
											write( "<tr class=dialogLineItem>");
										}
										if ("true" == DMIsRestartSupported( 0) && "1" != DMGetLoadSegmentSupport())
										{
											write( "<td align=right colspan=2><input type=button value=\"");
											DMTranslate( "Cycle");
											write("\" onclick=\"if (confirm('");
											DMTranslate( "Please Confirm...Cycle Device?");
											write("')) window.location = '/goforms/formSegmentControl?Type=Restart&Segment=" + 0 +"';\"></td>");
											write( "<td align=right colspan=3>");
										}
										else
											write( "<td align=right colspan=5>");
										%>
									 <b><% DMTranslate( "Total time to shut down Entire UPS:"); %></b></td>
									 <td align=center><% DMPrintShutdownTime( 0); %> <% DMTranslate( "Min"); %></b></td>
									</tr>
								</table>
							</td>
							</tr>
								<%
									count = DMGetUPSVariableSupported( "0", "Load Segment Count");
									for (i = 1; i <= count; i++)
									{
										write( "<tr><td><table width=100%% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
												<tr class=dialogColHeader>");
										if ("true" == DMIsUPSVariableSupported( "Load Segment Output Source"))
										{
											write( "<td align=center width=5% rowspan=2><img src=\"../Images/");
											if ("None" == DMGetUPSVariable( "Load Segment Output Source", i - 1))
												write( "btn_red.gif");
											else
												write( "btn_green.gif");
											write( "\"></td><td align=center width=35% rowspan=2><b>");
										}
										else
											write( "<td align=center colspan=2 width=40% rowspan=2><b>");
										DMTranslate( "Load");
										write( " " + i + "</b></td><td align=center rowspan=2 width=10%% >");
										DMTranslate( "Command Procedure");
										write( "</td><td align=center colspan=2>");
										DMTranslate( "Estimated Time Required To");
										write( "</td><td align=center rowspan=2>");
										DMTranslate( "Total Time");
										write ( "</td></tr><tr class=dialogColHeader><td align=center>");
										DMTranslate( "Execute Command");
										write ( "</td><td align=center>");
										DMTranslate( "Shut Down OS");
										write ( "</td></tr>");
										DMPrintAttachedDevices( i, "
											<tr class=dialogLineItem>
											<td align=center>
												<img border=0 src=\"$9\" width=13 alt=\"$10\">
											</td>
											<td align=center><a href=\"edit_device.asp?Device=$0&CallingPage=Device\">$1</a></td>
											<td align=center>$5?<img src=../../CImage/enabled.gif>??</td>
											<td align=center>$7 #Min#</td>
											<td align=center>$6 #Min#</td>
											<td align=center>$8 #Min#</td>
											</tr>
											");
										write( "<tr class=dialogLineItem>");
										if (("true" == DMIsShutdownSupported( i) ||
											"true" == DMIsStartupSupported( i) ||
											"true" == DMIsRestartSupported( i)))

										{
											write( "<td align=right colspan=2>");
											if ("true" == DMIsShutdownSupported( i) &&
												"false" == DMSegmentContainsLocalServer( i))
											{
												write( "<input type=button value=\"");
												DMTranslate( "Off");
												if ("None" == DMGetUPSVariable( "Load Segment Output Source", i - 1))
												{
													write("\" disabled onclick=\"if (confirm('");
												}
												else
												{
													write("\" onclick=\"if (confirm('");
												}
												DMTranslate( "Please Confirm...Power Off Device?");
												write("')) window.location = '/goforms/formSegmentControl?Type=Shutdown&Segment=" + i +"';\">");
											}
											if ("true" == DMIsStartupSupported( i) &&
												"false" == DMSegmentContainsLocalServer( i))
											{
												write( "<input type=button value=\"");
												DMTranslate( "On");
												if ("None" == DMGetUPSVariable( "Load Segment Output Source", i - 1))
												{
													write("\" onclick=\"window.location = '/goforms/formSegmentControl?Type=Startup&Segment=" + i +"';\">");
												}
												else
												{
													write("\" disabled onclick=\"window.location = '/goforms/formSegmentControl?Type=Startup&Segment=" + i +"';\">");
												}
											}
											if ("true" == DMIsRestartSupported( i))
											{
												write( "<input type=button value=\"");
												DMTranslate( "Cycle");
												write("\" onclick=\"if (confirm('");
												DMTranslate( "Please Confirm...Cycle Device?");
												write("')) window.location = '/goforms/formSegmentControl?Type=Restart&Segment=" + i +"';\">");
											}
											write( "</td><td align=right colspan=3><b>");
										}
										else
											write( "<td align=right colspan=5><b>");
										DMTranslate( "Total time to shut down Load Segment");
										write( " " + i + ":</b></td><td align=center colspan=4><b>");
										DMPrintShutdownTime( i);
										write( " ")
										DMTranslate( "Min");
										write( "</b></td></tr></table></td></tr>");
									}
								%>
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





