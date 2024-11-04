<%--
    Document   : contactus
    Created on : 18 Feb, 2014, 5:38:55 PM
    Author     : murthyk
--%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/QuickKlix/CSS/quickklixFontColor.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="/QuickKlix/CSS/nicebuttonsdisplay.css" type="text/css" />
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />

        <style type="text/css">
        .errorMessage {
        margin-left: 257px;
        position: absolute;
        display: inherit;
        font-size: 13px;
                    }
        [errorfor]{
        height:14px;
        }

       .redTestDisplay{
        color: red;
        font-style: italic;
        font-size: 14px;
        }
        </style>

        <%
        if(session.getAttribute("invitation111")=="emailsent"){
        out.println("<script>function rec(){window.alert('Thank you for your comment(s) and/or question(s). We will get back to you shortly!');return 0;}</script>");
        session.removeAttribute("invitation111");
        }%>

        <script type = "text/javascript">
        window.onload = function onloadfunction(){
        rec();
        document.contact.contactName.value="";
        document.contact.contactEmail.value="";
        document.contact.contactReenterEmail.value="";
        document.contact.contactSubject.value="";
        document.contact.contactComment.value="";
        }

        function validation(){
        var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
        var reg1 =  /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
        var name=document.contact.contactName.value;
        var email=document.contact.contactEmail.value;
        var reenterEmail=document.contact.contactReenterEmail.value;
        var subject=document.contact.contactSubject.value;
        var comment=document.contact.contactComment.value;
        var result = true;

        if(reg.test(name)){
         document.getElementById("namelabel").removeAttribute("class");
        }
        else{
        document.getElementById("namelabel").setAttribute("class","redTestDisplay");
        result=false;
        }

        if(reg1.test(email)){
        document.getElementById("emaillabel").removeAttribute("class");
        }
        else{
          document.getElementById("emaillabel").setAttribute("class","redTestDisplay");
          result=false;
        }

        if(reg1.test(reenterEmail) && email==reenterEmail){
        document.getElementById("reenteremaillabel").removeAttribute("class");
        }
        else{
          document.getElementById("reenteremaillabel").setAttribute("class","redTestDisplay");
          result=false;
        }

        if(reg.test(subject)){
         document.getElementById("subjectlabel").removeAttribute("class");
        }
        else{
        document.getElementById("subjectlabel").setAttribute("class","redTestDisplay");
        result=false;
        }

         if(comment!=""){
           document.getElementById("commentlabel").removeAttribute("class");
         }
         else{
         document.getElementById("commentlabel").setAttribute("class","redTestDisplay");
         result = false;
         }

         return result;
        }

        function nameValidation() {
        var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
        var name = document.contact.contactName.value;
        if (reg.test(name)) {
          document.getElementById("namelabel").removeAttribute("class");
         }
        else {
          document.getElementById("namelabel").setAttribute("class", "redTestDisplay");
          if (name == "") {
          document.getElementById("namelabel").removeAttribute("class");
         } }  }

         function emailValidation() {
          var reg1 = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
          var email = document.contact.contactEmail.value;
          if (reg1.test(email)) {
            document.getElementById("emaillabel").removeAttribute("class");
          }
         else {
            document.getElementById("emaillabel").setAttribute("class", "redTestDisplay");
          if (email == "") {
             document.getElementById("emaillabel").removeAttribute("class");
           }
          } }

       function reenterEmailValidation(){
         var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
         var email=document.contact.contactEmail.value;
         var reenterEmail=document.contact.contactReenterEmail.value;
         if(reg.test(reenterEmail) && email==reenterEmail){
         document.getElementById("reenteremaillabel").removeAttribute("class");
         }else{
         document.getElementById("reenteremaillabel").setAttribute("class","redTestDisplay");
         if(reenterEmail==""){
         document.getElementById("reenteremaillabel").removeAttribute("class");
         }}}

        function subjectValidation() {
        var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
        var subject = document.contact.contactSubject.value;
        if (reg.test(subject)) {
          document.getElementById("subjectlabel").removeAttribute("class");
         }
        else {
          document.getElementById("subjectlabel").setAttribute("class", "redTestDisplay");
          if (subject == "") {
          document.getElementById("subjectlabel").removeAttribute("class");
         } }  }

         function commentValidation() {
          var comment = document.contact.contactComment.value;
          if (comment != "") {
            document.getElementById("commentlabel").removeAttribute("class");
             }
          else {
            document.getElementById("commentlabel").setAttribute("class", "redTestDisplay");
            if (comment == "") {
             document.getElementById("commentlabel").removeAttribute("class");
            }
          } }

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

    </head>
    <body>
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>
        
    <img src="images/staticImgs/ContactUs_Img.png" alt="QuickKLix" style="margin-top: 42px; margin-left: 620px;position:absolute;"/>    

    <div style="margin-left: 100px;margin-top:54px;background: #f1f1f1;min-height: 510px;width: 390px;box-shadow: 3px 3px 0px #7e7e7e;height: auto;">
    <div style="background: #666666;height: 40px;width:391px;margin-top:-3px;">
    <p style="margin-left: 20px; margin-top: 8px; text-align: justify; color: white; font: bold 1.9em/1em Times New Roman,Georgia,Serif;position: absolute;">
    Contact Us</p>
    </div>

    <s:form action="contactInfo" name="contact">
    <table align="left" style="margin-top: 20px;margin-left: 25px;font: bold 1em/1em Verdana, Geneva, Arial, Helvetica, sans-serif;line-height: 1.25em;">
    <tr class="label"><td></td><td id="namelabel">Name*:</td></tr>
    <tr><td> <s:textfield  name="contactName" style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;"  maxlength="30" onblur="nameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);nameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height: 5px;"></tr>
    <tr class="label"><td></td><td id="emaillabel">Email*:</td></tr>
    <tr><td><s:textfield  name="contactEmail"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="30" onblur="emailValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);emailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height: 5px;"></tr>
    <tr class="label"><td></td><td id="reenteremaillabel">Re-enter Email*:</td></tr>
    <tr><td><s:textfield  name="contactReenterEmail"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="30" onblur="reenterEmailValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);reenterEmailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height: 5px;"></tr>
    <tr class="label"><td></td><td id="subjectlabel">Subject*:</td></tr>
    <tr><td><s:textfield  name="contactSubject"  style="width: 235px;height:25px;border-radius: 5px;box-shadow: 3px 3px 1px #6a6a6a;border: solid 1px #595959;" maxlength="30" onblur="subjectValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);subjectValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
    <tr style="height: 5px;"></tr>
    <tr  class="label"><td></td><td id="commentlabel">Comments and Questions*:</td></tr>
    <tr><td> <s:textarea name="contactComment" style="width: 240px;height: 60px;border-radius: 5px;box-shadow: 2px 3px 1px #6a6a6a;border: solid 1px #595959;" cols="35" rows="5"onblur="commentValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);commentValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>

    <tr style="height: 15px;"></tr>
    <tr><td colspan="2">&nbsp;<button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('SendButtonImg1').src='/QuickKlix/images/SSImgs/SendButtonMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('SendButtonImg1').src='/QuickKlix/images/SSImgs/SendButtonImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="SendButtonImg1" src="/QuickKlix/images/SSImgs/SendButtonImg.png"/><font style="top: -3px;position: relative;">&nbsp;SEND</font></button></td></tr>
    <tr style="height: 32px;"></tr>
    </table>
    </s:form>

    </div>        
    
    <div style="margin-left: 650px;margin-top: -320px;position: absolute;">
    <p style="margin-top: 6px;text-align: left;color: #3a3a3a;font: bold 1.9em/1em Times New Roman,Georgia,Serif;line-height: 1.25em;">
         Social Media</p>
    <img src="images/FaceBTWLinkImg.png" style="margin-left: -4px;margin-top: -2px;position: absolute;" alt="Cheap legal services"/>
    <div style="margin-top: 7px;position: absolute;margin-left:40px;">
    <a href="https://www.facebook.com/pages/QuicKKlix/192894260739196?ref=ts" target="_blank" title="facebook" style="color: #00a9f1;font-weight:normal;text-decoration: none;font-family:Calibri" onmouseover="this.style.color='blue';" onmouseout="this.style.color='#00a9f1';">www.facebook.com/quickklix</a>
    </div>
    <div style="margin-top: 49px;position: absolute;margin-left:40px;">
    <a href="http://twitter.com/#!/QuickKlix" target="_blank" title="twitter" style="color: #00a9f1;font-weight:normal;text-decoration: none;font-family:Calibri" onmouseover="this.style.color='blue';" onmouseout="this.style.color='#00a9f1';">www.twitter.com/quickklix</a>
    </div><br/>
    <div style="margin-top: 70px;position: absolute;margin-left:40px;">
    <a href="http://www.linkedin.com/company/quickklix" target="_blank" title="linkedin" style="color: #00a9f1;font-weight:normal;text-decoration: none;font-family:Calibri" onmouseover="this.style.color='blue';" onmouseout="this.style.color='#00a9f1';">www.linkedin.com/quickklix</a>
    </div>
    <div style="margin-top: 100px;position: absolute;margin-left:0px;">
    <p style="margin-left: 0px;margin-top: 40px;text-align: left;color: #3a3a3a;font: bold 1.9em/1em Times New Roman,Georgia,Serif;line-height: 1.25em;">
         E-mail: </p>

         <p style="margin-left: 90px;margin-top: -35px;text-align: left;color: #3a3a3a;font: 1.19em/1em arial,sans-serif;line-height: 1.34em;">
         info@quickklix.com</p>
    </div>

    </div>        
    
    <br/><br/><br/><br/><br/><br/>   
        
    </div>
    </div>
    </body>
</html>
