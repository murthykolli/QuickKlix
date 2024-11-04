<!--
    Document   : alabamadocform1
    Created on : 20 Nov, 2012, 10:59:30 AM
    Author     : murthyk-->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset=utf-8 />
        <meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval()%>;url=/LegalNod/sessionTimeOut.action" />
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />

        <meta name="description" content="Legal Documents Primary Contact Information, this service is most important for your legal needs, legalnod provide very quick service. " />
        <meta name="keywords" content="how to form an llc, Primary Contact Information, Contact Info, document creation, Cheap legal services, Free legal documents, Legal documents, Legal forms, Forming a company, llc form display, llp and lp, limited liability company, limited liability corporation" />

        <script language="javascript" src="/LegalNod/scripts/jquery-1.4.2.min.js"></script>

        <style type="text/css">
            .label{
                color: #363535;
                font:bold 1.02em Calibri,sans-serif;
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

            function validation(){
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;

            var phoneReg=/^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
            var firstName=document.contactFormName.firstName.value;
            var lastName=document.contactFormName.lastName.value;
            var phoneNumber=document.contactFormName.phoneNumber.value;
            var companyName=document.contactFormName.companyName.value;
            var industryName=document.contactFormName.industryName.value;
            var otherIndustry=document.contactFormName.otherIndustryName.value;
            var userType=document.contactFormName.userType;

             var result = true;
               if(reg.test(firstName)){
                 document.getElementById("firstNamelabelId").removeAttribute("class");
                }
                else{
                    document.getElementById("firstNamelabelId").setAttribute("class","redTestDisplay");
                    result=false;
                }
               if(reg.test(lastName)){
                 document.getElementById("lastNamelabelId").removeAttribute("class");
                }
                else{
                    document.getElementById("lastNamelabelId").setAttribute("class","redTestDisplay");
                    result=false;
                }

               if(phoneReg.test(phoneNumber)){
                 document.getElementById("phoneNumberlabelId").removeAttribute("class");
                }
                else{
                    document.getElementById("phoneNumberlabelId").setAttribute("class","redTestDisplay");
                    result=false;
                }

               if(reg.test(companyName)){
                 document.getElementById("companyNamelabel").removeAttribute("class");
                }
                else{
                    document.getElementById("companyNamelabel").setAttribute("class","redTestDisplay");
                    result=false;
                }

               if(industryName!=""){
                 if(industryName=="Other"){
                 if(reg.test(otherIndustry)){
                 document.getElementById("otherIndustryLabel").removeAttribute("class");
                 document.getElementById("industryNameS").value=otherIndustry;
                }
                else{
                 document.getElementById("otherIndustryLabel").setAttribute("class","redTestDisplay");
                 result=false;
                }   }
                document.getElementById("industryNamelabelId").removeAttribute("class");
                }
                else{
                document.getElementById("industryNamelabelId").setAttribute("class","redTestDisplay");
                result=false;
                }
                var radioVal="";
                if(userType.checked){
                for(var i=0;i<document.contactFormName.mediaType.length;i++){
                if(document.contactFormName.mediaType[i].checked) {
                radioVal = document.contactFormName.mediaType[i].value;break;
                }}
                if(radioVal!=""){
                document.getElementById("mediaLabel").removeAttribute("class");
                }
                else{
                document.getElementById("mediaLabel").setAttribute("class","redTestDisplay");
                result=false;
                }}
               return result;

              }

              function firstNameValidation(){
               var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var firstName=document.contactFormName.firstName.value;
                if(reg.test(firstName)){
                 document.getElementById("firstNamelabelId").removeAttribute("class");
                }
                 else{
                    document.getElementById("firstNamelabelId").setAttribute("class","redTestDisplay");
                }
                   if(firstName==""){
                        document.getElementById("firstNamelabelId").removeAttribute("class");
                   }
               }

              function lastNameValidation(){
               var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var lastName=document.contactFormName.lastName.value;
                if(reg.test(lastName)){
                 document.getElementById("lastNamelabelId").removeAttribute("class");
                }
                 else{
                    document.getElementById("lastNamelabelId").setAttribute("class","redTestDisplay");
                }
                   if(lastName==""){
                        document.getElementById("lastNamelabelId").removeAttribute("class");
                   }
               }

              function phoneNumberValidation(){
               var reg = /^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
               var phoneNumber=document.contactFormName.phoneNumber.value;
                if(reg.test(phoneNumber)){
                 document.getElementById("phoneNumberlabelId").removeAttribute("class");
                }
                 else{
                    document.getElementById("phoneNumberlabelId").setAttribute("class","redTestDisplay");
                }
                   if(phoneNumber==""){
                        document.getElementById("phoneNumberlabelId").removeAttribute("class");
                   }
               }

              function companyNamelabelValidation(){
               var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var companyName=document.contactFormName.companyName.value;
                if(reg.test(companyName)){
                 document.getElementById("companyNamelabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("companyNamelabel").setAttribute("class","redTestDisplay");
                }
                   if(companyName==""){
                        document.getElementById("companyNamelabel").removeAttribute("class");
                   }
               }

              function industryNameValidation(){
               var industryName=document.contactFormName.industryName.value;
                if(industryName!=""){
                 document.getElementById("industryNamelabelId").removeAttribute("class");
                }
                 else{
                    document.getElementById("industryNamelabelId").setAttribute("class","redTestDisplay");
                }
                if(industryName=="Other"){
                 document.getElementById("otherIndRow").style.display='table-row';
                }else{
                 document.getElementById("otherIndRow").style.display='none';
                 document.contactFormName.otherIndustryName.value="";
                }
               }

               function otherIndustryValidation(){
               var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
               var otherIndName=document.contactFormName.otherIndustryName.value;
                if(reg.test(otherIndName)){
                 document.getElementById("otherIndustryLabel").removeAttribute("class");
                }
                 else{
                    document.getElementById("otherIndustryLabel").setAttribute("class","redTestDisplay");
                }
                   if(otherIndName==""){
                    document.getElementById("otherIndustryLabel").removeAttribute("class");
                   }
               }


               function openRadio(checkVal){
                 if(checkVal.checked){
                 document.getElementById("mediaRow").style.display='table-row';
                 } else{
                 document.getElementById("mediaRow").style.display='none';
                 for(var i=0;i<document.contactFormName.mediaType.length;i++){
                document.contactFormName.mediaType[i].checked=false;
                 } }   }

              function mediavalidation(medval){
                 if(medval.checked){document.getElementById("mediaLabel").removeAttribute("class");  }
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

             function CheckFirstChar(key, txt){
            if(key == 32 && txt.value.length<=0)
            {return false;}
            else if(txt.value.length>0){
            if(txt.value.charCodeAt(0) == 32){
            txt.value=txt.value.substring(1,txt.value.length);
            return true;
            }}return true;}

</script>
 </head>
  <body class="body_page">

  <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 520px;height: auto;border-radius: 30px 30px 0 0;"><br/>

     <div style="background: white;border-left: solid 9px #d0d0d0;border-right: solid 2px #d0d0d0;width: 902px;margin-left: 25px;margin-top: 50px;height: auto;">
     <div style="background: #858585;height: 35px;margin-left: -1px;width:904px"></div>

     <div style=" min-height: 40px;">
     <div style="margin-top:-38px;margin-left: 14px;position: absolute;"><font style="font: bold 1.6em/1em Cambria;color: white;">Primary Contact</font></div>

     <form action="userContactAndMediaInfoSaving" name="contactFormName" id="contactFormID">
             <div style="margin-left: 10px;"><br/>
             <table style="margin-left: 25px;margin-top:13px;">
              <tr class="label"><td id="firstNamelabelId" align="right">First Name*:</td> <td> <input type="text"  name="firstName" style="width: 210px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;"  maxlength="30" onblur="firstNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);firstNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="lastNamelabelId" align="right">Last Name*:</td><td><input type="text"  name="lastName"  style="width: 210px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="30" onblur="lastNameValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);lastNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="phoneNumberlabelId" align="right">Phone Number:</td><td><input type="text" id="ph"  name="phoneNumber"  style="width: 210px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="12" onchange="phoneNumberValidation();" onblur="phoneNumberValidation();" onkeyup="phoneNumberValidation();return phoneFormat (event,ph)"  onkeypress="return numberonly(event,false)" /></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td id="companyNamelabel" align="right">Company Name*:</td><td><input type="text"  name="companyName"  style="width: 210px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="30" onblur="companyNamelabelValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);companyNamelabelValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 14px;"></tr>
              <tr class="label"><td id="industryNamelabelId" align="right">Select Industry*:</td><td><s:select id="industryNameS" name="industryName" cssStyle="position:absolute;margin-top:-25px;height:25px;width:210px;background-color: white;border-color: #f4f4f4;border-radius: 2px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" list="industryList" headerKey=""   headerValue="-------------Industry-------------" onchange="industryNameValidation();" onclick="industryNameValidation();"/></tr>
              <tr style="height: 4px;"></tr>
              <tr class="label" id="otherIndRow" style="display: none;"><td id="otherIndustryLabel" align="right">Enter Your Industry Type*:</td><td><input type="text" name="otherIndustryName"  style="margin-top: 6px;width: 210px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="30" onblur="otherIndustryValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);otherIndustryValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr><td><p id="medmessage" style="margin-top:10px;font: bold 1.1em/1em Calibri, sans-serif;color:#00a9f1">Are you a media member?</p></td><td><input type="checkbox"   name="userType" id="mmcheck" value="M" style="border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onclick="openRadio(this);"/><font color="black" size="3"> Yes</font></td></tr>
              <tr id="mediaRow" style="display: none;" class="label"><td id="mediaLabel" align="right" valign="top" >I work for a*:</td>
              <td  id="mediaRadioVal" ><font style="font-weight: normal;"><input type="radio" name="mediaType" onclick="mediavalidation(this)" id="radiosta" style="border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" value="RadioStation" /> Radio Station<br/>
              <input type="radio" name="mediaType" onclick="mediavalidation(this)" id="telv" style="border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" value="Television"/> Tv Station<br/>
              <input type="radio" name="mediaType" onclick="mediavalidation(this)" id="news" style="border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" value="Newspaper" /> News paper<br/>
              <input type="radio" name="mediaType" onclick="mediavalidation(this)" id="mag" style="border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" value="Magazine" /> Magazine<br/>
              <input type="radio" name="mediaType" onclick="mediavalidation(this)" id="others" style="border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" value="OtherMedia" /> Other Media<br/>
              </font></td></tr>
              <tr style="height: 20px;"></tr>
              <tr><td></td><td><button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE</font></button></td></tr>
             </table>
             </div>
          </form>
       </div><br/>
  </div>
<div style=" margin-top: -10px;margin-left: 22px;">
 <img src="/QuickKlix/images/CornerFoldImg.png" width="925px"/></div><br/><br/><br/><br/><br/><br/>
</div>
</div>
  </body>
</html>