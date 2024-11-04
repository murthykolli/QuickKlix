<%--
    Document   : mediaplanCreation
    Created on : 26 Jun, 2014, 2:11:32 PM
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

         $(document).ready(function(){
            cpName = "<s:property value="mpCampaignName"/>";
            tmName = "<s:property value="mpTargetMarketName"/>";
            
            if(document.mpFormName.mpClientName.value != ""){
            newAjaxCall();
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
             var existedName  = "<s:property value="mediaplanNameAlreadyExist"/>";
             if((existedName != null || existedName != "") && existedName == "AlreadyExisted"){
             alert("Media Plan name already exist!");
             }
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
           document.getElementById("mediaPlanNameID").removeAttribute("class");
           }
           else{
           document.getElementById("mediaPlanNameID").setAttribute("class","redTestDisplay");
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
           document.getElementById("mpStartDateID").removeAttribute("class");
           }
           else{
           document.getElementById("mpStartDateID").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(mpEndDate != ""){
           document.getElementById("mpEndDateID").removeAttribute("class");
           }
           else{
           document.getElementById("mpEndDateID").setAttribute("class","redTestDisplay");
           result=false;
           }
           createMpNewAjaxCall();
           return result;
           }

           function mpClientNameValidation(){
             var mpClientName=document.mpFormName.mpClientName.value;
             if(mpClientName !=""){
             document.getElementById("mpClientNameID").removeAttribute("class");
             }
             else{
             document.getElementById("mpClientNameID").setAttribute("class","redTestDisplay");
             }
             if(mpClientName==""){
            document.getElementById("mpClientNameID").removeAttribute("class");
            }
             }

           function mpCampaignNameValidation(){
             var mpClientName = document.mpFormName.mpClientName.value;
             var mpCampaignName = document.mpFormName.mpCampaignName.value;
             if(mpClientName == ""){
             alert("Please select a client.");
             }
             if(mpCampaignName !=""){
             document.getElementById("mpCampaignNameID").removeAttribute("class");
             }
             else{
             document.getElementById("mpCampaignNameID").setAttribute("class","redTestDisplay");
             }
             if(mpCampaignName==""){
             document.getElementById("mpCampaignNameID").removeAttribute("class");
             }
             }

           function mpTargetMarketNameValidation(){
             var mpClientName = document.mpFormName.mpClientName.value;
             var mpCampaignName = document.mpFormName.mpCampaignName.value;
             var mpTargetMarketName = document.mpFormName.mpTargetMarketName.value;
             if(mpClientName == ""){
              alert("Please select a client.");
             }
             else if(mpCampaignName == ""){
               alert("Please select a campaign.");
             }
             else{
             if(mpTargetMarketName != ""){
             document.getElementById("mpTargetMarketNameID").removeAttribute("class");
             }
             else{
             document.getElementById("mpTargetMarketNameID").setAttribute("class","redTestDisplay");
             }
             if(mpTargetMarketName==""){
            document.getElementById("mpTargetMarketNameID").removeAttribute("class");
            }
            }
            mpClCpAndTmValidationChecking();
            }


          function mediaPlanNameValidation(){
            var mpClientName = document.mpFormName.mpClientName.value;
            var mpCampaignName = document.mpFormName.mpCampaignName.value;
            var mpTargetMarketName = document.mpFormName.mpTargetMarketName.value;
            if(mpClientName == ""){
            document.mpFormName.mediaPlanName.value = "";
            alert("Please select a client.");
            }
            else if(mpCampaignName == ""){
            document.mpFormName.mediaPlanName.value = "";
            alert("Please select a campaign.");
            }
            else if(mpTargetMarketName == ""){
            document.mpFormName.mediaPlanName.value = "";
            alert("Please select a target market.");
            }
            else{
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var mediaPlanName=document.mpFormName.mediaPlanName.value;
            if(reg.test(mediaPlanName)){
            document.getElementById("mediaPlanNameID").removeAttribute("class");
            }
            else{
            document.getElementById("mediaPlanNameID").setAttribute("class","redTestDisplay");
            }
            if(mediaPlanName==""){
            document.getElementById("mediaPlanNameID").removeAttribute("class");
            }
            }}


           function mpMissionObjectiveValidation(){
             var mpMissionObjective=document.mpFormName.mpMissionObjective.value;
             if(mpMissionObjective !=""){
             document.getElementById("mpMissionObjectiveID").removeAttribute("class");
             }
             else{
             document.getElementById("mpMissionObjectiveID").setAttribute("class","redTestDisplay");
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
             }
             if(cpBudget==""){
             document.getElementById("cpBudgetID").removeAttribute("class");
             }
             }

           function mpStartDateValidation(){
             var mpStartDate=document.mpFormName.mpStartDate.value;
             if(mpStartDate !=""){
             document.getElementById("mpStartDateID").removeAttribute("class");
             }
             else{
             document.getElementById("mpStartDateID").setAttribute("class","redTestDisplay");
             }
             if(mpStartDate == ""){
             document.getElementById("mpStartDateID").removeAttribute("class");
             }
             }

            function mpEndDateValidation(){
            var mpEndDate=document.mpFormName.mpEndDate.value;
             if(mpEndDate !=""){
             document.getElementById("mpEndDateID").removeAttribute("class");
             }
             else{
             document.getElementById("mpEndDateID").setAttribute("class","redTestDisplay");
             }
             if(mpEndDate == ""){
             document.getElementById("mpEndDateID").removeAttribute("class");
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

           function replaceAll(txt, replace, with_this) {
            return txt.replace(new RegExp(replace, 'g'),with_this);
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
           function newAjaxCall(){
           mpClientNameValidation();
           if(document.mpFormName.mpClientName.value!=''){
           var clientName = document.mpFormName.mpClientName.value;
           $.post('/QuickKlix/mpCampaignSelectionFromDB.action', { data: clientName}, responseData, "text");
           }else{
           OptionsFill('mpCampaignSelectionID',"");
           } }

           function responseData(data){
           var myJsonObj = jsonParse(data);
           var value=myJsonObj.jsonResponse;
           value=value.replace('}',"");
           value=value.replace('{',"");
           OptionsFill('mpCampaignSelectionID',value);
           if(cpName!=""){
           document.mpFormName.mpCampaignName.value = cpName;
           cpName="";
           cpNewAjaxCall();
           }
        }

            function cpNewAjaxCall(){
            mpCampaignNameValidation();
            if(document.mpFormName.mpClientName.value!='' && document.mpFormName.mpCampaignName.value!=''){
            var clientName = document.mpFormName.mpClientName.value;
            var campaignName = document.mpFormName.mpCampaignName.value;
            $.post('/QuickKlix/mpTargetMarketSelectionFromDB.action', { data: clientName, data1:campaignName}, responseTmData, "text");
            }else{
            document.mpFormName.cpStartDate.value = "";
            document.mpFormName.cpEndDate.value = "";
            document.mpFormName.cpBudget.value = "";
            OptionsFill('mpTmSelectionID',"");
            } }

            function responseTmData(data){
             var myJsonObj = jsonParse(data);
            var value=myJsonObj.jsonResponse;
            var value1=myJsonObj.jsonRequest;
            value=value.replace('}',"");
            value=value.replace('{',"");
            OptionsFill('mpTmSelectionID',value);
            value1=value1.replace('}',"");
            value1=value1.replace('{',"");
            value1=replaceAll(value1,"'","");
            var splitedValue=value1.split('&,&');
            if(tmName != ''){
            document.mpFormName.mpTargetMarketName.value = tmName;
            }
            document.mpFormName.cpStartDate.value = splitedValue[0];
            document.mpFormName.cpEndDate.value = splitedValue[1];
            document.mpFormName.cpBudget.value = splitedValue[2];
            document.getElementById("cpStartDateID").removeAttribute("class");
            document.getElementById("cpEndDateID").removeAttribute("class");
            document.getElementById("cpBudgetID").removeAttribute("class");
            setDates();
            }


       </script>

        <script type="text/javascript" language="javascript">
        function createMpNewAjaxCall(){
        if(document.mpFormName.mpClientName.value != '' && document.mpFormName.mpCampaignName.value != '' && document.mpFormName.mpTargetMarketName.value != '' && document.mpFormName.mediaPlanName.value != ''){
        var clName = document.mpFormName.mpClientName.value;
        var cpName = document.mpFormName.mpCampaignName.value;
        var tmName = document.mpFormName.mpTargetMarketName.value;
        var mpName = document.mpFormName.mediaPlanName.value;
        var combValues = clName+"&,&"+cpName+"&,&"+tmName+"&,&"+mpName;
        $.post('/QuickKlix/mediaPlanCreationExist.action', { data: combValues}, responseCreateMpData, "text");
        }
    }

        function responseCreateMpData(data){
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

        <script type="text/javascript" language="javascript">
        function clientNotSelected(){
        if(document.mpFormName.mpClientName.value == ''){
        alert("Please select a client.");
        result=false;
        }else{ 
        window.location('mediaPlanCampaignCreation.action');    
        result=true;
        }
        return result;
        }

        function campaignNotSelected(){
        if(document.mpFormName.mpClientName.value == ''){
        alert("Please select a client.");
        result=false;
        }else if(document.mpFormName.mpCampaignName.value == ''){
        alert("Please select a campaign.");
        result=false;
        }else{
        window.location('mediaplanTargetMarketCreation.action');    
        result=true;
        }
        return result;
        }
        </script>
             
        <script type="text/javascript" language="javascript">
        function mpClCpAndTmValidationChecking(){
        if(document.mpFormName.mpClientName.value != '' && document.mpFormName.mpCampaignName.value != '' && document.mpFormName.mpTargetMarketName.value != ''){
        var clName = document.mpFormName.mpClientName.value;
        var cpName = document.mpFormName.mpCampaignName.value;
        var tmName = document.mpFormName.mpTargetMarketName.value;
        var combValues = clName+"&,&"+cpName+"&,&"+tmName;
        $.post('/QuickKlix/mpClCpAndTmValidationChecking.action', { data: combValues}, responseCreateMpData, "text");
        }
        }

        function responseCreateMpData(data){
        var myJsonObj = jsonParse(data);
        var value = myJsonObj.jsonResponse;
        value = value.replace('}',"");
        value = value.replace('{',"");
        if(value != "null"){
        alert("These three combinations are already exist!");
        document.mpFormName.mpTargetMarketName.value = '';
        document.mpFormName.mpCampaignName.value = '';
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
      <div style="margin-top:-38px;margin-left: 14px;position: absolute;"><font style="font: bold 1.6em/1em Cambria;color: white;">New Media Plan</font></div>

        <form action="mediaPlanDataSaving" name="mpFormName" id="mpFormId">
          <div style="margin-left: 10px;"><br/>

          <table style="margin-left: 25px;margin-top:13px;">

              <tr class="label"><td align="right" id="mpClientNameID">Client Name*:</td>
              <td><s:select name="mpClientName" list="mpClientList"  cssStyle="margin-top:-26px;position:absolute;height:25px;width:230px; background-color: white;border-color: #f4f4f4;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" headerKey=""  headerValue="--------Select Client Name--------" onclick="return newAjaxCall();"/></td>
              <td></td><td> <a href="mediaPlanClientCreation.action" style="text-decoration: none;"><button type="button" onclick="return clientRedirection();" onMouseOver="this.style.color='#00a9f1';document.getElementById('AddNewCLFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('AddNewCLFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; margin-left: 0px; height: 28px;color: white; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;position:absolute;margin-left:250px;margin-top:-33px;"><img id="AddNewCLFormImg1" src="/QuickKlix/images/SSImgs/AddNewFormSmallImg.png" /><font style="top: -2px;position: relative;">&nbsp;ADD NEW CLIENT</font></button></a> </td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td  align="right" id="mpCampaignNameID">Campaign Name*:</td>
              <td><s:select name="mpCampaignName" id="mpCampaignSelectionID" list="{}" cssStyle="margin-top:-26px;position:absolute;height:25px;width:230px; background-color: white;border-color: #f4f4f4;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" headerKey=""  headerValue="--------Select Campaign Name--------" onclick="return cpNewAjaxCall();" /></td>
              <td></td><td> <a href="mediaPlanCampaignCreation.action" style="text-decoration: none;" onclick="return clientNotSelected();"><button  type="button" onclick="" onMouseOver="this.style.color='#00a9f1';document.getElementById('AddNewCPFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('AddNewCPFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; margin-left: 0px; height: 28px;color: white; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;position:absolute;margin-left:250px;margin-top:-33px;"><img id="AddNewCPFormImg1" src="/QuickKlix/images/SSImgs/AddNewFormSmallImg.png" /><font style="top: -2px;position: relative;">&nbsp;ADD NEW CAMPAIGN</font></button></a> </td></tr>
              <tr style="height: 10px;"></tr>

               <tr class="label"><td  align="right" id="mpTargetMarketNameID">Target Market*:</td>
               <td><s:select  name="mpTargetMarketName"  id="mpTmSelectionID"  list="{}" cssStyle="margin-top:-26px;position:absolute;height:25px;width:230px; background-color: white;border-color: #f4f4f4;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" headerKey=""  headerValue="--------Select Target Market--------" onclick="return mpTargetMarketNameValidation();"/></td>
               <td></td><td> <a href="mediaplanTargetMarketCreation.action" style="text-decoration: none;" onclick="return campaignNotSelected();"><button type="button" onclick=""  onMouseOver="this.style.color='#00a9f1';document.getElementById('AddNewTMFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('AddNewTMFormImg1').src='/QuickKlix/images/SSImgs/AddNewFormSmallImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; margin-left: 0px; height: 28px;color: white; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;position:absolute;margin-left:250px;margin-top:-33px;"><img id="AddNewTMFormImg1" src="/QuickKlix/images/SSImgs/AddNewFormSmallImg.png" /><font style="top: -2px;position: relative;">&nbsp;ADD NEW TARGET MARKET</font></button></a> </td></tr>
               <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="mediaPlanNameID">Media Plan Name*:</td><td>  <input type="text"  name="mediaPlanName" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onclick="return mediaPlanNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" onchange="return createMpNewAjaxCall();"/></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" valign="top" id="mpMissionObjectiveID" >Mission Objective*:</td><td>  <textarea cols="35" rows="8"  name="mpMissionObjective"  style="width: 300px;height:120px;border-radius: 5px;box-shadow: 2px 2px 1px #6a6a6a;border: solid 1px #595959;" onblur="mpMissionObjectiveValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);mpMissionObjectiveValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" ></textarea>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="cpStartDateID">Campaign Start Date*:</td><td> <input type="text" name="cpStartDate" id="campStartDate" readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="cpStartDateValidation();" onkeyup = "cpStartDateValidation();" class="datepicker"  /></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td align="right" id="cpEndDateID">Campaign End Date*:</td><td> <input type="text" name="cpEndDate" id="campEndDate" readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="cpEndDateValidation();" onkeyup = "cpEndDateValidation();" class="datepicker"  /></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="cpBudgetID">Campaign Budget*:</td><td> <input type="text" name="cpBudget" maxlength="12" id="campaignBudgetID" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="cpBudgetValidation();" onkeyup = "CheckFirstZero(event.keyCode, this);cpBudgetValidation();" onkeydown = "return CheckFirstZero(event.keyCode, this);" onchange="return budgetFormat(this.value);"  onkeypress="return numeralsOnly(event)"/></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="mpStartDateID">Media Plan Start Date*:</td><td> <input type="text" name="mpStartDate"  id="medStartDate" readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mpStartDateValidation();" onkeyup = "mpStartDateValidation();" class="datepicker"  /></td></tr>
              <tr style="height: 10px;"></tr>
              <tr class="label"><td align="right" id="mpEndDateID">Media Plan End Date*:</td><td> <input type="text" name="mpEndDate" id="medEndDate" readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mpEndDateValidation();" onkeyup = "mpEndDateValidation();" class="datepicker"  /></td></tr>
              <tr style="height: 10px;"></tr>

              <tr class="label"><td align="right" id="mediaplanBudgetID">Media Plan Budget*:</td><td> <input type="text" name="mpBudget" maxlength="12" id="mpBudgetID" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="mpBudgetValidation();" onkeyup = "CheckFirstZero(event.keyCode, this);mpBudgetValidation();" onkeydown = "return CheckFirstZero(event.keyCode, this);"  onchange="return mbudgetFormat(this.value);"   onkeypress="return numeralsOnly(event)"/></td></tr>
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