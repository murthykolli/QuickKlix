<%--
    Document   : userinvitationcreation
    Created on : 5 Jun, 2014, 9:40:00 AM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@taglib  prefix="sx" uri="/struts-dojo-tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

        <%
            if(session.getAttribute("invitation111")=="emailsent"){
                out.println("<script>function rec(){window.alert('Your invite has been sent!');return 0;}</script>");
                            session.removeAttribute("invitation111");
          }
            else if(session.getAttribute("invitation111")=="alreadysend"){
                out.println("<script>function rec(){window.alert('You have already sent an invite to this email!');return 0;}</script>");
                            session.removeAttribute("invitation111");
          }
          
            else if(session.getAttribute("invitation111")=="registeredUser"){
                out.println("<script>function rec(){window.alert('This userid already registered.');return 0;}</script>");
                            session.removeAttribute("invitation111");
          }


    %>


     <script type = "text/javascript">
         window.onload = function onloadfunction(){
                   rec();
            document.userInvitationFormName.senderName.value = "";
            document.userInvitationFormName.senderEmail.value = "";
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
    </script>

        <script type="text/javascript">

          function validation(){
           var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
           var emailReg=/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
            var result = true;
            var senderName=document.userInvitationFormName.senderName.value;
            var senderEmail=document.userInvitationFormName.senderEmail.value;
            if(senderName != ""){
            document.getElementById("nameId").removeAttribute("class");
            }
            else{
            document.getElementById("nameId").setAttribute("class","redTestDisplay");
            result=false;
            }
            if(emailReg.test(senderEmail)){
            document.getElementById("emailId").removeAttribute("class");
            }
            else{
            document.getElementById("emailId").setAttribute("class","redTestDisplay");
            result=false;
            }
            return result;
            }

            function nameValidation(){
               var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
             var senderName=document.userInvitationFormName.senderName.value;

                if(reg.test(senderName)){
                 document.getElementById("nameId").removeAttribute("class");
                }
                 else{
                    document.getElementById("nameId").setAttribute("class","redTestDisplay");
                }
                   if(senderName==""){
                        document.getElementById("nameId").removeAttribute("class");
                   }
               }

           function emailValidation(){
              var emailReg=/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
             var senderEmail=document.userInvitationFormName.senderEmail.value;

                if(emailReg.test(senderEmail)){
                 document.getElementById("emailId").removeAttribute("class");
                }
                 else{
                    document.getElementById("emailId").setAttribute("class","redTestDisplay");
                }
                   if(senderEmail==""){
                        document.getElementById("emailId").removeAttribute("class");
                   }
              }

               </script>

    </head>
    <body class="body_page">
        <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 480px;height: auto;border-radius: 30px 30px 0 0;"><br/>

     <div style="background: white;border-left: solid 9px #d0d0d0;border-right: solid 2px #d0d0d0;width: 889px;margin-left: 25px;margin-top: 50px;height: auto;">
     <div style="background: #858585;height: 35px;margin-left: -1px;width:890px"></div>

     <div style=" min-height: 40px;">
     <div style="margin-top:-38px;margin-left: 14px;position: absolute;"><font style="font: bold 1.6em/1em Cambria;color: white;">Send Invitation</font></div>
      <form action="userInvitationSaving" name="userInvitationFormName" id="userInvitationFormId">
         <div style="margin-left: 10px;"><br/>
          <table style="margin-left: 25px;margin-top:13px;">
          <tr class="label"><td id="nameId"  align="right">Sender Name*:</td><td><input type="text"  name="senderName" style="height:25px;width:235px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="nameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);nameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
          <tr style="height:10px;"></tr>
          <tr class="label"><td id="emailId" align="right">Sender Email*:</td><td><input type="text"  name="senderEmail" style="height:25px;width:235px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="emailValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);emailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
          <tr style="height: 20px;"></tr>
          <tr><td></td><td><button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE</font></button></td></tr>
          
        </table>
        <img src="/QuickKlix/images/sendInvitationImg.png" style="margin-left: 560px;margin-top: -160px;"/>
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