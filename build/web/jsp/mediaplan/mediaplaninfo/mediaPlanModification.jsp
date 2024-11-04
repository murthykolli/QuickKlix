<%--
    Document   : mediaPlanModification
    Created on : 26 Jun, 2014, 2:11:51 PM
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
       <script src="/QuickKlix/scripts/jquery.ui.core.js" type="text/javascript"></script>
        <script src="/QuickKlix/scripts/jquery.ui.datepicker.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="/QuickKlix/CSS/jquery.ui.datepicker.css" />
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
         function convert(str){
             str = str.replace(/\&amp;/g,"&");
             str = str.replace(/\&gt;/g, ">");
             str = str.replace(/\&lt;/g, "<");
             str = str.replace(/\&quot;/g, '"');
            return str;
            }
        $(document).ready(function(){
            $("[name=mediaPlanName]").val(convert("<s:property value="mediaPlanName"/>"));
            $("[name=mpMissionObjective]").val(convert("<s:property value="mpMissionObjective"/>"));
            
          var existedName  = "<s:property value="mediaplanNameAlreadyExist"/>";
          if((existedName != null || existedName != "") && existedName == "AlreadyExisted"){
          alert("Media Plan name already exist!");
          }

              $("#campStartDate").datepicker({ changeMonth: true, changeYear: true,
	        onSelect: function(selected) {
                 $("#campEndDate").datepicker("option","minDate", selected);
                 $("#medStartDate").datepicker("option","minDate", selected);
                 $("#medEndDate").datepicker("option","minDate", selected);
                 if($("#medEndDate").val()!=""){ $("#campEndDate").datepicker("option","minDate", $("#medEndDate").val()); }
                 if($("#medStartDate").val()!=""){$("#medEndDate").datepicker("option","minDate", $("#medStartDate").val()); }
                 if($("#medStartDate").val()!="" && $("#medEndDate").val()==""){ $("#campEndDate").datepicker("option","minDate", $("#medStartDate").val()); }
                } });
	    $("#campEndDate").datepicker({ changeMonth: true, changeYear: true,
	        onSelect: function(selected) {
	        $("#campStartDate").datepicker("option","maxDate", selected);
                $("#medStartDate").datepicker("option","maxDate", selected);
                $("#medEndDate").datepicker("option","maxDate", selected);
                if($("#medStartDate").val()!=""){ $("#campStartDate").datepicker("option","maxDate", $("#medStartDate").val()); }
                if($("#medEndDate").val()!=""){ $("#medStartDate").datepicker("option","maxDate", $("#medEndDate").val()); }
                if($("#medEndDate").val()!="" && $("#medStartDate").val()==""){$("#campStartDate").datepicker("option","maxDate", $("#medEndDate").val()); }
                }  });
            $("#medStartDate").datepicker({ changeMonth: true, changeYear: true,
	        onSelect: function(selected) {
                 $("#medEndDate").datepicker("option","minDate", selected);
                 $("#campStartDate").datepicker("option","maxDate", selected);
                 $("#campEndDate").datepicker("option","minDate", selected);
                 if($("#medEndDate").val()!=""){
                 $("#campEndDate").datepicker("option","minDate", $("#medEndDate").val()); }
                } });
	    $("#medEndDate").datepicker({changeMonth: true, changeYear: true,
	        onSelect: function(selected) {
	        $("#medStartDate").datepicker("option","maxDate", selected);
               $("#campStartDate").datepicker("option","maxDate", selected);
                $("#campEndDate").datepicker("option","minDate", selected);
                if($("#medStartDate").val()!=""){
               $("#campStartDate").datepicker("option","maxDate", $("#medStartDate").val()); }
                } });
             setDates();
          });

         function setDates(){
            $("#campStartDate").datepicker("option","maxDate", $("#campEndDate").val());
            $("#campEndDate").datepicker("option","minDate", $("#campStartDate").val());
            $("#medStartDate").datepicker("option","minDate", $("#campStartDate").val());
            $("#medStartDate").datepicker("option","maxDate", $("#campEndDate").val());
            $("#medEndDate").datepicker("option","minDate", $("#campStartDate").val());
            $("#medEndDate").datepicker("option","maxDate", $("#campEndDate").val());
            if($("#medEndDate").val()!=""){
            $("#medStartDate").datepicker("option","maxDate", $("#medEndDate").val());
            $("#campEndDate").datepicker("option","minDate", $("#medEndDate").val());
           }
            if($("#medStartDate").val()!=""){
             $("#medEndDate").datepicker("option","minDate", $("#medStartDate").val());
             $("#campStartDate").datepicker("option","maxDate", $("#medStartDate").val());
           }
        }

          var result = true;
          function validation(){
           var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
           var numReg=/^[0-9\$]*(?=.*\d)[0-9-,.]*$/;
           
           var mpClientName = document.mpFormName.mpClientName.value;
           var mpCampaignName = document.mpFormName.mpCampaignName.value;
           var mpTargetMarketName = document.mpFormName.mpTargetMarketName.value;
           var mediaPlanName=document.mpFormName.mediaPlanName.value;
           var mpMissionObjective=document.mpFormName.mpMissionObjective.value;
           var cpStartDate=document.mpFormName.cpStartDate.value;
           var cpEndDate= document.mpFormName.cpEndDate.value;
           var cpBudget=document.mpFormName.cpBudget.value;
           var mpStartDate=document.mpFormName.mpStartDate.value;
           var mpEndDate=document.mpFormName.mpEndDate.value;
           var mpBudget=document.mpFormName.mpBudget.value;

           if(mpClientName != ""){
           document.getElementById("mpClientNameID").removeAttribute("class");
           }
           else{
           document.getElementById("mpClientNameID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(mpCampaignName != ""){
           document.getElementById("mpCampaignNameID").removeAttribute("class");
           }
           else{
           document.getElementById("mpCampaignNameID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(mpTargetMarketName != ""){
           document.getElementById("mpTargetMarketNameID").removeAttribute("class");
           }
           else{
           document.getElementById("mpTargetMarketNameID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(reg.test(mediaPlanName)){
           document.getElementById("mediaplanNameID").removeAttribute("class");
           }
           else{
           document.getElementById("mediaplanNameID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(mpMissionObjective != ""){
           document.getElementById("mpMissionObjectiveID").removeAttribute("class");
           }
           else{
           document.getElementById("mpMissionObjectiveID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(cpStartDate != ""){
           document.getElementById("cpStartDateID").removeAttribute("class");
           }
           else{
           document.getElementById("cpStartDateID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(cpEndDate != ""){
           document.getElementById("cpEndDateID").removeAttribute("class");
           }
           else{
           document.getElementById("cpEndDateID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(numReg.test(cpBudget) && cpBudget != ".00"){
           document.getElementById("cpBudgetID").removeAttribute("class");
           }
           else{
           document.getElementById("cpBudgetID").setAttribute("class","redTestDisplay");
           result=false;
           }
            if(numReg.test(mpBudget) && mpBudget != ".00"){
           document.getElementById("mediaplanBudgetID").removeAttribute("class");
           }
           else{
           document.getElementById("mediaplanBudgetID").setAttribute("class","redTestDisplay");
           result=false;
           }

           if(mpStartDate != ""){
           document.getElementById("mediaplanStartDateID").removeAttribute("class");
           }
           else{
           document.getElementById("mediaplanStartDateID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(mpEndDate != ""){
           document.getElementById("mediaplanEndDateID").removeAttribute("class");
           }
           else{
           document.getElementById("mediaplanEndDateID").setAttribute("class","redTestDisplay");
           result=false;
           }
           modifyMpNewAjaxCall();
           return result;
           }

             function mpClientNameValidation(){
             var mpClientName=document.mpFormName.mpClientName.value;
             if(mpClientName !=""){
             document.getElementById("mpClientNameID").removeAttribute("class");
             }
             else{
             document.getElementById("mpClientNameID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(mpClientName == ""){
             document.getElementById("mpClientNameID").removeAttribute("class");
             }
             }

              function mpCampaignNameValidation(){
             var mpCampaignName = document.mpFormName.mpCampaignName.value;
             if(mpCampaignName !=""){
             document.getElementById("mpCampaignNameID").removeAttribute("class");
             }
             else{
             document.getElementById("mpCampaignNameID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(mpCampaignName == ""){
             document.getElementById("mpCampaignNameID").removeAttribute("class");
             }
             }

              function mpTargetMarketNameValidation(){
             var mpTargetMarketName = document.mpFormName.mpTargetMarketName.value;
             if(mpTargetMarketName !=""){
             document.getElementById("mpTargetMarketNameID").removeAttribute("class");
             }
             else{
             document.getElementById("mpTargetMarketNameID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(mpTargetMarketName == ""){
             document.getElementById("mpTargetMarketNameID").removeAttribute("class");
             }
             }


             function mediaplanNameValidation(){
             var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
             var mediaPlanName=document.mpFormName.mediaPlanName.value;
             if(reg.test(mediaPlanName)){
             document.getElementById("mediaplanNameID").removeAttribute("class");
             }
             else{
             document.getElementById("mediaplanNameID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(mediaPlanName==""){
             document.getElementById("mediaplanNameID").removeAttribute("class");
             }
             }

             function mpMissionObjectiveValidation(){
             var mpMissionObjective=document.mpFormName.mpMissionObjective.value;
             if(mpMissionObjective !=""){
             document.getElementById("mpMissionObjectiveID").removeAttribute("class");
             }
             else{
             document.getElementById("mpMissionObjectiveID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(mpMissionObjective == ""){
             document.getElementById("mpMissionObjectiveID").removeAttribute("class");
             }
             }

             function cpStartDateValidation(){
             var cpStartDate=document.mpFormName.cpStartDate.value;
             if(cpStartDate !=""){
             document.getElementById("cpStartDateID").removeAttribute("class");
             }
             else{
             document.getElementById("cpStartDateID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(cpStartDate == ""){
             document.getElementById("cpStartDateID").removeAttribute("class");
             }
             }
            function cpEndDateValidation(){
            var cpEndDate= document.mpFormName.cpEndDate.value;
             if(cpEndDate !=""){
             document.getElementById("cpEndDateID").removeAttribute("class");
             }
             else{
             document.getElementById("cpEndDateID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(cpEndDate == ""){
             document.getElementById("cpEndDateID").removeAttribute("class");
             }
             }

             function cpBudgetValidation(){
             var numReg=/^[0-9\$]*(?=.*\d)[0-9-,.]*$/;
             var cpBudget=document.mpFormName.cpBudget.value;
             if(numReg.test(cpBudget) && cpBudget != ".00"){
             document.getElementById("cpBudgetID").removeAttribute("class");
             }
             else{
             document.getElementById("cpBudgetID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(cpBudget==""){
             document.getElementById("cpBudgetID").removeAttribute("class");
             }
             }
            
             function mediaplanStartDateValidation(){
             var mpStartDate=document.mpFormName.mpStartDate.value;
             if(mpStartDate !=""){
             document.getElementById("mediaplanStartDateID").removeAttribute("class");
             }
             else{
             document.getElementById("mediaplanStartDateID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(mpStartDate == ""){
             document.getElementById("mediaplanStartDateID").removeAttribute("class");
             }
             }
            function mediaplanEndDateValidation(){
            var mpEndDate=document.mpFormName.mpEndDate.value;
             if(mpEndDate !=""){
             document.getElementById("mediaplanEndDateID").removeAttribute("class");
             }
             else{
             document.getElementById("mediaplanEndDateID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(mpEndDate == ""){
             document.getElementById("mediaplanEndDateID").removeAttribute("class");
             }
             }

             function mpBudgetValidation(){
            var numReg=/^[0-9\$]*(?=.*\d)[0-9-,.]*$/;
            var mpBudget=document.mpFormName.mpBudget.value;
             if(numReg.test(mpBudget) && mpBudget != ".00"){
             document.getElementById("mediaplanBudgetID").removeAttribute("class");
             }
             else{
             document.getElementById("mediaplanBudgetID").setAttribute("class","redTestDisplay");
             <%--result=false;--%>
             }
             if(mpBudget==""){
             document.getElementById("mediaplanBudgetID").removeAttribute("class");
             }
             }

             function CheckFirstZero(key, txt)
            {
            if(key == 48 && txt.value.length<=0)
            {return false;}
            else if(txt.value.length>0)
            {
            if(txt.value.charCodeAt(0) == 48)
            {txt.value=txt.value.substring(1,txt.value.length);
            return true;
            } }
            if(key == 96 && txt.value.length<=0)
            { return false;}
            else if(txt.value.length>0)
            {
            if(txt.value.charCodeAt(0) == 96)
            {
            txt.value=txt.value.substring(1,txt.value.length);
            return true;
            } }
            if(key == 32 && txt.value.length<=0)
            { return false; }
           else if(txt.value.length>0)
           { if(txt.value.charCodeAt(0) == 32)
            {
             txt.value=txt.value.substring(1,txt.value.length);
             return true;
           }   }
            return true;
         }

            function budgetFormat(intNum) {
            if(intNum!=""){
            var budget= intNum.split('.');
            var exceedBudget=budget[0].replace(/\,/g,"");
            document.mpFormName.cpBudget.value = (exceedBudget + '').replace(/(\d)(?=(\d{3})+$)/g, '$1,')+".00";
            var cmpBudget = Number(document.mpFormName.cpBudget.value.replace(/[^0-9\.]+/g,"")); 
            if(cmpBudget == 0){
            alert("All zeros are not allowed.");  
            document.mpFormName.cpBudget.value = "";
            }
            }}

            function mbudgetFormat(intNum) {
            if(intNum!=""){
//            var cpBudget=document.mpFormName.cpBudget.value;
//            var cmpBudget = Number(cpBudget.replace(/[^0-9\.]+/g,""));
//            if(cmpBudget > intNum){
//            alert("Media plan budget must be greater than Campaign plan budget");
//            document.mpFormName.mpBudget.value = "";
//            }else{    
            var budget= intNum.split('.');
            var exceedBudget=budget[0].replace(/\,/g,"");
            document.mpFormName.mpBudget.value = (exceedBudget + '').replace(/(\d)(?=(\d{3})+$)/g, '$1,')+".00";
//            }
             var mpBudget = Number(document.mpFormName.mpBudget.value.replace(/[^0-9\.]+/g,"")); 
            if(mpBudget == 0){
            alert("All zeros are not allowed.");  
            document.mpFormName.mpBudget.value = "";
            }
            } }

            function numeralsOnly(evt) {
            evt = (evt) ? evt : event;
            var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
            ((evt.which) ? evt.which : 0));
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            if(charCode==37 || charCode==39){
            return true;
            }
            return false;
            }
            return true;
            }
           function CheckFirstChar(key, txt){
           if(key == 32 && txt.value.length<=0)
           return false;
           else if(txt.value.length>0)
           {
           if(txt.value.charCodeAt(0) == 32){
           txt.value=txt.value.substring(1,txt.value.length);
           return true;}
           }
           return true;
           }
      </script>

        <script type="text/javascript" language="javascript">
        function modifyMpNewAjaxCall(){
        if(document.mpFormName.mpClientName.value != '' && document.mpFormName.mpCampaignName.value != '' && document.mpFormName.mpTargetMarketName.value != '' && document.mpFormName.mediaPlanName.value != ''){
        var clName = document.mpFormName.mpClientName.value;
        var cpName = document.mpFormName.mpCampaignName.value;
        var tmName = document.mpFormName.mpTargetMarketName.value;
        var mpName = document.mpFormName.mediaPlanName.value;
        var combValues = clName+"&,&"+cpName+"&,&"+tmName+"&,&"+mpName;        
        $.post('/QuickKlix/mediaPlanModifyExist.action', { data: combValues}, responseModifyMpData, "text");
        } }

        function responseModifyMpData(data){
        var myJsonObj = jsonParse(data);
        var value = myJsonObj.jsonResponse;
        value = value.replace('}',"");
        value = value.replace('{',"");        
        if(value != "null"){
        alert("Media Plan name already exist!");
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
      <div style="margin-top:-38px;margin-left: 14px;position: absolute;"><font style="font: bold 1.6em/1em Cambria;color: white;">Modify Media Plan</font></div>

        <form action="mediaPlanModificationSaving" name="mpFormName" id="mpFormId" >
          <div style="margin-left: 10px;"><br/>

          <table style="margin-left: 25px;margin-top:13px;">

              <tr class="label"><td align="right" id="mpClientNameID">Client Name*:</td>
                  <td><input type="text"  name="mpClientName" readonly value="<s:property value="mpClientName"/>" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mpClientNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);mpClientNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td  align="right" id="mpCampaignNameID">Campaign Name*:</td>
              <td><input type="text"  name="mpCampaignName" readonly value="<s:property value="mpCampaignName"/>" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mpCampaignNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);mpCampaignNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
               <tr style="height: 10px;"></tr>

               <tr class="label"><td  align="right" id="mpTargetMarketNameID">Target Market*:</td>
              <td><input type="text"  name="mpTargetMarketName" readonly value="<s:property value="mpTargetMarketName"/>" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mpTargetMarketNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);mpTargetMarketNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
               <tr style="height: 10px;"></tr>

               <tr class="label"><td align="right" id="mediaplanNameID">Media Plan Name*:</td><td>  <input type="text"  name="mediaPlanName" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mediaplanNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);mediaplanNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onchange="return modifyMpNewAjaxCall();"/></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right"  valign="top" id="mpMissionObjectiveID" >Mission Objective*:</td><td>  <textarea cols="35" rows="8"  name="mpMissionObjective"  style="width: 300px;height:120px;border-radius: 5px;box-shadow: 2px 2px 1px #6a6a6a;border: solid 1px #595959;" onblur="mpMissionObjectiveValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);mpMissionObjectiveValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" ></textarea>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="cpStartDateID">Campaign Start Date*:</td><td> <input type="text" name="cpStartDate" id="campStartDate"  value="<s:property value="cpStartDate"/>"  readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="cpStartDateValidation();" onkeyup = "cpStartDateValidation();" class="datepicker"  /></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td align="right" id="cpEndDateID">Campaign End Date*:</td><td> <input type="text" name="cpEndDate" id="campEndDate"  value="<s:property value="cpEndDate"/>" readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="cpEndDateValidation();" onkeyup = "cpEndDateValidation();" class="datepicker"  /></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="cpBudgetID">Campaign Budget*:</td><td> <input type="text" name="cpBudget" maxlength="12" value="<s:property value="cpBudget"/>" id="campaignBudgetID" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="cpBudgetValidation();" onkeyup = "CheckFirstZero(event.keyCode, this);cpBudgetValidation();" onkeydown = "return CheckFirstZero(event.keyCode, this);" onchange="return budgetFormat(this.value);"  onkeypress="return numeralsOnly(event)"/></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="mediaplanStartDateID">Media Plan Start Date*:</td><td> <input type="text" name="mpStartDate" id="medStartDate"  value="<s:property value="mpStartDate"/>" readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mediaplanStartDateValidation();" onkeyup = "mediaplanStartDateValidation();" class="datepicker"  /></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td align="right" id="mediaplanEndDateID">Media Plan End Date*:</td><td> <input type="text" name="mpEndDate" id="medEndDate" value="<s:property value="mpEndDate"/>" readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mediaplanEndDateValidation();" onkeyup = "mediaplanEndDateValidation();" class="datepicker"  /></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="mediaplanBudgetID">Media Plan Budget*:</td><td> <input type="text" name="mpBudget" maxlength="12" value="<s:property value="mpBudget"/>"  id="mediaPlanBudgetID" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mpBudgetValidation();" onkeyup = "CheckFirstZero(event.keyCode, this);mpBudgetValidation();" onkeydown = "return CheckFirstZero(event.keyCode, this);" onchange="return mbudgetFormat(this.value);"  onkeypress="return numeralsOnly(event)"/></td></tr>
              <tr style="height: 30px;"></tr>              
              <tr><td></td><td><button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE</font></button></td></tr>
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