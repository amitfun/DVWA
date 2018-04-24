<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="-1">

	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script language="javascript1.1" src="../UI_lib.js"></script>
	<script language='javascript'>

		barArray = new Array();

		//	icon name, event description, event count, helpID

		<% DMPrintEventSummary( "barArray[$0] = [ \"icon_news$1.gif\",  \"$2\", $3, \"$4\" ];
		"); %>

		topCount = 1;

		function getTopCount()
		{
			for ( i = 0; i < barArray.length; i++ )
			{
				if ( barArray[i][2] > topCount ) { topCount = barArray[i][2] }
			}
		}

		getTopCount();
		widthPerEvent = parseInt( 400 / topCount );

		function setActionType( type )
		{
			document.eventSummary.actionType.value = type;
			document.eventSummary.submit();
		}

	</script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

	<form name='eventSummary' action='ups_eventSummary.asp' method='get'>

		<table width=800 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
		  <tr>
			 <td valign=top>

				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				  <!-- *** header bar *** -->
				  <tr>
					<td>
						<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
							<tr>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;">
									<% DMTranslate( "UPS Summary"); %> - <%
									if (2 == actionType)
										DMTranslate( "Last Week");
									else if (3 == actionType)
										DMTranslate( "Last Month");
									else if (4 == actionType)
										DMTranslate( "Last Year");
									else
										DMTranslate( "Last 24 Hours");
										%>
								</td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'UPS Log Summary')";>
							</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>

						<table width=100% align=center cellspacing=10 cellpadding=0>
						  <tr>
							 <td>


								<table width=100% align=center cellspacing=1 cellpadding=5 border=0 bgcolor='#cccccc'>
								  <tr>
									 <td class=dialogColHeader align=center valign=top style='width:50px;'><% DMTranslate( "Severity"); %></td>
									 <td class=dialogColHeader align=left valign=top><% DMTranslate( "Description"); %></td>
									 <td class=dialogColHeader align=left valign=top style='width:400px;'><% DMTranslate( "Value"); %></td>
									 <td class=dialogColHeader align=center valign=top style='width:40px;'><% DMTranslate( "Count"); %></td>
								  </tr>

								  <script language=javascript>

									for ( i = 0; i < barArray.length; i++ )
									{
									  document.write("<tr>")
										 document.write("<td class=dialogLineItem align=center valign=top><img border='0' src='../../CImage/" + barArray[i][0] + "'></td>")
										 document.write("<td class=dialogLineItem valign=top><a href='#' onClick=alarmHelp('" + barArray[i][3] + "')>" + barArray[i][1] + "</a></td>")
										 document.write("<td class=dialogLineItem valign=top><img border='0' src='../Images/redBox.gif' height='14' width='" + ( widthPerEvent * barArray[i][2] ) + "'></td>")
										 document.write("<td class=dialogLineItem align=center valign=top>" + barArray[i][2] + "</td>")
									  document.write("</tr>")
									}

								  </script>

								  <tr>
									 <td class=dialogLineItem colspan='4' align=center valign=top>
										<input type='button' value='<% DMTranslate( "Last 24 Hours"); %>' style='width:120px;' onClick="setActionType(1);">
										<input type='button' value='<% DMTranslate( "Last Week"); %>' style='width:120px;' onClick="setActionType(2);">
										<input type='button' value='<% DMTranslate( "Last Month"); %>' style='width:120px;' onClick="setActionType(3);">
										<input type='button' value='<% DMTranslate( "Last Year"); %>' style='width:120px;' onClick="setActionType(4);">
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

		<input type='hidden' value='1' name='actionType'>
	</form>

</body>
</html>

