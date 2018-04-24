<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=<%DMTranslate("charset");%>">
	<link rel=stylesheet href=/CStyle/Theme.css type=text/css>

</HEAD>

<BODY class=content rightMargin=5 topMargin=10>

<!-- *** action execute form ****************************************************** -->

<FORM action=login_validate.asp?ID=1 method=post>
<CENTER>
<TABLE align=center class=dialogBackground border=1 borderColor=#000000 cellPadding=0 cellSpacing=0 width=500>
  <TR>
    <TD vAlign=top>
    <!-- *** begin dialog box *** -->
      <TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
      <!-- *** header bar *** -->
        <TR>
          <TD>
            <TABLE align=center border=0 cellPadding=2 cellSpacing=0 width="100%">
              <TR>
                <TD align=left class=dialogHeader>
                  <P style="PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 0px"><% DMTranslate( "Execute Command"); %></P>
                </TD>
              </TR>
            </TABLE>
          </TD>
        </TR>
        <!-- *** dialog box content *** -->
        <TR>
          <TD>
            <TABLE align=center class=dialogBackground border=1 cellPadding=10 cellSpacing=0 width="100%">
            <!-- *** rows of various controls *** -->
              <TR height=150>
                <TD align=middle width="100%">
                	<B>( <% DMTranslate( "No Command Selected"); %> )</B>
                </TD>
              </TR>

            </TABLE>
          </TD>
        </TR>

      </TABLE>

    </TD>
  </TR>

</TABLE>
</CENTER>
</FORM>
</BODY>
</HTML>
