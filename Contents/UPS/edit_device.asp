<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script language="javascript1.1" src="../UI_lib.js"></script>
	<script language=javascript1.1>
   		<!--
			function checkSettings()
			{
				var devtype = 0;

				<% if (-1 == Device)
				{
					write("
						devtype = Number( document.theForm.DevType.options[document.theForm.DevType.selectedIndex].value);
					");
				}
				else
				{
					if ('Management Server' != DMGetAttachedDevice( Device, 2)  && 'Local Server' != DMGetAttachedDevice( Device, 2))
					{
						write("
							devtype = Number( document.theForm.DevType.options[document.theForm.DevType.selectedIndex].value);
						");
					}
					else
					{
						write("
							devtype=document.theForm.DevType.value;
						");
					}
				}
				%>

				if ("" == document.theForm.DevName.value)
				{
					alert( '<% DMTranslate( "Entry Error... \\n\\nDevice Description must not be empty."); %>');
					return false;
				}
				if (1 == devtype)
				{
					if ("" == document.theForm.Hostname.value)
					{
						alert( '<% DMTranslate( "Entry Error... \\n\\nHost Name must not be empty."); %>');
						return false;
					}
				}

				<%	if ("true" == DMIsUPSVariableSupported( "Maximum Shutdown Delay"))
				{
					if ("true" != DMIsContactClosure())
					{
						write( "if (3 != devtype)
						{
							time = Number( document.theForm.ShutdownOS.value) +
									Number( document.theForm.Execute.value);
							maxtime = 999999 / 60;
							if (time > maxtime)
							{
								alert( '");
								DMTranslate( "Entry Error... \\n\\nTotal time (Shutdown OS + Execute Command) cannot exceed ");
								write( "' + maxtime + '.');
									return false;
							}
						}");
					}
				}
				%>

				return true;
			}

			function enableFeatures()
			{
				var devtype = 0;

				<% if (-1 == Device)
				{
					write("
						devtype = Number( document.theForm.DevType.options[document.theForm.DevType.selectedIndex].value);
					");
				}
				else
				{
					if ('Management Server' != DMGetAttachedDevice( Device, 2)  && 'Local Server' != DMGetAttachedDevice( Device, 2))
					{
					write("
						devtype = Number( document.theForm.DevType.options[document.theForm.DevType.selectedIndex].value);
					");
					}
				}%>

				if (0 == devtype)
				{
					document.theForm.Hostname.value = "<% DMTranslate( "N/A"); %>";
					document.theForm.Hostname.disabled = true;
					if ("<% DMTranslate( "N/A"); %>" == document.theForm.Command.value)
						document.theForm.Command.value = "";
					document.theForm.Command.disabled = false;
					document.theForm.ShutdownOS .disabled = false;
					document.theForm.Execute.disabled = false;
				}
				else if (1 == devtype)
				{
					if ("<% DMTranslate( "N/A"); %>" == document.theForm.Hostname.value)
						document.theForm.Hostname.value = "";
					if ("<% DMTranslate( "N/A"); %>" == document.theForm.Command.value)
						document.theForm.Command.value = "";
					document.theForm.Hostname.disabled = false;
					document.theForm.Command.disabled = false;
					document.theForm.ShutdownOS .disabled = false;
					document.theForm.Execute.disabled = false;
				}
				else
				{
					document.theForm.Hostname.value = "<% DMTranslate( "N/A"); %>";
					document.theForm.Hostname.disabled = true;
					document.theForm.Command.value = "<% DMTranslate( "N/A"); %>";
					document.theForm.Command.disabled = true;
					document.theForm.ShutdownOS .disabled = true;
					document.theForm.Execute.disabled = true;
				}
			}

			function doDeleteDevice()
			{
				if (confirm( "<% DMTranslate( "Are you sure you want to delete the device?"); %>"))
				{
					dev = document.theForm.Device.value;
					document.theForm.action = "/goforms/formDeleteDevice?Device=" + dev;
					document.theForm.onSubmit = "return true";
					document.theForm.submit();
				}
			}

   		//-->
	</script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5 onLoad="enableFeatures();">

		<!-- *** news and announcements form ****************************************************** -->
<form action='/goform/formAddEditDevice' method='POST' name=theForm onSubmit='return checkSettings();'>
	<input type=hidden name=Device value=<% write( Device); %>>
	<input type=hidden name=CallingPage value=<%write( CallingPage);%>>
	<input type=hidden name=EncrName value=<%write( DMGetEncryptedName());%>>
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
							<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% if (-1 == Device) DMTranslate( "Add Device"); else DMTranslate( "Edit/Delete Device"); %>
							</td>
							<td align=right class=dialogHeader><p style="padding:0px 5px 0px 5px;;">
								<% if (-1 != Device)
								{
									write('<input type=button value=\"&nbsp;&nbsp;');
									DMTranslate( 'Help')
									write(' &nbsp;&nbsp;\" onClick=\"pageHelp( \'Edit+Device\');\">');
								}
								else
								{
									write('<input type=button value=\"&nbsp;&nbsp;');
									DMTranslate( 'Help')
									write('&nbsp;&nbsp;\" onClick=\"pageHelp( \'Add+Device\');\">');
								}
								%>
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
								<table width=100%% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
									<tr class=dialogLineItem>
										<td>
											<%DMTranslate( "Device Description"); %>
										</td>
										<td><% DMTranslate( "Device Type"); %></td>
										<%
											seg = 0;
											if (-1 != Device)
												seg = DMGetAttachedDevice( Device, 3);
											count = DMGetUPSVariableSupported( "0", "Load Segment Count");
											if (count > 0)
											{
												write( "<td>");
												DMTranslate("Load Segment");
												write("</td>");
											}
										%>
										<%
										var devtype = "Remote Agent";
										if (-1 != Device)
										{
											devtype = DMGetAttachedDevice( Device, 2);
											if ( "Remote Agent" == devtype)
											{
												write('<td>');
												DMTranslate( "Version")
												write('</td>');
											}
										}
										%>
									</tr>
									<tr class=dialogLineItem>
										 <%
										 write('<td align=left>');
										 write('<input type=text size=30 maxlength=50 name=DevName value="');
										 if (-1 != Device)
											DMPrintAttachedDevice( Device, "$1");
										 write('">');
										 write('</td>');
										 %>
										 <%
										 write('<td align=left>');


										 if ( "Management Server" == devtype || "Local Server" == devtype)
										 {
											write( "<input type=hidden name=DevType value=0>");
											DMTranslate( "Management Server");
										 }
										 else
										 {
											write('<select size=1 name=DevType onChange="enableFeatures();">');

												if (-1 == Device)
												{
													devtype = "Other Device";
													if ("true" != DMIsMaxAgentsReached())
														devtype = "Remote Agent";
												}

												if ("true" == DMAllowLocalServer( Device))
												{
													devtype = "Local Server"
													write( "<option value=0");
													if (-1 != Device)
													{
														devtype = DMGetAttachedDevice( Device, 2);
														if ("Local Server" == devtype)
															write( " selected");
													}
													else
														write( " selected");
													write( ">");
													DMTranslate( "Management Server");
													write( "</option>");
												}

												if ("true" != DMIsMaxAgentsReached() || "Remote Agent" == devtype)
												{
													write( "<option value=1");
													if (-1 != Device)
													{
														devtype = DMGetAttachedDevice( Device, 2);
														if ("Remote Agent" == devtype)
															write( " selected");
													}
													write( ">");
													DMTranslate( "Remote Agent");
													write( "</option>");
												}

												write('<option value=2');
												if (-1 != Device)
												{
													if ("Other Device" == devtype)
														write( " selected");
												}
												write( ">");
												DMTranslate( "Other Device")
												write('</option>');

												if ("true" == DMGetSkinBool( "StorageSupport", "false"))
												{
													write('<option value=3');
													if (-1 != Device)
													{
														if ("Storage Device" == devtype)
															write( " selected");
													}
													write( ">");
													DMTranslate( "Storage Device")
													write('</option>');
												}

											write('</select>');
										 }
										 write('</td>');
										 %>
										<%
											count = DMGetUPSVariableSupported( "0", "Load Segment Count");
											if (count > 0)
											{
												seg = 0;
												if (-1 != Device)
													seg = DMGetAttachedDevice( Device, 3);
												write( "<td align=left><select size=1 name=Segment>");
												if ( "2" != DMGetLoadSegmentSupport())
												{
													write( "<option value=0 ");
													if (seg == 0)
														write( "selected");
													write( ">");
													DMTranslate( "Entire UPS");
													write( "</option>");
													devtype = DMGetAttachedDevice( Device, 2);
													if ( "Management Server" != devtype && "Local Server" != devtype)
													{
														for (i = 1; i <= count; i++)
														{
															write( "<option value=" + i + " ");
															if (seg == i)
																write( "selected");
															write( ">" + i + "</option>");
														}
													}
												}
												else
												{
													for (i = 1; i <= count; i++)
													{
														write( "<option value=" + i + " ");
														if (seg == i)
															write( "selected");
														write( ">" + i + "</option>");
													}
												}
												write( "</select></td>");
											}
										%>
										<%
										if (-1 != Device && "Remote Agent" == devtype)
										{
											write('<td>');
											agtVers = DMGetAttachedDevice( Device, 9);
											if ("" == agtVers)
												DMTranslate("N/A");
											else
												write(agtVers);
											write('</td>');
										}
										%>
									</tr>
								</table>
							</td>
						</tr>
						<%
						if ("true" == DMIsMaxAgentsReached())
						{
							write( "<tr><td><b>Note:</b>  You have reached the maximum number of " );
							write(DMPrintMaxAgents());
							write( " Remote Agents you can attach.  To increase this amount, contact your customer representative.</td></tr>" );
						}
						%>
						<tr>
							<td>
								<table width=100%% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
									<tr class=dialogColHeader>
										<td colspan=2 align=center><% DMTranslate( "Computer Device Information"); %></td>
										<td colspan=2 align=center><% DMTranslate( "Estimated Time Required To"); %></td>
									</tr>
									<tr class=dialogLineItem>
										<td align=center><% DMTranslate( "Host Name or IP Address"); %></td>
										<td align=center>
											<input type=text size=25 maxlength=50 name=Hostname
										value="<%
												var devtype = "Remote Agent";
												 if (-1 != Device)
												 {
													 devtype = DMGetAttachedDevice( Device, 2);
												 }
												if (devtype == "Remote Agent")
												{
													if (-1 != Device)
													{
														DMPrintAttachedDevice( Device, "$4");
													}
													write( "\"");
												}
												else
												{
													DMTranslate( "N/A");
													write( "\" disabled");
												}
												%>>
										</td>
										<td align=center><% DMTranslate( "Shut Down OS"); %></td>
										<td align=center>
											<input type=text maxlength=3 size=7 name=ShutdownOS
										value="<%
												var devtype = "Remote Agent";
												if (-1 != Device)
												{
													 devtype = DMGetAttachedDevice( Device, 2);
												}
												if (devtype == "Other Device")
												{
													DMTranslate( "N/A");
													write( "\" disabled");
												}
												else
												{
													if (-1 != Device)
													{
														DMPrintAttachedDevice( Device, "$6");
													}
													else
														write( "1");
													write( "\"");
												}
											   %>>
											&nbsp;<% DMTranslate( "Min"); %>
										</td>
									</tr>
									<tr class=dialogLineItem>
										<td align=center colspan=2><input type=checkbox name="Command" value="1"
											<%
												var devtype = "Remote Agent";
												if (-1 != Device)
												{
													 devtype = DMGetAttachedDevice( Device, 2);
												}
												if (devtype == "Other Device")
												{
													write( " disabled");
												}
												else
												{
													if (-1 != Device)
													{
														if ("true" == DMGetAttachedDevice( Device, 5))
															write( " checked");
													}
											   }
											%>										><% DMTranslate( "Run Command Procedure (SDScript)?"); %></td>
										<td align=center><% DMTranslate( "Execute Command"); %></td>
										<td align=center>
											<input type=text maxlength=3 size=7 name=Execute
										value="<%
												var devtype = "Remote Agent";
												if (-1 != Device)
												{
													 devtype = DMGetAttachedDevice( Device, 2);
												}
												if (devtype == "Other Device")
											   {
													DMTranslate( "N/A");
													write( "\" disabled");
											   }
											   else
											   {
													if (-1 != Device)
													{
														DMPrintAttachedDevice( Device, "$7");
													}
													else
														write( "1");
													write( "\"");
											   }
											%>>
											&nbsp;<% DMTranslate( "Min"); %>
										</td>
									</tr>
								</table>
							</td>
						</tr>

					    <tr class=dialogBackground>
							<td align=center>
								<input type=submit value="<% DMTranslate( "Save Changes"); %>">
								<% if (-1 != Device)
								{
									devtype = DMGetAttachedDevice( Device, 2);
									if ("Management Server" != devtype && "Local Server" != devtype)
									{
										write('&nbsp;&nbsp;<input type=button value=\"');
										DMTranslate( "Delete Device")
										write('\" onClick=\"doDeleteDevice();\">&nbsp;&nbsp;');
									}
								}
								%>
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




