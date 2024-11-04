<%--
    Document   : campaignmodification
    Created on : 5 Jun, 2014, 9:42:52 AM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <script src="/QuickKlix/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
         <script src="/QuickKlix/scripts/jquery.ui.core.js" type="text/javascript"></script>
        <script src="/QuickKlix/scripts/jquery.ui.datepicker.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="/QuickKlix/CSS/jquery.ui.datepicker.css" />
        <script language="javascript" src="/QuickKlix/scripts/json-minified.js" type="text/javascript"></script>

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
          var existedName  = "<s:property value="contactPerson"/>";
         if((existedName != null || existedName != "") && existedName == "AlreadyExisted"){
          alert("Campaign name already exist!");
          }
         });
          
          $(document).ready(function(){
         if("<s:property value="existedCampaignProducts"/>" != ""){
            document.getElementById("existingProductId").style.display = "block";
            document.getElementById("removeButtonId").style.display = "block";
            }
            $("[name=campaignClientName]").val(convert("<s:property value="campaignClientName"/>"));
            $("[name=campaignName]").val(convert("<s:property value="campaignName"/>"));
            $("[name=missionObjective]").val(convert("<s:property value="missionObjective"/>"));
            $("[name=campaignStartDate]").val("<s:property value="campaignStartDate"/>");
            $("[name=campaignEndDate]").val("<s:property value="campaignEndDate"/>");
            $("[name=campaignBudget]").val("<s:property value="campaignBudget"/>");
            $("[name=existedCampaignProducts]").val("<s:property value="existedCampaignProducts"/>");
           
            var mpStartDate  = "<s:property value="mpStartDate"/>";
            var mpEndDate  = "<s:property value="mpEndDate"/>";
             $("#txtFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
	    onSelect: function(selected) {
            $("#txtToDate").datepicker("option","minDate", selected);
            if(mpEndDate != "MpEndDate"){
            $("#txtToDate").datepicker("option","minDate", mpEndDate);
	    } } });
  
	    $("#txtToDate").datepicker({
            changeMonth: true,
            changeYear: true,
	    onSelect: function(selected) {
	    $("#txtFromDate").datepicker("option","maxDate", selected);
            if(mpStartDate != "MpStartDate"){
            $("#txtFromDate").datepicker("option","maxDate", mpStartDate);
	    } } });
    
            if(mpStartDate != "MpStartDate" && mpEndDate != "MpEndDate" ){
            $("#txtFromDate").datepicker("option","maxDate", mpStartDate);
            $("#txtToDate").datepicker("option","minDate", mpEndDate);
            }else {
            $("#txtFromDate").datepicker("option","maxDate", $("#txtToDate").val());
            $("#txtToDate").datepicker("option","minDate", $("#txtFromDate").val());
            }

            var productsList = document.getElementById("existingProductId");
            var productsShow = "<s:property value="existedCampaignProducts"/>";
            productsShow = productsShow.replace(/\&amp;/g,"&");
            productsShow = productsShow.replace(/\&gt;/g, ">");
            productsShow = productsShow.replace(/\&lt;/g, "<");
            productsShow = productsShow.replace(/\&quot;/g, '"');
            if(!(productsShow == "")){
            var productsShowList = productsShow.split(",");
            }
            for(var i=0; i < productsShowList.length; i++){
            productsList.options[productsList.options.length] = new Option(productsShowList[i], productsShowList[i]);
            }
            budgetFormat("<s:property value="campaignBudget"/>");
            });
           var result = true;
          function validation(){
           var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
           var numReg=/^[0-9\$]*(?=.*\d)[0-9-,.]*$/;

           var campaignClientName=document.campaignFormName.campaignClientName.value;
           var campaignName=document.campaignFormName.campaignName.value;
           var missionObjective=document.campaignFormName.missionObjective.value;
           var campaignProductsList= document.campaignFormName.existedCampaignProducts.value;
           var campaignProducts=document.campaignFormName.campaignProducts.value;
           var campaignStartDate=document.campaignFormName.campaignStartDate.value;
           var campaignEndDate=document.campaignFormName.campaignEndDate.value;
           var campaignBudget=document.campaignFormName.campaignBudget.value;
           if(campaignClientName != ""){
           document.getElementById("clientId").removeAttribute("class");
           }
           else{
           document.getElementById("clientId").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(reg.test(campaignName)){
           document.getElementById("campaignId").removeAttribute("class");
           }
           else{
           document.getElementById("campaignId").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(missionObjective != ""){
           document.getElementById("missionId").removeAttribute("class");
           }
           else{
           document.getElementById("missionId").setAttribute("class","redTestDisplay");
           result=false;
           }
            if(campaignProductsList === ""){
           if(campaignProducts != ""){
           document.getElementById("campProductId").removeAttribute("class");
           }
           else{
           document.getElementById("campProductId").setAttribute("class","redTestDisplay");
           result=false;
           }}
           if(campaignStartDate != ""){
           document.getElementById("campStartDateId").removeAttribute("class");
           }
           else{
           document.getElementById("campStartDateId").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(campaignEndDate != ""){
           document.getElementById("campEndDateId").removeAttribute("class");
           }
           else{
           document.getElementById("campEndDateId").setAttribute("class","redTestDisplay");
           result=false;
           }
           if(numReg.test(campaignBudget) && campaignBudget != ".00" ){
           document.getElementById("campBudgetId").removeAttribute("class");
           }
           else{
           document.getElementById("campBudgetId").setAttribute("class","redTestDisplay");
           result=false;
           }
           newAjaxCall();
           return result;
           }

           function campaignClientNameValidation(){
           var campaignClientName=document.campaignFormName.campaignClientName.value;
           if(campaignClientName!=""){
           document.getElementById("clientId").removeAttribute("class");
           }
           else{
           document.getElementById("clientId").setAttribute("class","redTestDisplay");
           if(campaignClientName==""){
           document.getElementById("clientId").removeAttribute("class");
           } }  }

           function campaignNameValidation(){
           var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var campaignName=document.campaignFormName.campaignName.value;
            if(document.campaignFormName.campaignClientName.value != ""){
            if(reg.test(campaignName)){
            document.getElementById("campaignId").removeAttribute("class");
            }
            else{
            document.getElementById("campaignId").setAttribute("class","redTestDisplay");
            }
            if(campaignName==""){
            document.getElementById("campaignId").removeAttribute("class");
            }
            }else{
            document.campaignFormName.campaignName.value = "";
            alert("Please select a client.");
            }}

            function missionObjectiveValidation(){
            var missionObjective=document.campaignFormName.missionObjective.value;
            if(document.campaignFormName.campaignClientName.value != ""){
            if(missionObjective!=""){
            document.getElementById("missionId").removeAttribute("class");
            }
            else{
            document.getElementById("missionId").setAttribute("class","redTestDisplay");
            if(missionObjective==""){
            document.getElementById("missionId").removeAttribute("class");
            } }  }else{
            document.campaignFormName.missionObjective.value = "";
             alert("Please select a client.");
            }}

            function campaignProductsValidation(){
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var campaignProducts=document.campaignFormName.campaignProducts.value;
            var campaignProductsList=document.campaignFormName.campaignProductsList.value;
            if(campaignProductsList === ""){
             if(campaignProducts != ""){
            document.getElementById("campProductId").removeAttribute("class");
            }
            else{
            document.getElementById("campProductId").setAttribute("class","redTestDisplay");
            }
            if(campaignProducts==""){
            document.getElementById("campProductId").removeAttribute("class");
            }}}


           function campaignStartDateValidation(){
           var campaignStartDate=document.campaignFormName.campaignStartDate.value;
           if(campaignStartDate!=""){
           document.getElementById("campStartDateId").removeAttribute("class");
           }
           else{
           document.getElementById("campStartDateId").setAttribute("class","redTestDisplay");
           if(campaignStartDate==""){
           document.getElementById("campStartDateId").removeAttribute("class");
           } }  }

            function ccampaignEndDateValidation(){
            var campaignEndDate=document.campaignFormName.campaignEndDate.value;
            if(campaignEndDate!=""){
            document.getElementById("campEndDateId").removeAttribute("class");
            }
            else{
            document.getElementById("campEndDateId").setAttribute("class","redTestDisplay");
            if(campaignEndDate==""){
            document.getElementById("campEndDateId").removeAttribute("class");
            } }  }

            function campaignBudgetValidation(){
            var campaignBudget=document.campaignFormName.campaignBudget.value;
            if(campaignBudget!="" && campaignBudget != ".00"){
            document.getElementById("campBudgetId").removeAttribute("class");
            }
            else{
            document.getElementById("campBudgetId").setAttribute("class","redTestDisplay");
            if(campaignBudget==""){
            document.getElementById("campBudgetId").removeAttribute("class");
            } }}

            function displayAddButton(){
            if(document.campaignFormName.campaignProducts.value != ""){
            document.getElementById("addButtonId").style.display = "block";
            }else{
            document.getElementById("addButtonId").style.display = "none";    
            }
            document.getElementById("removeButtonId").style.display = "none";
            }
            function addProducts(){
            var reg = /^[A-Za-z 0-9][A-Za-z 0-9 -#/_().&amp;]*$/;
            var productNames="";
            var exisProducts=document.campaignFormName.existedCampaignProducts.value;
            document.getElementById("existingProductId").style.display = "block";
            var campaignProducts =  document.campaignFormName.campaignProducts.value;
            var productsList = document.getElementById("existingProductId");
            var options = document.createElement("option");
            var count = 0;
            for(var i=0; i < productsList.options.length; i++)
            {
            if(productsList.options[i].value == campaignProducts){
            count++;
            }}
            if(count == 0){
            if(campaignProducts != ""){
            options.text = campaignProducts;
            options.value = campaignProducts;
            productsList.add(options);
            document.getElementById("addButtonId").style.display = "none";    
            }
            for(var i=0; i < productsList.options.length; i++)
            {
            if(i==0){
            productNames = productsList.options[i].value;
            }
            else{
            productNames = productNames +",&,"+productsList.options[i].value;
            }}
            document.campaignFormName.existedCampaignProducts.value=productNames;
            }
            else{
            alert("Product already exist!");
            document.campaignFormName.existedCampaignProducts.value=exisProducts;
            document.getElementById("addButtonId").style.display = "none";    
            }
            document.getElementById("campaignProductsID").value = "";
            }

            function removeProductsInSelectBox(){
            document.getElementById("removeButtonId").style.display = "block";
            document.getElementById("addButtonId").style.display = "none";
            }

           function removeProducts(){
            var existingProductId = document.getElementById("existingProductId");
            if(existingProductId.value != ""){
            existingProductId.remove(existingProductId.selectedIndex);
            document.getElementById("removeButtonId").style.display = "none";
            }
            else{
            alert("Plese select at least one product."); 
            }
            if(existingProductId.options.length === 0){
            document.getElementById("existingProductId").style.display = "none";
            document.getElementById("removeButtonId").style.display = "none";
            }          
            var productNames="";
            if(existingProductId.options.length>0){
            for(var i=0; i < existingProductId.options.length; i++)
            {
            if(i==0){productNames = existingProductId.options[i].value;}
            else{
            productNames = productNames +",&,"+existingProductId.options[i].value;
            } }
            document.campaignFormName.existedCampaignProducts.value=productNames;
            }else{
            document.campaignFormName.existedCampaignProducts.value = "";
            }
            }

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
         document.campaignFormName.campaignBudget.value= (exceedBudget + '').replace(/(\d)(?=(\d{3})+$)/g, '$1,')+".00";
        var cmpBudget = Number(document.campaignFormName.campaignBudget.value.replace(/[^0-9\.]+/g,"")); 
        if(cmpBudget == 0){
        alert("All zeros are not allowed.");  
        document.campaignFormName.campaignBudget.value = "";
        }
        }
        }


        </script>

        <script type="text/javascript" language="javascript">
        function newAjaxCall(){
        if(document.campaignFormName.campaignName.value != ''){
        var campaignsName = document.campaignFormName.campaignName.value;
        $.post('/QuickKlix/campaignModifyCreationExist.action', { data: campaignsName}, responseData, "text");
        } }

        function responseData(data){
        var myJsonObj = jsonParse(data);
        var value = myJsonObj.jsonResponse;
        value = value.replace('}',"");
        value = value.replace('{',"");
        if(value != "null"){
        alert("Campaign name already exist!");
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
      <div style="margin-top:-38px;margin-left: 14px;position: absolute;"><font style="font: bold 1.6em/1em Cambria;color: white;">Modify Campaign</font></div>

        <form action="campaignModificationSaving" name="campaignFormName" id="campaignFormId" onsubmit="return addProducts();" >
          <div style="margin-left: 10px;"><br/>

          <table style="margin-left: 25px;margin-top:13px;">
                 <tr class="label"><td id="clientId" align="right">Client Name*:</td>
                 <td><s:textfield name="campaignClientName" readonly="true" cssStyle="margin-top:-26px;position:absolute;height:25px;width:230px; background-color: white;border-color: #f4f4f4;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;"/>
                 </td></tr>

                 <tr style="height: 10px;"></tr>
                 <tr class="label"><td id="campaignId" align="right">Campaign Name*:</td><td>  <input type="text"  name="campaignName" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="campaignNameValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);campaignNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onchange="return newAjaxCall();"/></td></tr>
                 <tr style="height: 10px;"></tr>
                 <tr class="label"><td id="missionId" valign="top" align="right">Mission Objective*:</td><td>  <textarea cols="35" rows="8"  name="missionObjective"  style="width: 300px;height:120px;border-radius: 5px;box-shadow: 2px 2px 1px #6a6a6a;border: solid 1px #595959;" onblur="missionObjectiveValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);missionObjectiveValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" ></textarea>
                 <tr style="height: 10px;"></tr>

                 <tr class="label"><td id="campProductId" align="right">Campaign Products*:</td><td> <input type="text"  name="campaignProducts" id="campaignProductsID" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="campaignProductsValidation();" onkeyup = "CheckFirstChar(event.keyCode, this);campaignProductsValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" onchange="addProducts();" onkeypress="displayAddButton();" /></td>
                 <td> <button type="button" id="addButtonId" onMouseOver="this.style.color='#00a9f1';document.getElementById('AddButtonImg1').src='/QuickKlix/images/SSImgs/AddButtonMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('AddButtonImg1').src='/QuickKlix/images/SSImgs/AddButtonImg.png';" style="display: none;background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;position:absolute;margin-left: -58px; margin-top: -15px;" onclick="addProducts()"><img id="AddButtonImg1" src="/QuickKlix/images/SSImgs/AddButtonImg.png" /><font style="top: -2px;position: relative;">&nbsp;ADD</font></button></td></tr>
                 <tr  class="label"><td></td><td><select name="campaignProductsList" id="existingProductId" onclick="removeProductsInSelectBox();" size="4" style="display: none;margin-top: 13px;width:230px; border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;  padding: 5px" /></td>
                 <td> <button id="removeButtonId" type="button" onMouseOver="this.style.color='#00a9f1';document.getElementById('RemoveButtonImg1').src='/QuickKlix/images/SSImgs/RemoveButtonMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('RemoveButtonImg1').src='/QuickKlix/images/SSImgs/RemoveButtonImg.png';" style="display: none;background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; margin-left: 0px; color: white; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;position:absolute;margin-left: -58px; margin-top: -30px;" onclick="removeProducts()"><img id="RemoveButtonImg1" src="/QuickKlix/images/SSImgs/RemoveButtonImg.png" /><font style="top: -2px;position: relative;">&nbsp;REMOVE</font></button></td></tr>
                 <input type="hidden" name="existedCampaignProducts" />
                 <tr style="height: 10px;"></tr>

                 <tr class="label"><td id="campStartDateId" align="right">Start Date*:</td><td> <input id="txtFromDate" type="text" name="campaignStartDate"  readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="campaignStartDateValidation();" onkeyup = "campaignStartDateValidation();" class="datepicker"  /></td></tr>
                 <tr style="height: 10px;"></tr>
                 <tr class="label"><td id="campEndDateId" align="right">End Date*:</td><td> <input id="txtToDate" type="text" name="campaignEndDate" readonly style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="ccampaignEndDateValidation();" onkeyup = "ccampaignEndDateValidation();" class="datepicker"  /></td></tr>
                 <tr style="height: 10px;"></tr>
                 <tr class="label"><td id="campBudgetId" align="right">Budget*:</td><td> <input type="text" maxlength="12" name="campaignBudget" style="height:25px;width:230px;border-radius: 5px;box-shadow: 3px 3px 1px gray;border: solid 1px #595959;" onblur="campaignBudgetValidation();" onkeyup = "CheckFirstZero(event.keyCode, this);campaignBudgetValidation();" onkeydown = "return CheckFirstZero(event.keyCode, this);" onchange="return budgetFormat(this.value);" onkeypress="return numeralsOnly(event)"/></td></tr>
                 <tr style="height: 30px;"></tr>
                 

<!--                 <tr><td></td><td><input type="submit" id="button" value="     SAVE" align="left" style="background: #666666;border-radius: 7px;cursor: pointer; border: 1px solid #666666; margin-left: 0px; color: white; height: 38px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"
                 onMouseOver="this.style.color='#00a9f1';document.getElementById('docConImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('docConImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" onclick="return validation()"/></td></tr>
                 <tr><td></td><td><p style="margin-top: -31px;margin-left:13px;position:absolute;"><img id="docConImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png" /> &nbsp;</p></td></tr>-->
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