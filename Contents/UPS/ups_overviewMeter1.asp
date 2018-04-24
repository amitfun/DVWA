<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="-1">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>
	<script language="javascript1.1" src="../UI_lib.js"></script>

	<script language='javascript'>

		function SetActionType( type )
		{
			document.home_overview_css.actionType.value = type;
			switch( type )
			{
				case 1: //help
					break;
			}
		}

		function VerifyData()
		{
			return true;
		}



	</script>
</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

		<table width=641 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
		  <tr>
			 <td valign=top>

<div data-role="button" data-text="I am a button"></div> <!-- make "I am a button" a user input --->
<script>
	var buttons = $("[data-role=button]");
	buttons.html(button.getAttribute("data-text"));
</script>



				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				  <!-- *** header bar *** -->
				  <tr>
					<td>
						<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
							<tr>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;">
									<% DMTranslate( "Overview"); %>
								</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Overview')";>
								</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
						<table width=100% align=center cellspacing=0 cellpadding=10 border=0 class=dialogBackground>

							<tr>
							 	<td align=center valign=top>

									<iframe width='770' height='430' frameborder='0' src='overviewCSS.asp' style="border:1px solid #ccc;"></iframe>

								</td>
							</tr>
							<tr>
					 			 <td>

									<table width=400 align=center cellspacing=0 cellpadding=0 border=0>
									  <tr>
										 <td align=center colspan=4><hr size=1 noshade></td>
									  </tr>
									  <tr>
										 <td align=center width=25%><img src='../../CImage/icon_newsCritical.gif'>&nbsp;&nbsp;<% DMTranslate( "Critical"); %></td>
										 <td align=center width=25%><img src='../../CImage/icon_newsWarning.gif'>&nbsp;&nbsp;<% DMTranslate( "Warning"); %></td>
										 <td align=center width=25%><img src='../../CImage/icon_newsGood.gif'>&nbsp;&nbsp;<% DMTranslate( "Normal"); %></td>
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
</body>
</html>

