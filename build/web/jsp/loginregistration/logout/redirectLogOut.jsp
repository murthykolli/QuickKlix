<%-- 
    Document   : redirectLogOut
    Created on : 17 Jun, 2014, 3:09:47 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  language="java" session="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="Expires" content="-1">
        <meta http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="refresh" content="0; url=&#39;/QuickKlix/quickklixLogin.action&#39;"/>
        <link rel="shortcut icon" href="/QuickKlix/images/TabIcons/favicon.ico" type="image/x-icon" />

        <%
                    response.setHeader("Pragma", "no-cache");
                    response.setHeader("Cache-Control", "no-cache");
                    response.setDateHeader("Expires", 0);
        %>
    </head>
    <body onload="cookieonload()">
        <%HttpSession sn = request.getSession();
                    sn.removeAttribute("userName");
                    sn.removeAttribute("userName");
                    sn.invalidate();
        %>

        <script>
            var Backlen=history.length;   history.go(-Backlen);
            location.replace("/QuickKlix/jsp/loginregistration/logout/redirectLogoutForward.jsp");
            javascript:window.history.forword();
            javascript:window.history.go(1);
        </script>


    </body>
</html>