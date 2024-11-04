<%-- 
    Document   : analyticsheader
    Created on : 3 Jun, 2014, 4:35:29 PM
    Author     : murthyk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval()%>;url=/QuickKlix/sessionTimeOut.action" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
	<link type="text/css" rel="stylesheet" href="/QuickKlix/CSS/loginRegistration.css" />
        <script src="/QuickKlix/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>

        <script type="text/javascript">
        $(document).ready(function(){
               var mediaMemReqType = "<s:property value="mediaMemberRequestType"/>";
               if(mediaMemReqType == "RadioStation"){
               document.getElementById("RadioRequestFormID").style.display='block';
               }
               else if(mediaMemReqType == "Television"){
               document.getElementById("TelevisionRequestFormID").style.display='block';
               }
               else if(mediaMemReqType == "Newspaper"){
               document.getElementById("NewspaperRequestFormID").style.display='block';
               }
               else if(mediaMemReqType == "Magazine"){
               document.getElementById("MagazineRequestFormID").style.display='block';
               }
               else if(mediaMemReqType == "OtherMedia"){
               document.getElementById("OtherMediaRequestFormID").style.display='block';
               }

               else if(mediaMemReqType == null || mediaMemReqType == "" ){
               document.getElementById("subMenuHomeID").style.display='none';
               }
          });
        </script>

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

        <div align="right" style="margin-top: -27px;margin-left: 0px;position: relative;">
        <table style="position: relative;">
            <tr><td><b><font style="color:#00a9f1;font: bold 1em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;">Welcome&nbsp;&nbsp;<font color="#222222"><s:property value="userFirstName"/>&nbsp;<s:property value="userLastName"/></font></font></b></td><td><font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
        <td><img id="docimg01" src="/QuickKlix/images/SSImgs/MyAccountImg.png" style="position:absolute;margin-left:-16px;margin-top:-7px;"/></td><td><a href="userAccountSettings.action" style=" cursor: pointer;text-decoration: none;" title="Account Setting"><font color="#494949" style="margin-left: 0px; margin-top: 0px; font: 1em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;" onMouseOver="this.style.color='#00a9f1';document.getElementById('docimg01').src='/QuickKlix/images/SSImgs/MyAccountMOImg.png';" onMouseOut="this.style.color='#494949';document.getElementById('docimg01').src='/QuickKlix/images/SSImgs/MyAccountImg.png';" > Account Settings&nbsp;&nbsp;</font></a></td><td><font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
        <td><img id="docimg02" src="/QuickKlix/images/logout.png" style="position:absolute;margin-left:-26px;margin-top:-6px;"/></td><td><a title="LogOut" href="userLogout.action" style=" cursor: pointer;color:#00a9f1;"><font  color="#009AD0" style="font: 1em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;text-decoration: underline;" onMouseOver="this.style.color='#494949';document.getElementById('docimg02').src='/QuickKlix/images/logoutMO.png';" onMouseOut="this.style.color='#009AD0';document.getElementById('docimg02').src='/QuickKlix/images/logout.png';" > Logout</font></a></td></tr>
        </table>
        </div>

    </div>


    <div id="quickklix_menu">
    <div id="header">
    <ul>
    <li><a href="userLandingHome.action"> HOME</a>
        <ul id="subMenuHomeID" class="subMenuHome">
        <ul style="float:left;">
            <li id="RadioRequestFormID" style="display:none;" class="subMenuText"><a href="radioRequestForm.action" title="Radio Request Form">Radio Request Form</a></li>
            <li id="TelevisionRequestFormID" style="display:none;" class="subMenuText"><a href="televisionRequestForm.action" title="Television Request Form">Television Request Form</a></li>
            <li id="NewspaperRequestFormID" style="display:none;" class="subMenuText"><a href="newspaperRequestForm.action" title="Newspaper Request Form">Newspaper Request Form</a></li>
            <li id="MagazineRequestFormID" style="display:none;" class="subMenuText"><a href="magazineRequestForm.action" title="Magazine Request Form">Magazine Request Form</a></li>
            <li id="OtherMediaRequestFormID" style="display:none;" class="subMenuText"><a href="otherMediaRequestForm.action" title="Other Media Request Form">Other Media Request Form</a></li>
        </ul>
    </ul> </li>

    <li><a href="campaignPlanRedirection.action">CAMPAIGN PLAN</a>
    <ul class="subMenuCampaignPlan">
        <ul style="float:left;">
        <li class="subMenuText"><a href="manageCampaignsSaving.action" title="Manage Campaigns">Manage Campaigns</a></li><br/>
        <li class="subMenuText"><a href="campaignCreation.action" title="New  Campaign">New  Campaign</a></li><br/>
        <li class="subMenuText"><a href="manageClientsSaving.action" title="Manage  Clients">Manage  Clients</a></li><br/>
        <li class="subMenuText"><a href="clientCreation.action" title="New  Client">New  Client</a></li><br/>
        <li class="subMenuText"><a href="sendInvitation.action" title="Send Invitation">Send Invitation</a></li><br/>
        </ul>
    </ul> </li>

    <li><a href="targetMarketRedirection.action">TARGET MARKET</a>
    <ul class="subMenuTargetMarket">
        <ul style="float:left;">
        <li class="subMenuHead"><font>SELECT BY STATES</font></li><br/>
        <li class="subMenuText"><a href="tmStatesRedirection.action" title="Manage Target Markets">Manage Target Markets</a></li><br/>
        <li class="subMenuText"><a href="tmStatesCreation.action" title="New Target Market">New Target Market</a></li><br/>
        <li class="subMenuHead"><font>SELECT BY CITIES</font></li><br/>
        <li class="subMenuText"><a href="#" title="Manage Target Markets">Manage Target Markets</a></li><br/>
        <li class="subMenuText"><a href="#" title="New Target Market">New Target Market</a></li><br/>
        </ul>
    </ul> </li>

    <li><a href="mediaPlanRedirection.action">MEDIA PLAN</a>
    <ul class="subMenuMediaPlan">
        <ul style="float:left;">
        <li class="subMenuText"><a href="mediaPlanRedirection.action" title="Manage Media Plan">Manage Media Plan</a></li><br/>
        <li class="subMenuText"><a href="mediaPlanCreation.action" title="New  Media Plan">New  Media Plan</a></li><br/>
        </ul>
    </ul> </li>

    <li><a href="reportsRedirection.action">REPORTS</a>
    </li>

    <li><a href="analyticsRedirection" class="current">ANALYTICS</a>
    </li>

    </ul>
    </div>

    </div></div>

    <div class="clear"></div>

</body>
</html>