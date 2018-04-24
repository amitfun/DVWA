nowSelected = "x";
nowTheme = 0;
oldSelected = "x";
oldTheme = 0;

colorTheme1 = new Array(
	"<% DMPrintConfigVar( "MenuBackground"); %>",  //mouseover
	"#ffffff",                                     //mouseover text
	"<% DMPrintConfigVar( "MenuBackground"); %>",  //mouseout bg
	"#ffffff",                                     //mouseout text
	"<% DMPrintConfigVar( "MenuHilite"); %>",      //onclick bg
	"#ffffff");                                    //onclick text

colorArray = new Array( colorTheme1 )

function navBar( tableCellRef, hoverFlag, nowTheme ) 
{
	if ( nowSelected != tableCellRef )
	{
		tableCellRef.style.backgroundColor = hoverFlag ? colorArray[nowTheme][0] : colorArray[nowTheme][2];
		tableCellRef.style.color = hoverFlag ? colorArray[nowTheme][1] : colorArray[nowTheme][3];
	}
	else
	{
		tableCellRef.style.backgroundColor = colorArray[nowTheme][4];
		tableCellRef.style.color = colorArray[nowTheme][5];
	}
}

function navBarClick( tableCellRef, url, nowTheme ) 
{
	oldSelected = nowSelected;
	nowSelected = tableCellRef;
	navBar( tableCellRef, 0, nowTheme );
	if ( oldSelected != "x" )
	{
		navBar( oldSelected, 0, oldTheme );
	}
	oldTheme = nowTheme;
	setContent( url );
}

function navBarClick2( tableCellRef, url, nowTheme ) 
{
	oldSelected = nowSelected;
	nowSelected = tableCellRef;
	navBar( tableCellRef, 0, nowTheme );
	if ( oldSelected != "x" )
	{
		navBar( oldSelected, 0, oldTheme );
	}
	oldTheme = nowTheme;
}


function setContent( url ) 
{
	parent.main.location.href = url;
}

// ----- outside interface -----


function selectTab( tableCellRef, url, nowTheme )
{
	navBarClick( tableCellRef, url, nowTheme );
}

function loadResource( url )
{
	window.location.href = url;
}
