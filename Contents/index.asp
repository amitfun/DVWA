<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
		<title><% DMPrintAppName(); %></title>
	</head>
	<frameset framespacing="0" border="false" frameborder="0" rows="<% DMPrintConfigVar( "HeaderHeight"); %>,3,*">
		<%	if ("true" == DMGetConfigVar( "MenuWidget"))
			{
				write( 	'<frame name=head src="/CPage/Header.asp" scrolling=no noresize>');
			}
			else
			{
				write( 	"<frame name=head src=topFrame.html scrolling=no noresize>");
			}
		%>
		<frame name="frameDiv" src="frameDivider.asp" scrolling="no" noresize>
		<frameset cols="<% DMPrintConfigVar( "MenuWidth"); %>,*">
		<%	if ("true" == DMGetConfigVar( "MenuWidget"))
		{
			write( 	"<frame name=left src=menuFrame.html scrolling=auto noresize>");
		}
		else
		{
			write( 	"<frame name=left src=menu.asp scrolling=auto noresize>");
		}
		%>
		<!--Redirect to page other than overview page which is what should be here because of 
		loading issues with a Linux machine running a Netscape browser with the load of this page.
		Redirecting slows loading enough that there isn't any problems//-->
		<frame name="main" src="UPS/blank.asp" scrolling="auto" noresize>
		</frameset>
	</frameset>
</html>
