<%-- 
    Document   : mediaplanClientCreation
    Created on : 30 Jun, 2014, 3:14:09 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset=utf-8 />
        <meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval()%>;url=/LegalNod/sessionTimeOut.action" />

         <script language="javascript" src="/scripts/jquery-1.4.2.min.js"></script>
         <script language="javascript" src="/QuickKlix/scripts/json-minified.js" type="text/javascript"></script>
         <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />

  <style type="text/css">
            .label{
                color: #363535;
                font-size: 14px;
                font-weight:bold;
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
       <script>
          window.onload=function(){
              var slreadyexist = "<s:property value="clientNameAlreadyExist"/>"
               if(slreadyexist === "AlreadyExist"){
                   alert("Client name already exist");
               }
           }
           var result = true;
           function validation(){
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var reg1 =  /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
            var zip = /^\d{5}$/;
            var phoneReg=/^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
            var addr = /^[A-Za-z0-9'\.\-\s\,\:]*$/;
            var clientName=document.clientFormName.tmsClientName.value;
            var clientAddress1=document.clientFormName.clientAddress1.value;
            var cityName=document.clientFormName.cityName.value;
            var stateName=document.clientFormName.stateName.value;
            var countryName=document.clientFormName.countryName.value;
            var zipCode=document.clientFormName.zipCode.value;
            var contactPerson=document.clientFormName.contactPerson.value;
            var contactPhoneNo=document.clientFormName.contactPhoneNo.value;
            var contactEmail=document.clientFormName.contactEmail.value;

               if(reg.test(clientName)){
                 document.getElementById("clientnamelabel").removeAttribute("class");
                }
                else{
                    document.getElementById("clientnamelabel").setAttribute("class","redTestDisplay");
                    result=false;
                }
               if(addr.test(clientAddress1) && clientAddress1 != ""){
                 document.getElementById("clientaddress1label").removeAttribute("class");
                }
                else{
                    document.getElementById("clientaddress1label").setAttribute("class","redTestDisplay");
                    result=false;
                }

               if(reg.test(cityName)){
                 document.getElementById("cityNamelabel").removeAttribute("class");
                }
                else{
                    document.getElementById("cityNamelabel").setAttribute("class","redTestDisplay");
                    result=false;
                }

               if(reg.test(stateName)){
                 document.getElementById("stateNamelabel").removeAttribute("class");
                }
                else{
                    document.getElementById("stateNamelabel").setAttribute("class","redTestDisplay");
                    result=false;
                }

               if(reg.test(countryName)){
                 document.getElementById("countryNamelabel").removeAttribute("class");
                }
                else{
                    document.getElementById("countryNamelabel").setAttribute("class","redTestDisplay");
                    result=false;
                }
               if(zip.test(zipCode)){
                 document.getElementById("zipCodelabel").removeAttribute("class");
                }
                else{
                    document.getElementById("zipCodelabel").setAttribute("class","redTestDisplay");
                    result=false;
                }
               if(reg.test(contactPerson)){
                 document.getElementById("contactPersonlabel").removeAttribute("class");
                }
                else{
                    document.getElementById("contactPersonlabel").setAttribute("class","redTestDisplay");
                    result=false;
                }
               if(phoneReg.test(contactPhoneNo)){
                 document.getElementById("contactPhoneNolabel").removeAttribute("class");
                }
                else{
                    document.getElementById("contactPhoneNolabel").setAttribute("class","redTestDisplay");
                    result=false;
                }
               if(reg1.test(contactEmail)){
                document.getElementById("contactEmaillabel").removeAttribute("class");
                 }
                 else{
                   document.getElementById("contactEmaillabel").setAttribute("class","redTestDisplay");
                   result=false;
               }
               newAjaxCall();

                  return result;

              }

               function clientNameValidation(){
               var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var clientName=document.clientFormName.tmsClientName.value;
                if(reg.test(clientName)){
                 document.getElementById("clientnamelabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("clientnamelabel").setAttribute("class","redTestDisplay");
                }
                   if(clientName==""){
                        document.getElementById("clientnamelabel").removeAttribute("class");
                   }
               }

               function clientAddress1Validation(){
               var addr = /^[A-Za-z0-9'\.\-\s\,\:]*$/;
               var clientAddress1=document.clientFormName.clientAddress1.value;
               if(addr.test(clientAddress1)){
               document.getElementById("clientaddress1label").removeAttribute("class");
               }
               else{
               document.getElementById("clientaddress1label").setAttribute("class","redTestDisplay");
               }
               if(clientAddress1==""){
               document.getElementById("clientaddress1label").removeAttribute("class");
               }
               }

               function clientAddress2Validation(){
               addr = /^[A-Za-z0-9'\.\-\s\,\:]*$/;
               var clientAddress2=document.clientFormName.clientAddress2.value;
               if(addr.test(clientAddress2)){
               document.getElementById("clientaddress2label").removeAttribute("class");
               }
               else{
               document.getElementById("clientaddress2label").setAttribute("class","redTestDisplay");
               }
               if(clientAddress2==""){
               document.getElementById("clientaddress2label").removeAttribute("class");
               }
               }

               function cityNameValidation(){
               var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var cityName=document.clientFormName.cityName.value;
                if(reg.test(cityName)){
                 document.getElementById("cityNamelabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("cityNamelabel").setAttribute("class","redTestDisplay");
                }
                   if(cityName==""){
                        document.getElementById("cityNamelabel").removeAttribute("class");
                   }
               }

               function stateNameValidation(){
               var stateName=document.clientFormName.stateName.value;
                if(stateName!=""){
                 document.getElementById("stateNamelabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("stateNamelabel").setAttribute("class","redTestDisplay");
                }
               }

               function countryNameValidation(){
               var countryName=document.clientFormName.countryName.value;
                if(countryName!=""){
                 document.getElementById("countryNamelabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("countryNamelabel").setAttribute("class","redTestDisplay");
                }
               }

               function zipCodeValidation(){
               var zip = /^\d{5}$/;
               var zipCode=document.clientFormName.zipCode.value;
                if(zip.test(zipCode)){
                 document.getElementById("zipCodelabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("zipCodelabel").setAttribute("class","redTestDisplay");
                }
                   if(zipCode==""){
                        document.getElementById("zipCodelabel").removeAttribute("class");
                   }
               }

               function contactPersonValidation(){
               var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var contactPerson=document.clientFormName.zipCode.value;
                if(reg.test(contactPerson)){
                 document.getElementById("contactPersonlabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("contactPersonlabel").setAttribute("class","redTestDisplay");
                }
                   if(contactPerson==""){
                        document.getElementById("contactPersonlabel").removeAttribute("class");
                   }
               }

               function contactPhoneNoValidation(){
               var phoneReg=/^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
               var contactPhoneNo=document.clientFormName.contactPhoneNo.value;
                if(phoneReg.test(contactPhoneNo)){
                 document.getElementById("contactPhoneNolabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("contactPhoneNolabel").setAttribute("class","redTestDisplay");
                }
                   if(contactPhoneNo==""){
                        document.getElementById("contactPhoneNolabel").removeAttribute("class");
                   }
               }

               function contactEmailValidation(){
               var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
               var contactEmail=document.clientFormName.contactEmail.value;
                if(reg.test(contactEmail)){
                 document.getElementById("contactEmaillabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("contactEmaillabel").setAttribute("class","redTestDisplay");
                }
                   if(contactEmail==""){
                        document.getElementById("contactEmaillabel").removeAttribute("class");
                   }
               }

           function CheckFirstChar(key, txt)
           {
               if(key == 32 && txt.value.length<=0)
               {
                   return false;
               }
               else if(txt.value.length>0)
               {
                   if(txt.value.charCodeAt(0) == 32)
                   {
                       txt.value=txt.value.substring(1,txt.value.length);
                       return true;
                   }
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

        </script>

        <script type="text/javascript" language="javascript">
        function newAjaxCall(){
        if(document.clientFormName.tmsClientName.value != ''){
        var clientsName = document.clientFormName.tmsClientName.value;
        $.post('/QuickKlix/clientCreationExist.action', { data: clientsName}, responseData, "text");
        } }

        function responseData(data){
        var myJsonObj = jsonParse(data);
        var value = myJsonObj.jsonResponse;
        value = value.replace('}',"");
        value = value.replace('{',"");
        if(value != "null"){
        alert("Client name already exist");
        result=false;
        }
        else{
        result=true;
        }
        }
        </script>

    </head>
    <body class="body_page">
     <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 520px;height: auto;border-radius: 30px 30px 0 0;"><br/>

     <div style="background: white;border-left: solid 9px #d0d0d0;border-right: solid 2px #d0d0d0;width: 889px;margin-left: 25px;margin-top: 50px;height: auto;">
     <div style="background: #858585;height: 35px;margin-left: -1px;width:890px"></div>

     <div style=" min-height: 40px;">
     <div style="margin-top:-38px;margin-left: 14px;position: absolute;"><font style="font: bold 1.6em/1em Cambria;color: white;">New Client</font></div>

            <form action="tmClientDetailsSaving" name="clientFormName" id="clientFormId">
            <div style="margin-left: 10px;"><br/>
             <table style="margin-left: 25px;margin-top:13px;">
                 <tr class="label"><td id="clientnamelabel" align="right">Client Name*:</td><td> <input type="text"  name="tmsClientName" style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;"  maxlength="60" onblur="clientNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);clientNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onchange="return newAjaxCall();"/></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="clientaddress1label" align="right">Client Address1*:</td><td><input type="text"  name="clientAddress1"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="60" onblur="clientAddress1Validation();"onkeyup = "CheckFirstChar(event.keyCode, this);clientAddress1Validation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="clientaddress2label" align="right">Client Address2:</td><td><input type="text"  name="clientAddress2"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="60" onblur="clientAddress2Validation();"onkeyup = "CheckFirstChar(event.keyCode, this);clientAddress2Validation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="cityNamelabel" align="right">City Name*:</td><td><input type="text"  name="cityName"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="30" onblur="cityNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);cityNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="stateNamelabel" align="right">State*:</td><td><s:select id="StateNamesId" name="stateName" cssStyle="margin-top:-26px;position:absolute;height:25px;width:235px;background-color: white;border-color: #f4f4f4;border-radius: 2px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" list="stateNamesList" headerKey=""   headerValue="---------------Select State---------------" onblur="stateNameValidation();" onchange="stateNameValidation();"/></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="countryNamelabel" align="right">Country Name*:</td><td><s:select id="CountryNameId" name="countryName" cssStyle="margin-top:-26px;position:absolute;height:25px;width:235px;background-color: white;border-color: #f4f4f4;border-radius: 2px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" list="countryNamesList" headerKey=""   headerValue="---------------Select Country---------------" onblur="countryNameValidation();" onchange="countryNameValidation();"/></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="zipCodelabel" align="right">Zip Code*:</td><td><input type="text"  name="zipCode"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="5" onblur="zipCodeValidation();" onkeyup = "zipCodeValidation();" onkeypress="return numeralsOnly(event);" /></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="contactPersonlabel" align="right">Contact Person*:</td><td><input type="text"  name="contactPerson"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="60" onblur="contactPersonValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);contactPersonValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="contactPhoneNolabel" align="right">Contact Phone No*:</td><td><input type="text"  name="contactPhoneNo"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="12" id="ph" onchange="contactPhoneNoValidation();" onblur="contactPhoneNoValidation();" onkeyup="contactPhoneNoValidation();return phoneFormat (event,ph)"  onkeypress="return numberonly(event,false)"/></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="contactEmaillabel" align="right" >Contact Email*:</td><td><input type="text"  name="contactEmail"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="60" onblur="contactEmailValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);contactEmailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 30px;"></tr>

              <tr><td></td><td><button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE</font></button></td></tr>
              </table>

           </div>
         </form>
     </div><br/>
  </div>
<div style=" margin-top: -10px;margin-left: 22px;">
 <img src="/QuickKlix/images/CornerFoldImg.png" width="912px"/></div><br/><br/><br/><br/><br/><br/>
</div>
</div>
  </body>
</html>