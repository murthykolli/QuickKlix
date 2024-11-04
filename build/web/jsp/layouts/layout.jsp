
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title><tiles:insertAttribute name="title"/></title>
       
    </head>

    <body>
        <div id="layout">
            <div id="top">
                    <tiles:insertAttribute name="header"/>                
                
            </div>
            <div>
                <div id="left" align="left">
                    <tiles:insertAttribute name="left"/>
                </div>
                <div>
                    <div id="right">
                        <tiles:insertAttribute name="right"/>
                    </div>
                    <div class="cen">
                            <tiles:insertAttribute name="body" />
                    </div>
                </div>
            </div>
            <div id="bottom">
                <tiles:insertAttribute name="footer"/>
            </div>
        </div>
    </body>
</html>

