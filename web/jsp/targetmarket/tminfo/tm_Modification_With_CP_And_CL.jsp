<%-- 
    Document   : tm_Modification_With_CP_And_CL
    Created on : 1 Sep, 2014, 12:36:19 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script language="javascript" type="text/javascript" src="/QuickKlix/scripts/json-minified.js"></script>
         <script src="/QuickKlix/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>       
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

    <script type="text/javascript">      


      $(document).ready(function(){
      document.tmFormName.tmsName.value = "<s:property value="tmsName"/>";
      var existedName  = "<s:property value="tmsNameAlreadyExist"/>";
      if((existedName != null || existedName != "") && existedName == "AlreadyExisted"){
      alert("Target Market name already exist!");
      }
      });

        var result = true;
	function validation(){
        var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
        var tmsName = document.tmFormName.tmsName.value;          
        if(reg.test(tmsName)){
        document.getElementById("tmsNameID").removeAttribute("class");
        }
        else{
        document.getElementById("tmsNameID").setAttribute("class","redTestDisplay");
        result=false;
        }    
        updateTmNewAjaxCall();   
        return result;
        }
        
        function targetMarketNameValidation(){            
        var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
        var tmsName=document.tmFormName.tmsName.value;
        if(reg.test(tmsName)){
        document.getElementById("tmsNameID").removeAttribute("class");
        }
        else{
        document.getElementById("tmsNameID").setAttribute("class","redTestDisplay");
        }
        if(tmsName==""){
        document.getElementById("tmsNameID").removeAttribute("class");
        }
        }

        function CheckFirstZero(key, txt) {
        if(key == 48 && txt.value.length<=0) {
        return false;
        }
        else if(txt.value.length>0) {
        if(txt.value.charCodeAt(0) == 48) {
        txt.value=txt.value.substring(1,txt.value.length);
        return true;
        } }
        if(key == 96 && txt.value.length<=0) {
        return false;
        }
        else if(txt.value.length>0) {
        if(txt.value.charCodeAt(0) == 96) {
        txt.value=txt.value.substring(1,txt.value.length);
        return true;
        } }
        if(key == 32 && txt.value.length<=0) {
        return false; 
        }
        else if(txt.value.length>0) {
        if(txt.value.charCodeAt(0) == 32) {
        txt.value=txt.value.substring(1,txt.value.length);
        return true;
        } }
        return true;
        }

        function CheckFirstChar(key, txt){
        if(key == 32 && txt.value.length<=0)
        return false;
        else if(txt.value.length>0) {
        if(txt.value.charCodeAt(0) == 32){
        txt.value=txt.value.substring(1,txt.value.length);
        return true;
        }
        }
        return true;
        }

        function replaceAll(txt, replace, with_this) {
        return txt.replace(new RegExp(replace, 'g'),with_this);
        }

       </script>

        <script type="text/javascript" language="javascript">
        function updateTmNewAjaxCall(){
        if(document.tmFormName.tmsClientName.value != '' && document.tmFormName.tmsCampaignName.value != '' && document.tmFormName.tmsName.value != ''){
        var clName = document.tmFormName.tmsClientName.value;
        var cpName = document.tmFormName.tmsCampaignName.value;
        var tmName = document.tmFormName.tmsName.value;        
        var combValues = clName+"&,&"+cpName+"&,&"+tmName;
        $.post('/QuickKlix/tmModifyExist.action', { data: combValues}, responseCreateTmData, "text");
        }
    }

        function responseCreateTmData(data){
        var myJsonObj = jsonParse(data);
        var value = myJsonObj.jsonResponse;
        value = value.replace('}',"");
        value = value.replace('{',"");
        if(value != "null"){
        alert("Target Market name already exist!");
        result=false;
        }
        else{
        result=true;
        }
        return result;
        }
        </script>        


    </head>
    <body class="body_page">
        <div id="container1" style="height: auto;margin-top:0px;">
        <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 520px;height: auto;border-radius: 30px 30px 0 0;"><br/>

        <div style="background: white;border-left: solid 9px #d0d0d0;border-right: solid 2px #d0d0d0;width: 889px;margin-left: 25px;margin-top: 50px;height: auto;">
        <div style="background: #858585;height: 35px;margin-left: -1px;width:890px"></div>

        <div style=" min-height: 40px;">
        <div style="margin-top:-38px;margin-left: 14px;position: absolute;"><font style="font: bold 1.6em/1em Cambria;color: white;">Modify Target Market</font></div>

        <form action="tmDataUpdateInDB" name="tmFormName" id="mpFormId">
        <div style="margin-left: 10px;"><br/>

        <table style="margin-left: 25px;margin-top:13px;">              
        
        <tr class="label"><td align="right" id="tmClientList">Client Name*:</td><td>  <input type="text"  name="tmsClientName" readonly value="<s:property value="tmsClientName"/>" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onclick="return tmsNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>    
        <tr style="height: 10px;"></tr>

        <tr class="label"><td align="right" id="tmClientList">Campaign Name*:</td><td>  <input type="text"  name="tmsCampaignName" readonly value="<s:property value="tmsCampaignName"/>" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onclick="return tmsNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>    
        <tr style="height: 10px;"></tr>  
              
        <tr class="label"><td align="right" id="tmsNameID">Target Market Name*:</td><td>  <input type="text"  name="tmsName" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onclick="return tmsNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" onchange="return updateTmNewAjaxCall();"/></td></tr>
        <tr style="height: 10px;"></tr>

        <tr style="height: 30px;"></tr>             
        <tr><td></td><td><button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png" alt="SAVE"/><font style="top: -3px;position: relative;">&nbsp;SAVE</font></button></td></tr>
        </table>

        </div>
              
        </form>
   
        </div><br/>
        </div>
 
        <div style=" margin-top: -10px;margin-left: 22px;">
        <img src="/QuickKlix/images/CornerFoldImg.png" width="912px"/></div><br/><br/><br/><br/><br/><br/>
        </div> </div>
    </body>
</html>