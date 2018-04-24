<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">

	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>

	<script language="javascript">
		<!--
			var highlightColor = '<% DMPrintConfigVar( "MenuHilite"); %>';
			var normalBgColor = '<% DMPrintConfigVar( "MenuBackground"); %>';
			// turn off error handling so older browsers won't croak when loading.
			var _OLD_ONERROR = window.onerror;
			window.onerror = null;
			if (navigator.version < 5)
			{
					  window.onerror = _OLD_ONERROR = defaultOnError;
			}
			else
			{
					  window.onerror = _OLD_ONERROR;
			}
		// -->
	</script>

	<script language="javascript" type="text/javascript" src="ua.js"></script>
	<script language="javascript1.2" src="xbStyle.js"></script>
	<script language="javascript1.2" src="xbCollapsibleLists.js"></script>

	<script language="javascript1.2" type="text/javascript">
		<!--

		  function init()
		  {
			  var height  = <% DMPrintConfigVar( "MenuItemHeight"); %>;
			  var width   = <% DMPrintConfigVar( "MenuWidth"); %>;
			  var index   = 0;

			  currentSelection = 0;

			  mainList = new List(true, width, height);
			  mainList.setFont("<font face='Arial,Helvetica' color='<% DMPrintConfigVar( "MenuHeader"); %>'><b>","</b></font>");

			  mainList.addItem( "<a href = 'user_details.asp'	target='main' onClick='setLite(" + index++ + ");'><% DMTranslate( "My Account"); %></a>" );
			  <%
					if ( "true" == DMIsAdmin() )
					{
						write("mainList.addItem( \"<a href = 'Admin/admin_Users.asp'	target='main' onClick='setLite(\" + index++ + \");'>");
						DMTranslate( "User Accounts");
						write("</a>\");" );
						if ("true" == DMGetSkinBool( "UpgradeSupportM", "true"))
						{
							write("mainList.addItem( \"<a href = 'Admin/admin_Upgrade.asp'	target='main' onClick='setLite(\" + index++ + \");'>");
							DMTranslate( "Upgrade");
							write("</a>\");" );
						}

			  			if ("true" == DMGetConfigVar("UseKey"))
						{
							write( "mainList.addItem ( \"<a href = '/CPage/upgrade.asp'	target='main' onClick='setLite(\" + index++ + \");'>");
							DMTranslate( "Registration");
							write( "</a>\");");
						}
					}
			  %>

			  //blank space
			  mainList.addItem("");
			  mainList.addItem("");
			  index++;
			  index++;
			  <% if ( "false" ==  DMGetConfigVar( "TopLogout"))
			  {
				write("mainList.addItem ( \"<a href = '/goform/formLogout' onClick='setLite(\" + index++ + \");'>");
				DMTranslate("Logout")
				write("</a>\");");
			  }
			  %>

			  mainList.build( 0,20 );
		  }

		//-->
	</script>

	<title></title>

</head>
<body class=navigation ONLOAD="init();">
</body>
</html>