<%-- 
    Document   : contactheader
    Created on : 26 Jun, 2014, 5:07:19 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
	<link type="text/css" rel="stylesheet" href="/QuickKlix/CSS/loginRegistration.css" />
    </head>

<body>

    <div id="quickklix_container">
    <div id="quickklix_banner"  align="left">
        <div id="logo" style="margin-left: 0px;margin-top: 10px;margin-left:9px;">
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="239" height="60">
                <param name="movie" value="images/logo.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#000000" />
                <param name="wmode" value="transparent" />
                <param name="seamlesstabbing" value="false" />
                <param name="allowscriptaccess" value="samedomain" />
                <param name="quality" value="high" />
                <embed src="images/logo.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="239" height="60"></embed>
              </object>
        </div>

    </div>


    <div id="quickklix_menu">
    <div id="header">
    <ul>
    <li><a href="homePage.action"> HOME</a></li>
    <li><a href="aboutusPage.action">ABOUT US</a></li>
    <%--<li><a href="careersPage.action">Careers</a></li>--%>
    <li><a href="productsPage.action">PRODUCTS</a></li>
    <li><a href="mediaoutletPage.action">MEMBERS</a></li>
    <li><a href="contactusPage.action">CONTACT US</a></li>
    <li><a href="userLogout.action">LOGOUT</a></li>
    </ul>
    </div>
    </div></div>

    <div class="clear"></div>

</body>
</html>