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
		initype = "Load_" + msload + "_Type";
		inidelay = "Load_" + msload + "_Delay";
		minups = DMGetMinMSShutdownTime();

		lowdelay = DMGetIniString( "Shutdown", "Low Battery Delay Sec", "-1");
		if ("-1" == lowdelay)
		lowdelay = DMGetIniString( "Shutdown", "Low Battery Delay", "0") * 60;

	%>

	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1" src="../pickdate.js"></script>
	<script language="javascript1.1">
		<!--

			function fixUPSDelay()
			{
				timeups = Number(document.theForm.Delay.value);
				if (timeups < <% write( minups); %>)
					document.theForm.Delay.value = <% write( minups); %>;
			}

			function checkSettings()
			{
				timeups = Number(document.theForm.Delay.value);
				if (timeups < <% write( minups); %>)
				{
					if (document.theForm.Battery[0].checked)
					{
						if ("2" == "<% write( lss); %>")
							alert( '<% DMTranslate( "Changing Management Server Load Segment delay to minimum value: "); %>' + <% write( minups); %> + '.');
						else
							alert( '<% DMTranslate( "Changing Entire UPS delay to minimum value: "); %>' + <% write( minups); %> + '.');
						fixUPSDelay();
					}
				}

				return true;
			}
   		//-->
	</script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

	<br>
	<form method="post" action="/goform/formAdvShutdown" name=theForm onSubmit='return checkSettings();'>

	<!-- *** identification page ****************************************************** -->

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
							<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Advanced Power Fail Settings"); %>
							</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Advanced Shutdown')";>
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
								<table width=100%% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>

								<tr class=dialogColHeader>
									<td align=left valign=top>
									<b><% DMTranslate( "On Battery Shutdown"); %></b>
									</td>
								</tr>
								<tr class=dialogLineItem>
									<td align=left valign=top>
									<input type=radio name=Battery value=Delay
										<% if ("Delay" == DMGetIniString( "Shutdown", initype, "Delay"))
											write( " checked"); %>><% DMTranslate( "Begin shutdown after a delay of"); %> <input type=text maxlength=3 name=Delay size=5 value=<% DMPrintIniString( "Shutdown", inidelay, "5");%>> <% DMTranslate( "minutes."); %><br>

									<%
									if ("true" == DMIsUPSVariableSupported( "Run Time Remaining"))
									{
										write( "<input type=radio name=Battery value=Runtime");
										if ("Runtime" == DMGetIniString( "Shutdown", initype, "Delay"))
											write( " checked");
										write( ">");DMTranslate( "Shut down based on UPS reported runtime remaining.");
										write( "<br>")
									}
									%>
									<input type=radio name=Battery value=None
										<% if ("None" == DMGetIniString( "Shutdown", initype, "Delay"))
											write( " checked"); %>><% DMTranslate( "Do not automatically shutdown."); %><br>
									</td>
								</tr>
								</table>
								<br>
								<table width=100%% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
								<tr class=dialogColHeader>
									<td align=left valign=top>
									<b><% DMTranslate( "Low Battery Shutdown"); %></b>
									</td>
								</tr>
								<tr class=dialogLineItem>
									<td align=left valign=top>
									<input type=radio name=Low value=Delay <% if ("1" == DMGetIniString( "Shutdown", "On Low Battery", "1")) write( "checked"); %>><% DMTranslate( "Begin shutdown after a delay of"); %> <input name=Shutdown_Low_Delay type=text maxlength=5 size=5 value=<% write( lowdelay); %>> <% DMTranslate( "seconds."); %><br>
									<input type=radio name=Low value=None <% if ("0" == DMGetIniString( "Shutdown", "On Low Battery", "1")) write( "checked"); %>><% DMTranslate( "Do not automatically shutdown."); %><br>
									</td>
								</tr>
								</table>
							</td>
						</tr>
								  <tr>
									 <td align=center>
										<input type=submit value="<% DMTranslate( "Save Changes"); %>">
									 </td>
								  </tr>
					</table>

				</td>
			 </tr>
		  </table>

	</table>
	</center>
	</form>

</body>
</html>
