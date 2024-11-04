<%-- 
    Document   : magazineRequestForm
    Created on : 16 Jun, 2014, 4:52:24 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" type="text/javascript" src="/QuickKlix/scripts/jquery-1.4.2.min.js"></script>
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />

        <title>JSP Page</title>
        <style>
            input[type="text"], textarea {
                background: none repeat scroll 0 0 white;
                border: 1px solid #7F7F7F;
                border-radius: 5px 5px 5px 5px;
                height: 20px;
            }
        </style>
        <style type="text/css">

            .redTestDisplay{
                color: red;
                font-style: italic;
                font-size: 14px;
            }


        </style>
        <script  type="text/javascript">
       $(document).ready(function(){
       $("[name=magzineName]").val("<s:property value="magzineName"/>");
       $("[name=magzineWebsite]").val("<s:property value="magzineWebsite"/>");
       $("[name=magzineCity]").val("<s:property value="magzineCity"/>");
       $("[name=magzineState]").val("<s:property value="magzineState"/>");
       $("[name=magzineContactName]").val("<s:property value="magzineContactName"/>");
       $("[name=magzineContactNo]").val("<s:property value="magzineContactNo"/>");
       $("[name=magzineContactEmail]").val("<s:property value="magzineContactEmail"/>");
       $("[name=magzineReach]").val("<s:property value="magzineReach"/>");
       $("[name=magzineDemographics]").val("<s:property value="magzineDemographics"/>");
       $("[name=magzineAdSlot]").val("<s:property value="magzineAdSlot"/>");
       $("[name=magzineAdType]").val("<s:property value="magzineAdType"/>");
       $("[name=magzineAdPrice]").val("<s:property value="magzineAdPrice"/>");
        });


            function validation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var magzineName = document.magazineFormName.magzineName.value;
                var result = true;
                if (reg.test(magzineName)) {
                    document.getElementById("magzineNamelableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineNamelableID").setAttribute("class", "redTestDisplay");
                    result = false;
                }

                return result;

            }

            function magzineNameValidation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var magzineName = document.magazineFormName.magzineName.value;
                if (reg.test(magzineName)) {
                    document.getElementById("magzineNamelableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineNamelableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineName == "") {
                    document.getElementById("magzineNamelableID").removeAttribute("class");
                }
            }
            function magzineWebsiteValidation() {
                var reg = /((?:[http|https]\:\/\/|www\.|ftp\:\/\/)(?:[-a-z0-9]+\.)*[-a-z0-9]+.*)/i;
                var magzineWebsite = document.magazineFormName.magzineWebsite.value;
                if (reg.test(magzineWebsite)) {
                    document.getElementById("magzineWebsitelableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineWebsitelableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineWebsite == "") {
                    document.getElementById("magzineWebsitelableID").removeAttribute("class");
                }
            }
            function magzineCityValidation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var magzineCity = document.magazineFormName.magzineCity.value;
                if (reg.test(magzineCity)) {
                    document.getElementById("magzineCitylableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineCitylableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineCity == "") {
                    document.getElementById("magzineCitylableID").removeAttribute("class");
                }
            }

            function magzineStateValidation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var magzineState = document.magazineFormName.magzineState.value;
                if (reg.test(magzineState)) {
                    document.getElementById("magzineStatelableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineStatelableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineState == "") {
                    document.getElementById("magzineStatelableID").removeAttribute("class");
                }
            }

            function magzineContactValidation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var contactName = document.magazineFormName.magzineContactName.value;
                if (reg.test(contactName)) {
                    document.getElementById("magzineContactlableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineContactlableID").setAttribute("class", "redTestDisplay");
                }
                if (contactName == "") {
                    document.getElementById("magzineContactlableID").removeAttribute("class");
                }
            }

            function magzineContactNoValidation() {
                var reg = /^\(?(\d{3})\)?[-]?(\d{3})[-]?(\d{4})$/;
                var magzineContactNo = document.magazineFormName.magzineContactNo.value;
                if (reg.test(magzineContactNo)) {
                    document.getElementById("magzineContactNolableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineContactNolableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineContactNo == "") {
                    document.getElementById("magzineContactNolableID").removeAttribute("class");
                }
            }

            function magzineContactEmailValidation() {
                var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.[A-Za-z]{2,}$/;
                var magzineContactEmail = document.magazineFormName.magzineContactEmail.value;
                if (reg.test(magzineContactEmail)) {
                    document.getElementById("magzineContactEmaillableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineContactEmaillableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineContactEmail == "") {
                    document.getElementById("magzineContactEmaillableID").removeAttribute("class");
                }
            }

            function magzineDemographicsValidation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var magzinedemog = document.magazineFormName.magzineDemographics.value;
                if (reg.test(magzinedemog)) {
                    document.getElementById("magzineDemographicslableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineDemographicslableID").setAttribute("class", "redTestDisplay");
                }
                if (magzinedemog == "") {
                    document.getElementById("magzineDemographicslableID").removeAttribute("class");
                }
            }


            function magzineReachValidation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var magzineReach = document.magazineFormName.magzineReach.value;
                if (reg.test(magzineReach)) {
                    document.getElementById("magzineReachlableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineReachlableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineReach == "") {
                    document.getElementById("magzineReachlableID").removeAttribute("class");
                }
            }

            function magzineAdSlotValidation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var magzineAdSlot = document.magazineFormName.magzineAdSlot.value;
                if (reg.test(magzineAdSlot)) {
                    document.getElementById("magzineAdSlotlableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineAdSlotlableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineAdSlot == "") {
                    document.getElementById("magzineAdSlotlableID").removeAttribute("class");
                }
            }

            function magzineAdTypeValidation() {
                var reg = /^[A-Za-z][A-Za-z 0-9 -#/_().&amp;]*$/;
                var magzineAdType = document.magazineFormName.magzineAdType.value;
                if (reg.test(magzineAdType)) {
                    document.getElementById("magzineAdTypelableID").removeAttribute("class");
                }
                else {
                    document.getElementById("magzineAdTypelableID").setAttribute("class", "redTestDisplay");
                }
                if (magzineAdType == "") {
                    document.getElementById("magzineAdTypelableID").removeAttribute("class");
                }
            }



            function CheckFirstChar(key, txt)
            {
                if (key == 32 && txt.value.length <= 0)
                {
                    return false;
                }
                else if (txt.value.length > 0)
                {
                    if (txt.value.charCodeAt(0) == 32)
                    {
                        txt.value = txt.value.substring(1, txt.value.length);
                        return true;
                    }
                }
                return true;
            }

            function phoneFormat(e, input) {
                evt = e || window.event; /* firefox uses reserved object e for event */
                var pressedkey = evt.which || evt.keyCode;
                var BlockedKeyCodes = new Array(0, 8, 27, 13, 9); //8 is backspace key
                var len = BlockedKeyCodes.length;
                var block = false;
                var str = '';
                for (i = 0; i < len; i++) {
                    str = BlockedKeyCodes[i].toString();
                    if (str.indexOf(pressedkey) >= 0)
                        block = true;
                }
                if (block)
                    return true;
                s = input.value;
                if (s.charAt(0) == '+')
                    return false;
                filteredValues = '"`!@#$%^&*()_+|~-=\QWERT YUIOP{}ASDFGHJKL:ZXCVBNM<>?qwertyuiop[]asdfghjkl;zxcvbnm,./\\\'';
                var i;
                var returnString = '';
                for (i = 0; i < s.length; i++) {
                    var c = s.charAt(i);
                    if ((filteredValues.indexOf(c) == -1) & (returnString.length < 12)) {
                        if (returnString.length == 3)
                            returnString += '-';
                        if (returnString.length == 7)
                            returnString += '-';
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

                if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13) || (key == 27)) {
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
                if (window.event) {
                    key = window.event.keyCode;
                }
                else if (evt) {
                    key = evt.which;
                }
                else {
                    return true;
                }
                keychar = String.fromCharCode(key);
                evt = (evt) ? evt : event;
                var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
                        ((evt.which) ? evt.which : 0));
                if (keychar == "." || keychar == ",") {
                    return true;
                }

                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }

        </script>

    </head>
    <body class="body_page">
        <div id="container1" style="height: auto;margin-top:0px;">
            <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>

                <div style="background: white;border-left: solid 8px #d0d0d0;border-right: solid 2px #d0d0d0;width: 888px;margin-left: 25px;margin-top: 50px;height: auto;">
                    <div style="background: #858585;height: 35px;margin-left: -1px;width:889px"></div>

                    <div style=" min-height: 200px;">
                        <div style="margin-top:-34px;margin-left: 14px;position: absolute;width:874px;"><font style="font: bold 1.35em/1em Cambria;color: white;">Magazine Info Request Form </font></div>
                                <s:form action="magazineRequestFormSavingAndUpdating" name="magazineFormName">
                            <table style="margin-left: 12px;margin-top:0px;width:865px;text-align: left;">
                                <br/>
                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineNamelableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Magazine Name*:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineName" maxlength="50" onblur="magzineNameValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineNameValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;" /></td></tr>
                                <tr style="height:10px;"></tr>
                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineWebsitelableID"  style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Magazine Website:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineWebsite" maxlength="100" onblur="magzineWebsiteValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineWebsiteValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineCitylableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">City:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineCity" maxlength="20" onblur="magzineCityValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineCityValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineStatelableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">State:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<s:select name="magzineState"  cssStyle="margin-top:-32px;margin-left:16px;position:absolute;height:25px;width:300px;background-color: white;border-color: #f4f4f4;border-radius: 2px;border: solid 1px #595959;" list="stateNamesList" headerKey=""   headerValue="---------------Select State---------------"  onblur="magzineStateValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineStateValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineContactlableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Ad Sales Contact Name:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineContactName" maxlength="60" onblur="magzineContactValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineContactValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineContactNolableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Number:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineContactNo" id="ph" maxlength="12" onblur="magzineContactNoValidation();" onkeyup = "magzineContactNoValidation();return phoneFormat(event, ph);"  onkeypress="return numberonly(event, false);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineContactEmaillableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Contact Email:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineContactEmail" maxlength="100" onblur="magzineContactEmailValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineContactEmailValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineReachlableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Reach of Magazines:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineReach" onblur="magzineReachValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineReachValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineDemographicslableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Demographics:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineDemographics" maxlength="80" onblur="magzineDemographicsValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineDemographicsValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineAdSlotlableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Available Advertising Slots:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineAdSlot" onblur="magzineAdSlotValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineAdSlotValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineAdTypelableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Type of Ads:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineAdType" maxlength="40" onblur="magzineAdTypeValidation();"onkeyup = "CheckFirstChar(event.keyCode, this);magzineAdTypeValidation();" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"/></td></tr>
                                <tr style="height:10px;"></tr>

                                <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p id="magzineAdPricelableID" style="width: 450px;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">Ad Prices:</p> </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="magzineAdPrice" maxlength="13" onkeyup = "CheckFirstChar(event.keyCode, this);" onkeydown = "return CheckFirstChar(event.keyCode, this);" style="width:300px;"onkeypress="return numeralsOnly(event)"/></td></tr>
                                <tr style="height:10px;"></tr>

                            </table>
                            <table style="margin-left: 12px;margin-top:0px;width:865px;text-align: left;">
                            <tr class="label" style="line-height: 16px;background: #f2f2f2;"><td><p style="width: 835px;text-align: justify;line-height: 1.3em;font-family: Calibri, sans-serif;margin-left:15px;margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We understand that ad rates change based on various factors however, any rate information
                            you can provide us would be helpful. We will list your rates only as estimates, not guaranteed rates. In addition, we will guide our users to contact you directly to get more accurate pricings.</p> </td></tr>
                           </table>

                            <div id="target" style="width: 940px;margin-top: 10px;margin-left: 50px;text-align: justify;font-family:ariar narrow ;color: #545454;font-size: 14px;">
                            <b>We will be happy to receive any other information you would like to share about your magazine with us!</b></div>

                            <div style="margin-left: 370px;margin-top: 18px;"><br/>
                           <table style="margin-left: 10px;margin-top:-26px;">
                           <tr><td></td><td><button type="submit" onclick="return validation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png"/><font style="top: -3px;position: relative;">&nbsp;SAVE</font></button></td></tr>
                          </table></div>
                     </s:form>
                    </div>
                </div>
                <div style="margin-top: -9px;margin-left: 22px;">
                <img src="/QuickKlix/images/CornerFoldImg.png" width="909px" /></div><br/><br/><br/><br/><br/><br/>
            </div>
        </div>
    </body>
</html>