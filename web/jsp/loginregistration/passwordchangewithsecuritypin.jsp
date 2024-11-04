<%-- 
    Document   : forgotpassword
    Created on : 6 Jun, 2014, 2:54:10 PM
    Author     : anusha
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset=utf-8 />
        <meta name="description" content="Quickklix Security PIN" />
        <meta name="keywords" content="Security PIN" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="/QuickKlix/CSS/nicebuttonsdisplay.css" type="text/css" />

    <style type="text/css">
            .label{
                color: #363535;
                font-size: 14px;
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
        <script type = "text/javascript">
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
         function validation(){
                var email=document.secpin.securityPin.value;
                var password=document.secpin.password.value;
                var confirmpass=document.secpin.conformPassword.value;

                var reg =/^[a-zA-Z0-9]{8}$/;
                var reg1 = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
                var result = true;
                if(reg.test(email)){
                    document.getElementById("secpinlabel").removeAttribute("class");
                }
                else{
                    document.getElementById("secpinlabel").setAttribute("class","redTestDisplay");
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
                return result;
            }

           function secpinValidation(){
               var reg = /^[a-zA-Z0-9]{8}$/;
               var email=document.secpin.securityPin.value;
               if(reg.test(email)){
                   document.getElementById("secpinlabel").removeAttribute("class");
               }
               else{
                   document.getElementById("secpinlabel").setAttribute("class","redTestDisplay");
                   if(email==""){
                        document.getElementById("secpinlabel").removeAttribute("class");
                   }
               }

           }
            function passValidation(){
               var reg1 = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
               var password=document.secpin.password.value;
                if(reg1.test(password)){
                   document.getElementById("passlabel").removeAttribute("class");

               }
               else{
                    document.getElementById("passlabel").setAttribute("class","redTestDisplay");
                    if(password==""){
                         document.getElementById("passlabel").removeAttribute("class");
                    }

               }

           }
            function confPassValidation(){
               var password=document.secpin.password.value;
               var confirmpass=document.secpin.conformPassword.value;
               if(password==confirmpass){

                   document.getElementById("confPasslabel").removeAttribute("class");

               }else{
                   document.getElementById("confPasslabel").setAttribute("class","redTestDisplay");
                   if(confirmpass==""){
                       document.getElementById("confPasslabel").removeAttribute("class");
                   }
               }

           }

           function passwdvalidation(){
           var reg1 = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
           var password=document.secpin.password.value;
           if(!(reg1.test(password))){
           document.secpin.password.value="" ;
            alert("Password must be a minimum of 8 characters with at least one digit.");
             }
           }


  </script>
    </head>
  <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 580px;height: auto;border-radius: 30px 30px 0 0;"><br/>

        <table style="margin-left: 420px;margin-top: -13px;">
            <form action="/QuickKlix/userRegistration.action" method="post">
                <tr><td><div align="right" style="font: bold 1.3em/1.25em Cambria;color: #595959;width:467px;"> New to QuickKlix?</div></td></tr>
            <tr><td><div align="right" style="margin-top: 2px;"><button type="submit" onMouseOver="this.style.color='#00a9f1';document.getElementById('docpRegImg1').src='/QuickKlix/images/SSImgs/RegistrationMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('docpRegImg1').src='/QuickKlix/images/SSImgs/RegistrationImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 32px; font: bold 1.26em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="docpRegImg1" src="/QuickKlix/images/SSImgs/RegistrationImg.png"/><font style="top: -3px;position: relative;">&nbsp;CREATE AN ACCOUNT</font></button></div></td></tr>
            </form>
        </table>
            
        <div style="margin-left: 410px;margin-top: 16px;position:absolute;">
        <p style="margin-left: 0px;margin-top: 10px;text-align: justify;width: 600px;color: #595959;font: bold 1.4em/1.25em Cambria;">
        <font color="#00a9f1" >Quick Klix </font>can help you overcome media</p>
        <p style="margin-left: 0px;margin-top: -5px;text-align: justify;width: 600px;color: #595959;font: bold 1.4em/1.25em Cambria;">
        planning complexities by:</p>

        <p style="margin-left: 0px;margin-top: 10px;text-align: justify;width: 600px;color: #494949;line-height: 3em;">
        <img src="images/tickMarkImg.png" alt="QuickKLix"/> <font style="font: 1.05em/1em sans-serif;margin-left:5px;">Defining Media Solutions</font><br/>
        <img src="images/tickMarkImg.png" alt="QuickKLix"/> <font style="font: 1.05em/1em sans-serif;margin-left:5px;">Establishing Effective Media Vehicles</font><br/>
        <img src="images/tickMarkImg.png" alt="QuickKLix"/> <font style="font: 1.05em/1em sans-serif;margin-left:5px;">Procuring the Best Placement and Price of Media Real-Estate</font><br/>
        <img src="images/tickMarkImg.png" alt="QuickKLix"/> <font style="font: 1.05em/1em sans-serif;margin-left:5px;">Analyzing Extensive Statistical and Quantitative Data</font><br/>
        <img src="images/tickMarkImg.png" alt="QuickKLix"/> <font style="font: 1.05em/1em sans-serif;margin-left:5px;">Providing Data-Driven Strategies and Predictive Analytics </font><br/>
        </p>
        </div>    

        <div style="margin-left: 70px;margin-top:34px;background: #f1f1f1;min-height: 365px;width: 310px;box-shadow: 3px 3px 0px #7e7e7e;height: auto;">
        <div style="background: #666666;height: 40px;width:311px;margin-top:-3px;">
        <p style="margin-left: 37px; margin-top: 9px; text-align: justify; color: white; font: bold 1.6em/1em Cambria;position: absolute;">
        New Password PIN</p>
        </div>

        <s:form action="passwordChangeWithSecPIN" name="secpin">
        <table style="margin-top: 5px;margin-left: 30px;position: absolute;">
        <tr><s:if test="hasActionErrors()"><s:iterator value="actionErrors">
        <tr><td></td><td class="error"><font  style="color: #c00002;font-size:14px; height: 10px;"><img src="/QuickKlix/images/warning.gif" width="18" height="12"/>
        <s:property escape="false" /></font></td></tr></s:iterator></s:if></tr></table>

        <table style="margin-top: 35px;margin-left: 30px;position: absolute;">
        <tr class="label" style="margin-left: 400px;font: bold 1em/1em Verdana, Geneva, Arial, Helvetica, sans-serif;line-height: 1.25em;"><td></td><td id="secpinlabel">Security PIN*:</td>
        <td><s:textfield id="secpin" name="securityPin" maxLength="8"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);secpinValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onblur="secpinValidation()" ></s:textfield></td></tr>
        <tr style="height: 7px;"></tr>
        <tr  class="label" style="font: bold 1em/1em Verdana, Geneva, Arial, Helvetica, sans-serif;line-height: 1.25em;"><td></td><td id="passlabel">New Password*:</td>
        <td>  <s:password id="pass" name="password" maxlength="30" style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);passValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"  onblur="passValidation()" onchange="passwdvalidation()"></s:password></td></tr>
        <tr style="height: 7px;"></tr>
        <tr  class="label" style="font: bold 1em/1em Verdana, Geneva, Arial, Helvetica, sans-serif;line-height: 1.25em;"><td></td><td id="confPasslabel">Confirm Password*:</td>
        <td>  <s:password name="conformPassword" id="conPass" maxlength="30" style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;"  onkeyup = "CheckFirstChar(event.keyCode, this);confPassValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onblur="confPassValidation()"></s:password></td></tr>

        <tr style="height: 25px;"></tr>
        <tr><td colspan="2">&nbsp;<button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('SaveButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('SaveButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="SaveButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE PASSWORD</font></button></td></tr>
        </table>
        </s:form>
        </div>
    </div>
    </div>

</body>


</html>
