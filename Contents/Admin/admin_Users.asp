<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>
  <script language="javascript1.1" src="../UI_lib.js"></script>
  <script language="javascript1.1">
  <!--
	function setActionType(type)
	{
		document.userForm.actionType.value = type;
	}

	function VerifyData()
	{
		var currentUser = "<% DMPrintUMVariable( "Login"); %>";
		var bNoAdmin = true;

		if (document.userForm.actionType.value == 1)
		{
			for (i=0; i<10; i++)
			{
				if ( eval("document.userForm.name" + i + ".value") == "" )
				{
					if ( eval("document.userForm.userName" + i + ".value") != "" )
					{
						alert( '<%DMTranslate("Entry Error: All users must have a name."); %> ');
						eval("document.userForm.name" + i + ".focus()");
						return false;
					}

					if ( eval("document.userForm.pass" + i + ".value") != ""
						|| eval("document.userForm.rpass" + i + ".value") != ""
						|| eval("document.userForm.admin" + i + ".checked") )
					{
						alert( '<%DMTranslate("Entry Error: Please enter a user name"); %> ');
						eval("document.userForm.name" + i + ".focus()");
						return false;
					}
				}
				else if ( eval("document.userForm.name" + i + ".value") != eval("document.userForm.userName" + i + ".value"))
				{
					if ( eval("document.userForm.pass" + i + ".value") == ""
						|| eval("document.userForm.rpass" + i + ".value") == "" )
					{
						alert( '<%DMTranslate("Entry Error: Please enter a user password for the new user."); %> ');
						eval("document.userForm.pass" + i + ".focus()");
						return false;
					}
				}

				if ( eval("document.userForm.pass" + i + ".value") != eval("document.userForm.rpass" + i + ".value") )
				{
					alert( '<%DMTranslate("Entry Error: The entries for Password and Verify Password do not match. Please re-enter."); %> ');
					eval("document.userForm.pass" + i + ".value = ''");
					eval("document.userForm.rpass" + i + ".value = ''");
					return false;
				}

				if ( eval("document.userForm.name" + i + ".value") == currentUser
				&& !eval("document.userForm.admin" + i + ".checked") )
				{
					alert( '<% DMTranslate("Entry Error: You may not change the permissions of your own account."); %>' );
					eval("document.userForm.admin" + i + ".checked = true");
					return false;
				}


				if ( eval("document.userForm.admin" + i + ".checked") )
					bNoAdmin = false;
			}
			if (bNoAdmin)
			{
				alert( '<%DMTranslate("Entry Error: There must be at least one administrator"); %> ');
				return false;
			}

			return true;
		}
		else if (document.userForm.actionType.value == 2)
		{
			var selectedToDelete = false;

			for (i=0; i<10; i++)
			{
				if ( eval("document.userForm.delete" + i + ".checked") )
				{
					if ( eval("document.userForm.name" + i + ".value") == currentUser )
					{
						alert( '<% DMTranslate("Entry Error: You may not delete your own account."); %>' );
						return false;
					}
					selectedToDelete = true;
				}
			}
			if (selectedToDelete)
				return true;
			else
			{
				alert(' <% DMTranslate("Entry Error: There are no users selected for deletion."); %> ');
				return false;
			}
		}
		else
		{
			return false;
		}

		//just in case
		return false;
	}

  //-->
  </script>

</head>

<body topmargin=10 leftmargin=10 rightmargin=5 class=content>

		<br>
		<!-- *** system user form ****************************************************** -->

		<form method="post" action="/goform/formSetUsers" name=userForm onSubmit="return VerifyData();">

		<table width=700 align=center cellspacing=0 cellpadding=0 border=1 class=dialogBackground bordercolor="#000000">
		  <tr>
			 <td valign=top>

				<!-- *** begin dialog box *** -->

				<table width=100% align=center cellspacing=0 cellpadding=0 border=0>

				  <!-- *** header bar *** -->
				  <tr>
					<td>
						<table width=100% align=center cellspacing=0 cellpadding=1 border=0>
							<tr class=dialogHeader>
								<td align=left class=dialogHeader><p style="padding:0px 5px 0px 5px;;">
									<% DMTranslate( "User Accounts"); %>
								</td>
								<td align=right class=dialogHeader>
									<input type=button value="&nbsp;&nbsp;<% DMTranslate( "Help"); %>&nbsp;&nbsp;" onClick="pageHelp( 'User+Accounts')";>
								</td>
							</tr>
						</table>
					</td>
				  </tr>

				  <!-- *** dialog box content *** -->
				  <tr>
					 <td>
						<table width=100% align=center cellspacing=5 cellpadding=1 border=0>

						  <!-- *** rows of various controls *** -->

						  <tr>
							 <td align=center width=100% valign=top>

							 	<table width=100% cellspacing=5 cellpadding=0 border=0>
							 		<tr>
							 			<td align=center valign=top>

												<table width=100% cellspacing=1 cellpadding=2 border="0" class=dialogCellLine>
													<tr class=dialogColHeader>
													  <td align=center>
															<b>
																<%DMTranslate( "Delete"); %>
															</b>
													  </td>
													  <td align=center>
															<b>
																<% DMTranslate( "Name"); %>
															</b>
														</td>
													  <td align=center>
															<b>
																<% DMTranslate( "Password"); %>
															</b>
														</td>
													  <td align=center>
															<b>
																<% DMTranslate( "Verify Password"); %>
															</b>
														</td>
													  <td align=center>
															<b>
																<% DMTranslate( "Administrator"); %>
															</b>
														</td>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 0, "
													  <td align=center ><input type=checkbox name=delete0></td>
													  <td align=center ><input maxLength=20 name=name0 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass0 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass0 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin0 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 1, "
													  <td align=center ><input type=checkbox name=delete1></td>
													  <td align=center ><input maxLength=20 name=name1 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass1 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass1 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin1 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 2, "
													  <td align=center ><input type=checkbox name=delete2></td>
													  <td align=center ><input maxLength=20 name=name2 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass2 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass2 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin2 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 3, "
													  <td align=center ><input type=checkbox name=delete3></td>
													  <td align=center ><input maxLength=20 name=name3 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass3 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass3 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin3 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 4, "
													  <td align=center ><input type=checkbox name=delete4></td>
													  <td align=center ><input maxLength=20 name=name4 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass4 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass4 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin4 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 5, "
													  <td align=center ><input type=checkbox name=delete5></td>
													  <td align=center ><input maxLength=20 name=name5 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass5 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass5 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin5 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 6, "
													  <td align=center ><input type=checkbox name=delete6></td>
													  <td align=center ><input maxLength=20 name=name6 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass6 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass6 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin6 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 7, "
													  <td align=center ><input type=checkbox name=delete7></td>
													  <td align=center ><input maxLength=20 name=name7 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass7 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass7 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin7 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 8, "
													  <td align=center ><input type=checkbox name=delete8></td>
													  <td align=center ><input maxLength=20 name=name8 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass8 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass8 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin8 $2?checked??></td>
														"); %>
													</tr>
													<tr class=dialogLineItem>
														<% DMPrintUser( 9, "
													  <td align=center ><input type=checkbox name=delete9></td>
													  <td align=center ><input maxLength=20 name=name9 size=15 value=\"$0\"></td>
													  <td align=center ><input maxLength=20 name=pass9 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input maxLength=20 name=rpass9 type=password size=15 value=\"$1\"></td>
													  <td align=center ><input type=checkbox name=admin9 $2?checked??></td>
														"); %>
													</tr>
												 </table>

											</td>
										</tr>

										<tr>
											<td align=center colspan=4>
												<input type=hidden name=actionType>
												<% DMPrintUser( 0, "<input type=hidden name=userName0 value=\"$0\">");%>
												<% DMPrintUser( 1, "<input type=hidden name=userName1 value=\"$0\">");%>
												<% DMPrintUser( 2, "<input type=hidden name=userName2 value=\"$0\">");%>
												<% DMPrintUser( 3, "<input type=hidden name=userName3 value=\"$0\">");%>
												<% DMPrintUser( 4, "<input type=hidden name=userName4 value=\"$0\">");%>
												<% DMPrintUser( 5, "<input type=hidden name=userName5 value=\"$0\">");%>
												<% DMPrintUser( 6, "<input type=hidden name=userName6 value=\"$0\">");%>
												<% DMPrintUser( 7, "<input type=hidden name=userName7 value=\"$0\">");%>
												<% DMPrintUser( 8, "<input type=hidden name=userName8 value=\"$0\">");%>
												<% DMPrintUser( 9, "<input type=hidden name=userName9 value=\"$0\">");%>
												<input type=hidden name=currentUser value="<% DMPrintUMVariable( "Login"); %>">
												<input type=submit value="<% DMTranslate( "Save Changes"); %>" onClick="setActionType(1);">&nbsp;&nbsp;
												<input type=submit value="<% DMTranslate( "Delete Selected Users"); %>" onClick="setActionType(2);">&nbsp;&nbsp;
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

		</form>

</body>
</html>

