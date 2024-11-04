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
            for(var i=0; i < document.mAppsFormName.choices.length; i++)
            {
            document.mAppsFormName.choices[i].checked=true;
            }}
            else{
            for(var i=0; i < document.mAppsFormName.choices.length; i++)
            {
            document.mAppsFormName.choices[i].checked=false;
            }}}
  
       function mobileAppsOsSelection(){
           var ret=true;
           var mAppsFormName="";
           for(var k=0; k < document.mAppsFormName.choices.length; k++)
           {
           if(document.mAppsFormName.choices[k].checked){
           mAppsFormName=document.mAppsFormName.choices[k].value;
           }}
           if(mAppsFormName == ""){
           window.alert("Please select at least one operating system.");
           return false;
           }else{
           ret==true;
           }
           return ret;
           }
      window.onload = function(){
         var dbtab = '<s:property value="mAppchoices"/>';
         var temp=dbtab.split(", ")
         var i;
         for(i=0;i<temp.length;i++){
         if(temp[i]=='Android'){
         document.getElementById("android").style.display = '';
         }
         else if(temp[i]=='Black Berry'){
         document.getElementById("berry").style.display = '';
         }
         else if(temp[i]=='Apple'){
         document.getElementById("apple").style.display = '';
         }
         else if(temp[i]=='Symbian'){
         document.getElementById("symbian").style.display = '';
         }
         else if(temp[i]=='Windows'){
         document.getElementById("windows").style.display = '';
         }}
       }
 </script>
</head>
    <body>
       <div id="container1" style="height: auto;margin-top:0px;">
        <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>
       <div style="margin-top:20px;margin-left: 40px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Operating Systems - </font><font color="#00a9f1" style="font-family: Calibri;font-size: 22px;font-weight: bold;">Mobile Apps</font></div><br/> 
       <s:form action="mobileAppsOSSaving" name="demo">
            <table style="margin-left: 75px;">
               <tbody id="android" style="display: none"> <tr><td></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/AndroidImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.android.com','mywindow')"></div></td><td></td><td><div style=" background-color: #eeece1;width: 600px;height: 80px;margin-left:30px;"><br/><font color="#808080" size="4"><b  style=" margin-left: 50px">ANDROID</b></font><font color="black" size="3" style=" margin-left: 30px"> Company: <b>Google</b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.android.com','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.android.com</a></font></div></td> </tr>
               <tr ><td></td><td></td><td></td><td>
                    <div style=" background-color: #999999;width: 600px;height: 90px;margin-top: -4px;margin-left:30px;"><br/>
                           <font color="white" size="3" style=" margin-left: 5px"><b>Advertisers :</b>&nbsp;<a href="http://www.google.com/ads/mobile/advertisers/" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://www.google.com/ads/mobile/advertisers/</a></font> <br/>
                           <font color="white" size="3" style=" margin-left: 5px"><b>Publishers :</b>&nbsp;&nbsp;<a href="http://www.google.com/ads/mobile/publishers/" target="_blank" style=" margin-left: 3px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://www.google.com/ads/mobile/publishers/</a></font> <br/>
                           <font color="white" size="3" style=" margin-left: 115px">&nbsp;&nbsp;<a href="http://developer.android.com/index.html" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://developer.android.com/index.html</a></font> <br/>
                    </div>
                </td></tr>
                </tbody>

               <tbody id="berry" style="display: none">
               <tr style=" margin-top: -50px;"><td></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/BlackBerryImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.rim.com','mywindow')"></div></td><td></td> <td><div style=" background-color: #eeece1;width: 600px;height: 80px;margin-top: 30px;margin-left:30px;"><br/><font color="#808080" size="4"><b  style=" margin-left: 50px">RIM</b></font><font color="black" size="3" style=" margin-left: 90px">Company: <b>Black Berry</b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.rim.com','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.RIM.com</a></font></div></td></tr>
               <tr><td></td><td></td><td></td><td>
                      <div style=" background-color: #999999;width: 600px;height: 70px;margin-top: -4px;margin-left:30px;"><br/>
                           <font color="white" size="3" style=" margin-left: 94px">&nbsp;<a href="http://us.blackberry.com/developers/platform/adservices/" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://us.blackberry.com/developers/platform/adservices/</a></font> <br/>
                           <font color="white" size="3" style=" margin-left: 94px">&nbsp;<a href="http://us.blackberry.com/developers/started/" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://us.blackberry.com/developers/started/</a></font> <br/>
                       </div>
                     </td></tr>
               </tbody>

           <tbody id="apple" style="display: none">
           <tr><td></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/AppleImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.apple.com/ios','mywindow')"></div></td><td></td><td><div style=" background-color: #eeece1;width: 600px;height: 80px;margin-top: 30px;margin-left:30px;"><br/><font color="#808080" size="4"><b  style=" margin-left: 50px">IOS</b></font><font color="black" size="3" style=" margin-left: 93px">Company: <b><strong>Apple</strong></b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.apple.com/ios','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.apple.com/ios</a></font></div></td></tr>
           <tr ><td></td><td></td><td></td><td>
                   <div style=" background-color: #999999;width: 600px;height: 70px;margin-top: -4px;margin-left:30px;"><br/>
                           <font color="white" size="3" style=" margin-left: 5px"><b>Advertising for Brands :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://advertising.apple.com/brands/" target="_blank" style=" margin-left: 4px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://advertising.apple.com/brands/</a></font> <br/>
                           <font color="white" size="3" style=" margin-left: 5px"><b>Advertising for Developers :</b>&nbsp;<a href="http://advertising.apple.com/developers/" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://advertising.apple.com/developers//</a></font> <br/>
                      </div>
                   </td></tr>
           </tbody>

           <tbody id="symbian" style="display: none">
           <tr><td></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/SymbianImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.symbian.nokia.com','mywindow')"></div></td><td></td><td><div style=" background-color: #eeece1;width: 600px;height: 80px;margin-top: 30px;margin-left:30px;"><br/><font color="#808080" size="4"><b  style=" margin-left: 50px">SYMBIAN</b></font><font color="black" size="3"  style=" margin-left: 35px">Company: <b>Nokia</b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.symbian.nokia.com','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.symbian.nokia.com</a></font></div></td></tr>
           <tr ><td></td><td></td><td></td><td>
                   <div style=" background-color: #999999;width: 600px;height: 70px;margin-top: -4px;margin-left:30px;"><br/>
                           <font color="white" size="3" style=" margin-left: 94px">&nbsp;<a href="http://www.nokia.com/global/about-nokia/developers/" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';">http://www.nokia.com/global/about-nokia/developers/</a></font> <br/>
                           <font color="white" size="3" style=" margin-left: 94px">&nbsp;<a href="http://www.developer.nokia.com/" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://www.developer.nokia.com/</a></font> <br/>
                     </div>
               </td></tr>
           </tbody>

           <tbody id="windows" style="display: none">
           <tr><td></td><td><div style="background-image:url(/QuickKlix/images/mediaplan/mobileapps/WindowsImg.png);height: 45px;width: 100px;cursor: pointer;" onClick="window.open('http://www.microsoft.com/windowsphone','mywindow')"></div></td><td></td><td><div style=" background-color: #eeece1;width: 600px;height: 80px;margin-top: 30px;margin-left:30px;"><br/><font color="#808080" size="4"><b  style=" margin-left: 50px">WINDOWS</b></font><font color="black" size="3" style=" margin-left: 23px">Company: <b>Microsoft</b></font><br/><font size="3"><a href="#" onClick="window.open('http://www.microsoft.com/windowsphone','mywindow')" style=" margin-left: 180px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >www.microsoft.com/windowsphone</a></font></div></td></tr>
           <tr ><td></td><td></td><td></td><td>
                   <div style=" background-color: #999999;width: 600px;height: 70px;margin-top: -4px;margin-left:30px;"><br/>
                           <font color="white" size="3" style=" margin-left: 94px">&nbsp;<a href="http://www.nokia.com/global/about-nokia/developers/" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://advertising.microsoft.com/marketers-agencies/home</a></font> <br/>
                           <font color="white" size="3" style=" margin-left: 94px">&nbsp;<a href="http://www.developer.nokia.com/" target="_blank" style=" margin-left: 0px;text-decoration: none;color: #00a9f1;" onmouseout="this.style.color='#00a9f1';" onmouseover="this.style.color='blue';" >http://advertising.microsoft.com/advertising</a></font> <br/>
                      </div>
               </td></tr>
           </tbody>
      </table>


        <table style="position:absolute;margin-left:95px;margin-top:45px;">
        <tr><td><button type="submit" name="method:backMove" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
        </table>
        <table style="margin-left:620px;margin-top:45px;">
        <tr><td><button type="submit" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" ><font style="top: -2px;position: relative;">GO TO HOME</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
        </table>

    </s:form>
  <br/><br/><br/><br/>
   </div></div>
    </body>
</html>
