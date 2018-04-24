<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>
	<% if (0 == TIME)
		TIME = DMGetTime();
	%>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   	<!--
		function setActionType(action)
		{
			switch(action)
			{
				case 1: //log settings
					document.theForm.actionType.value = 1;
					doLogSettings();
					break;

				case 2: //clear logs
					document.theForm.actionType.value = 2;
					break;

				case 3: //refresh
					document.theForm.actionType.value = 3;
					refreshPage();
					break;

				case 4: //export
					document.theForm.actionType.value = 4;
					doExport();
					break;
			}
		}

		function refreshPage()
   		{
   			top.main.window.location = "ups_data.asp?TIME=0&PAGE=1&ITEMSPERPAGE=" + <%write(ITEMSPERPAGE);%>;
		}

		function doExport()
		{
			window.location = 'exportLogs.asp?logType=Data';
		}

		function doLogSettings()
		{
			window.location = 'logSettings.asp';
		}

		function verifyData()
		{
			if (document.theForm.actionType.value == 2)
				return confirm("<% DMTranslate( "Please Confirm...Clear all log entries?");%>");
			else
				return true;
		}


		function showDataFreq()
		{
			var logfreq = <% DMGetLogFreq("$0"); %>;

			if (logfreq == 15)
				document.write("15 <% DMTranslate( "sec"); %>");
			else if (logfreq == 30)
				document.write("30 <% DMTranslate( "sec"); %>");
			else if (logfreq == 60)
				document.write("1 <% DMTranslate( "min"); %>");
			else if (logfreq == 180)
				document.write("3 <% DMTranslate( "min"); %>");
			else if (logfreq == 300)
				document.write("5 <% DMTranslate( "min"); %>");
			else if (logfreq == 600)
				document.write("10 <% DMTranslate( "min"); %>");
			else if (logfreq == 900)
				document.write("15 <% DMTranslate( "min"); %>");
			else if (logfreq == 1200)
				document.write("20 <% DMTranslate( "min"); %>");
			else if (logfreq == 1800)
				document.write("30 <% DMTranslate( "min"); %>");
			else if (logfreq == 3600)
				document.write("1 <% DMTranslate( "hr"); %>");
		}

   	//-->
   </script>

</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
<form action='/goform/formDataLog' method='POST' name=theForm onSubmit="return verifyData();">

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
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "UPS Data"); %></td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'UPS Data Log')";>
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

								<table width=40% align=center cellspacing=1 cellpadding=2 border=0 class=dialogCellLine>
									<tr class=dialogLineItem>
									 <td align=center><b><% DMTranslate( "Log Interval:"); %></b>&nbsp;&nbsp;
										 <% write('<script language=javascript>showDataFreq();</script>'); %>
									 </td>
									</tr>
								</table>

								<br>
								<table width=100% align=center cellspacing=1 cellpadding=2 border=0 class=dialogCellLine>
								  <tr class=dialogColHeader>
									<td align=center>
										<b><% DMTranslate( "Date"); %></b>&nbsp;
									</td>
									<td align=center>
										<b><% DMTranslate( "Time"); %></b>&nbsp;
									</td>
								  <% DMPrintUPSTypeVariables( "1", "<td align=center><b>$1</b>&nbsp;</td>"); %>
								  </tr>

								<% DMPrintUPSDataLogs( TIME); %>

								</table>

							</td>
						 </tr>
					   </table>
					 </td>
				  </tr>
				  <tr>
				 	<td align=center width=100%>
					<table>
					<tr>
				 	<td align=left nowrap>
						<input type=hidden name=actionType>
						<% DMPrintIfAdmin( "<input type=button style=\"font-size:8pt; color:black;;\" value=\'#Log Settings#\' name=logSettings onClick='setActionType(1);'>"); %>
						<% DMPrintIfAdmin( "<input type=submit style=\"font-size:8pt; color:black;;\" value=\'#Clear Logs#\' name=clearLogs onClick='setActionType(2);'>"); %>
						<input type=button  style="font-size:8pt; color:black;;" value='<% DMTranslate( "Refresh Page"); %>' name=refresh onClick="setActionType(3);">
						<input type=button style="font-size:8pt; color:black;;" value='<%DMTranslate( "Export Logs"); %> ' name=export onClick="setActionType(4);">
					</td>
					<td align=right width=100%>
					 <% 
						pages = DMGetDataPageCount( TIME);
						if (1 != PAGE)
						{
						write( "<input type=button style='font-size:8pt; color:black;' value=");
						DMTranslate( "First");
						write( " onclick=top.main.window.location='ups_data.asp?TIME=");
						write( TIME);
						write( "&PAGE=1");
						write( "&ITEMSPERPAGE=");
						write( ITEMSPERPAGE);
						write( "';>");
						}
						if (PAGE > 10)
						{
						write( "<input type=button style='font-size:8pt; color:black;' value='<<'  onclick=top.main.window.location='ups_data.asp?TIME=");
						write( TIME);
						write( "&PAGE=");
						write( PAGE - 10);
						write( "&ITEMSPERPAGE=");
						write( ITEMSPERPAGE);
						write( "';>");
						}
						if (PAGE > 1)
						{
						write( "<input type=button style='font-size:8pt; color:black;' value=' < '  onclick=top.main.window.location='ups_data.asp?TIME=");
						write( TIME);
						write( "&PAGE=");
						write( PAGE - 1);
						write( "&ITEMSPERPAGE=");
						write( ITEMSPERPAGE);
						write( "';>");
						}
						if (PAGE < pages)
						{
						write( "<input type=button style='font-size:8pt; color:black;' value=' > '  onclick=top.main.window.location='ups_data.asp?TIME=");
						write( TIME);
						write( "&PAGE=");
						write( PAGE + 1);
						write( "&ITEMSPERPAGE=");
						write( ITEMSPERPAGE);
						write( "';>");
						}
						if (PAGE < (pages - 9))
						{
						write( "<input type=button style='font-size:8pt; color:black;' value='>>'  onclick=top.main.window.location='ups_data.asp?TIME=");
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
						write( "'  onclick=top.main.window.location='ups_data.asp?&TIME=");
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
				</table>
			</td>
		  </tr>
		</table>
	</center>
	</form>
</body>
</html>





