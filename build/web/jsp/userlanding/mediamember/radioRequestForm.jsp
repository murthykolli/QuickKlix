<%--
    Document   : radiostationinforequestform
    Created on : 12 Jun, 2014, 3:42:59 PM
    Author     : anusha
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
            var daypart="<s:property value="radioStationDaypart"/>";
            if(daypart=="Morning Drive to Overnight"){
             $("#modtooth").prop("checked",true);
            }
            if(daypart=="Other"){
             $("#radotherdp").prop("checked",true);
            }
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
   var key;
   var keychar;
    if (window.event) {key = window.event.keyCode;}
    else if (evt) { key = evt.which;}
    else { return true;}
    keychar = String.fromCharCode(key);
    evt = (evt) ? evt : event;
   var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
   ((evt.which) ? evt.which : 0));
   if (keychar == ".") {return true;}
   if (keychar == ",") {return true;}
   if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    return false;
   }
   return true;
   }
          function validation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
          var stationName=document.radiostation.radStationName.value;
          var result = true;
          if(reg.test(stationName)){
          document.getElementById("rdStaNameLabel").removeAttribute("class");
          }
          else{
          document.getElementById("rdStaNameLabel").setAttribute("class","redTestDisplay");
          result=false;
           }
          return result;
          }

          function stationNameValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var stationName=document.radiostation.radStationName.value;
                if(reg.test(stationName)){
                 document.getElementById("rdStaNameLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaNameLabel").setAttribute("class","redTestDisplay");
                }
                   if(stationName==""){
                        document.getElementById("rdStaNameLabel").removeAttribute("class");
                   }
               }


          function frequencyValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var frequency=document.radiostation.radioStationFrequency.value;
                if(reg.test(frequency)){
                 document.getElementById("rdStaFrequencyLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaFrequencyLabel").setAttribute("class","redTestDisplay");
                }
                   if(frequency==""){
                        document.getElementById("rdStaFrequencyLabel").removeAttribute("class");
                   }
               }


          function formatValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var format=document.radiostation.radioStationFormat.value;
                if(reg.test(format)){
                 document.getElementById("rdStaFormatLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaFormatLabel").setAttribute("class","redTestDisplay");
                }
                   if(format==""){
                        document.getElementById("rdStaFormatLabel").removeAttribute("class");
                   }
               }

          function nameValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var name=document.radiostation.radioStationSalesConName.value;
                if(reg.test(name)){
                 document.getElementById("rdStaConNameLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaConNameLabel").setAttribute("class","redTestDisplay");
                }
                   if(name==""){
                        document.getElementById("rdStaConNameLabel").removeAttribute("class");
                   }
               }

          function contNOValidation(){
          var reg = /^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
               var contactNO=document.radiostation.raioStationContactNo.value;
                if(reg.test(contactNO)){
                 document.getElementById("rdStaConNoLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaConNoLabel").setAttribute("class","redTestDisplay");
                }
                   if(contactNO==""){
                        document.getElementById("rdStaConNoLabel").removeAttribute("class");
                   }
               }

          function emailValidation(){
          var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
               var email=document.radiostation.radioStationContactEmail.value;
                if(reg.test(email)){
                 document.getElementById("rdStaConEmailLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaConEmailLabel").setAttribute("class","redTestDisplay");
                }
                   if(email==""){
                        document.getElementById("rdStaConEmailLabel").removeAttribute("class");
                   }
               }

          function demographicsValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var demog=document.radiostation.radioStationDemographics.value;
                if(reg.test(demog)){
                 document.getElementById("rdStaDemogrLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaDemogrLabel").setAttribute("class","redTestDisplay");
                }
                   if(demog==""){
                        document.getElementById("rdStaDemogrLabel").removeAttribute("class");
                   }
               }

          function broadcastValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var broadcast=document.radiostation.radioStationBroadcast.value;
                if(reg.test(broadcast)){
                 document.getElementById("rdStaBroadcastLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaBroadcastLabel").setAttribute("class","redTestDisplay");
                }
                   if(broadcast==""){
                        document.getElementById("rdStaBroadcastLabel").removeAttribute("class");
                   }
               }

          function purchasingAdValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var purAd=document.radiostation.radioStationPurchasingAd.value;
                if(reg.test(purAd)){
                 document.getElementById("rdStaPurchasingAdeLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaPurchasingAdeLabel").setAttribute("class","redTestDisplay");
                }
                   if(purAd==""){
                        document.getElementById("rdStaPurchasingAdeLabel").removeAttribute("class");
                   }
               }

          function adSlotValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var adSlot=document.radiostation.radioStationAdSlot.value;
                if(reg.test(adSlot)){
                 document.getElementById("rdStaAdSlotLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaAdSlotLabel").setAttribute("class","redTestDisplay");
                }
                   if(adSlot==""){
                        document.getElementById("rdStaAdSlotLabel").removeAttribute("class");
                   }
               }

          function adTypeValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var adType=document.radiostation.radioStationAdTypes.value;
                if(reg.test(adType)){
                 document.getElementById("rdStaAdTypeLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("rdStaAdTypeLabel").setAttribute("class","redTestDisplay");
                }
                   if(adType==""){
                        document.getElementById("rdStaAdTypeLabel").removeAttribute("class");
                   }
               }

          function morningDriveValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var rdMorDrive=document.radiostation.radioMorningDrive.value;
                if(reg.test(rdMorDrive)){
                 document.getElementById("radioMorningDrive").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioMorningDrive").setAttribute("class","redTestDisplay");
                }
                   if(rdMorDrive==""){
                        document.getElementById("radioMorningDrive").removeAttribute("class");
                   }
               }

          function middayValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var radioMidday=document.radiostation.radioMidday.value;
                if(reg.test(radioMidday)){
                 document.getElementById("radioMidday").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioMidday").setAttribute("class","redTestDisplay");
                }
                   if(radioMidday==""){
                        document.getElementById("radioMidday").removeAttribute("class");
                   }
               }

          function aftDriveValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var radioAfternoonDrive=document.radiostation.radioAfternoonDrive.value;
                if(reg.test(radioAfternoonDrive)){
                 document.getElementById("radioAfternoonDrive").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioAfternoonDrive").setAttribute("class","redTestDisplay");
                }
                   if(radioAfternoonDrive==""){
                        document.getElementById("radioAfternoonDrive").removeAttribute("class");
                   }
               }

          function eveningValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var radioEvenings=document.radiostation.radioEvenings.value;
                if(reg.test(radioEvenings)){
                 document.getElementById("radioEvenings").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioEvenings").setAttribute("class","redTestDisplay");
                }
                   if(radioEvenings==""){
                        document.getElementById("radioEvenings").removeAttribute("class");
                   }
               }

          function overNightNameValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var radioOvernight=document.radiostation.radioOvernight.value;
                if(reg.test(radioOvernight)){
                 document.getElementById("radioOvernight").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioOvernight").setAttribute("class","redTestDisplay");
                }
                   if(radioOvernight==""){
                        document.getElementById("radioOvernight").removeAttribute("class");
                   }
               }

          function weekendValidation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var radioWeekend=document.radiostation.radioWeekend.value;
                if(reg.test(radioWeekend)){
                 document.getElementById("radioWeekend").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioWeekend").setAttribute("class","redTestDisplay");
                }
                   if(radioWeekend==""){
                        document.getElementById("radioWeekend").removeAttribute("class");
                   }
               }

          function perSecond1Validation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var perSecond1=document.radiostation.radioPerSecond1.value;
                if(reg.test(perSecond1)){
                 document.getElementById("radioPerSecond1").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioPerSecond1").setAttribute("class","redTestDisplay");
                }
                   if(perSecond1==""){
                        document.getElementById("radioPerSecond1").removeAttribute("class");
                   }
               }

          function perSecond2Validation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var perSecond2=document.radiostation.radioPerSecond2.value;
                if(reg.test(perSecond2)){
                 document.getElementById("radioPerSecond2").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioPerSecond2").setAttribute("class","redTestDisplay");
                }
                   if(perSecond2==""){
                        document.getElementById("radioPerSecond2").removeAttribute("class");
                   }
               }

          function perSecond3Validation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var perSecond3=document.radiostation.radioPerSecond3.value;
                if(reg.test(perSecond3)){
                 document.getElementById("radioPerSecond3").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioPerSecond3").setAttribute("class","redTestDisplay");
                }
                   if(perSecond3==""){
                        document.getElementById("radioPerSecond3").removeAttribute("class");
                   }
               }

          function perSecond4Validation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var perSecond4=document.radiostation.radioPerSecond4.value;
                if(reg.test(perSecond4)){
                 document.getElementById("radioPerSecond4").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioPerSecond4").setAttribute("class","redTestDisplay");
                }
                   if(perSecond4==""){
                        document.getElementById("radioPerSecond4").removeAttribute("class");
                   }
               }

          function perSecond5Validation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var perSecond5=document.radiostation.radioPerSecond5.value;
                if(reg.test(perSecond5)){
                 document.getElementById("radioPerSecond5").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioPerSecond5").setAttribute("class","redTestDisplay");
                }
                   if(perSecond5==""){
                        document.getElementById("radioPerSecond5").removeAttribute("class");
                   }
               }

          function perSecond6Validation(){
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var perSecond6=document.radiostation.radioPerSecond6.value;
                if(reg.test(perSecond6)){
                 document.getElementById("radioPerSecond6").removeAttribute("class");
                }
                 else{
                    document.getElementById("radioPerSecond6").setAttribute("class","redTestDisplay");
                }
                   if(perSecond6==""){
                        document.getElementById("radioPerSecond6").removeAttribute("class");
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
    <div style="margin-top:-34px;margin-left: 14px;position: absolute;width:874px;"><font style="font: bold 1.35em/1em Cambria;color: white;">Radio Station Info Request Form </font></div>
    <s:form action="radioRequestFormSavingAndUpdating" name="radiostation">
    <table style="margin-left: 12px;margin-top:0px;width:865px;text-align: left;">
    <br/>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaNameLabel" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Station Name*:</p> </td>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radStationName" value="<s:property value="radStationName"/>" maxlength="50" onblur="stationNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);stationNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaFrequencyLabel" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Frequency:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationFrequency" value="<s:property value="radioStationFrequency"/>" maxlength="10" onblur="frequencyValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);frequencyValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaFormatLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Format:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationFormat" value="<s:property value="radioStationFormat"/>" maxlength="50" onblur="formatValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);formatValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaConNameLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Sales Contact Name:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationSalesConName"  value="<s:property value="radioStationSalesConName"/>" maxlength="60" onblur="nameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);nameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaConNoLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Number:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="raioStationContactNo" value="<s:property value="raioStationContactNo"/>" id="ph" maxlength="12" onchange="contNOValidation();" onblur="contNOValidation();" onkeyup="contNOValidation();return phoneFormat (event,ph);"  onkeypress="return numberonly(event,false);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaConEmailLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Email:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationContactEmail"  value="<s:property value="radioStationContactEmail"/>" maxlength="100"  onblur="emailValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);emailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" /></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaDemogrLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;"> Demographics:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationDemographics"value="<s:property value="radioStationDemographics"/>"  maxlength="80" onblur="demographicsValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);demographicsValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaBroadcastLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Broadcast Area:</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationBroadcast" value="<s:property value="radioStationBroadcast"/>" onblur="broadcastValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);broadcastValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaPurchasingAdeLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">How far in advance do you recommend purchasing an ad slot in relation to the ad air date?</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationPurchasingAd" value="<s:property value="radioStationPurchasingAd"/>" maxlength="40" onblur="purchasingAdValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);purchasingAdValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaAdSlotLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Type of Advertising Slots: (15 sec, 30 sec, etc…):</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationAdSlot" value="<s:property value="radioStationAdSlot"/>" maxlength="60"  onblur="adSlotValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);adSlotValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="rdStaAdTypeLabel"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Type of Ads: (live reads, produced spots, sponsor program, etc…):</p> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;" name="radioStationAdTypes"  value="<s:property value="radioStationAdTypes"/>" maxlength="60"  onblur="adTypeValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);adTypeValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>

    <tr style="height:10px;"></tr>
    </table>

    <table style="margin-left:15px;width: 860px;font-family:ariar narrow ;font-family: Calibri, sans-serif;line-height: 16px;background: #f2f2f2;">
    <tr><td><b>&nbsp;&nbsp;&nbsp;How does your station daypart?</b></td></tr>
    <tr><td>&nbsp;&nbsp;<input type="radio"  id="modtooth" name="radioStationDaypart" value="Morning Drive to Overnight" style="margin-top: 8px;"> Morning Drive (6am – 10am)<input type="radio" name="radioStationDaypart" id="radotherdp" value="Other" onclick="displayOther();"   style=" margin-left: 290px;"> Other (Please list below)</td></tr>
                <tr><td><font style="line-height:1.5em; margin-left: 34px;">Midday (10am – 3pm)</font></td></tr>
                <tr><td><font style="line-height:1.5em; margin-left: 34px;">Afternoon Drive (3pm – 7pm)</font></td></tr>
                <tr><td><font style="line-height:1.5em; margin-left: 34px;">Evenings (7pm – 12midnight)</font></td></tr>
                <tr><td><font style="line-height:1.5em; margin-left: 34px;">Overnight (midnight – 6am)</font></td></tr>
                <tr><td><textarea  name="radioOtherDaypart" id="otherTime" style="width: 300px;height: 120px;margin-left: 528px; margin-top: -85px;position: absolute;"><s:property value="radioOtherDaypart"/></textarea><br>
     <tr style="height:30px;"></tr>
    </table>

   <div style="margin-left:15px;margin-top: 12px;width: 860px;font-family:ariar narrow ;font-family: Calibri, sans-serif;line-height: 16px;background: #f2f2f2;">
   <table  style="margin-top: 5px;text-align: justify;"><tr><td><b>&nbsp;&nbsp;&nbsp;Current average ad rates based on daypart segmentation:</b></td></tr></table><br/>
   <table>
   <tr style="height:30px;"><td id="radioMorningDrive"  style="text-align:right;">&nbsp;&nbsp;Morning Drive/Other:&nbsp;<input type="text" value="<s:property value="radioMorningDrive"/>" maxlength="20" style="width:160px;" name="radioMorningDrive" onblur="morningDriveValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);morningDriveValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td><td id="radioAveRate1" style="text-align:right;">&nbsp;Ave. Rate:&nbsp;<input type="text" style="width:160px;" maxlength="13" name="radioAveRate1" value="<s:property value="radioAveRate1"/>"  onkeypress="return numeralsOnly(event);"/></td><td id="radioPerSecond1" style="text-align:right;">&nbsp;per:&nbsp;<input  type="text" style="width:160px;" maxlength="20" name="radioPerSecond1" value="<s:property value="radioPerSecond1"/>" onblur="perSecond1Validation();" onkeyup = "CheckFirstChar(event.keyCode, this);perSecond1Validation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/>&nbsp;seconds</td></tr>
   <tr style="height:30px;"><td id="radioMidday"  style="text-align:right;">&nbsp;&nbsp;Midday/Other:&nbsp;<input type="text" value="<s:property value="radioMidday"/>" style="width:160px;" maxlength="20" name="radioMidday" onblur="middayValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);middayValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td><td id="radioAveRate2" style="text-align:right;">&nbsp;Ave. Rate:&nbsp;<input type="text" style="width:160px;" maxlength="13" name="radioAveRate2" value="<s:property value="radioAveRate2"/>" onkeypress="return numeralsOnly(event);"/></td><td id="radioPerSecond2" style="text-align:right;">&nbsp;per:&nbsp;<input  type="text" style="width:160px;" maxlength="20" name="radioPerSecond2" value="<s:property value="radioPerSecond2"/>" onblur="perSecond2Validation();" onkeyup = "CheckFirstChar(event.keyCode, this);perSecond2Validation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/>&nbsp;seconds</td></tr>
   <tr style="height:30px;"><td id="radioAfternoonDrive"  style="text-align:right;">&nbsp;&nbsp;Afternoon Drive/Other:&nbsp;<input type="text" value="<s:property value="radioAfternoonDrive"/>" style="width:160px;" maxlength="20" name="radioAfternoonDrive" onblur="aftDriveValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);aftDriveValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td><td id="radioAveRate3" style="text-align:right;">&nbsp;Ave. Rate:&nbsp;<input type="text" style="width:160px;" maxlength="13" name="radioAveRate3"value="<s:property value="radioAveRate3"/>" onkeypress="return numeralsOnly(event);"/></td><td id="radioPerSecond3" style="text-align:right;">&nbsp;per:&nbsp;<input type="text" style="width:160px;" maxlength="20" name="radioPerSecond3" value="<s:property value="radioPerSecond3"/>" onblur="perSecond3Validation();" onkeyup = "CheckFirstChar(event.keyCode, this);perSecond3Validation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/>&nbsp;seconds</td></tr>
   <tr style="height:30px;"><td id="radioEvenings"  style="text-align:right;">&nbsp;&nbsp;Evenings /Other:&nbsp;<input type="text" value="<s:property value="radioEvenings"/>" style="width:160px;" maxlength="20" name="radioEvenings" onblur="eveningValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);eveningValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td><td id="radioAveRate4" style="text-align:right;"> &nbsp;Ave. Rate:&nbsp;<input type="text" style="width:160px;" maxlength="13" name="radioAveRate4" value="<s:property value="radioAveRate4"/>" onkeypress="return numeralsOnly(event);"/></td><td id="radioPerSecond4" style="text-align:right;">&nbsp;per:&nbsp;<input type="text" style="width:160px;" name="radioPerSecond4" maxlength="20" value="<s:property value="radioPerSecond4"/>" onblur="perSecond4Validation();" onkeyup = "CheckFirstChar(event.keyCode, this);perSecond4Validation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/>&nbsp;seconds</td></tr>
   <tr style="height:30px;"><td id="radioOvernight"  style="text-align:right;">&nbsp;&nbsp;Overnight/Other:&nbsp;<input type="text" value="<s:property value="radioOvernight"/>" style="width:160px;" maxlength="20" name="radioOvernight" onblur="overNightNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);overNightNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td><td id="radioAveRate5" style="text-align:right;">&nbsp;Ave. Rate:&nbsp;<input type="text" style="width:160px;" maxlength="13" name="radioAveRate5" value="<s:property value="radioAveRate5"/>" onkeypress="return numeralsOnly(event);"/></td><td id="radioPerSecond5" style="text-align:right;">&nbsp;per:&nbsp;<input type="text" style="width:160px;" maxlength="20" name="radioPerSecond5" value="<s:property value="radioPerSecond5"/>" onblur="perSecond5Validation();" onkeyup = "CheckFirstChar(event.keyCode, this);perSecond5Validation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/>&nbsp;seconds</td></tr>
   <tr style="height:30px;"><td id="radioWeekend"  style="text-align:right;">&nbsp;&nbsp;Weekend/Other:&nbsp;<input type="text" value="<s:property value="radioWeekend"/>" style="width:160px;" maxlength="20" name="radioWeekend" onblur="weekendValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);weekendValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td><td id="radioAveRate6" style="text-align:right;">&nbsp;Ave. Rate:&nbsp;<input type="text" style="width:160px;" maxlength="13" name="radioAveRate6" value="<s:property value="radioAveRate6"/>" onkeypress="return numeralsOnly(event);"/></td><td  id="radioPerSecond6" style="text-align:right;">&nbsp;per:&nbsp;<input type="text" style="width:160px;" maxlength="20" name="radioPerSecond6" value="<s:property value="radioPerSecond6"/>" onblur="perSecond6Validation();" onkeyup = "CheckFirstChar(event.keyCode, this);perSecond6Validation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/>&nbsp;seconds</td></tr>
   <tr style="height:5px;"></tr>
   </table></div>

    <table style="margin-left: 12px;margin-top: 14px;width:865px;text-align: left;">
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 835px;text-align: justify;line-height: 1.3em;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We understand that ad rates change based on various factors however, any rate information
    you can provide us with based on daypart segmentation, season or any other method would be helpful. We will list your rates only as estimates, not guaranteed rates. In addition, we will guide our users to contact you directly to get more accurate pricings.</p> </td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 835px;text-align: justify;line-height: 1.3em;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Program schedules will also help users decide when to advertise with your station. We will list any
    program schedules you provide us for our users to view, noting that schedules are subject to change.</p> </td></tr>
    </table>

    <div id="target" style="width: 940px;margin-top: 10px;margin-left: 32px;text-align: justify;font-family:ariar narrow ;color: #545454;font-size: 14px;">
    <b>We will be happy to receive any other information you would like to share about your radio station with us!</b></div>

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