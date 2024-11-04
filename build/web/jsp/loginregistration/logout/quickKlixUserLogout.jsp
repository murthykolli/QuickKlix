<%-- 
    Document   : quickKlixUserLogout
    Created on : 17 Jun, 2014, 2:53:36 PM
    Author     : murthyk
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset=utf-8 />

        <meta name="description" content="Quick Klix Login Page " />
        <meta name="keywords" content="Login Page Creation" />

	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <link rel="shortcut icon" href="/QuickKlix/images/TabIcons/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="/QuickKlix/CSS/nicebuttonsdisplay.css" type="text/css" />
        <!--[if gte IE 6 ]>
        <style>
        #target{
        margin-left: 310px;
        }
        </style>
        <![endif]-->

        <!--[if lte IE 8]>
          <script type="text/javascript">
          alert("IE8 and below versions are not supported. You're using supported version like Firefox, Google Chrome,...");
         </script><![endif]-->
    <style type="text/css">
            .label{
                color: #363535;
                font-size: 14px;
                font-weight: bold;
            }
            .redTestDisplay{
                color: #c00000;
                font-style: italic;
             }
            #target{margin-left: 290px;}
        </style>
	<script type="text/javascript">
    if (navigator.userAgent.indexOf("Chrome")!=-1 || navigator.userAgent.toLowerCase().match('chrome'))
    document.write('<style type="text/css" >#target{margin-left:310px;}</style>');
    </script>

    <script>
    window.location.hash="";
    window.location.hash="";
    window.onhashchange=function(){window.location.hash="";}
    </script>

        <script type = "text/javascript">
            window.onload=function(){
                window.history.forward(1);
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
       function validation(){
                var email=document.login.userName.value;
                var password=document.login.password.value;

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
                return result;
            }

               function emailValidation(){
               var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
               var email=document.login.userName.value;
               if(reg.test(email)){
                   document.getElementById("emaillabel").removeAttribute("class");
               }
               else{
                   document.getElementById("emaillabel").setAttribute("class","redTestDisplay");
                   if(email==""){
                        document.getElementById("emaillabel").removeAttribute("class");
                   }  }
           }
            function passValidation(){
               var reg1 = /^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z0-9]).{8,30}$/;
               var password=document.login.password.value;
                if(reg1.test(password)){
                   document.getElementById("passlabel").removeAttribute("class");
               }
               else{
                    document.getElementById("passlabel").setAttribute("class","redTestDisplay");
                    if(password==""){
                         document.getElementById("passlabel").removeAttribute("class");
                    }  }
           }

           function removeErrorMsg(){
           document.getElementById("errMsgId").style.display='none';
           }

  </script>

    </head>

<body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 580px;height: auto;border-radius: 30px 30px 0 0;"><br/>

       <div id="errMsgId" style="margin-left: 100px;margin-top: 150px;position:absolute;font: 0.95em/1.25em sans-serif;color:#00a9f1;">You have been successfully logged out.</div>

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

        <div style="margin-left: 70px;margin-top:34px;background: #f1f1f1;min-height: 350px;width: 310px;box-shadow: 3px 3px 0px #7e7e7e;height: auto;">
        <div style="background: #666666;height: 40px;width:311px;margin-top:-3px;">
        <p style="margin-left: 37px; margin-top: 9px; text-align: justify; color: white; font: bold 1.6em/1em Cambria;position: absolute;">
        Login</p>
        </div>

        <s:form action="loginaction" id="login" name="login">
        <table style="margin-top: 5px;margin-left: 30px;position: absolute;">
        <tr><s:if test="hasActionErrors()"><s:iterator value="actionErrors">
        <tr><td></td><td class="error"><font  style="color: #c00002;font-size:14px; height: 10px;"><img alt="Documents" src="/QuickKlix/images/warning.gif" width="18" height="12"/>
        <s:property escape="false" /></font></td></tr></s:iterator></s:if></tr></table>
         <table style="margin-top: 35px;margin-left: 30px;position: absolute;">
        <tr class="label" style="margin-left: 400px;font: bold 1em/1em Verdana, Geneva, Arial, Helvetica, sans-serif;line-height: 1.25em;"><td></td><td id="emaillabel">Email Address*:</td>
        <td><s:textfield name="userName" style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="emailValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);emailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onclick="removeErrorMsg();" ></s:textfield></td></tr>
        <tr style="height: 7px;"></tr>
        <tr  class="label" style="font: bold 1em/1em Verdana, Geneva, Arial, Helvetica, sans-serif;line-height: 1.25em;"><td></td><td id="passlabel">Password*:</td>
        <td>  <s:password name="password" style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;"  onblur="passValidation()" onkeyup = "CheckFirstChar(event.keyCode, this);passValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onclick="removeErrorMsg();"></s:password></td></tr>

        <tr style="height: 25px;"></tr>
        <tr><td colspan="2">&nbsp;<button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('LoginButtonImg1').src='/QuickKlix/images/SSImgs/LoginSaveTextPointerWHImg.png';" onMouseOut="this.style.color='white';document.getElementById('LoginButtonImg1').src='/QuickKlix/images/SSImgs/LoginSaveTextPointerBlUeImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="LoginButtonImg1" src="/QuickKlix/images/SSImgs/LoginSaveTextPointerBlUeImg.png"/><font style="top: -3px;position: relative;">&nbsp;LOGIN</font></button></td></tr>


        <tr style="height: 12px;"></tr>
        <tr class="label" style="margin-left: 400px;"><td></td><td><a href="forgotPassword.action" title="Forgot Password"><font color="#009AD0" style="font: 1.1em/1em sans-serif;line-height: 1.25em;" onMouseOver="this.style.color='blue';" onMouseOut="this.style.color='#009AD0';"><u>Forgot password?</u></font></a></td></tr>

        </table>
        </s:form>

        </div>





    </div>
    </div>

</body>
</html>