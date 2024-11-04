<%-- 
    Document   : clientmodification
    Created on : 5 Jun, 2014, 9:44:10 AM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.util.ArrayList"%>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />

    <link type="text/css" rel="stylesheet" href="/QuickKlix/CSS/legalnodstyle.css" />
    <link rel="stylesheet" href="/QuickKlix/CSS/nicebuttonsdisplay.css" type="text/css" />
    <script language="javascript" type="text/javascript" src="/QuickKlix/scripts/jquery-1.4.2.min.js"></script>
    <script src="/QuickKlix/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
    <script language="javascript" src="/QuickKlix/scripts/json-minified.js" type="text/javascript"></script>

    <style>
    .tdLabel{
    display: none;
    }
    .label{
    font-size: 14px;
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
    <script type="text/javascript">
    function CheckFirstChar(key, txt) {
    if(key == 32 && txt.value.length<=0){
    return false;
    }
    else if(txt.value.length>0) {
    if(txt.value.charCodeAt(0) == 32) {
    txt.value=txt.value.substring(1,txt.value.length);
    return true;
    } }
    return true;
    }

    function phoneFormat (e,input) {
        evt = e || window.event; /* firefox uses reserved object e for event */
        var pressedkey = evt.which || evt.keyCode;
        var BlockedKeyCodes = new Array(0,8,27,13,9); //8 is backspace key
        var len = BlockedKeyCodes.length;
        var block = false;
        var str = '';
        for (i=0; i<len; i++){
        str=BlockedKeyCodes[i].toString();
        if (str.indexOf(pressedkey) >=0 ) block=true;
        }
        if (block) return true;
        s = input.value;
        if (s.charAt(0) =='+') return false;
        filteredValues = '"`!@#$%^&*()_+|~-=\QWERT YUIOP{}ASDFGHJKL:ZXCVBNM<>?qwertyuiop[]asdfghjkl;zxcvbnm,./\\\'';
        var i;
        var returnString = '';
        for (i = 0; i < s.length; i++) {
        var c = s.charAt(i);
        if ((filteredValues.indexOf(c) == -1) & (returnString.length <  12 )) {
        if (returnString.length==3) returnString +='-';
        if (returnString.length==7) returnString +='-';
        returnString += c;
        }
        }
        input.value = returnString;
        return false;
        }

        function numberonly(e, decimal) {
        var key;
        var keychar;
        if (window.event) {
            key = window.event.keyCode;
        }
        else if (e) {
            key = e.which;
        }
        else {
            return true;
        }
        keychar = String.fromCharCode(key);

        if ((key==null) || (key==0) || (key==8) ||  (key==9) || (key==13) || (key==27) ) {
            return true;
        }
        else if ((("0123456789").indexOf(keychar) > -1)) {
            return true;
        }
        else if (decimal && (keychar == ".")) {
            return true;
        }
        else if (keychar == "-") {
            return true;
        }
        else
            return false;
      }

       function numeralsOnly(evt) {
       var key;
        var keychar;
        if (window.event) {key = window.event.keyCode;}
        else if (evt) { key = evt.which;}
        else { return true;}
        keychar = String.fromCharCode(key);
        evt = (evt) ? evt : event;
        var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
        ((evt.which) ? evt.which : 0));
        if (keychar == ".") {return true;}
        if (keychar == ",") {return true;}
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
        }
       return true;
       }
    </script>
    <script type="text/javascript">
    
    window.onload=function(){
    var clNameVal = document.getElementById(EditModeNameId).value;
    }

    function attributesEditIds(name1,name2){
    var saveId = "SaveMode"+name2+"Id";
    var editId = "EditMode"+name2+"Id";    
    $("."+editId).hide();
    $("."+saveId).show();
    return false;
    }
        function attributesSaveIds(value1,value2){
        var saveId = "SaveMode"+value2+"Id";
        var editId = "EditMode"+value2+"Id";
        var attrNameId = "attrName"+value2+"Id";
        $("."+saveId).hide();
        $("."+editId).show();
        var attrbValue = document.getElementById(attrNameId).value;
        if(attrbValue != '' && value2 != ''){
        var value = attrbValue+"&,&"+value2+"&,&"+value1;
        $.post('/QuickKlix/modifyClientDataSaving.action', { data: value}, responseData, "text");
        }
         return false;
        }

        function responseData(data){
        var myJsonObj = jsonParse(data);
        var value = myJsonObj.jsonResponse;
        value = value.replace('}',"");
        value = value.replace('{',"");        
        var splitedIdValue = value.split('&,&');        
        if(splitedIdValue[0] != "null"){
        var editValId = "EditVal"+splitedIdValue[1]+"Id";
        var returnId = "Return"+splitedIdValue[1]+"Id";
        var returnValueId = "ReturnVal"+splitedIdValue[1]+"Id";
        document.getElementById(editValId).style.display='none';
        document.getElementById(returnId).style.display='block';
        document.getElementById(returnValueId).innerHTML = splitedIdValue[0];
        }else{
        alert("Client name already exist!");
        }
        }

        </script>


    </head>
    <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>

    <div style="background: white;border-left: solid 8px #d0d0d0;border-right: solid 2px #d0d0d0;width: 888px;margin-left: 25px;margin-top: 50px;height: auto;">
    <div style="background: #858585;height: 35px;margin-left: -1px;width:889px"></div>

    <div style=" min-height: 200px;">
    <div style="margin-top:-34px;margin-left: 14px;position: absolute;width:874px;white-space:nowrap;overflow-y:hidden;overflow-x:auto;"><font style="font: bold 1.35em/1em Cambria;color: white;">Modifiy Client</font></div>



        <tr><s:if test="hasActionErrors()"><s:iterator value="actionErrors">
        <tr><td></td><td class="error"><font  style="color: #c00002;font-size:14px; height: 10px;"><img src="/QuickKlix/images/warning.gif" width="18" height="12"/>
        <s:property escape="false" /></font></td></tr></s:iterator></s:if></tr>

        <table style="margin-left: 12px;margin-top:0px;width:865px;text-align: left;">
        <br/>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Client Name</p> </td>
        <td class="EditModeClientNameId"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValClientNameId"><s:property value="clientName"/></font><font style="display: none;height: 0px;" id="ReturnClientNameId"><b id="ReturnValClientNameId"></b></font> &nbsp;</p></td> <td class="EditModeClientNameId"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="clientName"/>','ClientName');" /></p></td>
        <td class="SaveModeClientNameId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><input id="attrNameClientNameId" type="text" name="clientName" value="<s:property value="clientName"/>" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" /></font></td> <td class="SaveModeClientNameId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="clientName"/>','ClientName');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Client Address1</p> </td>
        <td class="EditModeClientAddress1Id"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValClientAddress1Id"><s:property value="clientAddress1"/></font><font style="display: none;height: 0px;" id="ReturnClientAddress1Id"><b id="ReturnValClientAddress1Id"></b></font> &nbsp;</p></td> <td class="EditModeClientAddress1Id"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="clientAddress1"/>','ClientAddress1');" /></p></td>
        <td class="SaveModeClientAddress1Id" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><input id="attrNameClientAddress1Id" type="text" name="clientAddress1" value="<s:property value="clientAddress1"/>" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" /></font></td> <td class="SaveModeClientAddress1Id" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="clientAddress1"/>','ClientAddress1');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Client Address2</p> </td>
        <td class="EditModeClientAddress2Id"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValClientAddress2Id"><s:property value="clientAddress2"/></font><font style="display: none;height: 0px;" id="ReturnClientAddress2Id"><b id="ReturnValClientAddress2Id"></b></font> &nbsp;</p></td> <td class="EditModeClientAddress2Id"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="clientAddress2"/>','ClientAddress2');" /></p></td>
        <td class="SaveModeClientAddress2Id" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><input id="attrNameClientAddress2Id" type="text" name="clientAddress2" value="<s:property value="clientAddress2"/>" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" /></font></td> <td class="SaveModeClientAddress2Id" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="clientAddress2"/>','ClientAddress2');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">City Name</p> </td>
        <td class="EditModeCityNameId"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValCityNameId"><s:property value="cityName"/></font><font style="display: none;height: 0px;" id="ReturnCityNameId"><b id="ReturnValCityNameId"></b></font> &nbsp;</p></td> <td class="EditModeCityNameId"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="cityName"/>','CityName');" /></p></td>
        <td class="SaveModeCityNameId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><input id="attrNameCityNameId" type="text" name="cityName" value="<s:property value="cityName"/>" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" /></font></td> <td class="SaveModeCityNameId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="cityName"/>','CityName');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">State Name</p> </td>
        <td class="EditModeStateNameId"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValStateNameId"><s:property value="stateName"/></font><font style="display: none;height: 0px;" id="ReturnStateNameId"><b id="ReturnValStateNameId"></b></font> &nbsp;</p></td> <td class="EditModeStateNameId"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="stateName"/>','StateName');" /></p></td>
        <td class="SaveModeStateNameId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><select id="attrNameStateNameId" name="stateName" style="height:24px;width:180px;background-color: white;border-color: #f4f4f4;border-radius: 2px;box-shadow: 2px 2px 1px gray;border: solid 1px #595959;" onclick="selectVal('<s:property value="stateName"/>','StateName')">
        <option value="<s:property value="stateName"/>"><s:property value="stateName"/></option>
        <option value="Alabama">Alabama</option>
        <option value="Alaska">Alaska</option>
        <option value="Arizona">Arizona</option>
        <option value="Arkansas">Arkansas</option>
        <option value="California">California</option>
        <option value="Colorado">Colorado</option>
        <option value="Connecticut">Connecticut</option>
        <option value="Delaware">Delaware</option>
        <option value="District of Columbia">District of Columbia</option>
        <option value="Florida">Florida</option>
        <option value="Georgia">Georgia</option>
        <option value="Hawaii">Hawaii</option>
        <option value="Idaho">Idaho</option>
        <option value="Illinois">Illinois</option>
        <option value="Indiana">Indiana</option>
        <option value="Iowa">Iowa</option>
        <option value="Kansas">Kansas</option>
        <option value="Kentucky">Kentucky</option>
        <option value="Louisiana">Louisiana</option>
        <option value="Maine">Maine</option>
        <option value="Maryland">Maryland</option>
        <option value="Massachusetts">Massachusetts</option>
        <option value="Michigan">Michigan</option>
        <option value="Minnesota">Minnesota</option>
        <option value="Mississippi">Mississippi</option>
        <option value="Missouri">Missouri</option>
        <option value="Montana">Montana</option>
        <option value="Nebraska">Nebraska</option>
        <option value="Nevada">Nevada</option>
        <option value="New Hampshire">New Hampshire</option>
        <option value="New Jersey">New Jersey</option>
        <option value="New Mexico">New Mexico</option>
        <option value="New York">New York</option>
        <option value="North Carolina">North Carolina</option>
        <option value="North Dakota">North Dakota</option>
        <option value="Ohio">Ohio</option>
        <option value="Oklahoma">Oklahoma</option>
        <option value="Oregon">Oregon</option>
        <option value="Pennsylvania">Pennsylvania</option>
        <option value="Rhode Island">Rhode Island</option>
        <option value="South Carolina">South Carolina</option>
        <option value="South Dakota">South Dakota</option>
        <option value="Tennessee">Tennessee</option>
        <option value="Texas">Texas</option>
        <option value="Utah">Utah</option>
        <option value="Vermont">Vermont</option>
        <option value="Virginia">Virginia</option>
        <option value="Washington">Washington</option>
        <option value="West Virginia">West Virginia</option>
        <option value="Wisconsin">Wisconsin</option>
        <option value="Wyoming">Wyoming</option>
        </select></font></td>
        <td class="SaveModeStateNameId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="stateName"/>','StateName');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Country Name</p> </td>
        <td class="EditModeCountryNameId"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValCountryNameId"><s:property value="countryName"/></font><font style="display: none;height: 0px;" id="ReturnCountryNameId"><b id="ReturnValCountryNameId"></b></font> &nbsp;</p></td> <td class="EditModeCountryNameId"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="countryName"/>','CountryName');" /></p></td>
        <td class="SaveModeCountryNameId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><select id="attrNameCountryNameId" name="countryName" style="height:24px;width:180px;background-color: white;border-color: #f4f4f4;border-radius: 2px;box-shadow: 2px 2px 1px gray;border: solid 1px #595959;" onclick="selectVal('<s:property value="countryName"/>')">
        <option value="<s:property value="countryName"/>"><s:property value="countryName"/></option>
        <%--<option value="USA">USA</option>--%>
        </select></font></td>
        <td class="SaveModeCountryNameId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="countryName"/>','CountryName');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Zip Code</p> </td>
        <td class="EditModeZipCodeId"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValZipCodeId"><s:property value="zipCode"/></font><font style="display: none;height: 0px;" id="ReturnZipCodeId"><b id="ReturnValZipCodeId"></b></font> &nbsp;</p></td> <td class="EditModeZipCodeId"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="zipCode"/>','ZipCode');" /></p></td>
        <td class="SaveModeZipCodeId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><input id="attrNameZipCodeId" type="text" name="zipCode" maxlength="5" value="<s:property value="zipCode"/>" onkeypress="return numeralsOnly(event);" /></font></td> <td class="SaveModeZipCodeId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="zipCode"/>','ZipCode');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Person</p> </td>
        <td class="EditModeContactPersonId"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValContactPersonId"><s:property value="contactPerson"/></font><font style="display: none;height: 0px;" id="ReturnContactPersonId"><b id="ReturnValContactPersonId"></b></font> &nbsp;</p></td> <td class="EditModeContactPersonId"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="contactPerson"/>','ContactPerson');" /></p></td>
        <td class="SaveModeContactPersonId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><input id="attrNameContactPersonId" type="text" name="contactPerson" value="<s:property value="contactPerson"/>" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" /></font></td> <td class="SaveModeContactPersonId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="contactPerson"/>','ContactPerson');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Phone No</p> </td> <td class="EditModeContactPhoneNoId"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValContactPhoneNoId"><s:property value="contactPhoneNo"/></font><font style="display: none;height: 0px;" id="ReturnContactPhoneNoId"><b id="ReturnValContactPhoneNoId"></b></font> &nbsp;</p></td>
        <td class="EditModeContactPhoneNoId"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="contactPhoneNo"/>','ContactPhoneNo');" /></p></td>
        <td class="SaveModeContactPhoneNoId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><input id="attrNameContactPhoneNoId" type="text" name="contactPhoneNo" maxlength="12" value="<s:property value="contactPhoneNo"/>" onchange="return phoneFormat (event,attrNameContactPhoneNoId);"  onkeypress="return numberonly(event,false);" onkeyup="return phoneFormat (event,attrNameContactPhoneNoId);" /></font></td> <td class="SaveModeContactPhoneNoId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="contactPhoneNo"/>','ContactPhoneNo');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Email</p> </td> <td class="EditModeContactEmailId"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;"><font id="EditValContactEmailId"><s:property value="contactEmail"/></font><font style="display: none;height: 0px;" id="ReturnContactEmailId"><b id="ReturnValContactEmailId"></b></font> &nbsp;</p></td>
        <td class="EditModeContactEmailId"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input id="RbHideNameID" style="margin-top: -6px;position:absolute;" type="submit" value="Edit" onclick="return attributesEditIds('<s:property value="contactEmail"/>','ContactEmail');" /></p></td>
        <td class="SaveModeContactEmailId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:5px;width:270px;">
        <font><input id="attrNameContactEmailId" type="text" name="contactEmail" value="<s:property value="contactEmail"/>" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" /></font></td> <td class="SaveModeContactEmailId" style="display: none;"><p style="margin-left:20px;font-weight:bold;margin-top:0px;width:70px;"><input style="margin-top: -6px;position:absolute;background:#00a9f1;border: solid 1px #00a9f3;" type="submit" value="Save" onclick="return attributesSaveIds('<s:property value="contactEmail"/>','ContactEmail');" /></p></td></tr>
        <tr style=" height: 10px;"><td></td></tr>

        </table><br/>


    <form action="clientModificationSaving" name="clientFormName" id="clientFormId">
    <div style="margin-left: 8px;margin-top: 25px;">
    <table style="margin-left: 10px;margin-top: -26px;">
    <tr><td><button type="submit" name="method:clientBackMove" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
    </table>
    
    </div>
    </form>

    </div>
    </div>
    <div style="margin-top: -9px;margin-left: 22px;">
    <img src="/QuickKlix/images/CornerFoldImg.png" width="909px" /></div><br/><br/><br/><br/><br/><br/>

    </div>
    </div>

</body>
</html>
