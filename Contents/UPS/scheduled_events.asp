<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>

   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   	<!--
		function doAdd()
		{
			window.location = 'addScheduledShutdown.asp';
		}

		function verifyData(form)
		{
			var total = 0;
			var max = 0;
			if (form.ScheduledEvent)  // if there are no checkboxes then ScheduledEvent is not defined.
			{
				if (form.ScheduledEvent.length)  // if there are multiple checkboxes
				{
					max = form.ScheduledEvent.length;   // figure out how many there are
					for (var idx = 0; idx < max; idx++) 
					{
						// check each one
						if (eval("document.theForm.ScheduledEvent[" + idx + "].checked") == true) 
						{
							total += 1;
						}
					}
				}
				else // if only one checkbox exists 
				{    // check it
					if (eval("document.theForm.ScheduledEvent.checked") == true) 
					{
						total = 1;
					}
				}
			}


			if ( total == 0 )
			{
				alert("<% DMTranslate( "No Scheduled Events are selected.");%>");
				return false;
			}
			else
			{
				return confirm("<% DMTranslate( "Please Confirm...Delete Selected Scheduled Shutdown Events?");%>");
			}
		}


   	//-->
   </script>



</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
<form action='/goform/formScheduledSettings' method='POST' name=theForm onSubmit="return verifyData(this);">

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
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Scheduled Shutdown"); %></td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Add New Scheduled Shutdown"); %>&nbsp;&nbsp;" onClick="window.location = 'addScheduledShutdown.asp';">
								<input type=submit value="&nbsp;&nbsp;<% DMTranslate( "Delete Selection(s)"); %>&nbsp;&nbsp;">
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Scheduled Shutdown');">
							</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
					 	<table width=100% cellspacing=0 cellpadding=0 border=0 class=dialogBackground>
								  <tr class=dialogColHeader>
									<td align=center><b><% DMTranslate( "Event Affects"); %></b>&nbsp;</td>
									<td align=center><b><% DMTranslate( "Frequency"); %></b>&nbsp;</td>
									<td align=center><b><% DMTranslate( "Shutdown"); %></b>&nbsp;</td>
									<td align=center><b><% DMTranslate( "Restart"); %></b>&nbsp;</td>
									<td align=center><b><% DMTranslate( "Delete"); %></b>&nbsp;</td>
								  </tr>
								  <% DMPrintScheduledEvents( "<tr class=content><td align=center>$0</td>
								                             <td align=center>$1</td>
															 <td align=center>$2</td>
															 <td align=center>$3</td>
															 <td align=center><input type=checkbox style='font-size:8pt; color:black;;' value='$4' name='ScheduledEvent'></td>
															 </tr>", 
															 "<tr class=content><td colspan = 5 align=center>$0</td></tr>" ); %>	
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






