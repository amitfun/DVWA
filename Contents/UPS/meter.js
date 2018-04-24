﻿

	// preload the icons we will be using

	img1 = new Image();
	img2 = new Image();
	img3 = new Image();
	img1.src = "../../CImage/icon_newsGood.gif";
	img2.src = "../../CImage/icon_newsWarning.gif";
	img3.src = "../../CImage/icon_newsCritical.gif";


            var http_request = false;

            function makeRequest(url) {

                http_request = false;

                if (window.XMLHttpRequest) { // Mozilla, Safari,...
                    http_request = new XMLHttpRequest();
                    if (http_request.overrideMimeType) {
                        http_request.overrideMimeType('text/xml');
                    }
                } else if (window.ActiveXObject) { // IE
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e) {
                        try {
                        http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {}
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
				else if ( iconDefArray[i][2] == "txt" )
				{
					document.getElementById( iconDefArray[i][0] ).innerHTML = iconDefArray[i][1];
				}
				else if ( iconDefArray[i][2] == "pointer" )
				{
					setPointerPosition( iconDefArray[i][0], iconDefArray[i][1] );
				}
				else if ( iconDefArray[i][2] == "bgColor" )
				{
					document.getElementById( iconDefArray[i][0] ).style.background = iconDefArray[i][1];
				}
			}
                    }
                }

            }



