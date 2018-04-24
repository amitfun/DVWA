<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>

	<script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   <!--
		function verifyData()
		{
			if (document.theForm.Load_Shed_Time_Ctrl_Temp.checked)
			{
				document.theForm.Load_Shed_Time_Ctrl.value = "Enabled"
			}
			else
			{
				document.theForm.Load_Shed_Time_Ctrl.value = "Disabled"
			}
			return true;
		}


	//-->
	</script>

</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
	<br>
	<form method="post" action="/goform/formLoadSheddingSettings" name=theForm onSubmit="return verifyData();">
		<center>
		<table width='100%' align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
		  <tr>
			 <td valign=top>

				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				  <!-- *** header bar *** -->
				  <tr>
					<td class=dialogHeader>
						<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
							<tr>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;">
									<%DMTranslate("Load Shedding Settings");%>
									
								</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;Help&nbsp;&nbsp;" onClick="pageHelp( 'Load Shedding Settings')";>
								</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
						<table width=100% align=center cellspacing=5 cellpadding=0 border=0>

						  <!-- *** rows of various controls *** -->

						  <tr>
							 <td align=center width=100% valign=top>

							 	<table width=100% cellspacing=5 cellpadding=0 border=0>
							 		<tr>
							 			<td align=center valign=top>

											<table width='100%' align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>

											  <!-- *** main column headers *** -->

											  <tr class=dialogColHeader>
												<td align=center rowspan='2'>
													<%DMTranslate("Day of Week");%>
												</td>
												<td align=center colspan='2'>
													<%DMTranslate("Load 1");%>
												</td>

												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center colspan='2'>");
														DMTranslate("Load 2");
														write("</td>");		
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center colspan='2'>");
														DMTranslate("Load 3");
														write("</td>");		
												}
												%>

												
											  </tr>

											  <!-- *** sub column headers *** -->

											  <tr class=dialogColHeader>
 												<td align=center><%DMTranslate("On Time");%></td>
												<td align=center><%DMTranslate("Off Time");%></td>

												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center>");
														DMTranslate("On Time");
														write("</td><td align=center>");		
														DMTranslate("Off Time");
														write("</td>");		
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center>");
														DMTranslate("On Time");
														write("</td><td align=center>");		
														DMTranslate("Off Time");
														write("</td>");		
												}
												%>
											  </tr>

											  <!-- *** SUNDAY *** -->

											  <tr class=dialogLineItem>
 												<td align=center><%DMTranslate("Sunday");%></td>

												<%
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Sunday On Time"));
														write("' name='Ld1SuOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Sunday Off Time"));
														write("' name='Ld1SuOffT'></td>");
												%>

												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Sunday On Time"));
														write("' name='Ld2SuOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Sunday Off Time"));
														write("' name='Ld2SuOffT'></td>");
	
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Sunday On Time"));
														write("' name='Ld3SuOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Sunday Off Time"));
														write("' name='Ld3SuOffT'></td>");
												}
												%>
												
											  </tr>

											  <!-- *** MONDAY *** -->

											  <tr class=dialogLineItem>
 												<td align=center><%DMTranslate("Monday");%></td>

												<%
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Monday On Time"));
														write("' name='Ld1MoOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Monday Off Time"));
														write("' name='Ld1MoOffT'></td>");
												%>


												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Monday On Time"));
														write("' name='Ld2MoOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Monday Off Time"));
														write("' name='Ld2MoOffT'></td>");
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Monday On Time"));
														write("' name='Ld3MoOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Monday Off Time"));
														write("' name='Ld3MoOffT'></td>");
												}
												%>
												
											  </tr>

											  <!-- *** TUESDAY *** -->

											  <tr class=dialogLineItem>
 												<td align=center><%DMTranslate("Tuesday");%></td>

												<%
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Tuesday On Time"));
														write("' name='Ld1TuOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Tuesday Off Time"));
														write("' name='Ld1TuOffT'></td>");
												%>

												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Tuesday On Time"));
														write("' name='Ld2TuOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Tuesday Off Time"));
														write("' name='Ld2TuOffT'></td>");
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Tuesday On Time"));
														write("' name='Ld3TuOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Tuesday Off Time"));
														write("' name='Ld3TuOffT'></td>");
												}
												%>
												
											  </tr>

											  <!-- *** WEDNESDAY *** -->

											  <tr class=dialogLineItem>
 												<td align=center><%DMTranslate("Wednesday");%></td>

 												<%
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Wednesday On Time"));
														write("' name='Ld1WeOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Wednesday Off Time"));
														write("' name='Ld1WeOffT'></td>");
												%>


												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Wednesday On Time"));
														write("' name='Ld2WeOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Wednesday Off Time"));
														write("' name='Ld2WeOffT'></td>");
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Wednesday On Time"));
														write("' name='Ld3WeOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Wednesday Off Time"));
														write("' name='Ld3WeOffT'></td>");
												}
												%>
												

											  </tr>

											  <!-- *** THURSDAY *** -->

											  <tr class=dialogLineItem>
 												<td align=center><%DMTranslate("Thursday");%></td>

												<%
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Thursday On Time"));
														write("' name='Ld1ThOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Thursday Off Time"));
														write("' name='Ld1ThOffT'></td>");
												%>

												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Thursday On Time"));
														write("' name='Ld2ThOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Thursday Off Time"));
														write("' name='Ld2ThOffT'></td>");
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Thursday On Time"));
														write("' name='Ld3ThOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Thursday Off Time"));
														write("' name='Ld3ThOffT'></td>");
												}
												%>
												
											  </tr>

											  <!-- *** FRIDAY *** -->

											  <tr class=dialogLineItem>
 												<td align=center><%DMTranslate("Friday");%></td>
												<%
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Friday On Time"));
														write("' name='Ld1FrOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Friday Off Time"));
														write("' name='Ld1FrOffT'></td>");
												%>

												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Friday On Time"));
														write("' name='Ld2FrOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Friday Off Time"));
														write("' name='Ld2FrOffT'></td>");
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Friday On Time"));
														write("' name='Ld3FrOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Friday Off Time"));
														write("' name='Ld3FrOffT'></td>");
												}
												%>
												
											  </tr>

											  <!-- *** SATURDAY *** -->

											  <tr class=dialogLineItem>
 												<td align=center><%DMTranslate("Saturday");%></td>

 												<%
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Saturday On Time"));
														write("' name='Ld1SaOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 1 Saturday Off Time"));
														write("' name='Ld1SaOffT'></td>");
												%>


												<% if (2 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Saturday On Time"));
														write("' name='Ld2SaOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 2 Saturday Off Time"));
														write("' name='Ld2SaOffT'></td>");
												}
												%>

												<% if (3 <=  DMGetUPSVariable("Load Segment Count"))
												{
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Saturday On Time"));
														write("' name='Ld3SaOnT'></td>");
														write("<td align=center><input type='text' size='5' maxlength='5' value='");
														write(DMGetUPSVariable("Load 3 Saturday Off Time"));
														write("' name='Ld3SaOffT'></td>");
												}
												%>
												
											  </tr>


											</table>
										</td>
									</tr>
								    <tr>
								    	<td><br>

											<table width='100%' cellspacing='0' cellpadding='0' border='0'>
												<tr>
													<td align=left>
														<input type="hidden" name="Load_Shed_Time_Ctrl" value="<% write(DMGetUPSVariable("Load Shed Time Ctrl"));%>">
														<input type=checkbox name='Load_Shed_Time_Ctrl_Temp' <% if ("Enabled" ==  DMGetUPSVariable("Load Shed Time Ctrl")) write("checked");%>> &nbsp;&nbsp;<%DMTranslate("Enable Load Shedding Time Controls");%>
													</td>
													<td align=right>
														<input type=submit value="<%DMTranslate("Save Changes");%>">&nbsp;&nbsp;<input type=reset value="<%DMTranslate("Undo Changes");%>">
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

			</td>
		  </tr>
		</table>

		</center>
		</form>
</body>
</html>
