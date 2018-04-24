<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
    <link rel=stylesheet href='/CStyle/Theme.css' type='text/css'>
    <title>Contents</title>
  </head>

  <body class=content topmargin=10 leftmargin=10 rightmargin=5>
    <table width=100% align=left cellspacing=0 cellpadding=5 border=0 bordercolor="#000000">
      <tr>
         <td>
          <table width=100% align=center cellspacing=5 cellpadding=0 border=0>
            <tr>
              <td>
                <b><%DMTranslate("Table of Contents");%></b>
               </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
         <td>
          <table width=100% align=center cellspacing=5 cellpadding=0 border=0>
            <tr>
              <td><b><%DMTranslate("Home Tab");%></b></td>
            </tr>
            <tr>
              <td>
                <table width=100% align=center cellspacing=10 cellpadding=0 border=0>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td>
                    <%  if ("true" == DMIsHpux())
                      {
                        write("<a href='/Contents/PageHelp.asp?Id=Overview+Page' target='_self'>");
                      }
                      else
                      {
                        write("<a href='/Contents/PageHelp.asp?Id=Overview' target='_self'>");
                      }
                    %>

                    <%DMTranslate("Overview");%></a>                    </td>

                  </tr>
                  <%  if ("true" == DMIsHpux())
                    {
                    }
                    else
                    {
                      write("<tr>");
                      write("<td width=10>&nbsp;</td>");
                      write("<td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0>");
                      DMTranslate("Meter Display Tab");
                      write("</td>");
                      write("</tr>");
                      write("<tr>");
                      write("<td width=10>&nbsp;</td>");
                      write("<td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0>");
                      DMTranslate("Alarms Tab");
                      write("</td>");
                      write("</tr>");
                    }
                  %>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=Alarms' target='_self'><%DMTranslate("Alarms");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=Identification' target='_self'><%DMTranslate("Identification");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=UPS+Parameters' target='_self'><%DMTranslate("Parameters");%></a></td>
                  </tr>
                  <% if ("UPS" == DMGetSkinString( "DevType", "UPS"))
                  {
                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=Attached+Device' target='_self'>");
                    DMTranslate("Attached Devices");
                    write( "</a></td></tr>");

                    write( "<tr><td width=10>&nbsp;</td><td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0>");
                    DMTranslate("Controlling a Load Segment");
                    write( "</td></tr>");

                    write( "<tr><td width=10>&nbsp;</td><td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0>");
                    DMTranslate("Adding an Attached Device");
                    write( "</td></tr>");

                    write( "<tr><td width=10>&nbsp;</td><td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0>");
                    DMTranslate("Editing or Deleting an Attached Device");
                    write( "</td></tr>");

                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=Power+Fail' target='_self'>");
                    DMTranslate("Power Fail");
                    write( "</a></td></tr>");

                    write( "<tr><td width=10>&nbsp;</td><td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0>");
                    DMTranslate("Configuring the Shutdown Delay for the Management Server Load Segment");
                    write( "</td></tr>");

                    write( "<tr><td width=10>&nbsp;</td><td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0>");
                    DMTranslate("Configuring Shutdown for All Other Load Segments");
                    write( "</td></tr>");

                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=Shutdown+Events' target='_self'>");
                    DMTranslate("Shutdown Events");
                    write( "</a></td></tr>");

                  if ("true" == DMGetSkinBool( "ScheduledShutdown", "false"))
                  {
                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=Scheduled+Shutdown' target='_self'>");
                    DMTranslate("Scheduled Shutdown");
                    write( "</a></td></tr>");
		  }

                  } %>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=Event+Settings' target='_self'><%DMTranslate("Event Settings");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Creating User-Defined Categories");%></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Categorizing Individual Events by Severity");%></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Selecting Notification Actions for Event Categories");%></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=40 height=5 border=0><%DMTranslate("E-mail");%></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=40 height=5 border=0><%DMTranslate("SNMP");%></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=40 height=5 border=0><%DMTranslate("Broadcast");%></td>
                  </tr>
                  <% if ("false" == DMIsContactClosure() && "true" == DMUPSHasCommands())
                  {
                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=Battery+Test' target='_self'>");
                    DMTranslate("Battery Test");
                    write( "</a></td></tr>");
                    write( "<tr><td width=10>&nbsp;</td><td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0>");
                    DMTranslate("Executing the Battery Test Command");
                    write( "</td></tr>");
                  } %>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=Settings' target='_self'><%DMTranslate("Settings");%></a></td>
                  </tr>
                  <%  if ("true" == DMHasLoadShedding())
                  {
                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=Load+Shedding+Settings' target='_self'>");
                    DMTranslate("Load Shedding Settings");
                    write( "</a></td></tr>");
                  }
                  %>

                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
         <td>
          <table width=100% align=center cellspacing=5 cellpadding=0 border=0>
            <tr>
              <td><b><%DMTranslate("Logs Tab");%></b></td>
            </tr>
            <tr>
              <td>
                <table width=100% align=center cellspacing=10 cellpadding=0 border=0>

                    <%  if ("true" != DMIsHpux())
                      {
                        write("<tr>");
                        write("<td width=10>&nbsp;</td>");
                        write("<td><a href='/Contents/PageHelp.asp?Id=UPS+Log+Summary' target='_self'>");
                        DMTranslate("UPS Summary");
                        write("</a></td></tr>");

                      }
                    %>


                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=UPS+Detailed+Log' target='_self'><%DMTranslate("UPS Detailed");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Exporting a UPS Event Log");%></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=UPS+Data+Log' target='_self'><%DMTranslate("UPS Data");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Exporting a UPS Data Log");%></td>
                  </tr>
                  <%if ("true" == DMGetSkinBool( "DataGraphSupport", "true") &&
                        "true" != DMIsHpux())
                  {
                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=UPS+Graphical+Log' target='_self'>");
                    DMTranslate("UPS Graphical Log");
                    write( "</a></td></tr>");
                  }%>
                  <%if ("true" == DMGetSkinBool( "MaintSupport", "true"))
                  {
                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=UPS+Maintenance+Log' target='_self'>");
                    DMTranslate("UPS Maintenance");
                    write( "</a></td></tr>");
                  }%>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=Application+Log' target='_self'><%DMTranslate("Application");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Exporting an Application Log");%></td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
         <td>
          <table width=100% align=center cellspacing=5 cellpadding=0 border=0>
            <tr>
              <td><b><%DMTranslate("Setup Tab");%></b></td>
            </tr>
            <tr>
              <td>
                <table width=100% align=center cellspacing=10 cellpadding=0 border=0>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=My+Account' target='_self'><%DMTranslate("My Account");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=User+Accounts' target='_self'><%DMTranslate("User Accounts");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Adding a User Account");%></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Modifying a User Account");%></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><img src='/Contents/Images/blank.gif' width=20 height=5 border=0><%DMTranslate("Deleting a User Account");%></td>
                  </tr>
                  <%if ("true" == DMGetSkinBool( "UpgradeSupportM", "true"))
                  {
                    write( "<tr><td width=10>&nbsp;</td><td><a href='/Contents/PageHelp.asp?Id=Upgrade' target='_self'>");
                    DMTranslate("Upgrade");
                    write( "</a></td></tr>");
                  }%>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
         <td>
          <table width=100% align=center cellspacing=5 cellpadding=0 border=0>
            <tr>
              <td><b><%DMTranslate("Help Tab");%></b></td>
            </tr>
            <tr>
              <td>
                <table width=100% align=center cellspacing=10 cellpadding=0 border=0>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=About' target='_self'><%DMTranslate("About");%></a></td>
                  </tr>
                  <tr>
                    <td width=10>&nbsp;</td>
                    <td><a href='/Contents/PageHelp.asp?Id=Info' target='_self'><%DMTranslate("Info & Updates");%></a></td>
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
