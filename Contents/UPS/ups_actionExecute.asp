<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script language="javascript1.1" src="../UI_lib.js"></script>
</HEAD>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
	<center>
	<table width=500 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
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
								<p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Execute " + Command); %></p>
							</td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Battery+Test');">
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
							<form action='/goform/formUPSPerformCommand' method='POST'>
								<input type=hidden name=Command value="<% write( Command); %>">
								<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
									<tr class=dialogLineItem><td colspan=3><% DMPrintUPSCommand( Command, "$2"); %></td></tr>

									<%
										count = DMUPSCommandParamCount( Command);
										if (count)
										{
											write( "<tr class=dialogColHeader>");
											write( "<td><b>");
											DMTranslate( "Parameter");
											write( "</b></td>");
											write( "<td><b>");
											DMTranslate( "Value");
											write( "</b></td>");
											write( "<td><b>");
											DMTranslate( "Notes");
											write( "</b></td></tr>");
										}

										for (i = 0; i < count; i++)
										{
											write( "<tr class=dialogLineItem><td>");
											DMPrintUPSCommandParameter( Command, i, "$1");
											write( "</td><td>");
											if ("true" == DMIsUPSCommandParameterEnum( Command, i))
											{
												DMPrintUPSCommandParameter( Command, i, "<select name=\"$0\">");
												DMPrintUPSCommandParameterEnum( Command, i, "<option $1?selected??>$0</option>");
												write( "</select>");
											}
											else
											{
												DMPrintUPSCommandParameter( Command, i, "<input type=text maxlength=3 size=20 name=\"$0\">");
											}
											write( "</td><td>");
											if ("true" == DMIsUPSCommandParameterRange( Command, i))
											{
												DMPrintUPSCommandParameterMinMax( Command, i, "#Enter a number from $0 to $1.#");
											}
											write( "</td></tr>");
										}
									%>
							<tr class=dialogLineItem>
								<td colspan=3 align=center><input type='Submit' value='<% DMTranslate( "Execute Command"); %>'></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
      </TABLE>
    </TD>
  </TR>

</TABLE>

</TD>
</TR>

</TABLE>
</CENTER>
</BODY>
</HTML>
