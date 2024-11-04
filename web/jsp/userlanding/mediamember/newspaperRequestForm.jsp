<%-- 
    Document   : newspaperRequestForm
    Created on : 16 Jun, 2014, 4:52:13 PM
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
        <script language="javascript" type="text/javascript" src="/QuickKlix/scripts/jquery-1.4.2.min.js"></script>
        <title>JSP Page</title>
       <style type="text/css">
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
            .errorMessage {
                margin-left: 257px;
                position: absolute;
                display: inherit;
                font-size: 13px;
            }
            [errorfor]{
                height:14px;
            }
        </style>


        <script type="text/javascript">

           $(document).ready(function(){
             $("[name=newsPaperState]").val("<s:property value="newsPaperState"/>");
         });

         function validation()
         {
          var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
          var nameOfNewsPaper = document.newspaperformname.nameOfNewsPaper.value;
          var result = true;
          if(reg.test(nameOfNewsPaper)){
          document.getElementById("newsPaperNameID").removeAttribute("class");
          }
          else{
          document.getElementById("newsPaperNameID").setAttribute("class","redTestDisplay");
          result=false;
          }
          return result;
          }

           function npNameValidation(){
           var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
           var nameOfNewsPaper = document.newspaperformname.nameOfNewsPaper.value;
           if(reg.test(nameOfNewsPaper)){
           document.getElementById("newsPaperNameID").removeAttribute("class");
           }
           else{
           document.getElementById("newsPaperNameID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(nameOfNewsPaper==""){
           document.getElementById("newsPaperNameID").removeAttribute("class");
           }
           }


            function npWebsiteValidation(){
             var regUrl = /^(((ht|f){1}(tp:[/][/]){1})|((www.){1}))[-a-zA-Z0-9@:%_\+.~#?&//=]+$/;
             var newsPaperWebsite = document.newspaperformname.newsPaperWebsite.value;
             if(regUrl.test(newsPaperWebsite)){
             document.getElementById("newsPapaerWebsiteID").removeAttribute("class");
             }
             else{
             document.getElementById("newsPapaerWebsiteID").setAttribute("class","redTestDisplay");
             result=false;
             }
             if(newsPaperWebsite==""){
             document.getElementById("newsPapaerWebsiteID").removeAttribute("class");
             }
            }

            function npCityValidation(){
              var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
              var newsPaperCity = document.newspaperformname.newsPaperCity.value;
              if(reg.test(newsPaperCity)){
              document.getElementById("newsPaperCityID").removeAttribute("class");
              }
              else{
              document.getElementById("newsPaperCityID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPaperCity==""){
              document.getElementById("newsPaperCityID").removeAttribute("class");
              }
            }
            function npStateValidation(){
             var newsPaperState = document.newspaperformname.newsPaperState.value;
              if(reg.test(newsPaperState)){
              document.getElementById("newsPaperStateID").removeAttribute("class");
              }
              else{
              document.getElementById("newsPaperStateID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPaperState==""){
              document.getElementById("newsPaperStateID").removeAttribute("class");
              }
            }
             function npAdSalesContactNameValidation(){
             var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
             var newsPaperAdSalesContactName = document.newspaperformname.newsPaperAdSalesContactName.value;
              if(reg.test(newsPaperAdSalesContactName)){
              document.getElementById("npAdSalesContactNameID").removeAttribute("class");
              }
              else{
              document.getElementById("npAdSalesContactNameID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPaperAdSalesContactName==""){
              document.getElementById("npAdSalesContactNameID").removeAttribute("class");
              }
            }
             function npContactNumberValidation(){
             var phoneReg=/^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
             var newsPaperContactNumber = document.newspaperformname.newsPaperContactNumber.value;
              if(phoneReg.test(newsPaperContactNumber)){
              document.getElementById("npContactNumberID").removeAttribute("class");
              }
              else{
              document.getElementById("npContactNumberID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPaperContactNumber==""){
              document.getElementById("npContactNumberID").removeAttribute("class");
              }
            }
             function npContactEmailValidation(){
             var email = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
            var newsPaperContactEmail = document.newspaperformname.newsPaperContactEmail.value;
              if(email.test(newsPaperContactEmail)){
              document.getElementById("npContactEmailID").removeAttribute("class");
              }
              else{
              document.getElementById("npContactEmailID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPaperContactEmail==""){
              document.getElementById("npContactEmailID").removeAttribute("class");
              }
            }
            function npreachOfValidation(){
             var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var reachOfNewsPaper = document.newspaperformname.reachOfNewsPaper.value;
              if(reg.test(reachOfNewsPaper)){
              document.getElementById("reachOfNewsPapaerID").removeAttribute("class");
              }
              else{
              document.getElementById("reachOfNewsPapaerID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(reachOfNewsPaper==""){
              document.getElementById("reachOfNewsPapaerID").removeAttribute("class");
              }
            }
            function npDemographicsValidation(){
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var newsPapaerDemographics = document.newspaperformname.newsPaperDemographics.value;
              if(reg.test(newsPapaerDemographics)){
              document.getElementById("npDemographicsID").removeAttribute("class");
              }
              else{
              document.getElementById("npDemographicsID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPapaerDemographics==""){
              document.getElementById("npDemographicsID").removeAttribute("class");
              }
            }
            function npAdvSlotsValidation(){
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var newsPaperAdvSlots = document.newspaperformname.newsPaperAdvSlots.value;
              if(reg.test(newsPaperAdvSlots)){
              document.getElementById("npAdvSlotsID").removeAttribute("class");
              }
              else{
              document.getElementById("npAdvSlotsID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPaperAdvSlots==""){
              document.getElementById("npAdvSlotsID").removeAttribute("class");
              }
            }
             function npTypeofAdsValidation(){
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
             var newsPapaerTypeofAds = document.newspaperformname.newsPaperTypeofAds.value;
              if(reg.test(newsPapaerTypeofAds)){
              document.getElementById("npTypeofAdsID").removeAttribute("class");
              }
              else{
              document.getElementById("npTypeofAdsID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPapaerTypeofAds==""){
              document.getElementById("npTypeofAdsID").removeAttribute("class");
              }
            }

              function npAdPricesValidation(){
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var newsPaperAdPrices = document.newspaperformname.newsPaperAdPrices.value;
              if(reg.test(newsPaperAdPrices)){
              document.getElementById("npAdPricesID").removeAttribute("class");
              }
              else{
              document.getElementById("npAdPricesID").setAttribute("class","redTestDisplay");
              result=false;
              }
              if(newsPaperAdPrices==""){
              document.getElementById("npAdPricesID").removeAttribute("class");
              }
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

            </script>

    </head>
    <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>

    <div style="background: white;border-left: solid 8px #d0d0d0;border-right: solid 2px #d0d0d0;width: 888px;margin-left: 25px;margin-top: 50px;height: auto;">
    <div style="background: #858585;height: 35px;margin-left: -1px;width:889px"></div>

    <div style=" min-height: 200px;">
    <div style="margin-top:-34px;margin-left: 14px;position: absolute;width:874px;"><font style="font: bold 1.35em/1em Cambria;color: white;">Newspaper Info Request Form </font></div>
    <s:form action="newspaperRequestFormSavingAndUpdating" name="newspaperformname">
    <table style="margin-left: 12px;margin-top:0px;width:865px;text-align: left;">
    <br/>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;">
        <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;"  id="newsPaperNameID"> Newspaper Name*:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="nameOfNewsPaper" value="<s:property value="nameOfNewsPaper"/>" maxlength="50" style="width:300px;" onblur="npNameValidation();" onkeyup="npNameValidation();"/></td></tr>
    <tr style="height:10px;"></tr>
    <tr class="label" style="line-height: 16px;background: #f2f2f2;">
        <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;"id="newsPapaerWebsiteID">Newspaper Website:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="newsPaperWebsite"  value="<s:property value="newsPaperWebsite"/>" maxlength="100" style="width:300px;"  onblur="npWebsiteValidation();" onkeyup="npWebsiteValidation();"/></td></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="newsPaperCityID">City:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="newsPaperCity"  value="<s:property value="newsPaperCity"/>"  maxlength="20" style="width:300px;"  onblur="npCityValidation();" onkeyup="npCityValidation();"/></td></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="newsPaperStateID">State:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<s:select name="newsPaperState"  cssStyle="margin-top:-32px;margin-left:16px;position:absolute;height:25px;width:300px;background-color: white;border-color: #f4f4f4;border-radius: 2px;border: solid 1px #595959;" list="stateNamesList" headerKey=""   headerValue="---------------Select State---------------" onblur="npStateValidation();" onkeyup="npStateValidation();"/></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="npAdSalesContactNameID">Ad Sales Contact Name:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="newsPaperAdSalesContactName"  value="<s:property value="newsPaperAdSalesContactName"/>"  maxlength="60" style="width:300px;"  onblur="npAdSalesContactNameValidation();" onkeyup="npAdSalesContactNameValidation();"/></td></tr>
    <tr style="height:10px;"></tr>



      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="npContactNumberID">Contact Number:</p> </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="ph" name="newsPaperContactNumber"  value="<s:property value="newsPaperContactNumber"/>"  maxlength="12" style="width:300px;" onchange="return phoneFormat (event,ph);"  onkeypress="return numberonly(event,false);" onblur="npContactNumberValidation();" onkeyup="npContactNumberValidation();return phoneFormat (event,ph)"/></td></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="npContactEmailID">Contact Email:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="newsPaperContactEmail"  value="<s:property value="newsPaperContactEmail"/>"  maxlength="100" style="width:300px;"  onblur="npContactEmailValidation();" onkeyup="npContactEmailValidation();"/></td></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="reachOfNewsPapaerID">Reach of Newspapers:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reachOfNewsPaper"  value="<s:property value="reachOfNewsPaper"/>" style="width:300px;"  onblur="npreachOfValidation();" onkeyup="npreachOfValidation();"/></td></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="npDemographicsID">Demographics:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="newsPaperDemographics"  value="<s:property value="newsPaperDemographics"/>"  maxlength="80" style="width:300px;"  onblur="npDemographicsValidation();" onkeyup="npDemographicsValidation();"/></td></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="npAdvSlotsID">Available Advertising Slots:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="newsPaperAdvSlots"  value="<s:property value="newsPaperAdvSlots"/>" style="width:300px;"  onblur="npAdvSlotsValidation();" onkeyup="npAdvSlotsValidation();"/></td></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
        <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;"  id="npTypeofAdsID">Type of Ads:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="newsPaperTypeofAds" value="<s:property value="newsPaperTypeofAds"/>"  maxlength="40" style="width:300px;"  onblur="npTypeofAdsValidation();" onkeyup="npTypeofAdsValidation();"/></td></tr>
    <tr style="height:10px;"></tr>

      <tr class="label" style="line-height: 16px;background: #f2f2f2;">
          <td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;" id="npAdPricesID">Ad Prices:</p> </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="newsPaperAdPrices"  value="<s:property value="newsPaperAdPrices"/>" maxlength="13" style="width:300px;"  onkeypress="return numeralsOnly(event);" /></td></tr>
    <tr style="height:10px;"></tr>

    </table>

    <table style="margin-left: 12px;margin-top:0px;width:865px;text-align: left;">
    <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 835px;text-align: justify;line-height: 1.3em;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We understand that ad rates change based on various factors however,
    any rate information you can provide us would be helpful. We will list your rates only as estimates, not guaranteed rates. In addition, we will guide our users to contact you directly to get more accurate pricings.</p> </td></tr>
   </table>

   <div id="target" style="width: 940px;margin-top: 10px;margin-left: 50px;text-align: justify;font-family:ariar narrow ;color: #545454;font-size: 14px;">
    <b>We will be happy to receive any other information you would like to share about your newspaper with us!</b></div>

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