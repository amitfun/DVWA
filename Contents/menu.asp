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

			  <%
				if ("true" == DMIsConnected())
				{
				  write( "mainList.addItem ( \"<a href = '");
				  write("UPS/ups_overviewMeter1.asp");

				  write("' 	target='main' onClick='setLite(\" + index++ + \");'>");
				  DMTranslate("Overview");
				  write( "</a>\" );");
				}

				write( "mainList.addItem ( \"<a href = '");
				write( "Alarms.asp");
				write( "' 	target='main' onClick='setLite(\" + index++ + \");'>");
				DMTranslate("Alarms");
				write( "</a>\" );");

				if ("true" == DMIsConnected())
				{
				  write( "mainList.addItem ( \"<a href = 'UPS/ups_identification.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
				  DMTranslate("Identification");
				  write( "</a>\" );");
				}
			  %>

			  <%	if ("false" == DMIsContactClosure() && "true" == DMIsConnected())
				{
					write( "mainList.addItem ( \"<a href = '");
					write( "UPS/ups_variables.asp");
					write( "' 	target='main' onClick='setLite(\" + index++ + \");'>");
					DMTranslate("Parameters");
					write( "</a>\" );");

				}
			  %>


			  <%	if ( "true" == DMIsAdmin() && "true" == DMIsConnected())
					{
					  if ("UPS" == DMGetSkinString( "DevType", "UPS"))
						{
							write( "mainList.addItem ( \"<a href = 'UPS/devices.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
							DMTranslate( "Attached Devices");
							write( "</a>\" );");

							write( "mainList.addItem ( \"<a href = 'UPS/shutdown.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
							DMTranslate( "Power Fail");
							write( "</a>\" );");

							if ("true" == DMUPSHasShutdownEvents())
							{
								write( "mainList.addItem ( \"<a href = 'UPS/shutdown_events.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
								DMTranslate( "Shutdown Events");
								write( "</a>\" );");
							}
							if ("true" == DMUPSHasScheduledShutdown())
							{
								write( "mainList.addItem ( \"<a href = 'UPS/scheduled_events.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
								DMTranslate( "Scheduled Shutdown");
								write( "</a>\" );");
							}

						}

						write( "mainList.addItem ( \"<a href = 'UPS/event_actions.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
						DMTranslate( "Event Settings");
						write( "</a>\" );");

						if ("false" == DMIsContactClosure() && "true" == DMUPSHasCommands())
						{
							write( "mainList.addItem ( \"<a href = 'UPS/ups_actionExecute.asp?Command=Battery+Test' target='main' onClick='setLite(\" + index++ + \");'>");
							DMTranslate( "Battery Test");
							write( "</a>\" );");
						}

						write( "mainList.addItem ( \"<a href = 'UPS/settings.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
						DMTranslate( "Settings");
						write( "</a>\" );");

				  		if ("true" == DMHasLoadShedding())
						{
							write( "mainList.addItem ( \"<a href = 'UPS/ls_settings.asp' 	target='main' onClick='setLite(\" + index++ + \");'>");
							DMTranslate( "Load Shedding Settings");
							write( "</a>\" );");
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
			  if ( 4 == gup('id'))
			  	setLite("4");
		  }

		  function gup( name )
		  {
		  		name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
		  		var regexS = "[\\?&]"+name+"=([^&#]*)";
		  		var regex = new RegExp( regexS );
		  		var results = regex.exec( window.location.href );
		  		if( results == null )
		  			return "";
		  		else
		  			return results[1];
		  }
		//-->
	</script>

	<title></title>

</head>
<body class=navigation ONLOAD="init();">
</body>
</html>