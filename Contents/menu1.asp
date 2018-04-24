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

			  currentSelection = 1;

			  mainList = new List(true, width, height);
			  mainList.setFont("<font face='Arial,Helvetica' color='<% DMPrintConfigVar( "MenuHeader"); %>'><b>","</b></font>");

			  <%	
				if ("true" == DMIsConnected())
				{
				  write( "mainList.addItem ( \"<a href = 'UPS/ups_eventSummary.asp?actionType=1' 	target='main' onClick='setLite(\" + index++ + \");'>");
    			  DMTranslate("UPS Summary");
				  write( "</a>\" );");

				  write( "mainList.addItem ( \"<a href = 'UPS/ups_eventLogs.asp?SORTCOL=2&SORTORD=2&TIME=0&PAGE=1&ITEMSPERPAGE=15' 	target='main' onClick='setLite(\" + index++ + \");'>");
					DMTranslate("UPS Detailed");
					write( "</a>\" );");

					if ("false" == DMIsContactClosure())
					{
						if ("true" == DMGetSkinBool( "DataSupport", "true"))
						{
							write( "mainList.addItem ( \"<a href = 'UPS/ups_data.asp?TIME=0&PAGE=1&ITEMSPERPAGE=10' 	target='main' onClick='setLite(\" + index++ + \");'>");
							DMTranslate( "UPS Data");
							write( "</a>\" );");
						}
						if ("true" == DMGetSkinBool( "DataGraphSupport", "true"))
						{
							write( "mainList.addItem ( \"<a href = 'UPS/ups_dataGraph.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
							DMTranslate("UPS Data Graph");
							write( "</a>\" );");
						}
					}

					if ("true" == DMGetSkinBool( "MaintSupport", "true"))
					{
						write( "mainList.addItem ( \"<a href = 'maintList.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
						DMTranslate( "UPS Maintenance");
						write( "</a>\" );");
					}
				}
			  %>

			  <% if ("true" == DMIsAdmin())
			  {
			  		  write("mainList.addItem( \"<a href = 'ApplicationLogs.asp?SORTCOL=2&SORTORD=2&TIME=0&PAGE=1&ITEMSPERPAGE=20' target='main' onClick='setLite(\" + index++ + \");'>");
					  DMTranslate( "Application")
					  write("</a>\");");
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