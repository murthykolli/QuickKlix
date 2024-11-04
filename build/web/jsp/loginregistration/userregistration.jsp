<%--
    Document   : legalnodregistration
    Created on : 22 Nov, 2012, 3:04:26 PM
    Author     : murthyk
--%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
     <%@taglib  prefix="s" uri="/struts-tags" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset=utf-8 />

        <meta name="description" content="Legal Documents New Contact Info, this service is most important for your legal needs, legalnod provide very quick service. " />
        <meta name="keywords" content="how to form an llc, New Contact Page Creation, Contact page, document creation, Cheap legal services, Free legal documents, Legal documents, Legal forms, Forming a company, llc form display, llp and lp, limited liability company, limited liability corporation" />

	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="/LegalNod/CSS/nicebuttonsdisplay.css" type="text/css" />
        
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

            input.check{
                width: 30px;
                height: 30px;
            }

        </style>
        <script>


            function validation(){
                var email=document.register.userName.value;
                var password=document.register.password.value;
                var confirmpass=document.register.conformPassword.value;

                var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
                var reg1 = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
                var result = true;
                if(reg.test(email)){
                    document.getElementById("emaillabel").removeAttribute("class");
                }
                else{
                    document.getElementById("emaillabel").setAttribute("class","redTestDisplay");
                    result=false;
                }
                if(reg1.test(password)){
                    document.getElementById("passlabel").removeAttribute("class");
                }
                else{
                    document.getElementById("passlabel").setAttribute("class","redTestDisplay");
                    result=false;
                }
                if(password!=confirmpass || confirmpass==""){

                    document.getElementById("confPasslabel").setAttribute("class","redTestDisplay");
                    result=false;
                }
                else{
                    document.getElementById("confPasslabel").removeAttribute("class");
                }
               if(reg.test(email) && reg1.test(password) && password==confirmpass ){
                if(document.register.terms.checked==false){
                alert("Please accept the terms and conditions.")
                 result=false;
                }}
                return result;
            }

           function emailValidation(){
               var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
               var email=document.register.userName.value;
               if(reg.test(email)){
                   document.getElementById("emaillabel").removeAttribute("class");
               }
               else{
                   document.getElementById("emaillabel").setAttribute("class","redTestDisplay");
                   if(email==""){
                     document.getElementById("emaillabel").removeAttribute("class");
                   }   }

           }
            function passValidation(){
               var reg1 = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
               var password=document.register.password.value;
                if(reg1.test(password)){
                   document.getElementById("passlabel").removeAttribute("class");
               }
               else{
                    document.getElementById("passlabel").setAttribute("class","redTestDisplay");
                    if(password==""){
                     document.getElementById("passlabel").removeAttribute("class");
                    }  }
           }
            function confPassValidation(){
               var password=document.register.password.value;
               var confirmpass=document.register.conformPassword.value;
               if(password==confirmpass){
                   document.getElementById("confPasslabel").removeAttribute("class");
               }else{
                   document.getElementById("confPasslabel").setAttribute("class","redTestDisplay");
                   if(confirmpass==""){
                       document.getElementById("confPasslabel").removeAttribute("class");
                   } } }


           function CheckFirstChar(key, txt)
           {
               if(key == 32 && txt.value.length<=0)
               {  return false;}
               else if(txt.value.length>0)
               {
                   if(txt.value.charCodeAt(0) == 32)
                   {
                       txt.value=txt.value.substring(1,txt.value.length);
                       return true;
                   } }
               return true;
           }

           function passwdvalidation(){
           var reg1 = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
           var password=document.register.password.value;
           if(!(reg1.test(password))){
           document.register.password.value="" ;
           alert("Password must be a minimum of 8 characters with at least one digit.");
             }
         }
        </script>
</head>

<body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 595px;height: auto;border-radius: 30px 30px 0 0;"><br/>

   <div style="margin-left: 120px;margin-top:45px;background: #f1f1f1;min-height: 430px;width: 310px;box-shadow: 3px 3px 0px #7e7e7e;height: auto;">
        <div style="background: #666666;height: 40px;width:311px;margin-top:-3px;">
        <p style="margin-left: 37px; margin-top: 9px; text-align: justify; color: white; font: bold 1.6em/1em Cambria;position: absolute;">
        New User</p>
        </div>

        <s:form action="registrationDataSaving" name="register" id="signup">
        <table style="margin-top: 5px;margin-left: 30px;position: absolute;">
        <tr><s:if test="hasActionErrors()"><s:iterator value="actionErrors">
        <tr><td></td><td class="error"><font  style="color: #c00002;font-size:14px; height: 10px;" id="errmsg"><img src="/QuickKlix/images/warning.gif" width="18" height="12"/>
        <s:property escape="false" /></font></td></tr></s:iterator></s:if></tr></table>
         <table style="margin-top: 35px;margin-left: 30px;position: absolute;">
        <tr class="label" style="font: bold 1em/1.25em sans-serif;"><td></td><td  id="emaillabel">Email Address*:</td><td> <s:textfield  id="email" name="userName" maxLength="50" style="width:245px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);emailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onblur="emailValidation()"/></td></tr>
        <tr style="height: 5px;"></tr>
        <tr class="label" style="font: bold 1em/1.25em sans-serif;"><td></td><td class="label" id="passlabel">Password*:</td><td>  <s:password id="pass" name="password" maxlength="30" style="width:245px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);passValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"  onblur="passValidation()" onchange="passwdvalidation();"/></td></tr>
        <tr style="height: 5px;"></tr>
        <tr class="label" style="font: bold 1em/1.25em sans-serif;"><td></td><td class="label" id="confPasslabel">Confirm Password*:</td><td><s:password name="conformPassword" id="conPass" maxlength="30" style="width:245px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);confPassValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onblur="confPassValidation()"/></td></tr>
       <tr style="height: 72px;"></tr>
        <tr><td colspan="2">&nbsp;<button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('RegButtonImg1').src='/QuickKlix/images/SSImgs/RegPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('RegButtonImg1').src='/QuickKlix/images/SSImgs/RegPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;position: relative;">SIGN UP&nbsp;</font><img id="RegButtonImg1" src="/QuickKlix/images/SSImgs/RegPointerBlueImg.png"/> </button></td></tr>

        </table>
      <table style="margin-left: 25px;margin-top:230px;position: absolute;font: 1.1em/1.25em sans-serif;" >
          <tr><td></td><td style="margin-left:140px; "><div style="margin-top:-20px;"><input type="checkbox" style="box-shadow: 2px 2px 1px #6a6a6a;" name="terms" value=""/></div></td><td style="font-size: 14px">I accept the <a target="_blank" href="termsAndConditionsPopup.action" style="text-decoration: none;color: #009ad0;cursor: pointer;"onmouseover="this.style.color='blue',style.fontWeight = 'normal';" onmouseout="this.style.color='#009ad0',style.fontWeight = 'normal';">Terms and Conditions</a><br/> and <a target="_blank" href="privacyPolicyPopup.action" style="cursor: pointer;text-decoration: none;color: #009ad0;" onmouseover="this.style.color='blue',style.fontWeight = 'normal';" onmouseout="this.style.color='#009ad0',style.fontWeight = 'normal';">Privacy Policy</a></td></tr>
            <%--<tr><td></td><td style="margin-left:140px; "><div style="margin-top:-20px;"><input type="checkbox" style="box-shadow: 2px 2px 1px #6a6a6a;"name="terms" value=""/></div></td><td style="font-size: 14px">I accept the <font id="gallerya1"><a href="/LegalNod/images/TermsAndConditionsImg.png" style="text-decoration: none;color: #009ad0;cursor: pointer;"onmouseover="this.style.color='blue',style.fontWeight = 'normal';" onmouseout="this.style.color='#009ad0',style.fontWeight = 'normal';">Terms and Conditions</a></font><br/> and <font id="gallerya2"><a href="/LegalNod/images/PrivacyPolicyImg.png" style="cursor: pointer;text-decoration: none;color: #009ad0;" onmouseover="this.style.color='blue',style.fontWeight = 'normal';" onmouseout="this.style.color='#009ad0',style.fontWeight = 'normal';">Privacy Policy</a></font></td></tr>--%>
        </table>

        </s:form>

   </div>



        <table style="margin-left: 0px;margin-top: 0px;"><tr><td>
        <p style="margin-left: 120px;margin-top: 10px;text-align: left;color: #1c1c1c;font: 1.19em/1.25em sans-serif;">
         Already have an account? </p>
         </td><td></td><td></td>
         <td><a href="quickklixLogin.action" title="Login" style="font-size:14px;font-family: Calibri, sans-serif;text-decoration:none;"><font color="#009ad0" style="font-size:16px;" onMouseOver="this.style.color='blue',style.fontWeight = 'normal';" onMouseOut="this.style.color='#009ad0',style.fontWeight = 'normal';">Login here</font></a></td>
         </tr></table>

        <%--<div style="margin-left: 460px;margin-top: -460px;position:absolute;">
        <p style="margin-left: 0px;margin-top: 10px;text-align: left;width: 340px;color: #00a9f1;">
        <img src="/LegalNod/images/approvedstatusImg.png"/> <font style="font: bold 1.5em/1em Cambria;margin-left:5px;">PERSONALIZED</font>
        </p>
        <p style="margin-left: 34px;margin-top: -10px;text-align: left;width: 340px;color: #393939;font: 1.0em/1.25em sans-serif;">
        Create personalized documents in a short amount of time</p>

        <p style="margin-left: 0px;margin-top: 10px;text-align: left;width: 340px;color: #00a9f1;">
        <img src="/LegalNod/images/approvedstatusImg.png" /> <font style="font: bold 1.5em/1em Cambria;margin-left:5px;">COST-EFFECTIVE</font>
        </p>
        <p style="margin-left: 34px;margin-top: -10px;text-align: left;width: 340px;color: #393939;font: 1.0em/1.25em sans-serif;">
        Avoid high legal fees by using our affordable services</p>

        <p style="margin-left: 0px;margin-top: 10px;text-align: left;width: 340px;color: #00a9f1;">
        <img src="/LegalNod/images/approvedstatusImg.png"/> <font style="font: bold 1.5em/1em Cambria;margin-left:5px;">EFFICIENT</font>
        </p>
        <p style="margin-left: 34px;margin-top: -10px;text-align: left;width: 340px;color: #393939;font: 1.0em/1.25em sans-serif;">
        Save your progress and access your documents 24/7</p>

        <p style="margin-left: 0px;margin-top: 10px;text-align: left;width: 340px;color: #00a9f1;">
        <img src="/LegalNod/images/approvedstatusImg.png"/> <font style="font: bold 1.5em/1em Cambria;margin-left:5px;">SECURE</font>
        </p>
        <p style="margin-left: 34px;margin-top: -10px;text-align: left;width: 340px;color: #393939;font: 1.0em/1.25em sans-serif;">
        Keep track of all of your legal documents in one secure place</p>


        </div>--%>


    </div>
    </div>






</body>
</html>