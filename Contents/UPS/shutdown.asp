<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<%
		count = DMGetUPSVariableSupported( "0", "Load Segment Count");
		lss = DMGetLoadSegmentSupport();
		msload = 0;
		if ("2" == lss)
		{
			for (i = 1; i <= count; i++)
			{
				if ("true" == DMSegmentContainsLocalServer( i))
				{
					msload = i;
				}
			}
		}
		countsd = 0;
		for (i = 0; i <= count; i++)
		{
			if ("true" == DMIsShutdownSupported( i))
				countsd++;
		}
		restart = 0;
		if ("true" == DMIsUPSVariableSupported( "Load Segment Restart Time"))
			restart = 1;
	%>
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>
	<script language="javascript1.1" src="../UI_lib.js"></script>
	<script language="javascript1.1">
		<!--
			function refreshPage()
   			{
   				window.location = window.location;
   			}

			function minUPS()
			{
				minups = 0;
				<%
					for (i = 1; i <= count; i++)
					{
						if ("true" == DMIsShutdownSupported( i) &&
							"false" == DMSegmentContainsLocalServer( i))
						{
							write( "if (document.theForm.Type_" + i + "[0].checked)\n");
							if ("2" == lss)
							{
								write( "minups = max( minups, Number(document.theForm.Delay_" + i + ".value) + ");
									DMPrintCommandTime( i);
							}
							else
							{
								write( "minups = max( minups, Number(document.theForm.Delay_" + i + ".value) + ");
									DMPrintShutdownTime( i);
							}
							write( ");\n");
						}
					}

					if ("2" == lss)
					{
						write( "minups = max( minups, ");
						DMPrintCommandTime( msload);
						write( ");");
						write( "return minups - ");
						DMPrintCommandTime( msload);
						write( ";");
					}
					else
					{
						write( "minups = max( minups, ");
						DMPrintShutdownTime( msload);
						write( ");");
						write( "return minups - ");
						DMPrintShutdownTime( msload);
						write( ";");
					}
				%>
			}

			function doAdvanced()
			{
				var thisPlatform = navigator.platform.substring( 0, 5 );

				if( thisPlatform == "HP-UX" )
				{
					openCenteredWindow2( 'advshut.asp', 'Advanced', 400, 390, '', '', 'opener');
				}
				else
				{
					openCenteredWindow2( 'advshut.asp', 'Advanced', 400, 310, '', '', 'opener');

				}
			}

			function fixUPSDelay()
			{
				<% write( "timeups = Number(document.theForm.Delay_" + msload + ".value);"); %>
				minups = Number( minUPS());
				if (timeups < minups)
					<% write( "document.theForm.Delay_" + msload + ".value = minups;"); %>
			}

			function checkSettings()
			{
				<% write( "timeups = Number(document.theForm.Delay_" + msload + ".value);"); %>
				minups = Number( minUPS());
				if (timeups < minups)
				{
					if (document.theForm.MSType[0].checked)
					{
						if ("1" == "<% write( lss); %>")
							alert( '<% DMTranslate( "Changing Unswitched Outlets delay to minimum value: "); %>' + minups + '.');
						if ("2" == "<% write( lss); %>")
							alert( '<% DMTranslate( "Changing Management Server Load Segment delay to minimum value: "); %>' + minups + '.');
						else
							alert( '<% DMTranslate( "Changing Entire UPS delay to minimum value: "); %>' + minups + '.');
						fixUPSDelay();
					}
				}

				return true;
			}

			function Relink()
			{
				top.left.location="../menu.asp?id=4";
				top.main.location="devices.asp";
			}
   		//-->
	</script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

		<br>
		<form method="post" action="/goform/formShutdownSequence" name=theForm onSubmit='return checkSettings();'>

		<center>
		<table width=650 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
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
									<% DMTranslate( "Power Fail Settings"); %>
								</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Power+Fail')";>
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
													<%
														if (countsd > 1)
														{
															write( "<td colspan=2 width=10%% align=center><b>");
															DMTranslate( "Attached Devices");
														}
														else
														{
															write( "<td rowspan=2 width=10%% align=center><b>");
															DMTranslate( "Attached Devices");
														}
														write( "</b></td>");
													%>

													<% if ("1" == lss && restart)
															write( "<td align=center colspan=5><b>");
														else
															write( "<td align=center colspan=4><b>");

														DMTranslate( "Shutdown Settings");
													%>
													</b></td>
													<%
													if ("2" == lss && restart)
														{
															write( "<td align=center><b>");
															DMTranslate( "Restart Settings");
															write( "</b></td>");
														}
													%>
											  </tr>
											  <tr class=dialogColHeader>
													<%
														if (countsd > 1)
														{
															write( "<td width=5%% nowrap align=center><b>");
															DMTranslate( "Load");
															write( "</b></td>");
															write( "<td width=5%% align=center><b>");
															DMTranslate( "Devices");
															write( "</b></td>");
														}
													%>
												<td align=center colspan=2><b>
													<% DMTranslate( "Conserve Battery Power"); %>
												</b></td>
												<td align=center><b>
													<% DMTranslate( "Maximize Runtime"); %>
												</b></td>
												<% if ("1" == lss && restart)
														write( "<td align=center colspan=2><b>");
													else
														write( "<td align=center><b>");
													DMTranslate( "Advanced");
												%>

												</b></td>
												<%
												if ("2" == lss && restart)
													{
														write( "<td width=8% align=center rowspan=2>");
														DMTranslate( "Delay<br>(Seconds)");
														write( "</td>");
													}
												%>
											  </tr>

											<tr class=dialogLineItem>
												<%
													cs1 = 2;
													if (countsd > 1)
													{
														cs1 = 3;
														write( "<td align=center nowrap rowspan=2>");
														if ( "1" == lss)
															DMTranslate( "Unswitched<br />Outlets");
														else if ("2" == lss)
														{
															DMTranslate( "Load");
															write( " " + msload);
														}
														else
															DMTranslate( "Entire UPS");
														write( "</td>");
													}
												%>

												<td align=left rowspan=2><% DMPrintAttachedDevices( msload, "<img border=0 src=\"$9\" width=13 alt=\"$10\">&nbsp;<a href=edit_device.asp?Device=$0&CallingPage=PowerFail>$1</a><br>"); %></td>

												<td align=center width=8%>
													<% DMTranslate( "Shutdown Delay<br>(Minutes)"); %>
												</td>
												<td align=center>
													<% DMTranslate( "Required OS Shutdown Time<br>(After Delay)"); %>
												</td>
												<td align=center>
													<% DMTranslate( "Run Until Battery Depletion"); %>
												</td>
												<% if ("1" == lss && restart)
														write( "<td align=center colspan=2><b>");
													else
														write( "<td align=center>");
												%>
														<input type=button  style="font-size:8pt; color:black;;"
															value='<% DMTranslate( "Settings..."); %>' name=refresh onclick='doAdvanced();'>
												</td>
											  </tr>

											<tr class=dialogLineItem>

												<td align=center nowrap><input type=radio name=MSType value=Delay<%
													if ("Delay" == DMGetIniString( "Shutdown", "Type", "Advanced"))
														write( " checked");
													%>><input type=text maxlength=3 size=5 name=Delay_<% write( msload); %> value=<% DMPrintIniString( "Shutdown", "Load_" + msload + "_Delay", "5"); %>></td>
												<td align=center ><a href=devices.asp onClick="Relink();"><% if ("2" == lss) { DMPrintShutdownTime( msload); } else { DMPrintShutdownTime( 0); } %> <% DMTranslate( "Min"); %></a></td>

												<td align=center nowrap><input type=radio name=MSType value=Runtime<%
													if ("Runtime" == DMGetIniString( "Shutdown", "Type", "Advanced"))
														write( " checked");
													%>></td>
												<% if ("1" == lss && restart)
														write( "<td align=center colspan=2>");
													else
														write( "<td align=center>");
												%>
												<input type=radio name=MSType value=Advanced<%
													if ("Advanced" == DMGetIniString( "Shutdown", "Type", "Advanced"))
														write( " checked");
													%>></td>
												<%
													if ("2" == lss && restart)
													{
														write( "<td align=center><input type=text maxlength=5 size=5 name=Load_Segment_Restart_Time_" + (msload - 1) + " value=");
														DMPrintUPSVariable( "Load Segment Restart Time", msload - 1);
														write( "></td>");
													}
												%>
											</tr>

											<%
												if (countsd > 1)
												{
													write ("<tr class=dialogBackground><td colspan=7>&nbsp;</td></tr><tr class=dialogColHeader><td colspan=2 width=10%% align=center><b>");
													DMTranslate( "Attached Devices");
													write( "</b></td><td align=center colspan=4><b>");
													DMTranslate( "Shutdown Settings");
													write( "</b></td>");
													if ("0" != lss && restart)
													{
														write( "<td align=center><b>");
														DMTranslate( "Restart Settings");
														write( "</b></td>");
													}
													write ("</tr><tr class=dialogColHeader><td align=center><b>");
													DMTranslate( "Load");
													write( "</b></td><td align=center><b>");
													DMTranslate( "Devices");
													write( "</b></td><td align=center colspan=2><b>");
													DMTranslate( "Shed Load");
													write( "</b></td><td align=center colspan=2><b>");
													DMTranslate( "Maximize Runtime");
													write( "</b></td>");
													if (restart)
													{
														write( "<td align=center rowspan=2>");
														DMTranslate( "Delay<br>(Seconds)");
														write( "</td>");
													}

													row = 0;
													for (i = 1; i <= count; i++)
													{
														if ("2" != lss || i != msload)
														{
															if ("true" == DMIsShutdownSupported( i))
															{
																write( "<tr class=dialogLineItem>");
																if (countsd > 1)
																{
																	if (row == 0)
																		write( "<td align=center rowspan=2>");
																	else
																		write( "<td align=center>");
																	DMTranslate( "Load");
																	write( " " + i + "</td>");
																}
																if (row == 0)
																	write( "<td align=left rowspan=2>");
																else
																	write( "<td align=left>");
																DMPrintAttachedDevices( i, "<img border=0 src=\"$9\" alt=\"$10\">&nbsp;<a href=edit_device.asp?Device=$0&CallingPage=PowerFail>$1</a><br>");
																write( "</td>");
																if (row == 0)
																{
																	write ("<td align=center nowrap>");
																	DMTranslate( "Shutdown Delay<br>(Minutes)");
																	write ("</td><td align=center>");
																	DMTranslate( "Required OS Shutdown Time<br>(After Delay)");
																	write ("</td><td align=center colspan=2>");
																	DMTranslate( "Shutdown With Management Server");
																	write ("</td></tr><tr class=dialogLineItem>");
																}
																row = 1;
																initype = "Load_" + i + "_Type";
																inidelay = "Load_" + i + "_Delay";
																write( "<td align=center>");
																write( "<input type=radio name=Type_" + i + " value=Delay");
																if ("true" == DMSegmentContainsStorageDevice( i))
																	write( " disabled");
																else if ("Delay" == DMGetIniString( "Shutdown", initype, "None"))
																	write( " checked");
																write( "><input type=text maxlength=3 size=5 name=Delay_" + i + " value=");
																DMPrintIniString( "Shutdown", inidelay, "5");
																if ("true" == DMSegmentContainsStorageDevice( i))
																	write( " disabled");
																write( " onChange='fixUPSDelay();'>");
																write( "</td>");
																write( "<td align=center><a href=devices.asp onClick=\"Relink();\">");
																DMPrintShutdownTime( i);
																write( " ");
																DMTranslate( "Min");
																write( "</a></td>");
																write( "<td align=center colspan=2>");
																write( "<input type=radio name=Type_" + i + " value=None");
																if ("None" == DMGetIniString( "Shutdown", initype, "None"))
																	write( " checked");
																else if ("true" == DMSegmentContainsStorageDevice( i))
																	write( " checked");
																write( "></td>");
																if (restart)
																{
																	write( "<td align=center><input type=text maxlength=5 size=5 name=Load_Segment_Restart_Time_" + (i - 1) + " value=");
																	DMPrintUPSVariable( "Load Segment Restart Time", i - 1);
																	write( "></td>");
																}
																write( "</tr>");
															}
														}
													}
												}
											%>
										</table>
									</td>
								  </tr>
								  <tr>
									 <td colspan=6 align=center>
										<input type=submit value="<% DMTranslate( "Save Changes"); %>">
										<input type=button  style="font-size:8pt; color:black;;" value='<% DMTranslate( "Refresh Page"); %>' name=refresh onclick='refreshPage();'>
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

