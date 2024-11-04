<%-- 
    Document   : newspapers_City_Selection
    Created on : 4 Jul, 2014, 2:52:49 PM
    Author     : murthyk
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <title>JSP Page</title>
    </head>
    <script type="text/javascript">
        function checkAll(){
            if(document.mAppsFormName.master.checked== true){
            for(var i=0; i < document.mAppsFormName.mAppchoices.length; i++){
            document.mAppsFormName.mAppchoices[i].checked=true;
            }}
            else{
            for(var i=0; i < document.mAppsFormName.mAppchoices.length; i++){
            document.mAppsFormName.mAppchoices[i].checked=false;
            }}}
 
        function mobileAppsOsSelection(){
            var ret=true;
            var mAppsFormName="";
            for(var k=0; k < document.mAppsFormName.mAppchoices.length; k++)
            {
            if(document.mAppsFormName.mAppchoices[k].checked){
            mAppsFormName=document.mAppsFormName.mAppchoices[k].value;
            }}
            if(mAppsFormName == ""){
            window.alert("Please select at least one operating system.");
            return false;
            }else{
            ret==true;
            }
            return ret;
            }
     </script>
   </head>
    <body>
       <div id="container1" style="height: auto;margin-top:0px;">
       <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 600px;height: auto;border-radius: 30px 30px 0 0;"><br/>
       <div style="margin-top:20px;margin-left: 40px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Operating Systems - </font><font color="#00a9f1" style="font-family: Calibri;font-size: 22px;font-weight: bold;">Mobile Apps</font></div><br/> 
       <s:form action="mAppsselectedOperatingSystem" name="mAppsFormName">
            <table style="position: absolute; margin-top: 8px;margin-left:5px;"><tr><td><input type="checkbox" name="master" onclick="checkAll();" style="margin-left: 130px;" value=""></td><td><font color="black" size="2">Select All</font></td></tr></table>
            <table style="margin-left: 130px;">
            <tr><td> <input type="checkbox" name="mAppchoices" value="Android"></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/AndroidImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.android.com','mywindow')"></div></td><td></td><td><div style=" background-color: #eeece1;width: 500px;height: 80px;margin-top: 50px;margin-left:30px;"><br/><font color="#808080" size="4"><b  style=" margin-left: 50px">ANDROID</b></font><font color="black" size="3" style=" margin-left: 30px"> Company: <b>Google</b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.android.com','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.android.com</a></font></div></td></tr>
            <tr style=" margin-top: -50px;"><td><input type="checkbox" name="mAppchoices" value="Black Berry"></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/BlackBerryImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.rim.com','mywindow')"></div></td><td></td><td> <div style=" background-color: #999999;width: 500px;height: 80px;margin-top: 30px;margin-left:30px;"><br/><font color="white" size="4"><b  style=" margin-left: 50px">RIM</b></font><font color="white" size="3" style=" margin-left: 90px">Company: <b>Black Berry</b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.rim.com','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.RIM.com</a></font></div></td></tr>
            <tr><td><input type="checkbox" name="mAppchoices" value="Apple"></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/AppleImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.apple.com/ios','mywindow')"></div></td><td></td><td><div style=" background-color: #eeece1;width: 500px;height: 80px;margin-top: 30px;margin-left:30px;"><br/><font color="#808080" size="4"><b  style=" margin-left: 50px">IOS</b></font><font color="black" size="3" style=" margin-left: 93px">Company: <b><strong>Apple</strong></b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.apple.com/ios','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.apple.com/ios</a></font></div></td></tr>
            <tr><td><input type="checkbox" name="mAppchoices" value="Symbian"></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/SymbianImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.symbian.nokia.com','mywindow')"></div></td><td></td><td><div style=" background-color: #999999;width: 500px;height: 80px;margin-top: 30px;margin-left:30px;"><br/><font color="white" size="4"><b  style=" margin-left: 50px">SYMBIAN</b></font><font color="white" size="3"  style=" margin-left: 35px">Company: <b>Nokia</b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.symbian.nokia.com','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.symbian.nokia.com</a></font></div></td></tr>
            <tr><td><input type="checkbox" name="mAppchoices" value="Windows"></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/WindowsImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.microsoft.com/windowsphone','mywindow')"></div></td><td></td><td><div style=" background-color: #eeece1;width: 500px;height: 80px;margin-top: 30px;margin-left:30px;"><br/><font color="#808080" size="4"><b  style=" margin-left: 50px">WINDOWS</b></font><font color="black" size="3" style=" margin-left: 23px">Company: <b>Microsoft</b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.microsoft.com/windowsphone','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.microsoft.com/windowsphone</a></font></div></td></tr>
            </table>
        <br/><br/>
        <table style="position:absolute;margin-left:130px">
            <tr><td><button type="submit" name="method:backMove" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
        </table>
         <table style="margin-left:680px;">
            <tr><td><button type="submit" onclick="return mobileAppsOsSelection()" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" ><font style="top: -2px;position: relative;">NEXT</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
         </table>
      </s:form>
  <br/><br/><br/><br/>
   </div></div>
    </body>
</html>
