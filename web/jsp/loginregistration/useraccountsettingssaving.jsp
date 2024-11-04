<%-- 
    Document   : useraccountsettingssaving
    Created on : 11 Jun, 2014, 4:44:19 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<%--<%@taglib uri="http://displaytag.sf.net" prefix="display" %>--%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />

        <script src="/QuickKlix/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>

       <style>
            .tdLabel{
                display: none;
               }
           .label {
               color: #363535;
              font-size: 14px;
              font-family: sans-serif;
              font-weight: bold;
            }
            .redTestDisplay{
                color: red;
                font-style: italic;
            }
           .errorMessage {
            position: absolute;
            display: inherit;
            font-size: 13px;
            color: red;
                    }
            [errorfor]{
            height:20px;
            }
       </style>
       <script>
        function cPwdValidation(){
        var currpwd1=document.changePwdForm.password.value;
        var newPwd1=document.changePwdForm.newPassword.value;
        var confirmpwd1=document.changePwdForm.conformPassword.value;
        var reg1 = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
        var result = true;
        if(reg1.test(currpwd1)){
        document.getElementById("currPwdLabel").removeAttribute("class");
        }
        else{
        document.getElementById("currPwdLabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        if(reg1.test(newPwd1)){
        document.getElementById("pwdLabel").removeAttribute("class");
        }
        else{
        document.getElementById("pwdLabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        if(newPwd1!=confirmpwd1 || confirmpwd1==""){
        document.getElementById("confPwdLabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        else{
        document.getElementById("confPwdLabel").removeAttribute("class");
        }
        return result;
        }

        function currPassValidation1(){
        var reg = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
        var currpwd1=document.changePwdForm.password.value;
        if(reg.test(currpwd1)){
        document.getElementById("currPwdLabel").removeAttribute("class");
        }
        else{
        document.getElementById("currPwdLabel").setAttribute("class","redTestDisplay");
        if(currpwd1==""){
        document.getElementById("currPwdLabel").removeAttribute("class");
        }
        }}
        function passValidation1(){
        var reg= /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
        var newPwd1=document.changePwdForm.newPassword.value;
        if(reg.test(newPwd1)){
        document.getElementById("pwdLabel").removeAttribute("class");
        document.getElementById("msglabel1").removeAttribute("class");
        }
        else{
        document.getElementById("pwdLabel").setAttribute("class","redTestDisplay");
        document.getElementById("msglabel1").setAttribute("class","redTestDisplay");
        }
        if(newPwd1==""){
        document.getElementById("pwdLabel").removeAttribute("class");
        document.getElementById("msglabel1").removeAttribute("class");
        }
        }
        function confPassValidation1(){
        var newPwd1=document.changePwdForm.newPassword.value;
        var confirmpwd1=document.changePwdForm.conformPassword.value;
        if(newPwd1==confirmpwd1){
        document.getElementById("confPwdLabel").removeAttribute("class");
        }else{
        document.getElementById("confPwdLabel").setAttribute("class","redTestDisplay");
        if(confirmpwd1==""){
        document.getElementById("confPwdLabel").removeAttribute("class");
        }
        }}
        function contactInfoValidation(){
        var reg=/^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&]*$/;
        var phoneReg=/^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
        var firstName=document.editcontact.firstName.value;
        var lastName=document.editcontact.lastName.value;
        var phoneNumber=document.editcontact.phoneNumber.value;
        var companyName=document.editcontact.companyName.value;
        var result=true;
        if(reg.test(firstName)){
        document.getElementById("fnamelabel").removeAttribute("class");
        }
        else{
        document.getElementById("fnamelabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        if(reg.test(lastName)){
        document.getElementById("lnamelabel").removeAttribute("class");
        }
        else{
        document.getElementById("lnamelabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        if(phoneReg.test(phoneNumber)){
        document.getElementById("phonelabel").removeAttribute("class");
        }
        else{
        document.getElementById("phonelabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        if(reg.test(companyName)){
        document.getElementById("companylabel").removeAttribute("class");
        }
        else{
        document.getElementById("companylabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        return result;
        }
        function firstNameValidation(){
        var reg=/^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&]*$/;
        var firstName=document.editcontact.firstName.value;
        if(reg.test(firstName)){
        document.getElementById("fnamelabel").removeAttribute("class");
        }
        else{
        document.getElementById("fnamelabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        if(firstName==""){
        document.getElementById("fnamelabel").removeAttribute("class");
        }
        }
        function lastNameValidation(){
        var reg=/^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&]*$/;
        var lastName=document.editcontact.lastName.value;
        if(reg.test(lastName)){
        document.getElementById("lnamelabel").removeAttribute("class");
        }
        else{
        document.getElementById("lnamelabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        if(lastName==""){
        document.getElementById("lnamelabel").removeAttribute("class");
        }
        }
        function phoneNumberValidation(){
        var phoneReg=/^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
        var phoneNumber=document.editcontact.phoneNumber.value;
        if(phoneReg.test(phoneNumber)){
        document.getElementById("phonelabel").removeAttribute("class");
        }
        else{
        document.getElementById("phonelabel").setAttribute("class","redTestDisplay");
        result=false;
        }
        if(phoneNumber==""){
        document.getElementById("phonelabel").removeAttribute("class");
        }
        }
        function companyNameValidation(){
        var reg=/^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&]*$/;
        var companyName=document.editcontact.companyName.value;
        if(reg.test(companyName)){
        document.getElementById("companylabel").removeAttribute("class");
        }
        else{
        document.getElementById("companylabel").setAttribute("class","redTestDisplay");
        }
        if(companyName==""){
        document.getElementById("companylabel").removeAttribute("class");
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

          function numeralsOnly(evt) {
          evt = (evt) ? evt : event;
          var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
          ((evt.which) ? evt.which : 0));
          if (charCode > 31 && (charCode < 48 || charCode > 57)) {
          return false;
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
</script>



<script>
var message = '<s:if test="hasActionMessages()"><s:iterator value="actionMessages"><s:property escape="false" /></s:iterator></s:if>';
if(message==""){
}else{
 window.alert(message);
}
 </script>

 <script>
    $(document).ready(function(){
     $("#pswdshow").click(function(){
      $("#passwdele").toggle("slow");
    });
     if("<s:property value="passError"/>"=="invalpass"){
     $("#passwdele").show();
     }
    $("#contactShow").click(function(){
     $("#contactele").toggle("slow");
    });

});


</script>

    </head>
    <body class="body_page">


   <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 695px;height: auto;border-radius: 30px 30px 0 0;"><br/>

        <div style="margin-top:38px;margin-left: 54px;position: absolute;font-family: Cambria;"><font style="font: bold 1.45em/1em Cambria;color:#595959;">My Account</font></div><br/>

        <table style="margin-left: 24px;margin-top:31px;position: absolute;">
            <tr><td style="border-bottom: 27px solid #7e7e7e;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="userAccountSettings.action" title="User Profile" style="position: relative;top:25px;cursor: pointer;text-decoration: none;" ><font color="white" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='white';"><b>&nbsp;User Profile&nbsp;</b></font></a> </td>
            </tr>
        </table>

     <div style="background: white;border-top:  solid 3px #d0d0d0;border-bottom:  solid 2px #d0d0d0;border-left:  solid 2px #d0d0d0;border-right:  solid 2px #d0d0d0;box-shadow: 4px 4px 1px #dddddd;width: 902px;margin-left: 25px;margin-top: 82px;height: auto;">
       <br/><br/>


    <div style="background: white;border: solid 2px #d0d0d0;width: 808px;margin-left: 40px;margin-top: 0px;height: auto;">
    <div style="background: #f2f2f2;height: 35px;margin-left: -2px;margin-top:-2px;border: solid 2px #d0d0d0;width:808px"></div>
    <div style="margin-top:-30px;margin-left: 14px;position: absolute;"><font style="font-family: Cambria;font-size: 20px;font-weight: bold;color: #6f6e6e;">Password</font></div>
    <table style="margin-top: 10px;margin-left: 15px;" id="pwdalignTab">
    <tr style="white-space: nowrap;"><td>Current Password:</td><td>&nbsp;&nbsp;**********</td></tr>
    <tr style="height:10px"><td></td><td></td></tr>
    </table>
    <div style="background: #f2f2f2;border-left: solid 1px #d0d0d0;border-right: solid 2px #d0d0d0;border-top: solid 2px #d0d0d0;border-bottom: solid 2px #d0d0d0;min-height: 30px;width: 765px;margin-left: 20px;margin-top: -10px;height: auto;" id="pwdalign">
    <table style="margin-left: 28px;"><tr><td></td><td><span style="cursor: pointer;"><font color="#00A9F1" size="3" onMouseOver="this.style.color='blue',style.fontWeight = 'normal';" onMouseOut="this.style.color='#00A9F1',style.fontWeight = 'normal';" id="pswdshow"><u>Edit Password</u></font></span></td></tr></table>
    <div id="passwdele" style="margin-left: 0px;margin-top: 0px;min-height: 5px;display: none">

      <s:form action="passwordModification" name="changePwdForm" autocomplete="off">
          <table style=" margin-left: 60px;margin-top:0px;">
                 <tr class="label"><td  id="currPwdLabel">Current Password*:</td><td> <s:password  id="currPass1" name="password" maxLength="30" style="height:25px;width:250px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);currPassValidation1();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onblur="currPassValidation1();"/></td></tr>
                 <tr style="height: 10px;"></tr>
                 <tr class="label"><td id="msglabel1"><font size="2" style="margin-top: 10px;white-space: nowrap;height: 12px;font-weight: normal;">Password must be a minimum of 8 characters with at least one numeric value</font></td></tr>
                 <tr style="height: 10px;"></tr>
                 <tr class="label"><td id="pwdLabel">New Password*:</td><td>  <s:password id="pass1" name="newPassword" maxlength="30" style="height:25px;width:250px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);passValidation1();" onkeydown = "return CheckFirstChar(event.keyCode, this);"  onblur="passValidation1();"/></td></tr>
                 <tr style="height: 10px;"></tr>
                 <tr class="label"><td  id="confPwdLabel">Re-enter New Password*:</td><td><s:password name="conformPassword" id="conPass1" maxlength="30" style="height:25px;width:250px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);confPassValidation1();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onblur="confPassValidation1();"/></td></tr>
                 <tr style="height: 20px;"></tr>

                 <tr><td><button type="submit" onclick="return cPwdValidation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('docPSImg1').src='/QuickKlix/images/SSImgs/PasswordSavingMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('docPSImg1').src='/QuickKlix/images/SSImgs/PasswordSavingImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 34px; font: bold 1.14em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="docPSImg1" src="/QuickKlix/images/SSImgs/PasswordSavingImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE CHANGES</font></button></td></tr>

        </table><br/><br/>
      </s:form>
    </div></div><br/>
    </div><br/>

       <!--Edit Contact Info-->

    <div style="background: white;border: solid 2px #d0d0d0;width: 808px;margin-left: 40px;margin-top: 0px;height: auto;">
     <div style="background: #f2f2f2;height: 35px;margin-left: -2px;margin-top:-2px;border: solid 2px #d0d0d0;width:808px"></div>

     <div style="margin-top:-30px;margin-left: 14px;position: absolute;"><font style="font-family: Cambria;font-size: 20px;font-weight: bold;color: #6f6e6e;">Primary Contact</font></div>
     <table style="margin-top: 10px;margin-left: 15px;">
                <tr style="white-space: nowrap;"><td><u><b>Contact Info:</b></u></td><td>&nbsp;&nbsp;</td></tr>
                 <s:hidden><s:param name="value"><s:property escape="false" value="primaryContactsList"/></s:param></s:hidden>
                 <tr style="margin-top: 0px;"><td><s:property value="firstName"></s:property>&nbsp;<s:property value="lastName"></s:property></td></tr>
                <tr style="margin-top: 0px;"><td><s:property value="phoneNumber"></s:property></td></tr><tr style="margin-top: 0px;"><td><s:property value="companyName"></s:property></td></tr>
        </table> <br/>
        <div style="background: #f2f2f2;border-left: solid 1px #d0d0d0;border-right: solid 2px #d0d0d0;border-top: solid 2px #d0d0d0;border-bottom: solid 2px #d0d0d0;min-height: 30px;width: 765px;margin-left: 20px;margin-top: 10px;height: auto;">
           <table style="margin-left: 28px;"><tr><td></td><td><span style="cursor: pointer;"><font color="#00A9F1" size="3" onMouseOver="this.style.color='blue',style.fontWeight = 'normal';" onMouseOut="this.style.color='#00A9F1',style.fontWeight = 'normal';" id="contactShow"><u>Edit Contact Info</u></font></span></td></tr></table>

         <div id="contactele" style="margin-left: 0px;margin-top: 0px;min-height: 5px;display: none">

         <form action="primaaryContactModification" name="editcontact">
            <table style="margin-left: 60px;margin-top:0px;">
                <tr class="label"><td id="fnamelabel"> First Name*:</td></tr>
                <tr><td> <s:textfield  name="firstName" cssStyle="height:25px;width:250px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="firstNameValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);firstNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
                <tr style="height: 10px;"></tr>
                <tr class="label"><td id="lnamelabel"> Last Name*:</td></tr>
                <tr><td> <s:textfield  name="lastName" cssStyle="height:25px;width:250px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;"  onblur="lastNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);lastNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
                <tr style="height: 10px;"></tr>
                <tr class="label"><td id="phonelabel"> Phone Number*:</td></tr>
                <tr><td> <s:textfield  name="phoneNumber"  maxLength="12" id="ph" cssStyle="height:25px;width:250px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onchange="phoneNumberValidation();return phoneFormat (event,ph);" onblur="phoneNumberValidation();" onkeydown="phoneNumberValidation();return numeralsOnly(event);" onkeyup="return phoneFormat (event,ph)"   onkeypress="return numeralsOnly(event);"/></td></tr>
                <tr style="height: 10px;"></tr>
                <tr class="label"><td id="companylabel">Company*:</td></tr>
                <tr><td> <s:textfield  name="companyName" cssStyle="height:25px;width:250px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="companyNameValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);companyNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);companyNameValidation();"onchange="companyNameValidation();"/></td></tr>
                <tr style="height: 20px;"></tr>

                <tr><td><button type="submit" onclick="return contactInfoValidation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('docConImg1').src='/QuickKlix/images/SSImgs/ContactSavingMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('docConImg1').src='/QuickKlix/images/SSImgs/ContactSavingImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 34px; font: bold 1.14em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="docConImg1" src="/QuickKlix/images/SSImgs/ContactSavingImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE CHANGES</font></button></td></tr>

              </table> <br/><br/>
        </form>
       </div> </div> <br/>
     </div> <br/><br/>
     </div><br/><br/><br/><br/><br/><br/></div></div>

</body>
</html>