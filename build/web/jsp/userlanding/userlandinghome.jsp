<%-- 
    Document   : userlandinghomepage
    Created on : 3 Jun, 2014, 2:57:33 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <%@taglib  prefix="s" uri="/struts-tags" %>
    </head>
    <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 530px;height: auto;border-radius: 30px 30px 0 0;"><br/>
        <div style="margin-top:40px;margin-left: 45px;position: absolute;font-family: Cambria;"><font style="font: bold 1.45em/1em Cambria;color:#595959;">User Landing</font></div><br/>

           

        <div style=" margin-top: 80px;margin-left: 50px;">
        <table style="margin-left: 25px;margin-top: 0px;">
            <tr>
                <td align="right"><a href="campaignPlanRedirection.action" onmouseout="this.style.color='#595959';" onmouseover="this.style.color='#00a9f1';" style="text-decoration: none;font-weight: normal;color: #595959;font: bold 1.0em/1.25em calibri;position: absolute;margin-top: 11px;margin-left: 50px;position:absolute; white-space: nowrap;" title="Campaign Plan">&nbsp; <u>Campaign Plan</u> &nbsp;</a></td>
                <td align="right"><a href="targetMarketRedirection.action" onmouseout="this.style.color='#595959';" onmouseover="this.style.color='#00a9f1';" style="text-decoration: none;font-weight: normal;color: #595959;font: bold 1.0em/1.25em calibri;position: absolute;margin-top: 11px;margin-left: 251px;position:absolute; white-space: nowrap;" title="Target Market">&nbsp; <u>Target Market</u> &nbsp;</a></td>
                <td align="right"><a href="mediaPlanRedirection.action" onmouseout="this.style.color='#595959';" onmouseover="this.style.color='#00a9f1';" style="text-decoration: none;font-weight: normal;color: #595959;font: bold 1.0em/1.25em calibri;position: absolute;margin-top: 11px;margin-left: 450px;position:absolute; white-space: nowrap;" title="Media Plan">&nbsp; <u>Media Plan</u> &nbsp;</a></td>
                <td align="right"><a href="reportsRedirection.action" onmouseout="this.style.color='#595959';" onmouseover="this.style.color='#00a9f1';" style="text-decoration: none;font-weight: normal;color: #595959;font: bold 1.0em/1.25em calibri;position: absolute;margin-top: 11px;margin-left: 653px;position:absolute; white-space: nowrap;" title="Reports">&nbsp; <u>Reports</u> &nbsp;</a></td>
            </tr>
        </table>    
        <img src="/QuickKlix/images/UserLandingImg/UserLandingImg.png"/>
        
        <table>
            <tr>
                <td align="right"><a href="campaignPlanRedirection.action" title="Campaign Plan"><img src="/QuickKlix/images/UserLandingImg/CPImage.png"  style="margin-top:-235px;margin-left:37px;position:absolute;"/></a></td>
                <td align="right"><a href="targetMarketRedirection.action" title="Target Market"><img src="/QuickKlix/images/UserLandingImg/TMImage.png"  style="margin-top:-235px;margin-left:237px;position:absolute;"/></a></td>
                <td align="right"><a href="mediaPlanRedirection.action" title="Media Plan"><img src="/QuickKlix/images/UserLandingImg/MPImage.png"  style="margin-top:-235px;margin-left:436px;position:absolute;"/></a></td>
                <td align="right"><a href="reportsRedirection.action" title="Reports"><img src="/QuickKlix/images/UserLandingImg/RPImage.png"  style="margin-top:-235px;margin-left:639px;position:absolute;"/></a></td>
            </tr>
        </table>
        
        <div style="margin-top: -90px;margin-left: 40px;">Total Campaigns : <b><font color="#00a9f1"><s:property value="campaignCount"/></font></b></div>
            <div style="margin-top: -25px;margin-left: 245px;">Total Markets : <b><font color="#00a9f1"><s:property value="tmCount"/></font></b></div>
            <div style="margin-top: -25px;margin-left: 450px;">Total Media Plans : <b><font color="#00a9f1"><s:property value="mediaPlanCount"/></font></b></div>
        </div><br/><br/>
        
    </div>
    </div>
    </body>
</html>
