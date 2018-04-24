<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>
	<script language="javascript1.1" src="../UI_lib.js"></script>

</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

		<!-- *** news and announcements form ****************************************************** -->

	<center>
	<table width=90% align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
	  <tr>
		 <td valign=top>

			<!-- *** begin dialog box *** -->

			<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				<!-- *** header bar *** -->
				<tr>
				<td>
					<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
						<tr>
							<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Event Notifications"); %>
							</td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Event Settings')";>
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
								<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
									<tr class=dialogColHeader>
									 <td align=center width=20%>&nbsp;</td>
									 <td align=center width=10%><a href='event.asp'><% DMTranslate( "Critical"); %></a></td>
									 <td align=center width=15%><a href='event.asp'><% DMTranslate( "Warning"); %></a></td>
									 <td align=center width=15%><a href='event.asp'><% DMTranslate( "Information"); %></a></td>
									 <td align=center width=20%><a href='event.asp'><% DMPrintIniString( "Event_Severities", "User1Name", "#User Defined 1#"); %></a></td>
									 <td align=center width=20%><a href='event.asp'><% DMPrintIniString( "Event_Severities", "User2Name", "#User Defined 2#"); %></a></td>
									</tr>
									<tr class=dialogLineItem>
									 <td class=dialogColHeader align=center><a href="setup_notification.asp?Type=EMail"><% DMTranslate( "EMail"); %></a></td>
									<%	if ("1" == DMGetIniString( "EMail_Notification", "Critical_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "EMail_Notification", "Critical_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "EMail_Notification", "Critical_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
										else
											write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>

									<%	if ("1" == DMGetIniString( "EMail_Notification", "Warning_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "EMail_Notification", "Warning_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "EMail_Notification", "Warning_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "EMail_Notification", "Information_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "EMail_Notification", "Information_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "EMail_Notification", "Information_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "EMail_Notification", "User1_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "EMail_Notification", "User1_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "EMail_Notification", "User1_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "EMail_Notification", "User2_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "EMail_Notification", "User2_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "EMail_Notification", "User2_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									</tr>
									<tr class=dialogLineItem>
									 <td class=dialogColHeader align=center><a href="setup_notification.asp?Type=SNMP"><% DMTranslate( "SNMP"); %></a></td>
									<%	if ("1" == DMGetIniString( "SNMP_Notification", "Critical_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "SNMP_Notification", "Critical_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "SNMP_Notification", "Critical_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "SNMP_Notification", "Warning_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "SNMP_Notification", "Warning_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "SNMP_Notification", "Warning_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "SNMP_Notification", "Information_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "SNMP_Notification", "Information_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "SNMP_Notification", "Information_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "SNMP_Notification", "User1_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "SNMP_Notification", "User1_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "SNMP_Notification", "User1_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "SNMP_Notification", "User2_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "SNMP_Notification", "User2_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "SNMP_Notification", "User2_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									</tr>
									<tr class=dialogLineItem>
									 <td class=dialogColHeader align=center><a href="setup_notification.asp?Type=Broadcast"><% DMTranslate( "Broadcast"); %></a></td>
									<%	if ("1" == DMGetIniString( "Broadcast_Notification", "Critical_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "Broadcast_Notification", "Critical_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "Broadcast_Notification", "Critical_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "Broadcast_Notification", "Warning_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "Broadcast_Notification", "Warning_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "Broadcast_Notification", "Warning_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "Broadcast_Notification", "Information_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "Broadcast_Notification", "Information_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "Broadcast_Notification", "Information_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "Broadcast_Notification", "User1_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "Broadcast_Notification", "User1_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "Broadcast_Notification", "User1_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									<%	if ("1" == DMGetIniString( "Broadcast_Notification", "User2_Enabled", "0"))
										{
											if ("0" < DMGetIniString( "Broadcast_Notification", "User2_List_Count", "0") )
											{
												write( "<td><table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr valign=top>");
												write( "<td align=left>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
												write( "</table>");
												write( "</td>");
												write( "<td>");
												write( "<table cellspacing=1 cellpadding=0 border=0>");
												DMPrintIniArray( "Broadcast_Notification", "User2_List", "<tr><td>$0</td></tr>")
												write( "</table></td></tr></table></td>");
											}
											else
											{
												write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
											}
										}
											else
												write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									%>
									</td></tr>
								  <% if ( "true" ==  DMGetConfigVar( "EventScript", "false"))
								  {
									write( "<tr class=dialogLineItem>");
									write( "<td class=dialogColHeader align=center><a href='setup_script.asp?Type=Script'>");
									DMTranslate( "Script");
									write( "</a></td>");
									if ("1" == DMGetIniString( "Script_Notification", "Critical_Enabled", "0"))
									{
										if ("0" < DMGetIniString( "Script_Notification", "Critical_List_Count", "0") )
										{
											write( "<td><table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr valign=top>");
											write( "<td align=left>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
											write( "</table>");
											write( "</td>");
											write( "<td>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											DMPrintIniArray( "Script_Notification", "Critical_List", "<tr><td>$0</td></tr>")
											write( "</table></td></tr></table></td>");
										}
										else
										{
											write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
										}
									}
									else
										write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									if ("1" == DMGetIniString( "Script_Notification", "Warning_Enabled", "0"))
									{
										if ("0" < DMGetIniString( "Script_Notification", "Warning_List_Count", "0") )
										{
											write( "<td><table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr valign=top>");
											write( "<td align=left>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
											write( "</table>");
											write( "</td>");
											write( "<td>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											DMPrintIniArray( "Script_Notification", "Warning_List", "<tr><td>$0</td></tr>")
											write( "</table></td></tr></table></td>");
										}
										else
										{
											write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
										}
									}
									else
										write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");
									if ("1" == DMGetIniString( "Script_Notification", "Information_Enabled", "0"))
									{
										if ("0" < DMGetIniString( "Script_Notification", "Information_List_Count", "0") )
										{
											write( "<td><table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr valign=top>");
											write( "<td align=left>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
											write( "</table>");
											write( "</td>");
											write( "<td>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											DMPrintIniArray( "Script_Notification", "Information_List", "<tr><td>$0</td></tr>")
											write( "</table></td></tr></table></td>");
										}
										else
										{
											write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
										}
									}
									else
										write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");

									if ("1" == DMGetIniString( "Script_Notification", "User1_Enabled", "0"))
									{
										if ("0" < DMGetIniString( "Script_Notification", "User1_List_Count", "0") )
										{
											write( "<td><table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr valign=top>");
											write( "<td align=left>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
											write( "</table>");
											write( "</td>");
											write( "<td>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											DMPrintIniArray( "Script_Notification", "User1_List", "<tr><td>$0</td></tr>")
											write( "</table></td></tr></table></td>");
										}
										else
										{
											write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
										}
									}
									else
										write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");

									if ("1" == DMGetIniString( "Script_Notification", "User2_Enabled", "0"))
									{
										if ("0" < DMGetIniString( "Script_Notification", "User2_List_Count", "0") )
										{
											write( "<td><table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr valign=top>");
											write( "<td align=left>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											write( "<tr><td><img src=../../CImage/enabled.gif></td></tr>");
											write( "</table>");
											write( "</td>");
											write( "<td>");
											write( "<table cellspacing=1 cellpadding=0 border=0>");
											DMPrintIniArray( "Script_Notification", "User2_List", "<tr><td>$0</td></tr>")
											write( "</table></td></tr></table></td>");
										}
										else
										{
											write("<td align=center valign=center><img src=../../CImage/enabled.gif></td>");
										}
									}
									else
										write( "<td align=center valign=center><img src=../../CImage/disabled.gif></td>");

									write( "</td></tr>");
								} %>
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

	<br>

	<form name=formSetIni method=post action='/goform/formSetIni'>
	<input type=hidden name=Section value="Event_Severities">
		<center>
		<table width=90% align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
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
									<% DMTranslate( "Event Categories"); %>
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

											<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>

											  <!-- *** rows of various controls *** -->

											  <tr class=dialogColHeader>
													<td align=center width=20%>
														<b>
															<% DMTranslate( "Category"); %>
														</b>
													</td>
												 <td align=center width=40%>
														<b>
															<% DMTranslate( "Name"); %>
														</b>
													</td>
												 <td align=center width=40%>
														<b>
															<% DMTranslate( "Severity"); %>
														</b>
													</td>
											  </tr>

											  <tr class=dialogLineItem>
												 <td align=center>
													<% DMTranslate( "User Defined 1"); %>
												 </td>
												 <td align=center>
													<input type=text maxlength=50 size=20 name=User1Name value="<% DMPrintIniString( "Event_Severities", "User1Name", "#User Defined 1#"); %>"></td>
												 </td>
												 <td align=center>
													<select size=1 name="User1Severity" maxLength="20">
														<option value=Critical <% if ("Critical" == DMGetIniString( "Event_Severities", "User1Severity", "Critical")) write( "selected"); %>>
															<% DMTranslate( "Critical"); %>
														</option>
														<option value=Warning <% if ("Warning" == DMGetIniString( "Event_Severities", "User1Severity", "Critical")) write( "selected"); %>>
															<% DMTranslate( "Warning"); %>
														</option>
														<option value=Information <% if ("Information" == DMGetIniString( "Event_Severities", "User1Severity", "Critical")) write( "selected"); %>>
															<% DMTranslate( "Information"); %>
														</option>
													</select>
												 </td>
											  </tr>

											  <tr class=dialogLineItem>
												 <td align=center>
													<% DMTranslate( "User Defined 2"); %>
												 </td>
												 <td align=center>
													<input type=text maxlength=50 size=20 name=User2Name value="<% DMPrintIniString( "Event_Severities", "User2Name", "#User Defined 2#"); %>"></td>
												 </td>
												 <td align=center>
													<select size=1 name="User2Severity" maxLength="20">
														<option value=Critical <% if ("Critical" == DMGetIniString( "Event_Severities", "User2Severity", "Warning")) write( "selected"); %>>
															<% DMTranslate( "Critical"); %>
														</option>
														<option value=Warning <% if ("Warning" == DMGetIniString( "Event_Severities", "User2Severity", "Warning")) write( "selected"); %>>
															<% DMTranslate( "Warning"); %>
														</option>
														<option value=Information <% if ("Information" == DMGetIniString( "Event_Severities", "User2Severity", "Warning")) write( "selected"); %>>
															<% DMTranslate( "Information"); %>
														</option>
													</select>
												 </td>
											  </tr>
											</table>
										</td>
									</tr>

									<tr>
										 <td colspan=3 align=center>
												<input type=submit value="<% DMTranslate( "Save Changes"); %>">&nbsp;&nbsp;
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




