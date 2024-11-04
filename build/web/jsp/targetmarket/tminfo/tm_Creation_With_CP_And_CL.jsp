<%-- 
    Document   : tm_Creation_With_CP_And_CL
    Created on : 27 Aug, 2014, 10:32:12 AM
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
      cpName = "<s:property value="tmsCampaignName"/>";
      if(document.tmFormName.tmsClientName.value != ""){
      newAjaxCall();
      }      
      var existedName  = "<s:property value="tmsNameAlreadyExist"/>";
      if((existedName != null || existedName != "") && existedName == "AlreadyExisted"){
      alert("Target Market name already exist!");
      }
      });

        var result = true;
	function validation(){
        var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
        var tmsClientName = document.tmFormName.tmsClientName.value;
        var tmsCampaignName = document.tmFormName.tmsCampaignName.value;
        var tmsName = document.tmFormName.tmsName.value;
           
        if(tmsClientName != ""){
        document.getElementById("tmsClientNameID").removeAttribute("class");
        }
        else{
        document.getElementById("tmsClientNameID").setAttribute("class","redTestDisplay");
        result=false;
        }
        
        if(tmsCampaignName != ""){
        document.getElementById("tmsCampaignNameID").removeAttribute("class");
        }
        else{
        document.getElementById("tmsCampaignNameID").setAttribute("class","redTestDisplay");
        result=false;
        }
        
        if(reg.test(tmsName)){
        document.getElementById("tmsNameID").removeAttribute("class");
        }
        else{
        document.getElementById("tmsNameID").setAttribute("class","redTestDisplay");
        result=false;
        }
        
        createTmNewAjaxCall();
        return result;
        }

        function tmsClientNameValidation(){
        var tmsClientName=document.tmFormName.tmsClientName.value;
        if(tmsClientName !=""){
        document.getElementById("tmsClientNameID").removeAttribute("class");
        }
        else{
        document.getElementById("tmsClientNameID").setAttribute("class","redTestDisplay");
        }
        if(tmsClientName==""){
        document.getElementById("tmsClientNameID").removeAttribute("class");
        }
        }

        function tmsCampaignNameValidation(){
        var tmsClientName = document.tmFormName.tmsClientName.value;
        var tmsCampaignName = document.tmFormName.tmsCampaignName.value;
        if(tmsClientName == ""){
        alert("Please select a client.");
        }else{
        if(tmsCampaignName !=""){
        document.getElementById("tmsCampaignNameID").removeAttribute("class");
        }
        else{
        document.getElementById("tmsCampaignNameID").setAttribute("class","redTestDisplay");
        }
        if(tmsCampaignName==""){
        document.getElementById("tmsCampaignNameID").removeAttribute("class");
        }}
        tmClAndCpValidationNewAjaxCall();
        }

        function targetMarketNameValidation(){            
        var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
        var tmsName=document.tmFormName.tmsName.value;
        var tmsClientName = document.tmFormName.tmsClientName.value;
        var tmsCampaignName = document.tmFormName.tmsCampaignName.value;
        if(tmsClientName == ""){
        alert("Please select a client.");
        }else if(tmsCampaignName == "" && tmsClientName != ""){
        alert("Please select a campaign.");
        }else{
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
            
        function newAjaxCall(){
        tmsClientNameValidation();
        if(document.tmFormName.tmsClientName.value != ''){
        var clientName = document.tmFormName.tmsClientName.value;
        $.post('/QuickKlix/tmCampaignSelectionFromDB.action', { data: clientName}, responseData, "text");
        }else{        
        OptionsFill('tmCampaignSelectionID',"");
        } }
       
        function responseData(data){
        var myJsonObj = jsonParse(data);
        var value = myJsonObj.jsonResponse;
        value = value.replace('}',"");
        value = value.replace('{',"");
        OptionsFill('tmCampaignSelectionID',value);
        if(cpName!=""){
        document.tmFormName.tmsCampaignName.value = cpName;
        cpName="";             
        tmClAndCpValidationNewAjaxCall();
     
        }
        }
        
        function OptionsFill(id,value){
        var selector = document.getElementById(id);
        selector.options.length=1;
        var options=value.split(',');
        for (var i=0;i<options.length;i++){
        var opt = document.createElement('option');
        options[i]=options[i].replace("'","");
        options[i]=options[i].replace("'","");
        opt.value     = options[i];
        opt.innerHTML = options[i];
        selector.appendChild(opt);
        }
        }

       </script>
      
        <script type="text/javascript" language="javascript">
        function tmClAndCpValidationNewAjaxCall(){
        if(document.tmFormName.tmsClientName.value != '' && document.tmFormName.tmsCampaignName.value != ''){
        var clName = document.tmFormName.tmsClientName.value;
        var cpName = document.tmFormName.tmsCampaignName.value;               
        var combValues = clName+"&,&"+cpName;
        $.post('/QuickKlix/tmClAndCpValidation.action', { data: combValues}, responseClAndCpValidation, "text");
        }
        }

        function responseClAndCpValidation(data){
        var myJsonObj = jsonParse(data);
        var value = myJsonObj.jsonResponse;
        value = value.replace('}',"");
        value = value.replace('{',"");
        if(value != "null"){
        alert("These two combinations are already exist!");
        document.tmFormName.tmsCampaignName.value = '';
        result=false;
        }
        else{
        result=true;
        }
        return result;
        }
        </script>

        <script type="text/javascript" language="javascript">
        function createTmNewAjaxCall(){
        if(document.tmFormName.tmsClientName.value != '' && document.tmFormName.tmsCampaignName.value != '' && document.tmFormName.tmsName.value != ''){
        var clName = document.tmFormName.tmsClientName.value;
        var cpName = document.tmFormName.tmsCampaignName.value;
        var tmName = document.tmFormName.tmsName.value;        
        var combValues = clName+"&,&"+cpName+"&,&"+tmName;
        $.post('/QuickKlix/tmCreationExist.action', { data: combValues}, responseCreateTmData, "text");
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

        <script type="text/javascript" language="javascript">
        function clientNotSelected(){
        if(document.tmFormName.tmsClientName.value == ''){
        alert("Please select a client.");
        result=false;
        }else{ 
        window.location('mediaPlanCampaignCreation.action');    
        result=true;
        }
        return result;
        }

        function campaignNotSelected(){
        if(document.tmFormName.tmsClientName.value == ''){
        alert("Please select a client.");
        result=false;
        }else if(document.tmFormName.tmsCampaignName.value == ''){
        alert("Please select a campaign.");
        result=false;
        }else{
        window.location('mediaplanTargetMarketCreation.action');    
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
        <div style="margin-top:-38px;margin-left: 14px;position: absolute;"><font style="font: bold 1.6em/1em Cambria;color: white;">New Target Market</font></div>

        <form action="tmDataSavingInDB" name="tmFormName" id="mpFormId">
        <div style="margin-left: 10px;"><br/>

        <table style="margin-left: 25px;margin-top:13px;">              
              
        <tr class="label"><td align="right" id="tmsClientNameID">Client Name*:</td>
        <td><s:select name="tmsClientName" list="tmClientList"  cssStyle="margin-top:-26px;position:absolute;height:25px;width:230px; background-color: white;border-color: #f4f4f4;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" headerKey=""  headerValue="--------Select Client Name--------" onclick="return newAjaxCall();"/></td>
        <td></td><td> <a href="tmClientCreation.action" style="text-decoration: none;"><button type="button" onclick="return clientRedirection();" onMouseOver="this.style.color='#00a9f1';document.getElementById('AddNewCLFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('AddNewCLFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; margin-left: 0px; height: 28px;color: white; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;position:absolute;margin-left:250px;margin-top:-33px;"><img id="AddNewCLFormImg1" src="/QuickKlix/images/SSImgs/AddNewFormSmallImg.png" /><font style="top: -2px;position: relative;">&nbsp;ADD NEW CLIENT</font></button></a> </td></tr>
        <tr style="height: 10px;"></tr>

        <tr class="label"><td  align="right" id="tmsCampaignNameID">Campaign Name*:</td>
            <td><s:select name="tmsCampaignName" id="tmCampaignSelectionID" list="{}" cssStyle="margin-top:-26px;position:absolute;height:25px;width:230px; background-color: white;border-color: #f4f4f4;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" headerKey=""  headerValue="--------Select Campaign Name--------" onclick="return tmsCampaignNameValidation();" /></td>
        <td></td><td> <a href="tmCampaignCreation.action" style="text-decoration: none;" onclick="return clientNotSelected();"><button  type="button" onclick="" onMouseOver="this.style.color='#00a9f1';document.getElementById('AddNewCPFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('AddNewCPFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; margin-left: 0px; height: 28px;color: white; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;position:absolute;margin-left:250px;margin-top:-33px;"><img id="AddNewCPFormImg1" src="/QuickKlix/images/SSImgs/AddNewFormSmallImg.png" /><font style="top: -2px;position: relative;">&nbsp;ADD NEW CAMPAIGN</font></button></a> </td></tr>
        <tr style="height: 10px;"></tr>  
              
        <tr class="label"><td align="right" id="tmsNameID">Target Market Name*:</td><td>  <input type="text"  name="tmsName" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" onchange="return createTmNewAjaxCall();" onclick="return targetMarketNameValidation();"/></td></tr>
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