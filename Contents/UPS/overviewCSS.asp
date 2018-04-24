<html>
	<head>

		<title>HP</title>
		<meta http-equiv="content-type" content="text/html; charset=<%DMTranslate("charset");%>">
		<link rel="stylesheet" type="text/css" href="default.css">
		<link rel="stylesheet" href="meter.css" type="text/css">
		<script language="JavaScript" type="text/javascript" src="meter.js"></script>

		<script language='javascript'>

			setInterval( "makeRequest('overviewData.asp')", 5000 );

			<!-- section config -->

			<% DMPrintVarConfig( "sectionLabels   = [ $0 ];
			sectionRowCount = [ $1 ]"); %>;
			sectionColHead  = [ '<%DMTranslate("Severity");%>', '<%DMTranslate("Description");%>', '<%DMTranslate("Value");%>' ];

			<!-- begin meter config -->

				<!-- meter 1 -->
					<% DMPrintMeterConfig( 1, "m1_colors     = [ $3 ];
					m1_percent    = [ $4 ];
					m1_yMax       = $5;
					m1_yMin       = $6;
					m1_paramCount = $0;
					m1_unitLabel  = '$1';
					"); %>

				<!-- meter 2 -->

					<% DMPrintMeterConfig( 2, "m2_colors     = [ $3 ];
					m2_percent    = [ $4 ];
					m2_yMax       = $5;
					m2_yMin       = $6;
					m2_paramCount = $0;
					m2_unitLabel  = '$1';
					"); %>

				<!-- meter 3 -->

					<% DMPrintMeterConfig( 3, "m3_colors     = [ $3 ];
					m3_percent    = [ $4 ];
					m3_yMax       = $5;
					m3_yMin       = $6;
					m3_paramCount = $0;
					m3_unitLabel  = '$1';
					"); %>

			<!-- end meter config -->


			function initMeters()
			{

				setMeterType( "m1", m1_paramCount );
				setMeterType( "m2", m2_paramCount );
				setMeterType( "m3", m3_paramCount );
				setMeterUnitLabels();
				var agent = navigator.userAgent.toLowerCase();
				if (agent.indexOf("msie") != -1 )
				{
					setColorBarWidth();
					document.getElementById("rightContainer").style.top = "10px";
					document.getElementById("m1_header").style.width = "90px";
					document.getElementById("m2_header").style.width = "90px";
					document.getElementById("m3_header").style.width = "90px";
					document.getElementById("m1_meterContainer").style.top = "31px";
					document.getElementById("m2_meterContainer").style.top = "31px";
					document.getElementById("m3_meterContainer").style.top = "31px";
					document.getElementById("m1_value").style.width = "78px";
					document.getElementById("m2_value").style.width = "78px";
					document.getElementById("m3_value").style.width = "78px";
				}

			}

			function setColorBarWidth()
			{
				document.getElementById( "m1_colorBar_0" ).style.width = "10px";
				document.getElementById( "m1_colorBar_1" ).style.width = "10px";
				document.getElementById( "m1_colorBar_2" ).style.width = "10px";
				document.getElementById( "m2_colorBar_0" ).style.width = "10px";
				document.getElementById( "m2_colorBar_1" ).style.width = "10px";
				document.getElementById( "m2_colorBar_2" ).style.width = "10px";
				document.getElementById( "m3_colorBar_0" ).style.width = "10px";
				document.getElementById( "m3_colorBar_1" ).style.width = "10px";
				document.getElementById( "m3_colorBar_2" ).style.width = "10px";
			}

			function setMeterUnitLabels()
			{
				document.getElementById( "m1_units" ).innerHTML = m1_unitLabel;
				document.getElementById( "m2_units" ).innerHTML = m2_unitLabel;
				document.getElementById( "m3_units" ).innerHTML = m3_unitLabel;
			}

			function setPointerPosition( pointerRef, pointerValue )
			{
				var pointerPosition = 337 - ( pointerValue * 3 );
				if ( pointerPosition < 37 ) { pointerPosition = 37; }
				if ( pointerPosition > 337 ) { pointerPosition = 337; }
				document.getElementById( pointerRef ).style.top = pointerPosition;
			}

			function setMeterType( meterName, paramCount )
			{
				switch( paramCount )
				{
					case 1:

					  document.getElementById( meterName + "_colorBar_1" ).style.display = "none";
					  document.getElementById( meterName + "_colorBar_2" ).style.display = "none";
					  document.getElementById( meterName + "_pointer_1"  ).style.display = "none";
					  document.getElementById( meterName + "_pointer_2"  ).style.display = "none";

					  document.getElementById( meterName + "_colorBar_0" ).style.left = "25px";
					  document.getElementById( meterName + "_pointer_0" ).style.left = "24px";
					  document.getElementById( meterName + "_y_tick" ).style.left = "28px";
					  document.getElementById( meterName + "_y_label" ).style.left = "34px";
					  break;

					case 2:

					  document.getElementById( meterName + "_colorBar_2" ).style.display = "none";
					  document.getElementById( meterName + "_pointer_2"  ).style.display = "none";
					  break;

					case 3:

					  break;

					default:
				}
			}

			function paintColorBar( colorArray, percentArray )
			{
				for ( i = 0; i < colorArray.length; i++ )
				{
					var pxHeight = percentArray[i] * 3;
					document.write("<div style='height:" + pxHeight + "; background-color:" + colorArray[i] + ";'></div>");
				}
			}

			function paintYlabels( min, max )
			{
				var yInc = ( max - min ) / 10;
				for ( i = 0; i <= 10; i++ )	{ document.write("<div id='y_label_" + i + "' class='y_label'>" + ( max - ( yInc * i ) ) + "</div>"); }
			}

			function paintYticks()
			{
				for ( i = 0; i <= 10; i++ )	{ document.write("<div id='y_tick_" + i + "' class='y_tick'></div>"); }
			}

		</script>

	</head>

	<body style='font-family:arial; font-size:8pt; margin-left:0px; margin-top:0px; margin-right:7px;' onLoad="initMeters(); makeRequest('overviewData.asp');">

		<form name='home_overview_css' action='home_overview_css.htm' method='post'>

			<div id='leftContainer' style='position:relative; top:0px;'>

				<!-- meter 1 -->

					<div id='m1_header' class='meterHeader' style='left:20px;'><% DMPrintMeterConfig( 1, "$2");%></div>
					<div id='m1_meterContainer' class='meterContainer' style='left:20px;'>
						<div id='m1_units' style='position:relative; top:10px; left:5px; width:80px; height:20px; background-color:ffffff; text-align:center;'></div>
						<div id='m1_colorBar_0' class='colorBar'  style='left:16px;'><script language='javascript'>paintColorBar( m1_colors, m1_percent );</script></div>
						<div id='m1_colorBar_1' class='colorBar'  style='left:18px;'><script language='javascript'>paintColorBar( m1_colors, m1_percent );</script></div>
						<div id='m1_colorBar_2' class='colorBar'  style='left:20px;'><script language='javascript'>paintColorBar( m1_colors, m1_percent );</script></div>
						<div id='m1_pointer_0'  class='pointer'   style='left:15px;'></div>
						<div id='m1_pointer_1'  class='pointer'   style='left:27px;'></div>
						<div id='m1_pointer_2'  class='pointer'   style='left:39px;'></div>
						<div id='m1_y_tick'     class='tickContainer' ><script language='javascript'>paintYticks();</script></div>
						<div id='m1_y_label'    class='labelContainer'><script language='javascript'>paintYlabels( m1_yMin, m1_yMax );</script></div>
						<div id='m1_value' style='position:absolute; top:354px; left:5px; width:80px; height:15px; background-color:ffffff; text-align:center; padding-top:3px; padding-bottom:3px;'></div>
					</div>

				<!-- meter 2 -->

					<div id='m2_header' class='meterHeader' style='left:120px;'><% DMPrintMeterConfig( 2, "$2");%></div>
					<div id='m2_meterContainer' class='meterContainer' style='left:120px;'>
						<div id='m2_units' style='position:relative; top:10px; left:5px; width:80px; height:20px; background-color:ffffff; text-align:center;'></div>
						<div id='m2_colorBar_0' class='colorBar'  style='left:16px;'><script language='javascript'>paintColorBar( m2_colors, m2_percent );</script></div>
						<div id='m2_colorBar_1' class='colorBar'  style='left:18px;'><script language='javascript'>paintColorBar( m2_colors, m2_percent );</script></div>
						<div id='m2_colorBar_2' class='colorBar'  style='left:20px;'><script language='javascript'>paintColorBar( m2_colors, m2_percent );</script></div>
						<div id='m2_pointer_0'  class='pointer'   style='left:15px;'></div>
						<div id='m2_pointer_1'  class='pointer'   style='left:27px;'></div>
						<div id='m2_pointer_2'  class='pointer'   style='left:39px;'></div>
						<div id='m2_y_tick'     class='tickContainer' ><script language='javascript'>paintYticks();</script></div>
						<div id='m2_y_label'    class='labelContainer'><script language='javascript'>paintYlabels( m2_yMin, m2_yMax );</script></div>
						<div id='m2_value' style='position:absolute; top:354px; left:5px; width:80px; height:15px; background-color:ffffff; text-align:center; padding-top:3px; padding-bottom:3px;'></div>
					</div>

				<!-- meter 3 -->

					<div id='m3_header' class='meterHeader' style='left:220px;'><% DMPrintMeterConfig( 3, "$2");%></div>
					<div id='m3_meterContainer' class='meterContainer' style='left:220px;'>
						<div id='m3_units' style='position:relative; top:10px; left:5px; width:80px; height:20px; background-color:ffffff; text-align:center;'></div>
						<div id='m3_colorBar_0' class='colorBar'  style='left:16px;'><script language='javascript'>paintColorBar( m3_colors, m3_percent );</script></div>
						<div id='m3_colorBar_1' class='colorBar'  style='left:18px;'><script language='javascript'>paintColorBar( m3_colors, m3_percent );</script></div>
						<div id='m3_colorBar_2' class='colorBar'  style='left:20px;'><script language='javascript'>paintColorBar( m3_colors, m3_percent );</script></div>
						<div id='m3_pointer_0'  class='pointer'   style='left:15px;'></div>
						<div id='m3_pointer_1'  class='pointer'   style='left:27px;'></div>
						<div id='m3_pointer_2'  class='pointer'   style='left:39px;'></div>
						<div id='m3_y_tick'     class='tickContainer' ><script language='javascript'>paintYticks();</script></div>
						<div id='m3_y_label'    class='labelContainer'><script language='javascript'>paintYlabels( m3_yMin, m3_yMax );</script></div>
						<div id='m3_value' style='position:absolute; top:354px; left:5px; width:80px; height:15px; background-color:#ffffff; text-align:center; padding-top:3px; padding-bottom:3px;'></div>
					</div>

				<!-- end meters -->

			</div>

			<div id='rightContainer' style='position:relative; height:380px; width:430px; top:10px; left:320px;'>

				<table width='100%' border="0" cellpadding="0" cellspacing="0" class="dataTable" id="table_some_unique_id">

					<script language="javascript">

						for ( i = 0; i < sectionLabels.length; i++ )
						{
							document.write("<thead>");
							document.write("<tr class='captionRow'>");
							document.write("<th colspan='3' width='60' style='border-bottom: 1px solid #efefef;'>" + sectionLabels[i] + "</th>");
							document.write("</tr>");

							document.write("<tr class='captionRow'>");
							document.write("<th width='60'>" + sectionColHead[0] + "</th>");
							document.write("<th>" + sectionColHead[1] + "</th>");
							document.write("<th width='120'>" + sectionColHead[2] + "</th>");
							document.write("</tr>");
							document.write("</thead>");

							document.write("<tbody>");

							for ( j = 0; j < sectionRowCount[i]; j++ )
							{
								if ( j > 0 && j % 2 == 1 ) { rowClass = "<tr class='altRowColor' style='height:19px;'>" } else { rowClass = "<tr style='height:19px;'>" }
								document.write(rowClass);
								document.write("<td><img border='0' src='../../CImage/blank.gif' name='s" + i + "r" + j + "c1'></td>");
								document.write("<td><div id='s" + i + "r" + j + "c2'></td>");
								document.write("<td><div id='s" + i + "r" + j + "c3'></div></td>");
								document.write("</tr>");
							}

							document.write("</tbody>");
						}

					</script>

				</table>

			</div>

		</form>

	</body>
</html>