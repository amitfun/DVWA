<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<title>Page Template</title>

	<link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>
	<script language="javascript1.1" src="UI_lib.js"></script>
	<script language=javascript>
		<!--
			function isFormComplete()
			{
	  			if ( document.userForm.Password.value != document.userForm.rpass.value )
	  			{
//	     			alert ( "ERROR - Your Input Values for ' Password ' and ' Verify Password ' do not match..." );
//					alert( '<%DMTranslate("Entry Error Verify Password"); %> ');
					alert( '<%DMTranslate("ERROR - Your Input Values for Password and Verify Password do not match."); %> ');
					return false;
				}

				for (var i = 0; i < document.userForm.elements.length; i++)
				{
					if (document.userForm.elements[i].value == "")
					{
						alert( '<%DMTranslate("Entry Error: All Fields on this Form must be Completed"); %> ');
						return false;
					}
				}

				return true;
			}

		//-->
	</script>

</head>

<body class=content topmargin=10 leftmargin=10 rightmargin=5>

		<!-- *** begin my account form ****************************************************** -->

		<br><br>
		<form method="post" action="/goform/formSetMyAccount" name=userForm onSubmit='return isFormComplete();'>

		<center>
		<table width=400 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
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
									<% DMTranslate( "My Account"); %>
								</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick='pageHelp( "My+Account");'>
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
											<table width=100% align=center cellspacing=1 cellpadding=5 border=0 class=dialogCellLine>
							 					<tr class=dialogColHeader>
							 						<td colspan=2 align=center>
														<% DMTranslate( "Login Name"); %>:&nbsp;
														<b>
															<% DMPrintUMVariable( "Login"); %>
														</b>
													</td>
							 					</tr>
							 					<tr class=dialogLineItem>
							 						<td width=50% align=center>
														<% DMTranslate( "Password"); %>
													</td>
							 						<td width=50% align=center><input type=password name=Password size=20 maxLength=20></td>
							 					</tr>
							 					<tr class=dialogLineItem>
							 						<td width=50% align=center>
														<% DMTranslate( "Verify Password"); %>
													</td>
							 						<td width=50% align=center><input type=password name=rpass size=20 maxLength=20></td>
							 					</tr>
							 				</table>
										</td>
									</tr>
									<tr>
										<td colspan=2 align=center>
											<input type=submit value="<% DMTranslate( "Save Changes"); %>">&nbsp;&nbsp;
											</script>
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


