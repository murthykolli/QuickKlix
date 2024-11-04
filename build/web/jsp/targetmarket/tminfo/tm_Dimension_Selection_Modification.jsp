<%-- 
    Document   : tm_Dimension_Selection_Modification
    Created on : 28 Aug, 2014, 4:21:01 PM
    Author     : murthyk
--%>

<%-- 
    Document   : tm_Dimension_Selection
    Created on : 4 Aug, 2014, 12:25:41 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <script language="javascript" src="/QuickKlix/scripts/tmselection.js"></script>
        <script language="javascript" src="/QuickKlix/scripts/pumacodefortable.js"></script>
        <script language="javascript" src="/QuickKlix/scripts/json-minified.js" type="text/javascript"></script>
        
        <script type="text/javascript">
        if (navigator.userAgent.toLowerCase().match('chrome'))
        document.write('<style type="text/css" >#target{margin-top:-485px}#dscCrome{margin-top:40px;margin-left:6px;}</style>');
        </script>
        
    <script type="text/javascript">
        reportCombVal="";
        $(document).ready(function(){
        $(".slidingDiv").hide();
        $(".show_hide").show();
	$('.show_hide').click(function(){
        var stateAndCount = "<s:property value="selStatesAndCount"/>";        
        stateAndCount = stateAndCount.split(";");
        var statesAndCountsList = "";
        for(var i=0;i<stateAndCount.length;i++){
        var stAndCount = stateAndCount[i].indexOf(": ", 0);
        var stateAndCountData = stateAndCount[i].substr(0, stAndCount+2)+'<font color="#00a9f1">'+stateAndCount[i].substr(stAndCount+2,stateAndCount[i].length)+'</font>'+'<font color="blue">;</font>';
        statesAndCountsList = statesAndCountsList + stateAndCountData;
        }
        $("#stateCountId").html(statesAndCountsList);
	$(".slidingDiv").slideToggle();
	});

        $(".slidingDiv1").hide();
        $(".show_hide1").show();

	$('.show_hide1').click(function(){
	$(".slidingDiv1").slideToggle();
	});

        });
        
        function addSeparatorsNF(nStr, inD, outD, sep) {
	nStr += '';
	var dpos = nStr.indexOf(inD);
	var nStrEnd = '';
	if (dpos != -1) {
	nStrEnd = outD + nStr.substring(dpos + 1, nStr.length);
	nStr = nStr.substring(0, dpos);
	}
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(nStr)) {
	nStr = nStr.replace(rgx, '$1' + sep + '$2');
	}
	return nStr + nStrEnd;
        }
 
    </script>
        
    <script type="text/javascript">
        function onLoadCallForEdit(){           
        var data1="<s:property value="dimensionName"/>";
        var data2="<s:property value="selectedTMCategories"/>";        
        if(data1 == "" && data2 == ""){
        var myCookie = new Cookie();
        var value = myCookie.read('selectedBackData');
        var backMove = "<s:property value="tmBackMoveToDim"/>";
        if(backMove == "BackMove"){
        myCookie.write("selectedpuma",value);    
        }    
        newAjaxCall();
        }
        else{
        dispalyVal(data1,data2);
        }
        }
    
        function dispalyVal(dimenName,catAndPumaCodes){
        if(catAndPumaCodes != "" && catAndPumaCodes != null){ 
        catAndPumaCodes = catAndPumaCodes.replace(/&amp;/g, "&");  
        setValuesToCookie(dimenName,catAndPumaCodes);
        newAjaxCall();
        }
        }
    
        function setValuesToCookie(value,value1) { 
        var arrayObject = new Array();
        var myCookie = new Cookie();
        arrayObject=myCookie.read('selectedpuma');
        var Str;
        var objJSON;
        if(value1 != "false"){
        objJSON=pumaCodeSplit(value,value1);
        } else{
        objJSON=value;
        }
        Str=JSON.stringify(objJSON) ;
        var Arrays = new Array();
        Str=replaceAll(Str,'"',"'");
        if(arrayObject != ""){
        arrayObject=arrayObject.substring(0,arrayObject.length-1);
        }
        if(arrayObject != ""){
        Str=Str.substring(1);
        }
        if(arrayObject== ""){
        Arrays.push(Str);
        }else{
        Arrays.push(arrayObject,Str);
        }
        myCookie.write('selectedpuma',Arrays);
        }
    
        function newAjaxCall(){
        var myCookie = new Cookie();
        
        var modCookieValue = "<s:property value="dimentionCookieValue"/>";
        var cookieData = "<s:property value="cookieData"/>";
        modCookieValue = replaceAll(modCookieValue,'&quot;','"'); 
        var cookieValue1 = myCookie.read('selectedpuma');
        if(deletedValue == 'Delete'){
        if(cookieValue1 != ""){
        $.post('/QuickKlix/tmDimenJson.action', { data: cookieValue1}, responseData, "text");
        }
        }
        if(modCookieValue != ""){
        myCookie.write("selectedpuma","");    
        }
        var cookieValue = myCookie.read('selectedpuma');
        if(cookieValue != ""){
        $.post('/QuickKlix/tmDimenJson.action', { data: cookieValue}, responseData, "text");
        }
        
        if(cookieValue == "" && deletedValue != 'Delete'){
        $.post('/QuickKlix/tmDimenJsonModification.action', { data: cookieData, type: modCookieValue}, responseData, "text");
        }if(cookieValue == "" && cookieData==""){
        $("#loadingImg").hide();
        $("#hideDiv").show();
        }
        }
    
        function responseData(data){
        var myJsonObj = jsonParse(data);
        var cookieData = myJsonObj.cookieData;
        var myCookie = new Cookie();
        myCookie.write('selectedpuma',cookieData);
        var value = jsonParse(myJsonObj.jsonResponse);
        duplicationRemove();
        for (var k in value) {
        var dimName = k;
        var catNameAndValue = "";
        var combTotal = 0;
        for(var l in value[k]){
        var myObj = eval("(" + dimName + ")");        
        var ret=isEven(l);        
        if(l==0){}else
        if(l==1){
        var catTotal = value[k][l];        
        
        }else if(ret){
        catNameAndValue+="; "+myObj[value[k][l]]+": ";
        } else{
        var sumInt = value[k][l];
        catNameAndValue+= sumInt.toString();
        var sumRep = replaceAll(sumInt,',',"");
        sumRep = parseInt(sumRep);        
        combTotal+=sumRep;    
        }
        }
        catNameAndValue=catNameAndValue.substring(1);        
        combTotal = addSeparatorsNF(combTotal, '.','.', ',');
        createDynamicTable($("#tbl"),dimName,catNameAndValue,catTotal,combTotal);
        } 
        $("#loadingImg").hide();
        $("#hideDiv").show();
        }

    </script>

    <script type="text/javascript">

//this is for Dynamic Table creation

        function createDynamicTable(tbody,dimName,catNameAndValue,catTotal,combTotal) {         
        if (tbody == null || tbody.length < 1) return;
        document.getElementById("hidesample").style.display = 'none';
        var element = document.createElement("img");
        element.setAttribute("src","/QuickKlix/images/delete.gif","");
        element.setAttribute("onclick", "return rowDelete()");
        element.setAttribute("class", "hintanchor");
        element.setAttribute("onMouseover", "showhint('Delete', this, event, '37px')");
        element.setAttribute("style", "cursor: pointer");
        var scData1 = "";
        var comCatVal = "";
        var scData=catNameAndValue.split("; ");
        for(var i=0;i<scData.length;i++){
        var ind=scData[i].indexOf(": ", 0);
        var chanData = scData[i].substr(0, ind+2)+'<font color="#00a9f1">'+scData[i].substr(ind+2,scData[i].length)+'</font>'+'<font color="blue">;</font>';
        var catValData = scData[i].substr(0, ind+2)+''+scData[i].substr(ind+2,scData[i].length)+';';
        scData1+=" "+chanData;      
        comCatVal+=" "+catValData;
        }
        reportCombVal = reportCombVal+"("+dimName +" -"+ comCatVal+"); ";
        document.tmFormName.reportsTMData.value = reportCombVal;
        
        var trow = $("<tr>");
        $("<td>")
        .addClass("tableCell")
        .text(dimName)
        .appendTo(trow);

        $("<td>")
        .addClass("tableCell1")
        .html(scData1)
        .appendTo(trow);

        $("<td>")
        .addClass("tableCell2")
        .text(catTotal)
        .appendTo(trow);

        $("<td>")
        .addClass("tableCell3")
        .text(combTotal)
        .appendTo(trow);

        $("<td>").addClass("tableCell4").append(element).appendTo(trow);
        trow.appendTo(tbody);
        }

        var deletedValue;
        function rowDelete(){
        var where_to = confirm("Are you sure want to delete this category");
        if (where_to) {
        }
        else {
        return false;
        }
        $("#loadingImg").show();
        $("#hideDiv").hide();
        
        var tablelength = ($("#tbl").find("tr:gt(1)").length);
        if (tablelength == 1) {
        document.getElementById("hidesample").style.display = '';
        }

        $('td.tableCell4').click(function(){
        var row = $(this).parent().parent().children().index($(this).parent());
        var removingRow=$("#tbl").children().children()[row].children[0].innerHTML;
        
        var obj = {};
        var keyName = removingRow;
        obj[ keyName ] = [];
        reportCombVal="";        
        setValuesToCookie(obj,"false");
        deletedValue = "Delete";
        document.tmFormName.reportsTMData.value = reportCombVal;
        newAjaxCall();
        });        
        }

        function rowUpdate(value){
        $("#tbl .tableCell3").each(function(){
        $(this).text(value);
        });
        }

        function duplicationRemove(){
        $("#tbl").find("tr:gt(1)").remove();
        }    

        dimenCode = 0; 
        function tmNewAjaxCallForDynamicQuarry(dimCode){  
        $("#loadingImg").show();
        $("#hideDiv").hide();
        
        dimenCode = dimCode;
        var myCookie = new Cookie();
        var value = myCookie.read('selectedpuma');
        myCookie.write("selectedData",value);  
        myCookie.write("selectedBackData",value);
        
        $.post('/QuickKlix/tmDimenJson.action', { data: value, type: dimenCode}, responseDataForGroupBy, "text");
        
//        if(value == ""){
//        $.post('/QuickKlix/tmDimenJson.action', { data: value, type: dimenCode}, responseDataForGroupBy, "text");
//        }
//   
//        else{
//        $.post('/QuickKlix/tmDimenJson.action', { data: value, type: dimenCode}, responseDataForGroupBy, "text");
//        } 
        
        }

        function responseDataForGroupBy(data){
        var myJsonObj = jsonParse(data);
        var cookieData = myJsonObj.cookieData;
        var myCookie = new Cookie();
        myCookie.write('selectedpuma',cookieData);
        if(dimenCode == 1){
            window.location = 'tmAbilityToSpeakEnglishCreation.action';     
        }
        else if(dimenCode == 2){
            window.location = 'tmAgeCreation.action';  
        }
        else if(dimenCode == 3){
            window.location = 'tmAncestryCreation.action';  
        }
        else if(dimenCode == 4){
            window.location = 'tmCitizenshipCreation.action';  
        }
        else if(dimenCode == 5){
            window.location = 'tmClassOfWorkerCreation.action';  
        }
        else if(dimenCode == 6){
            window.location = 'tmEducationCreation.action';  
        }
        else if(dimenCode == 7){
            window.location = 'tmGenderCreation.action';  
        }
        else if(dimenCode == 8){
            window.location = 'tmIncomeCreation.action';  
        }
        else if(dimenCode == 9){
            window.location = 'tmIndustryCreation.action';  
        }
        else if(dimenCode == 10){
            window.location = 'tmLanguageSpokenAtHomeCreation.action';  
        }
        else if(dimenCode == 11){
            window.location = 'tmMaritalStatusCreation.action';  
        }
        else if(dimenCode == 12){
            window.location = 'tmMeansOfTransportationCreation.action';  
        }
        else if(dimenCode == 13){
            window.location = 'tmMigrationStatusCreation.action';  
        }
        else if(dimenCode == 14){
            window.location = 'tmOccupationCreation.action';  
        }
        else if(dimenCode == 15){
            window.location = 'tmRaceCreation.action';  
        }
        return true;
        }


        function saveTMSelected(){
        var finalValue = finalTargetedValue();
        var tablelength = ($("#tbl").find("tr:gt(1)").length);
        var removingRow = "";
        removingRow = $("#tbl").children().children()[1].children[0].innerHTML;
        if(tablelength>0){
        alert("The total number of people in your Target Market is "+finalValue+".");
        }else if(removingRow == ""){
        var statepop = '<s:property value="allStatesCount"/>'
        finalValue = statepop;
        var where_to = confirm("You have made no selection from the Target Market categories. Your total Target Market population is "+statepop+".");
        if (where_to) {
        }
        else {
        return false;
        } }
        var myCookie = new Cookie();
        var value = "";
        value = myCookie.read('selectedpuma');
        document.getElementById("TargetedPeoplesId").value = finalValue;
        
        }

        function finalTargetedValue(){
        var length = $("#tbl").closest('table').find('tr').length;
        length = length-1;
        var removingRow = $("#tbl").children().children()[length].children[3].innerHTML;
        return removingRow;
        }
    </script>


    <script type="text/javascript">
        function replaceAll(txt, replace, with_this) {
        return txt.replace(new RegExp(replace, 'g'),with_this);
        }
    </script>
        
    </head>
    
    <body onload="onLoadCallForEdit()">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div id="loadingImg" style="background-color: white;margin-top:30px;margin-left:10px;height:450px;border-radius: 30px 30px 0 0;"><img style="margin-left:415px;margin-top:120px;" src="/QuickKlix/images/targetMarket/loodingImg.gif"/></div>   
        <div id="hideDiv" style="display: none;background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 820px;height: auto;border-radius: 30px 30px 0 0;"><br/>
    <div style="margin-top:30px;margin-left: 45px;position: absolute;font-family: Cambria;"><font style="font: bold 1.45em/1em Cambria;color:#595959;">Target Market</font></div><br/>
  
       
    <div style=" margin-left: 15px; margin-top: 70px;">
    <table style=" margin-top:-5px; margin-left: 0px; height: auto;white-space: nowrap;"> 
        <s:hidden id="tmDimenJsonValId" name="tmDimenJsonVal" value="" />
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(1);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg1').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg1').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 11px;position: relative;"> Ability To Speak English &nbsp;</font><img id="MapNextButtonImg1" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 11px;position: relative;" /></button></td></tr>
        
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(2);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg2').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg2').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 90px;position: relative;"> Age &nbsp;</font><img id="MapNextButtonImg2" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 90px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(3);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg3').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg3').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 72px;position: relative;"> Ancestry &nbsp;</font><img id="MapNextButtonImg3" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 72px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(4);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg4').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg4').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 63px;position: relative;"> Citizenship &nbsp;</font><img id="MapNextButtonImg4" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 63px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(5);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg5').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg5').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 43px;position: relative;"> Class Of Worker &nbsp;</font><img id="MapNextButtonImg5" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 43px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(6);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg6').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg6').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 67px;position: relative;"> Education &nbsp;</font><img id="MapNextButtonImg6" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 67px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(7);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg7').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg7').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 77px;position: relative;"> Gender &nbsp;</font><img id="MapNextButtonImg7" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 77px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(8);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg8').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg8').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 75px;position: relative;"> Income &nbsp;</font><img id="MapNextButtonImg8" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 75px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(9);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg9').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg9').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 72px;position: relative;"> Industry &nbsp;</font><img id="MapNextButtonImg9" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 72px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(10);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg10').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg10').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 0px;position: relative;"> Language Spoken At Home &nbsp;</font><img id="MapNextButtonImg10" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 0px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(11);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg11').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg11').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 52px;position: relative;"> Marital Status &nbsp;</font><img id="MapNextButtonImg11" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 52px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(12);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg12').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg12').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 10px;position: relative;"> Means Of Transportation &nbsp;</font><img id="MapNextButtonImg12" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 10px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(13);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg13').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg13').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 41px;position: relative;"> Migration Status &nbsp;</font><img id="MapNextButtonImg13" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 41px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(14);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg14').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg14').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 62px;position: relative;"> Occupation &nbsp;</font><img id="MapNextButtonImg14" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 62px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
        <tr><td><button type="submit" onclick="return tmNewAjaxCallForDynamicQuarry(15);" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg15').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg15').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;width: 250px; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -3px;left: 86px;position: relative;"> Race &nbsp;</font><img id="MapNextButtonImg15" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 86px;position: relative;" /></button></td></tr>
        <tr style="height: 5px;"><td></td></tr>
    </table>

    <div id="target" style=" margin-top: -618px; margin-left: 180px; height: auto; min-height: 435px;width:auto; ">

        <font size="3" style="margin-left: 105px;position: absolute;margin-top: 0px;" color="#595959"><b>Selected Criteria</b></font>
        <div align="right" style="width: 650px;margin-left: 85px;margin-top: -140px;white-space: nowrap;"><font style="margin-left: 135px;white-space: nowrap;" size="2" color="#595959"><b><font color="#00a9f1"  class="show_hide" onMouseOver="this.style.color='blue';" onMouseOut="this.style.color='#00a9f1';" style="cursor: pointer;"><u>Selected State(s)</u></font> Total Population : </b></font><font size="2" color="#00a9f1"><b><s:property value="allStatesCount"/></b></font></div>

        <div class="slidingDiv" >&nbsp;
             <div style="border: solid 1px #595959;height: auto;min-height: 50px;width: 645px;margin-top: -18px;margin-left: 95px;border-radius: 12px 12px 0px 0px;-moz-border-radius: 12px 12px 0px 0px;-webkit-border-radius: 12px 12px 0px 0px;">
                 <font style="left: 13px;top: 10px;position: relative;width: 620px;text-align: justify;display:block;" id="stateCountId"></font><br/>
             </div>
        </div>

        <style type="text/css">

        td.tableCell
        {
            padding: 5px;
            border: solid 1px #00a9f1;            
            height: auto;
            margin-top: 10px;
            text-align: center;
        }
        td.tableCell1{
            border: solid 1px #00a9f1;   
            width: 600px;
            height: auto;
        }
        td.tableCell2{
            border: solid 1px #00a9f1;   
            height: auto;
            text-align: center;
        }
       td.tableCell3{
            border: solid 1px #00a9f1;   
            height: auto;
            text-align: center;
        }
        </style>

    <table id="tbl" style="margin-left:90px;margin-top: 10px;min-width:450px;width:auto;">
    <tbody>
        <tr><td style=" background-color:#595959; border: solid 1px #00a9f1;border-radius: 16px 0px 0px 0px;-khtml-border-radius: 16px 0px 0px 0px;-moz-border-radius: 16px 0px 0px 0px;-webkit-border-radius: 16px 0px 0px 0px; height: 30px;min-width: 100px;width: auto;">
            <font style="font-family: Arial;" color="white" size="3"><center><b>Category</b></center></font>
            </td>
            
            <td style="background-color:#595959;border: solid 1px #00a9f1;height: 30px;width: 300px;">
            <font color="white" size="3"><center><b>Selected Categories</b></center></font>
            </td>
            
            <td style="background-color:#595959;border: solid 1px #00a9f1;height: 30px;min-width: 100px;width: auto;">
            <font color="white" size="3"><center><b>Category Total*</b></center></font>
            </td>
            
            <td style="background-color:#595959;border: solid 1px #00a9f1;border-radius: 0px 16px 0px 0px;-khtml-border-radius: 0px 16px 0px 0px;-moz-border-radius: 0px 16px 0px 0px;-webkit-border-radius: 0px 16px 0px 0px;height: 30px;min-width: 100px;width: auto;">
            <font color="white" size="3"><center><b>Combination Value</b></center></font>
            </td><td></td>
        </tr>
        
        <tr id="hidesample">
            <td style="border: solid 1px #00a9f1; height: 30px;"></td>
            <td style="border: solid 1px #00a9f1; height: 30px; width: 300px;"><font style="left: 10px;top: 3px;position: relative;text-align: left;display:block;width:230px;"></font><br/></td>
            <td style="border: solid 1px #00a9f1; height: 30px;"></td>
            <td style="border: solid 1px #00a9f1; height: 30px;"></td>
            <td></td>
        </tr>

    </tbody>
    </table>
    
    <s:form action="tmDetailsUpdating" name="tmFormName">            
        <input id="TargetedPeoplesId" type="hidden" name="totalTMPeoplrsCount" value=""/>        
        <div style=" margin-top: 20px">
            <table style="white-space: nowrap;">
            <tr>
                <td><button type="submit" name="method:moveToBack" onMouseOver="this.style.color='#00a9f1';document.getElementById('SmallImgButton1').src='/QuickKlix/images/SSImgs/BackSmallMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('SmallImgButton1').src='/QuickKlix/images/SSImgs/BackSmallImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;margin-left:90px;"><img id="SmallImgButton1" src="/QuickKlix/images/SSImgs/BackSmallImg.png" style="top: -1px;left: 0px;position: relative;" /><font style="top: -3px;left: 0px;position: relative;"> &nbsp;BACK </font></button></td>
                <td id="next"><button type="submit" name="method:targetMarketModification" onclick="return saveTMSelected()" onMouseOver="this.style.color='#00a9f1';document.getElementById('SmallImgButton3').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('SmallImgButton3').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white;height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;margin-left: 470px"><font style="top: -3px;left: 0px;position: relative;"> NEXT &nbsp;</font><img id="SmallImgButton3" src="/QuickKlix/images/SSImgs/MapNextImg.png" style="top: -1px;left: 0px;position: relative;" /></button></td>

            </tr>
            </table>
                <p style="font-size: 13px;margin-left: 95px;text-align: justify;margin-top:15px;">*Category Total denotes the population value for that selected category per selected state(s).</p>
        </div>
        <input type="hidden" name="reportsTMData" value=""/>         
    </s:form>
    </div>

    <div id="disclaimer" style="margin-top: 190px; margin-left: 22px;width: 500px;"><font size="3" color="gray"><b>Data Disclaimer:</b>&nbsp;&nbsp;</font><font style="cursor: pointer;" onMouseOver="this.style.color='blue'; this.style.cursor='hand';" onMouseOut="this.style.color='#00a9f1';" color="#00a9f1" class="show_hide1" size="2"><b>Show / Hide</b></font></div>
        <div class="slidingDiv1" >
        <p style=" font-size: 13px;margin-left: 22px;margin-top: 10px;text-align: justify;width:905px;"><b>Data Disclaimer:</b> Data used in the Target Market module is gathered from 2006 PUMA files provided by the U.S. Census Bureau. PUMA data is defined using boundaries of 5 percent for
        a minimum population threshold of 100,000.  For the Target Market module we have redefined PUMA files to represent the entire population with a margin of error no more than approximately
        +/- 10%.  Please be advised that the data provided is for general informational purposes only. QuickKlix is not responsible for any derived conclusions or analysis generated from this data.
        For more information on PUMA data please visit the following website: <a href="http://www.census.gov/acs/www/data_documentation/pums_documentation/" target="_blank"><font style="color:#00a9f1;white-space: nowrap;" onMouseOver="this.style.color='blue'; this.style.cursor='hand';" onMouseOut="this.style.color='#00a9f1';">http://www.census.gov/acs/www/data_documentation/pums_documentation/</font></a></p>
        </div><br/><br/><br/><br/><br/>

        </div> </div>
    

    </div>
  
    </body>
</html>
