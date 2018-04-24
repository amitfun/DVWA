<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>

   <script language="javascript1.1" src="../pickdate.js"></script>
   <script language="javascript1.1" src="../UI_lib.js"></script>
   <script language="javascript1.1">
   	<!--
		function DaysSince1970(year, month, day)
		{


			var daysPerMonth = new Array(12);

			// calculate the number of days since 1970 
			days = (year - 1970) * 365;

			// add in the leap days. 
			days += parseInt((year - 1 - 1972) / 4, 10) -  parseInt((year - 1  - 1972) / 100, 10);

			daysPerMonth[0] = 31;
			daysPerMonth[1] = 28;	// Feb
			daysPerMonth[2] = 31;	// Mar
			daysPerMonth[3] = 30;	// Apr
			daysPerMonth[4] = 31;	// May
			daysPerMonth[5] = 30;	// Jun
			daysPerMonth[6] = 31;	// Jul
			daysPerMonth[7] = 31;	// Aug
			daysPerMonth[8] = 30;	// Sep
			daysPerMonth[9] = 31;	// Oct
			daysPerMonth[10] = 30;	// Nov
			daysPerMonth[11] = 31;	// Dec  // this one is never used. 

			for ( i =0; i < month - 1; i++)
			{
				days += daysPerMonth[i];


			}

			// add leap day from this year if applicable. 

			if ( month > 2  && 0 == parseInt(year, 10) % 4)
			{
				days += 1;
			}

			days += parseInt(day, 10);
			return days;
		}


		function Once() 
		{
			var DateTimeSelector = '<b><% DMTranslate( "Date"); %></b>&nbsp;<br><input type=text name=shutdownDate maxLength=19 size=15 disabled><a href="';
				DateTimeSelector += "javascript:show_calendar('ScheduleForm.shutdownDate');";
				DateTimeSelector += '" onmouseover="window.status=';
				DateTimeSelector += "'Date Picker'";
				DateTimeSelector += ';return true;" onmouseout="window.status=';
				DateTimeSelector += "''";
				DateTimeSelector += ';return true;"><img src="../Images/mini_cal.gif" width=21 height=17 border=0></a>';

			var DateTimeSelector2 = '<b><% DMTranslate( "Date"); %></b>&nbsp;<br><input type=text name=restartDate maxLength=19 size=15 disabled><a href="';
				DateTimeSelector2 += "javascript:show_calendar('ScheduleForm.restartDate');";
				DateTimeSelector2 += '" onmouseover="window.status=';
				DateTimeSelector2 += "'Date Picker'";
				DateTimeSelector2 += ';return true;" onmouseout="window.status=';
				DateTimeSelector2 += "''";
				DateTimeSelector2 += ';return true;"><img src="../Images/mini_cal.gif" width=21 height=17 border=0></a>';


			document.getElementById('ShutdownDiv').innerHTML=DateTimeSelector;
			document.getElementById('RestartDiv').innerHTML=DateTimeSelector2;

		}
		function Daily() 
		{
			var DaySelect = '&nbsp;<br>';
				DaySelect += '<SELECT NAME="Day" ID="Day">';
				DaySelect += '<OPTION value="Same"><% DMTranslate("Same Day"); %></OPTION>';
				DaySelect += '<OPTION value="Next"><% DMTranslate("Next Day"); %></OPTION>';
				DaySelect += '</SELECT>';

			document.getElementById('ShutdownDiv').innerHTML="";
			document.getElementById('RestartDiv').innerHTML=DaySelect;


		}
		function Weekly() 
		{
			var rest = '<OPTION value="1"><% DMTranslate("Monday"); %></OPTION>';
				rest += '<OPTION value="2"><% DMTranslate( "Tuesday"); %></OPTION>';
				rest += '<OPTION value="3"><% DMTranslate( "Wednesday"); %></OPTION>';
				rest += '<OPTION value="4"><% DMTranslate( "Thursday"); %></OPTION>';
				rest += '<OPTION value="5"><% DMTranslate( "Friday"); %></OPTION>';
				rest += '<OPTION value="6"><% DMTranslate( "Saturday"); %></OPTION>';
				rest += '<OPTION value="0"><% DMTranslate( "Sunday"); %></OPTION>';
				rest += '</SELECT>';

			var DayOfWeekSelect = '<b><% DMTranslate( "Day Of Week"); %></b>&nbsp;<br>';
				DayOfWeekSelect += '<SELECT NAME="DayOfWeek" ID="DayOfWeek">';
				DayOfWeekSelect += rest;


			var DayOfWeekSelect2 = '<b><% DMTranslate( "Day Of Week"); %></b>&nbsp;<br>';
				DayOfWeekSelect2 += '<SELECT NAME="DayOfWeek2" ID="DayOfWeek2">';
				DayOfWeekSelect2 += rest;

			document.getElementById('ShutdownDiv').innerHTML=DayOfWeekSelect;
			document.getElementById('RestartDiv').innerHTML=DayOfWeekSelect2;

		}

		function verifyData()
		{
			var shutdownTimeInMinutes = 0;
			var restartTimeInMinutes = 0;

			shutdownTimeInMinutes = Number(document.ScheduleForm.HOUR.value)* 60;
			shutdownTimeInMinutes = Number(shutdownTimeInMinutes)+ Number(document.ScheduleForm.MINUTE.value);

			restartTimeInMinutes = document.ScheduleForm.HOUR2.value * 60;
			restartTimeInMinutes = restartTimeInMinutes + Number(document.ScheduleForm.MINUTE2.value);

			var offset;
			// add a couple minutes to make sure the UPS will be completely shutdown before the restart. 
			offset = <%DMPrintShutdownTime(0);%> + 2;  
			
			var msg1 = '<%DMTranslate("Entry Error...\\n\\nThe shutdown date and time must be at least ");%>';
			var msg2 = '<%DMTranslate(" minutes before the restart date and time.");%>';
			var msg3 = msg1 + String(offset) + msg2;

			if (document.ScheduleForm.EVENT_TYPE[0].checked && document.ScheduleForm.shutdownDate.value == "")
			{
				alert( '<%DMTranslate("Entry Error...\\n\\nPlease enter a Shutdown Date."); %> ');
				return false;
			}
			else if (document.ScheduleForm.EVENT_TYPE[0].checked && document.ScheduleForm.restartDate.value == "") 
			{
				alert( '<%DMTranslate("Entry Error...\\n\\nPlease enter an Restart Date."); %> ');
				return false;
			}
			else if (document.ScheduleForm.EVENT_TYPE[1].checked)  // daily
			{
				if (document.ScheduleForm.Day.value == "Same")
				{
					if ( restartTimeInMinutes < shutdownTimeInMinutes + offset)
					{
						alert(String(msg3));
						return false;
					}
				}
				else
				{
					var t = 1440 - Number( shutdownTimeInMinutes);
					t = Number( t) + Number( restartTimeInMinutes);
					if ( Number( t) < Number(offset))
					{
						alert(String(msg3));
						return false;
					}
				}
			}
			else if (document.ScheduleForm.EVENT_TYPE[0].checked)
			{
				beginOn = document.ScheduleForm.shutdownDate.value;
				imonthdaysep = 0;
				idayyearsep = 0;

				imonthdaysep = beginOn.indexOf("/");
				beginOn = beginOn.substring(imonthdaysep + 1);
				idayyearsep = beginOn.indexOf("/");
				idayyearsep = idayyearsep + imonthdaysep + 1;

				beginOn = document.ScheduleForm.shutdownDate.value;

				month = beginOn.substring(0,imonthdaysep);
				document.ScheduleForm.bMonth.value = month;

				day = beginOn.substring(imonthdaysep+1,idayyearsep);
				document.ScheduleForm.bDay.value = day;

				year = beginOn.substring(idayyearsep+1,beginOn.length);
				document.ScheduleForm.bYear.value = year;

				shutdownDaysSince1970 = DaysSince1970(year, month, day);


				endOn = document.ScheduleForm.restartDate.value;

				imonthdaysep = endOn.indexOf("/");
				beginOn = endOn.substring(imonthdaysep + 1);
				idayyearsep = endOn.indexOf("/");
				idayyearsep = idayyearsep + imonthdaysep + 1;

				endOn = document.ScheduleForm.restartDate.value;

				document.ScheduleForm.eMonth.value = endOn.substring(0,imonthdaysep);
				document.ScheduleForm.eDay.value = endOn.substring(imonthdaysep+1,idayyearsep);
				document.ScheduleForm.eYear.value = endOn.substring(idayyearsep+1,endOn.length);

				restartDaysSince1970  = DaysSince1970(document.ScheduleForm.eYear.value, 
				                                      document.ScheduleForm.eMonth.value, 
													  document.ScheduleForm.eDay.value);



				if ( restartDaysSince1970 < shutdownDaysSince1970 || 
					 ( restartDaysSince1970 == shutdownDaysSince1970 
					   && ( restartTimeInMinutes < shutdownTimeInMinutes + offset)) )
				{
					alert(String(msg3));
					return false;
				}
				else if (Number(restartDaysSince1970) == (Number( shutdownDaysSince1970) + 1))
				{
					var t = 1440 - Number( shutdownTimeInMinutes);
					t = Number( t) + Number( restartTimeInMinutes);
					if ( Number( t) < Number(offset))
					{
						alert(String(msg3));
						return false;
					}
				}
				
				shutdownDaysSince1970 = parseInt(shutdownDaysSince1970, 10) + parseInt(45, 10);
				if (restartDaysSince1970 > shutdownDaysSince1970)
				{
					alert( '<%DMTranslate("Entry Error...\\n\\nThe restart date must be less than 45 days after the shutdown date."); %> ');
					return false;
				}
			}
			else
			{
				var days = parseInt( document.ScheduleForm.DayOfWeek.value);
				var dayr = parseInt( document.ScheduleForm.DayOfWeek2.value);

				if (days == dayr && restartTimeInMinutes < (shutdownTimeInMinutes + offset))
				{
					alert(String(msg3));
					return false;
				}
				else if ((days + 1) == dayr && (restartTimeInMinutes + 24 * 60) < (shutdownTimeInMinutes + offset))
				{
					alert(String(msg3));
					return false;
				}
				
				return true;
			}
		}






	//-->
	</script>



</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>
<form action='/goform/formAddScheduledEvent' method='POST' name=ScheduleForm onSubmit="return verifyData();">

		<center>
		<table width=100% align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
		  <tr>
			 <td valign=top>

				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				  <!-- *** header bar *** -->
				  <tr>
					<td>
						<table width=100% align=center cellspacing=0 cellpadding=2 border=0>
							<tr>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;"><% DMTranslate( "Scheduled Shutdown"); %></td>
							<td align=right class=dialogHeader>
								<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'Add Scheduled Shutdown')";>
							</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
					 	<table width=100% cellspacing=10 cellpadding=0 border=0 class=dialogBackground>
					 	  <tr>
					 		 <td>

								
								<table align=center cellspacing=1 cellpadding=2 border=0  class=dialogCellLine>
								  <tr class=dialogColHeader>
									<td align=center width=200><b><% DMTranslate( "Frequency"); %></b>&nbsp;</td>
									<td align=center width=400><b><% DMTranslate( "Shutdown"); %></b>&nbsp;</td>

								  </tr>
								  <tr class=dialogLineItem valign=top>
									<td align=left rowspan=3 width=200 >&nbsp;<br>
									&nbsp;&nbsp;<% DMTranslate( "Entire UPS"); %><p>
									
									  &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" NAME="EVENT_TYPE" onclick="Once();" value="ONCE" checked> <% DMTranslate( "One Time"); %><br>
									  &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" NAME="EVENT_TYPE" onclick="Daily();" value="DAILY"> <% DMTranslate( "Daily"); %><br>
									  &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" NAME="EVENT_TYPE" onclick="Weekly();" value="WEEKLY"> <% DMTranslate( "Weekly"); %>&nbsp;
									</td>
									<td align=center >

									<table >
									<tr class=dialogLineItem height=50>
									<td  align=center>

										<div ID="ShutdownDiv" >
										</div>

									  </td>
									  <td align=center>
										<b><%DMTranslate( "Time");%></b><br>&nbsp;&nbsp;&nbsp;
										<SELECT id="HOUR" name="HOUR">

											<OPTION VALUE="0">0</OPTION>
											<OPTION VALUE="1" SELECTED>1</OPTION>
											<OPTION VALUE="2">2</OPTION>
											<OPTION VALUE="3">3</OPTION>
											<OPTION VALUE="4">4</OPTION>
											<OPTION VALUE="5">5</OPTION>
											<OPTION VALUE="6">6</OPTION>
											<OPTION VALUE="7">7</OPTION>
											<OPTION VALUE="8">8</OPTION>
											<OPTION VALUE="9">9</OPTION>
											<OPTION VALUE="10">10</OPTION>
											<OPTION VALUE="11">11</OPTION>
											<OPTION VALUE="12">12</OPTION>
											<OPTION VALUE="13">13</OPTION>
											<OPTION VALUE="14">14</OPTION>
											<OPTION VALUE="15">15</OPTION>
											<OPTION VALUE="16">16</OPTION>
											<OPTION VALUE="17">17</OPTION>
											<OPTION VALUE="18">18</OPTION>
											<OPTION VALUE="19">19</OPTION>
											<OPTION VALUE="20">20</OPTION>
											<OPTION VALUE="21">21</OPTION>
											<OPTION VALUE="22">22</OPTION>
											<OPTION VALUE="23">23</OPTION>
										</SELECT>
										:
										<SELECT id="MINUTE" name="MINUTE">
											<OPTION VALUE="00">00</OPTION>
											<OPTION VALUE="01">01</OPTION>
											<OPTION VALUE="02">02</OPTION>
											<OPTION VALUE="03">03</OPTION>
											<OPTION VALUE="04">04</OPTION>
											<OPTION VALUE="05">05</OPTION>
											<OPTION VALUE="06">06</OPTION>
											<OPTION VALUE="07">07</OPTION>
											<OPTION VALUE="08">08</OPTION>
											<OPTION VALUE="09">09</OPTION>
											<OPTION VALUE="10">10</OPTION>
											<OPTION VALUE="11">11</OPTION>
											<OPTION VALUE="12">12</OPTION>
											<OPTION VALUE="13">13</OPTION>
											<OPTION VALUE="14">14</OPTION>
											<OPTION VALUE="15">15</OPTION>
											<OPTION VALUE="16">16</OPTION>
											<OPTION VALUE="17">17</OPTION>
											<OPTION VALUE="18">18</OPTION>
											<OPTION VALUE="19">19</OPTION>
											<OPTION VALUE="20">20</OPTION>
											<OPTION VALUE="21">21</OPTION>
											<OPTION VALUE="22">22</OPTION>
											<OPTION VALUE="23">23</OPTION>
											<OPTION VALUE="24">24</OPTION>
											<OPTION VALUE="25">25</OPTION>
											<OPTION VALUE="26">26</OPTION>
											<OPTION VALUE="27">27</OPTION>
											<OPTION VALUE="28">28</OPTION>
											<OPTION VALUE="29">29</OPTION>
											<OPTION VALUE="30">30</OPTION>
											<OPTION VALUE="31">31</OPTION>
											<OPTION VALUE="32">32</OPTION>
											<OPTION VALUE="33">33</OPTION>
											<OPTION VALUE="34">34</OPTION>
											<OPTION VALUE="35">35</OPTION>
											<OPTION VALUE="36">36</OPTION>
											<OPTION VALUE="37">37</OPTION>
											<OPTION VALUE="38">38</OPTION>
											<OPTION VALUE="39">39</OPTION>
											<OPTION VALUE="40">40</OPTION>
											<OPTION VALUE="41">41</OPTION>
											<OPTION VALUE="42">42</OPTION>
											<OPTION VALUE="43">43</OPTION>
											<OPTION VALUE="44">44</OPTION>
											<OPTION VALUE="45">45</OPTION>
											<OPTION VALUE="46">46</OPTION>
											<OPTION VALUE="47">47</OPTION>
											<OPTION VALUE="48">48</OPTION>
											<OPTION VALUE="49">49</OPTION>
											<OPTION VALUE="50">50</OPTION>
											<OPTION VALUE="51">51</OPTION>
											<OPTION VALUE="52">52</OPTION>
											<OPTION VALUE="53">53</OPTION>
											<OPTION VALUE="54">54</OPTION>
											<OPTION VALUE="55">55</OPTION>
											<OPTION VALUE="56">56</OPTION>
											<OPTION VALUE="57">57</OPTION>
											<OPTION VALUE="58">58</OPTION>
											<OPTION VALUE="59">59</OPTION>
										</SELECT>
									  </tr>
									  </table>
									</td>
									<tr class=dialogLineItem>
									<td align=center>
										<b><% DMTranslate( "Restart"); %></b>
									</td>
									</tr>
									<tr class=dialogLineItem height=50>
									<td align=center>
									<table class=dialogLineItem>
									<tr>
									<td align=center>

										<div ID="RestartDiv" >
										</div>

									  </td>
									  <td align=center>
										<b><% DMTranslate( "Time"); %></b><br>&nbsp;&nbsp;&nbsp;
										<SELECT id="HOUR2" name="HOUR2">

											<OPTION VALUE="0">0</OPTION>
											<OPTION VALUE="1" SELECTED>1</OPTION>
											<OPTION VALUE="2">2</OPTION>
											<OPTION VALUE="3">3</OPTION>
											<OPTION VALUE="4">4</OPTION>
											<OPTION VALUE="5">5</OPTION>
											<OPTION VALUE="6">6</OPTION>
											<OPTION VALUE="7">7</OPTION>
											<OPTION VALUE="8">8</OPTION>
											<OPTION VALUE="9">9</OPTION>
											<OPTION VALUE="10">10</OPTION>
											<OPTION VALUE="11">11</OPTION>
											<OPTION VALUE="12">12</OPTION>
											<OPTION VALUE="13">13</OPTION>
											<OPTION VALUE="14">14</OPTION>
											<OPTION VALUE="15">15</OPTION>
											<OPTION VALUE="16">16</OPTION>
											<OPTION VALUE="17">17</OPTION>
											<OPTION VALUE="18">18</OPTION>
											<OPTION VALUE="19">19</OPTION>
											<OPTION VALUE="20">20</OPTION>
											<OPTION VALUE="21">21</OPTION>
											<OPTION VALUE="22">22</OPTION>
											<OPTION VALUE="23">23</OPTION>
										</SELECT>
										:
										<SELECT id="MINUTE2" name="MINUTE2">
											<OPTION VALUE="00">00</OPTION>
											<OPTION VALUE="01">01</OPTION>
											<OPTION VALUE="02">02</OPTION>
											<OPTION VALUE="03">03</OPTION>
											<OPTION VALUE="04">04</OPTION>
											<OPTION VALUE="05">05</OPTION>
											<OPTION VALUE="06">06</OPTION>
											<OPTION VALUE="07">07</OPTION>
											<OPTION VALUE="08">08</OPTION>
											<OPTION VALUE="09">09</OPTION>
											<OPTION VALUE="10">10</OPTION>
											<OPTION VALUE="11">11</OPTION>
											<OPTION VALUE="12">12</OPTION>
											<OPTION VALUE="13">13</OPTION>
											<OPTION VALUE="14">14</OPTION>
											<OPTION VALUE="15">15</OPTION>
											<OPTION VALUE="16">16</OPTION>
											<OPTION VALUE="17">17</OPTION>
											<OPTION VALUE="18">18</OPTION>
											<OPTION VALUE="19">19</OPTION>
											<OPTION VALUE="20">20</OPTION>
											<OPTION VALUE="21">21</OPTION>
											<OPTION VALUE="22">22</OPTION>
											<OPTION VALUE="23">23</OPTION>
											<OPTION VALUE="24">24</OPTION>
											<OPTION VALUE="25">25</OPTION>
											<OPTION VALUE="26">26</OPTION>
											<OPTION VALUE="27">27</OPTION>
											<OPTION VALUE="28">28</OPTION>
											<OPTION VALUE="29">29</OPTION>
											<OPTION VALUE="30">30</OPTION>
											<OPTION VALUE="31">31</OPTION>
											<OPTION VALUE="32">32</OPTION>
											<OPTION VALUE="33">33</OPTION>
											<OPTION VALUE="34">34</OPTION>
											<OPTION VALUE="35">35</OPTION>
											<OPTION VALUE="36">36</OPTION>
											<OPTION VALUE="37">37</OPTION>
											<OPTION VALUE="38">38</OPTION>
											<OPTION VALUE="39">39</OPTION>
											<OPTION VALUE="40">40</OPTION>
											<OPTION VALUE="41">41</OPTION>
											<OPTION VALUE="42">42</OPTION>
											<OPTION VALUE="43">43</OPTION>
											<OPTION VALUE="44">44</OPTION>
											<OPTION VALUE="45">45</OPTION>
											<OPTION VALUE="46">46</OPTION>
											<OPTION VALUE="47">47</OPTION>
											<OPTION VALUE="48">48</OPTION>
											<OPTION VALUE="49">49</OPTION>
											<OPTION VALUE="50">50</OPTION>
											<OPTION VALUE="51">51</OPTION>
											<OPTION VALUE="52">52</OPTION>
											<OPTION VALUE="53">53</OPTION>
											<OPTION VALUE="54">54</OPTION>
											<OPTION VALUE="55">55</OPTION>
											<OPTION VALUE="56">56</OPTION>
											<OPTION VALUE="57">57</OPTION>
											<OPTION VALUE="58">58</OPTION>
											<OPTION VALUE="59">59</OPTION>
										</SELECT>
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
		  <tr><td>
			<center>
			<input type=hidden name=bMonth>
			<input type=hidden name=bDay>
			<input type=hidden name=bYear>
			<input type=hidden name=eMonth>
			<input type=hidden name=eDay>
			<input type=hidden name=eYear>
			<input type=submit  style="font-size:8pt; color:black;;" value='<% DMTranslate( "Add"); %>' name=submit >
			<br>&nbsp;
			</center>
		  </td></tr>

				</table>
			</td>
		  </tr>
		</table>
	</center>

	</form>

	<SCRIPT type="text/javascript">
	<!--
		Once();
		//-->
	</SCRIPT>

</body>
</html>





