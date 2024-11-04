<%-- 
    Document   : televisionRequestForm
    Created on : 16 Jun, 2014, 4:51:59 PM
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
        <title>JSP Page</title>
        <style>
         input[type="text"], textarea {
         background: none repeat scroll 0 0 white;
         border: 1px solid #7F7F7F;
         border-radius: 5px 5px 5px 5px;
         height: 20px;
        }
        .redTestDisplay{
          color: red;
          font-style: italic;
          font-size: 14px;
        }
        </style>

        <script type="text/javascript">
        $(document).ready(function(){
        $("[name=tvStationState]").val("<s:property value="tvStationState"/>");
        });

        function CheckFirstChar(key, txt){
            if(key == 32 && txt.value.length<=0)
               return false;
           else if(txt.value.length>0)
           {
               if(txt.value.charCodeAt(0) == 32){
                  txt.value=txt.value.substring(1,txt.value.length);
                   return true;}
           }
           return true;
            }

     function phoneFormat (e,input) {
    evt = e || window.event; /* firefox uses reserved object e for event */
    var pressedkey = evt.which || evt.keyCode;
    var BlockedKeyCodes = new Array(0,8,27,13,9); //8 is backspace key
    var len = BlockedKeyCodes.length;
    var block = false;
    var str = '';
    for (i=0; i<len; i++){
        str=BlockedKeyCodes[i].toString();
        if (str.indexOf(pressedkey) >=0 ) block=true;
    }
    if (block) return true;
    s = input.value;
    if (s.charAt(0) =='+') return false;
    filteredValues = '"`!@#$%^&*()_+|~-=\QWERT YUIOP{}ASDFGHJKL:ZXCVBNM<>?qwertyuiop[]asdfghjkl;zxcvbnm,./\\\'';
    var i;
    var returnString = '';
       for (i = 0; i < s.length; i++) {
        var c = s.charAt(i);
        if ((filteredValues.indexOf(c) == -1) & (returnString.length <  12 )) {
            if (returnString.length==3) returnString +='-';
            if (returnString.length==7) returnString +='-';
            returnString += c;
        }
    }
    input.value = returnString;
    return false;
  }

   function numberonly(e, decimal) {
    var key;
    var keychar;
    if (window.event) {
        key = window.event.keyCode;
    }
    else if (e) {
        key = e.which;
    }
    else {
        return true;
    }
    keychar = String.fromCharCode(key);

    if ((key==null) || (key==0) || (key==8) ||  (key==9) || (key==13) || (key==27) ) {
        return true;
    }
    else if ((("0123456789").indexOf(keychar) > -1)) {
        return true;
    }
    else if (decimal && (keychar == ".")) {
        return true;
    }
    else if (keychar == "-") {
        return true;
    }
    else
        return false;
  }

  function numeralsOnly(evt) {
   evt = (evt) ? evt : event;
   var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
   ((evt.which) ? evt.which : 0));
   if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    return false;
   }
   return true;
   }

          function validation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
          var stationName=document.tvstation.tvStationName.value;
          var result = true;
          if(reg.test(stationName)){
          document.getElementById("tvStaNameLabel").removeAttribute("class");
          }
          else{
          document.getElementById("tvStaNameLabel").setAttribute("class","redTestDisplay");
          result=false;
           }
          return result;
          }


          function stationNameValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var stationName=document.tvstation.tvStationName.value;
                if(reg.test(stationName)){
                 document.getElementById("tvStaNameLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaNameLabel").setAttribute("class","redTestDisplay");
                }
                   if(stationName==""){
                        document.getElementById("tvStaNameLabel").removeAttribute("class");
                   }
               }

         function websiteValidation(){
          var reg = /((?:[http|https]\:\/\/|www\.|ftp\:\/\/)(?:[-a-z0-9]+\.)*[-a-z0-9]+.*)/i;
               var website=document.tvstation.tvStationWebsite.value;
                if(reg.test(website)){
                 document.getElementById("tvStaWebsiteLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaWebsiteLabel").setAttribute("class","redTestDisplay");
                }
                   if(website==""){
                        document.getElementById("tvStaWebsiteLabel").removeAttribute("class");
                   }
               }

         function cityValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var city=document.tvstation.tvStationCity.value;
                if(reg.test(city)){
                 document.getElementById("tvStaCityLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaCityLabel").setAttribute("class","redTestDisplay");
                }
                   if(city==""){
                        document.getElementById("tvStaCityLabel").removeAttribute("class");
                   }
               }

         function stateNameValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var stateName=document.tvstation.tvStationState.value;
                if(reg.test(stateName)){
                 document.getElementById("tvStastateLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStastateLabel").setAttribute("class","redTestDisplay");
                }
                   if(stateName==""){
                        document.getElementById("tvStastateLabel").removeAttribute("class");
                   }
               }

       function contactNameValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var name=document.tvstation.tvStationContactName.value;
                if(reg.test(name)){
                 document.getElementById("tvStaContNameLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaContNameLabel").setAttribute("class","redTestDisplay");
                }
                   if(name==""){
                        document.getElementById("tvStaContNameLabel").removeAttribute("class");
                   }
               }

        function phoneValidation(){
          var reg = /^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
               var phoneNo=document.tvstation.tvStationContactNumber.value;
                if(reg.test(phoneNo)){
                 document.getElementById("tvStaConNoLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaConNoLabel").setAttribute("class","redTestDisplay");
                }
                   if(phoneNo==""){
                        document.getElementById("tvStaConNoLabel").removeAttribute("class");
                   }
               }

          function emailValidation(){
          var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
               var email=document.tvstation.tvStationEmail.value;
                if(reg.test(email)){
                 document.getElementById("tvStaConEmailLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaConEmailLabel").setAttribute("class","redTestDisplay");
                }
                   if(email==""){
                        document.getElementById("tvStaConEmailLabel").removeAttribute("class");
                   }
               }

        function stationReachValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var stationReach=document.tvstation.tvStationReach.value;
                if(reg.test(stationReach)){
                 document.getElementById("tvStaReachLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaReachLabel").setAttribute("class","redTestDisplay");
                }
                   if(stationReach==""){
                        document.getElementById("tvStaReachLabel").removeAttribute("class");
                   }
               }

        function demographicsValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var demographics=document.tvstation.tvStationDemographics.value;

                if(reg.test(demographics)){
                 document.getElementById("tvStademograLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStademograLabel").setAttribute("class","redTestDisplay");
                }
                   if(demographics==""){
                        document.getElementById("tvStademograLabel").removeAttribute("class");
                   }
               }

         function adSlotValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var adSlot=document.tvstation.tvStationAdSlot.value;
                if(reg.test(adSlot)){
                 document.getElementById("tvStaAdSlotLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaAdSlotLabel").setAttribute("class","redTestDisplay");
                }
                   if(adSlot==""){
                        document.getElementById("tvStaAdSlotLabel").removeAttribute("class");
                   }
               }

         function adtypeValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var adType=document.tvstation.tvStationAdTypes.value;
                if(reg.test(adType)){
                 document.getElementById("tvStaAdTypeLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("tvStaAdTypeLabel").setAttribute("class","redTestDisplay");
                }
                   if(adType==""){
                        document.getElementById("tvStaAdTypeLabel").removeAttribute("class");
                   }
               }
     </script>

    </head>
    <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>

    <div style="background: white;border-left: solid 8px #d0d0d0;border-right: solid 2px #d0d0d0;width: 888px;margin-left: 25px;margin-top: 50px;height: auto;">
    <div style="background: #858585;height: 35px;margin-left: -1px;width:889px"></div>

    <div style=" min-height: 200px;">
    <div style="margin-top:-34px;margin-left: 14px;position: absolute;width:874px;"><font style="font: bold 1.35em/1em Cambria;color: white;">TV Station Info Request Form </font></div>
    <s:form action="televisionRequestFormSavingAndUpdating" name="tvstation">
    <table style="margin-left: 12px;margin-top:0px;width:865px;text-align: left;">
    <br/>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaNameLabel" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Station Name*:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationName" value="<s:property value="tvStationName"/>" maxlength="50" onblur="stationNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);stationNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaWebsiteLabel" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Station Website:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationWebsite" value="<s:property value="tvStationWebsite"/>" maxlength="100" onblur="websiteValidation();" onkeyup= "CheckFirstChar(event.keyCode, this);websiteValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaCityLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">City:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationCity" value="<s:property value="tvStationCity"/>" maxlength="20" onblur="cityValidation();" onkeyup= "CheckFirstChar(event.keyCode, this);cityValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStastateLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">State:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<s:select name="tvStationState"  cssStyle="margin-top:-32px;margin-left:16px;position:absolute;height:25px;width:300px;background-color: white;border-color: #f4f4f4;border-radius: 2px;border: solid 1px #595959;" list="stateNamesList" headerKey=""   headerValue="---------------Select State---------------"  onblur="magzineStateValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineStateValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaContNameLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Ad Sales Contact Name:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationContactName" value="<s:property value="tvStationContactName"/>" maxlength="60" onblur="contactNameValidation();" onkeyup= "CheckFirstChar(event.keyCode, this);contactNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaConNoLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Number:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationContactNumber" value="<s:property value="tvStationContactNumber"/>" maxlength="12" id="ph" onchange="phoneValidation();" onblur="phoneValidation();" onkeyup="phoneValidation();return phoneFormat (event,ph);"  onkeypress="return numberonly(event,false);" /></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaConEmailLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Email:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationEmail" value="<s:property value="tvStationEmail"/>" maxlength="100" onblur="emailValidation();" onkeyup= "CheckFirstChar(event.keyCode, this);emailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaReachLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Reach of Station:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationReach" value="<s:property value="tvStationReach"/>" onblur="stationReachValidation();" onkeyup= "CheckFirstChar(event.keyCode, this);stationReachValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStademograLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Demographics:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationDemographics" value="<s:property value="tvStationDemographics"/>" maxlength="80" onblur="demographicsValidation();" onkeyup= "CheckFirstChar(event.keyCode, this);demographicsValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaAdSlotLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Available Advertising Slots:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationAdSlot" value="<s:property value="tvStationAdSlot"/>" onblur="adSlotValidation();" onkeyup= "CheckFirstChar(event.keyCode, this);adSlotValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="tvStaAdTypeLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Type of Ads:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="tvStationAdTypes"  value="<s:property value="tvStationAdTypes"/>" onblur="adtypeValidation();" onkeyup= "CheckFirstChar(event.keyCode, this);adtypeValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>

    <tr style="height:10px;"></tr>
    </table>
    <table style="margin-left: 12px;margin-top:0px;width:865px;text-align: left;">
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 835px;text-align: justify;line-height: 1.3em;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We understand that ad rates change based on various factors however, any
    rate information you can provide us would be helpful. We will list your rates only as estimates, not guaranteed rates. In addition, we will guide our users to contact you directly to get more accurate pricings.</p> </td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 835px;text-align: justify;line-height: 1.3em;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Program schedules will also help users decide when to advertise with your
     Tv Station. We will list any program schedules you provide us for our users to view, noting that schedules are subject to change.</p> </td></tr>
    </table>

    <div id="target" style="width: 940px;margin-top: 10px;margin-left: 50px;text-align: justify;font-family:ariar narrow ;color: #545454;font-size: 14px;">
    <b>We will be happy to receive any other information you would like to share about your Tv station with us!</b></div>

    <div style="margin-left: 370px;margin-top: 18px;"><br/>
    <table style="margin-left: 10px;margin-top:-26px;">
    <tr><td></td><td><button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE</font></button></td></tr>
    </table></div>
    </s:form>
    </div>
    </div>
    <div style="margin-top: -9px;margin-left: 22px;">
    <img src="/QuickKlix/images/CornerFoldImg.png" width="909px" /></div><br/><br/><br/><br/><br/><br/>

    </div>
    </div>
    </body>
</html>