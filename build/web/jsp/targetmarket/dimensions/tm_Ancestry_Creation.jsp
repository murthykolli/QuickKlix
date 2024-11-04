<%-- 
    Document   : tm_Ancestry_Creation
    Created on : 7 Aug, 2014, 12:16:37 PM
    Author     : murthyk
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
    </head>
    <script type="text/javascript">

    function checkAll(){
    if(document.ancestryFormName.selectAll.checked== true){
    for(var i=0; i < document.ancestryFormName.selectedAncestryCategories.length; i++){
    document.ancestryFormName.selectedAncestryCategories[i].checked=true;
    } }
    else{
    for(var i=0; i < document.ancestryFormName.selectedAncestryCategories.length; i++){
    document.ancestryFormName.selectedAncestryCategories[i].checked=false;
    } } }

    function checkStateAll(passStateName){
    var stateChecked = document.getElementById(passStateName).checked;
    var len=document.ancestryFormName.selectedAncestryCategories.length;

    if(stateChecked== true){
    if(len==undefined){
    document.ancestryFormName.selectedAncestryCategories.checked=true;
    }
    for(var i=0; i < document.ancestryFormName.selectedAncestryCategories.length; i++){
    if (document.ancestryFormName.selectedAncestryCategories[i].className.indexOf(passStateName) != -1){
    document.ancestryFormName.selectedAncestryCategories[i].checked = true;
    } }}
     
    else{
    if(len==undefined && document.ancestryFormName.selectedAncestryCategories.checked==true ){
    document.ancestryFormName.selectedAncestryCategories.checked=false;
    }
    
    for (var i = 0; i < document.ancestryFormName.selectedAncestryCategories.length; i++){
    if (document.ancestryFormName.selectedAncestryCategories[i].className.indexOf(passStateName) != -1){
    document.ancestryFormName.selectedAncestryCategories[i].checked = false;
    } } } }

    function citySelection() {
    var selectedAncestryCategoriess = "";
    for (var k = 0; k < document.ancestryFormName.selectedAncestryCategories.length; k++){
    if (document.ancestryFormName.selectedAncestryCategories[k].checked) {
    selectedAncestryCategoriess = document.ancestryFormName.selectedAncestryCategories[k].value;
    } }
    if (document.ancestryFormName.selectedAncestryCategories.checked) {
    selectedAncestryCategoriess = document.ancestryFormName.selectedAncestryCategories.value;
    }
    if (selectedAncestryCategoriess == "") {
    window.alert("Please select at least one category.");
    return false;
    } }

    $(document).ready(function(){
    if($(".mainBox").length>1){
    $("#selectAllDiv").show();
    }
    });
    
    $(document).ready(function(){
    var totalCount = "<s:property value="tmTotalPumaCount"/>";
    if(totalCount == 0){
    alert("No combination values");
    window.location = 'tmZeroTotalValRedirection.action';  
    }
    });

    </script>
    
    <body>
        <div id="container1" style="height: auto;margin-top:0px;">
        <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>

        <div style="margin-top:20px;margin-left: 30px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by <font color="#00a9f1">Ancestry</font> Dimension - <font color="#00a9f1">Categories</font></font></div><br/>
        <form name="ancestryFormName" action="ancestrySaving" method="post">
  
        <div id="selectAllDiv" style="margin-left: 50px;display: none;"><input type="checkbox" id="master" name="selectAll" onclick="checkAll();" value="" ><font style="font: 1em/0.25em sans-serif;">&nbsp;Select All</font></div>
  
        <div style="margin-top:-13px;">
        <%
        if(session.getAttribute("Ancestry_Map") != null){
        Map sortedMap = (Map)session.getAttribute("Ancestry_Map");
        if(null != sortedMap && sortedMap.size() > 0){
        Iterator iterator = sortedMap.keySet().iterator();
        String dimensionName = "";
        while(iterator. hasNext()){
        dimensionName = (String)iterator.next();
        %>


        <div class="mainBox" style="margin-left: 40px;margin-top:34px;background: white;min-height: 280px;width: 880px;border-radius: 12px 10px 0px 0px;height: auto;border: solid 2px #595959;">
        <div style="background: #666666;height: 25px;width:880px;margin-top: 0px;border-radius: 10px 8px 0px 0px;border-bottom: solid 2px #595959;">
        <p style="margin-left: 10px; margin-top: 3px; text-align: justify; color: white; font: bold 1.1em/1em Cambria;position: absolute;">
        <input type="checkbox" id="<%=dimensionName%>" name="<%=dimensionName%>" onclick="this.value=checkStateAll('<%=dimensionName%>');" value="">
        <b><font color="white" size="4"><%= dimensionName %></font></b><font color="yellow" size="3">&nbsp;-&nbsp;<s:property value="tmTotalPumaCount"/></font>&nbsp;</p>
        </div>
        <div style="width:860px; height: 280px;margin-left: 7px;margin-top: 13px; overflow:auto;">
        <table border="0" id="myScrollTable">

        <%
        int maxCols = 3;
        int temp = 0;
        ArrayList<String> dimensionNameAndCountList = new ArrayList<String>();
        dimensionNameAndCountList = (ArrayList<String>)sortedMap.get(dimensionName);
//        Collections.sort(dimensionNameAndCountList);
        if(null != dimensionNameAndCountList && dimensionNameAndCountList.size() > 0){
        float noOfIter=(float)dimensionNameAndCountList.size()/maxCols;
        int iterationSize=(int)Math.ceil(noOfIter);
        for(int i =0; i<iterationSize;i++){
        %>
        <tr>

        <%
        if(maxCols >= dimensionNameAndCountList.size()){
        maxCols = dimensionNameAndCountList.size();
        }

        for(int j = temp; j < maxCols; j++){
        String dimensionNameAndPumaCount = dimensionNameAndCountList.get(j); 
        String dimensionNameAndPumaCounts[] = dimensionNameAndPumaCount.split("&,&");
        String dimensionNameAndCount = dimensionNameAndPumaCounts[0];
        String pumaCount = dimensionNameAndPumaCounts[1];
        %>

        <td><input type="checkbox" name="selectedAncestryCategories" class="<%=dimensionName%>" value="<%= pumaCount%>"/></td>

        <td><%= dimensionNameAndCount  %></td>
        <td width="20">&nbsp;</td>
        <%
        temp++;
        }
        maxCols = maxCols + 3;
        %>

        </tr>
        <% } } %>
        </table>
        </div>
        <div style="height:4px;"></div>
        </div>

        <% }   }  } %>
        </div><br/>

        <div align="center" style="margin-top: 15px;margin-left: 0px;">
        <table style="margin-left: 38px;margin-top:0px;position: absolute">
        <tr><td><button type="submit" name="method:moveToBack" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
        </table>

        <table style="margin-left: 808px;margin-top: 0px;position: absolute">
        <tr><td><button type="submit" name="method:ancestryDimensionSaving" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" onclick="return citySelection();"><font style="top: -2px;position: relative;">NEXT</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
        </table>
        </div>

        </form>
        <br/><br/><br/><br/><br/><br/><br/>
    </div></div>
        
    </body>
</html>