<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
		<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>
		<script language='javascript'>

			img1 = new Image();
			img2 = new Image();
			img3 = new Image();
			img1.src = "../../CImage/icon_newsGood.gif";
			img2.src = "../../CImage/icon_newsWarning.gif";
			img3.src = "../../CImage/icon_newsCritical.gif";

			var http_request = false;

			function makeRequest(url)
			{
				http_request = false;
				if (window.XMLHttpRequest) // Mozilla, Safari,...
				{
					http_request = new XMLHttpRequest();
					if (http_request.overrideMimeType)
					{
						http_request.overrideMimeType('text/xml');
					}
				}
				else if (window.ActiveXObject) // IE
				{
					try
					{
						http_request = new ActiveXObject("Msxml2.XMLHTTP");
					}
					catch (e)
					{
						try
						{
							http_request = new ActiveXObject("Microsoft.XMLHTTP");
						}
						catch (e)
						{}
					}
				}
				if (!http_request)
				{
					alert('Giving up :( Cannot create an XMLHTTP instance');
					return false;
				}
				http_request.onreadystatechange = updateIcons;
				http_request.open('GET', url, true);
				http_request.send(null);
			}

			function updateIcons()
			{
				if (http_request.readyState == 4)
				{
					if (http_request.status == 200)
					{
						iconList = http_request.responseText;
						iconDefArray = new Array();
						iconDefArray = iconList.split("|");
						for ( i = 0; i < iconDefArray.length; i++ )
						{
							iconDefArray[i] = iconDefArray[i].split("^");
						}

						for ( i = 0; i < iconDefArray.length; i++ )
						{
							if ( iconDefArray[i][2] == "icon" )
							{
								document[ iconDefArray[i][0] ].src = eval( "img" + iconDefArray[i][1] + ".src" );
							}
							else if (iconDefArray[i][2] == "txt" )
							{
								document.getElementById( iconDefArray[i][0] ).innerHTML = iconDefArray[i][1];
							}
							else if (iconDefArray[i][2] == "autoLogOut" )
							{
								top.location = "/goform/formLogout";
							}
							else if (iconDefArray[i][2] == "refresh" )
							{
								top.location = "/Contents/index.asp";
							}
						}
					}
				}
			}

			setInterval("makeRequest('alerterData.asp')", 5000 );

		</script>

		<style linkunderline>
			A:link { text-decoration: underline;}
			A:active { text-decoration: underline;}
			A:visited { text-decoration: underline;}
		</style>
	</head>

	<body class=header leftMargin=0 topMargin=0 onLoad="makeRequest('alerterData.asp');">
		<center>
		<table valign=center cellspacing=0 cellpadding=0 border=0 width=100% height=100%>
			<tr>
				<td valign=center>
					<div style="border:1px solid #999999; height:50px;">
						<table width='100%' cellspacing='3' cellpadding='0' border='0'>
							<tr>
								<td valign='top'><img border="0" src="../../CImage/blank.gif" name='icon1'></td>
								<td align='center' width='100%' style="color:#000;"><div id='txt1'></div></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<% if ("true" ==  DMGetConfigVar( "TopLogout"))
			{
					write("<tr><td align=center><a class=appTitle href = '/goform/formLogout'>");
					DMTranslate("Logout")
					write("</a></td></tr>");
			}
			%>

		</table>
		</center>
	</body>
</html>