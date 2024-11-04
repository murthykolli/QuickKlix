<%-- 
    Document   : reports_redirection
    Created on : 9 Sep, 2014, 4:56:02 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
    </head>
    <body class="body_page">
        <div id="container1" style="height: auto;margin-top:0px;">
        <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 510px;height: auto;border-radius: 30px 30px 0 0;"><br/>

            <div style="margin-top:40px;margin-left: 45px;position: absolute;font-family: Cambria;"><font style="font: bold 1.45em/1em Cambria;color:#595959;">Reports</font></div><br/>

            <p style="margin-left: 45px;margin-top: 80px;width: 580px;color: #242424;font: 1.1em/1.25em sans-serif;text-align: justify;">User Reports cluster information from all of your Campaign Plans and all of your clients in one place. This allows you to view your work and progress thus far in one place.</p>
            <p style="margin-left: 45px;margin-top: 25px;width: 580px;color: #242424;font: 1.1em/1.25em sans-serif;text-align: justify;">Client Reports offers interactive graphs and charts in order to provide a more in-depth perspective of each step of the entire Campaign Plan for each individual client.</p>
            <p style="margin-left: 45px;margin-top: 25px;width: 580px;color: #242424;font: 1.1em/1.25em sans-serif;text-align: justify;">Reports are also available in PDF format. This enables you to save and print them at your convenience.</p>

            <img src="/QuickKlix/images/reports/ReportsampleImg.png" style="margin-left: 675px;margin-top: -250px;position: absolute;"/>

            <div style="margin-left: 470px;margin-top: 30px;"><a href="userReportsRedirection.action" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='#595959';" style="text-decoration: none;font-weight: normal;color: #00a9f1;font: bold 1.4em/1.25em calibri;" title="Continue">&nbsp; Continue &nbsp;</a><img src="/QuickKlix/images/CampaignPlan/continueButtonImg.png" style="margin-left: -5px;margin-top: 2px;position:absolute;"/></div>

            <form action="reportsHome" name="reportsFormName" id="reportsFormId"></form>

        </div>
        </div>
    </body>
</html>