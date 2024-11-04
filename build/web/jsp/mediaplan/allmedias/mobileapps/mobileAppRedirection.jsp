<%-- 
    Document   : mobileAppRedirection
    Created on : 4 Jul, 2014, 2:51:25 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <script src="/QuickKlix/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        $(document).ready(function(){
       var allMediaRed = "<s:property value="allMediaRedirection"/>";
       if(allMediaRed > 0){
       document.getElementById("AllMediasRedirectionId").style.display='block';
       }
          });
        </script>
    </head>
    <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>
    <div style="margin-top:38px;margin-left: 54px;position: absolute;"><font style="font: bold 1.45em/1em Cambria;color:#595959;">Mobile Apps</font></div><br/>
    <table style="margin-left: 24px;margin-top:31px;position: absolute;">
     <tr><td id="AllMediasRedirectionId" style="display: none;border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="allMediasDataSaving.action" title="All Medias" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;All Medias&nbsp;</b></font></a> </td>
     <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="newspapersRedirection.action" title="Newspapers" style="position: relative;top:25px;cursor: pointer;text-decoration: none;" ><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';"><b>&nbsp;Newspapers&nbsp;</b></font></a> </td>
     <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="magazinesRedirection.action" title="Magazines" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;Magazines&nbsp;</b></font></a> </td>
     <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="televisionRedirection.action" title="Television" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;TV&nbsp;</b></font></a> </td>
     <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="radioRedirection.action" title="Radio" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;Radio&nbsp;</b></font></a> </td>
     <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="internetRedirection.action" title="Internet" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;Internet&nbsp;</b></font></a> </td>
     <td style="border-bottom: 27px solid #7e7e7e;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="mobileAppsRedirection.action" title="Mobile Apps" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="white" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='white';" ><b>&nbsp;Mobile Apps&nbsp;</b></font></a> </td>
      </tr>
      </table>
      <div style="background: white;border-top:  solid 3px #d0d0d0;border-bottom:  solid 2px #d0d0d0;border-left:  solid 2px #d0d0d0;border-right:  solid 2px #d0d0d0;box-shadow: 4px 4px 1px #dddddd;width: 902px;margin-left: 25px;margin-top: 82px;height: auto;">
      <div style=" min-height: 305px;">
      <div style=" margin-top: 20px;margin-left: 27px;"><font style="font: bold 1.5em/1.25em Cambria; color: #00a9f1;"><a  href="selectByMobileAppsOsCategory.action" style="color:#00a9f1;" onmouseover="this.style.color='blue';" onmouseout="this.style.color='#00a9f1';"><b><u>Select by Operating System</u></b></a></font><font style="font: bold 1.5em/1.25em Cambria; color: #595959;"><b>&nbsp;&nbsp;or&nbsp;&nbsp;</b></font><font style="font: bold 1.5em/1.25em Cambria; color: #00a9f1;"><a href="selectByMobileAppsCategory.action" style="color:#00a9f1;" onmouseover="this.style.color='blue';" onmouseout="this.style.color='#00a9f1';"><b><u>by Apps Category</u></b></a></font></div><br/><br/>
      <img src="/QuickKlix/images/mediaplan/mobileAppsImg.png" style="margin-left: 680px;margin-top: -40px;" alt="Mobile Apps"/>
      <div style=" margin-top: -243px;">
      <p style="color: #242424;margin-left: 27px;margin-top: -15px;width: 620px;text-align: justify;font: 1.1em/1.25em sans-serif;">
      Choosing to place adds in a particular operating system allows you to reach a broader audience within an operating system.</p>
      <p style="color: #242424;margin-left: 27px;margin-top: 15px;width: 620px;text-align: justify;font: 1.1em/1.25em sans-serif;">Selecting mobile apps according to an apps category will allow you to choose ad placements within a specific genre of apps enabling you to target a specific audience.</p> 
      <p style="color: #242424;margin-left: 27px;margin-top: 15px;width: 620px;text-align: justify;font: 1.1em/1.25em sans-serif;">If you would like to select mobile apps for your media plan using both methods, select one method first, make your selections using that method and save them to your media plan. Then you can use the second method to make more selections.</p> 
        
      </div><br></div><br>
      </div>
      <br/><br/><br/><br/><br/><br/>
    </div>
    </div>
</body>
</html>