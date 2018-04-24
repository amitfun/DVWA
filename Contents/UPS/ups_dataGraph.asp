<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="-1">

	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
	<script src="../AC_RunActiveContent.js" type="text/javascript"></script>
	<script language="javascript1.1" src="../UI_lib.js"></script>

	<script language="Javascript1.1" type="text/javascript">
		<!--

		function SetVis( Style, State) // 1 visible, 0 hidden
		{
			if(document.layers)	   //NN4+
				document.layers[Style].display = State ? "inline" : "none";
			else if(document.getElementById)	  //gecko(NN6) + IE 5+
			{
				var obj = document.getElementById( Style);
				obj.style.display = State ? "inline" : "none";
			}
			else if(document.all)	// IE 4
				document.all[Style].style.display = State ? "inline" : "none";
		}

		var requiredVersion = 6;
		var flash2Installed = false;
		var flash3Installed = false;
		var flash4Installed = false;
		var flash5Installed = false;
		var flash6Installed = false;
		var flash7Installed = false;
		var maxVersion = 7;
		var actualVersion = 0;
		var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
		var isWin = (navigator.appVersion.indexOf("Windows") != -1) ? true : false;

		if (isWin)
			requiredVersion = 7;
		else
			requiredVersion = 6;

		if (isIE && isWin)
		{
  			document.write('<SCR' + 'IPT language=VBscript\> \n');
  			document.write('on error resume next \n');
  			document.write('flash2Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.2"))) \n');
  			document.write('flash3Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.3"))) \n');
  			document.write('flash4Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.4"))) \n');
  			document.write('flash5Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.5"))) \n');
  			document.write('flash6Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.6"))) \n');
  			document.write('flash7Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.7"))) \n');
  			document.write('</SCR' + 'IPT\> \n');
		}

		function detectFlash()
		{
  			if (navigator.plugins)
 			{
    			if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"])
    			{
    				var isVersion2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
   						var flashDescription = navigator.plugins["Shockwave Flash" + isVersion2].description;
  	   				var flashVersion = parseInt(flashDescription.charAt(flashDescription.indexOf(".") - 1));

	   				flash2Installed = flashVersion == 2;
   					flash3Installed = flashVersion == 3;
   					flash4Installed = flashVersion == 4;
  	   				flash5Installed = flashVersion == 5;
  	   				flash6Installed = flashVersion == 6;
  	   				flash7Installed = flashVersion >= 7;
  				}
  			}

	  		for (var i = 2; i <= maxVersion; i++)
	  		{
	  			if (eval("flash" + i + "Installed") == true) actualVersion = i;
	  		}

	  		if (actualVersion < requiredVersion)
				window.location = "ups_dataGraphNF.asp";
		}

		// -->
	</script>

</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5 onload="detectFlash();">
		<table  class="hidden" id="graph" width=601 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
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
									<% DMTranslate( "UPS Data Graph"); %>
								</td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'UPS Graphical Log')";>
							</td>				  
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
						<table width=100% align=center cellspacing=0 cellpadding=0 border=0 class=dialogBackground>

						  <!-- *** rows of various controls *** -->

						  <tr>
							 <td align=center width=100% valign=top>

							 	<table width=100% cellspacing=0 cellpadding=10 border=0 bgcolor='#ffffff'>
							 		<tr>
							 			<td align=center valign=top>
										<%
											write('<script type="text/javascript">\n');
											write("AC_FL_RunContent( \n");
											write("	'codebase',		'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0',\n");
											write("	'width',    	'640',\n");
											write("	'height',   	'400',\n");
											write("	'align',		'top',\n");
											write("	'menu',			'false',\n");
											write("	'salign',		'T',\n");
											write("	'bgcolor',      '#FFFFFF',\n");
											write("	'src',      	'lineChart',\n");
											write("	'quality',  	'high',\n");
											write("	'pluginspage',	'http://www.macromedia.com/go/getflashplayer',\n");
											write("	'movie',      	'lineChart');\n");
											write('</script>\n');
											%>
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
</body>
</html>

