<%-- 
    Document   : newspapers_City_Selection
    Created on : 4 Jul, 2014, 2:52:49 PM
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
        <title>JSP Page</title>
   
  <script type="text/javascript">
  function checkStateAll(passStateName){
        var stateChecked = document.getElementById(passStateName).checked;
        var len=document.mAppFormName.combinationalName.length;
        if(stateChecked== true){
        if(len==undefined){
        document.mAppFormName.combinationalName.checked=true;
        }   
        for(var i=0; i < document.mAppFormName.combinationalName.length; i++)
        {         
        if (document.mAppFormName.combinationalName[i].className.indexOf(passStateName) != -1)
        document.mAppFormName.combinationalName[i].checked = true;
        }}
        else{
        if(len==undefined && document.mAppFormName.combinationalName.checked==true ){
        document.mAppFormName.combinationalName.checked=false;
        }
        for (var i = 0; i < document.mAppFormName.combinationalName.length; i++)
        {
        if (document.mAppFormName.combinationalName[i].className.indexOf(passStateName) != -1)
        document.mAppFormName.combinationalName[i].checked = false;
        }}}
    function mobileAppsSelection(){
       var appNames="";
       for(var k=0; k < document.mAppFormName.combinationalName.length; k++)
       {
       if(document.mAppFormName.combinationalName[k].checked){
       appNames=document.mAppFormName.combinationalName[k].value;
       }}
       if(document.mAppFormName.combinationalName.checked){
       appNames=document.mAppFormName.combinationalName.value;
       }
       if(appNames == ""){
       window.alert("Please select at least one app.");
       return false;
       }
    }
    
    function checkAll(){
    if(document.mAppFormName.selectAll.checked== true){
    for(var i=0; i < document.mAppFormName.combinationalName.length; i++)
    {
    document.mAppFormName.combinationalName[i].checked=true;
    }
    }
    else
    {
    for(var i=0; i < document.mAppFormName.combinationalName.length; i++)
    {
    document.mAppFormName.combinationalName[i].checked=false;
    } } }
    
    $(document).ready(function(){
    if($(".mainBox").length>1){
       $("#selectAllDiv").show();
    }
  });
</script>
 </head>
    <body>
       <div id="container1" style="height: auto;margin-top:0px;">
        <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>
     
       <div style="margin-top:20px;margin-left: 30px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Selected Apps Category by Operating Systems - </font><font color="#00a9f1" style="font-family: Calibri;font-size: 22px;font-weight: bold;"><s:property value="mobileAppsCategory"/></font></div><br/>
    <form name="mAppFormName" action="mobileAppsNameSelection.action" method="post">    
    <table style="margin-left: 38px;margin-top:0px">
    <tr><td></td><td><div style=" margin-left: -150px"><s:fielderror><s:param>appCategoryType</s:param></s:fielderror></div></td></tr>
    <tr><td></td><td><input type="radio" name="appCategoryType" value="Alphabetical" onClick="operatingsystem_submit('Alphabetical');return false"/>
    <font color="#242234" size="3">
    by Alphabetical order
    </font>
    </td>
    </tr>
    <tr><td></td><td><input type="radio" name="appCategoryType" value="Operating System"  checked="checked" onClick="operatingsystem_submit('Operating');return false"/>
    <font color="#242234" size="3">
    by Operating Systems
    </font>
    </td>
    </tr>
    </table><br/><br/>
    <div id="selectAllDiv" style="margin-left: 50px;display: none;position:absolute;margin-top:-33px;"><input type="checkbox" id="master" name="selectAll" onclick="checkAll();" value="" ><font style="font: 1em/0.25em sans-serif;">&nbsp;Select All</font></div>
      
 
  
  <div style="margin-top:-30px;">
      <%
              if (null != session.getAttribute("Mobile_Category_OS_Session")) {
                Map sortedMap = (Map) session.getAttribute("Mobile_Category_OS_Session");
                if (null != sortedMap && sortedMap.size() > 0) {
                Iterator iterator = sortedMap.keySet().iterator();
                String category = "";
                while (iterator.hasNext()) {
                category = (String) iterator.next();
  %>  
     
  <div class="mainBox" style="margin-left: 40px;margin-top:34px;background: white;min-height: 150px;width: 880px;border-radius: 12px 10px 0px 0px;height: auto;border: solid 2px #595959;">
        <div style="background: #666666;height: 25px;width:880px;margin-top: -0.5px;border-radius: 10px 8px 0px 0px;border-bottom: solid 2px #00a9f1;">
        <p style="margin-left: 10px; margin-top: 3px; text-align: justify; color: white; font: bold 1.1em/1em Cambria;position: absolute;">
        <input type="checkbox" id="<%=category%>" name="<%=category%>" onclick="this.value=checkStateAll('<%=category%>');" value=""><font color="white" size="3">&nbsp;Select all App Names in</font>&nbsp;
         <b><font color="yellow" size="4"><%= category %></font></b></p>
        </div>
        <div style="width:860px; height:150px;margin-left: 7px;margin-top: 13px; overflow:auto;">
        <table border="0" id="myScrollTable">

            <%
             int maxCols = 4;
             int temp = 0;
             ArrayList mAppsList = new ArrayList();
             mAppsList = (ArrayList)sortedMap.get(category);
             ArrayList appNamesList = new ArrayList();
             
             ArrayList appIdList = new ArrayList();
             appNamesList=(ArrayList)mAppsList.get(0);
             appIdList=(ArrayList)mAppsList.get(1);
             if(null != appNamesList && appNamesList.size() > 0)
             { 
             float noOfIter=(float)appNamesList.size()/maxCols;
             int iterationSize=(int)Math.ceil(noOfIter);
             for(int i =0; i<iterationSize;i++)
             {
            %>
             <tr>
             <%
             if(maxCols >= appNamesList.size())
             {
             maxCols = appNamesList.size();
             }
             for(int j = temp; j < maxCols; j++)
             {
             %>
            <td>
            <input type="checkbox" name="combinationalName" class="<%=category%>" value="<%= appIdList.get(j) %>"/>
            </td>
            <td>
            <%= appNamesList.get(j) %>
            </td>
            <td width="30">
            &nbsp;
            </td>
            <%
            temp++;
            }
            maxCols = maxCols + 4;
            %>
            </tr>
            <%
            } }
            %>
            </table>
            </div>
             <div style="height:4px;"></div>
            </div>
            <%
            }   }  }
            %>
      <br/>
  
   <div align="center" style="margin-top: 15px;margin-left: 0px;">
         <table style="margin-left: 38px;margin-top:0px;position: absolute">
             <tr><td><button type="submit" name="method:backMove" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
         </table>

         <table style="margin-left: 808px;margin-top: 0px;position: absolute">
             <tr><td><button type="submit" onclick="return mobileAppsSelection();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" ><font style="top: -2px;position: relative;">NEXT</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
         </table>
    </div>
  </div>
   </form>
  
   <form name="operatingsystem" action="operatingSystemsInApps">
                <input type="hidden" name="appCategoryType">
            </form>
            <script>
                function operatingsystem_submit(type){
                    document.operatingsystem.appCategoryType.value=type;
                    document.operatingsystem.submit();
                }

            </script>
  <br/><br/><br/><br/><br/><br/>
   </div></div>
    </body>
</html>
