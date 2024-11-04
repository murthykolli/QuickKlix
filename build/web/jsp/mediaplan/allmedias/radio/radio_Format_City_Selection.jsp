<%-- 
    Document   : radio_Format_City_Selection
    Created on : 17 Jul, 2014, 12:17:42 PM
    Author     : anusha
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
    </head>
    <script type="text/javascript">

    function checkAll()
    {
    if(document.radioCity.selectAll.checked== true)
    {
    for(var i=0; i < document.radioCity.radioSelectedCity.length; i++)
    {
    document.radioCity.radioSelectedCity[i].checked=true;
    }
    }
    else
    {
    for(var i=0; i < document.radioCity.radioSelectedCity.length; i++)
    {
    document.radioCity.radioSelectedCity[i].checked=false;
    } } }
    
    function checkStateAll(passStateName)
    {
    var stateChecked = document.getElementById(passStateName).checked;
    var len=document.radioCity.radioSelectedCity.length;
    
     if(stateChecked== true)
     {
     if(len==undefined){
     document.radioCity.radioSelectedCity.checked=true;
      }   
      for(var i=0; i < document.radioCity.radioSelectedCity.length; i++)
     {         
       if (document.radioCity.radioSelectedCity[i].className.indexOf(passStateName) != -1)
       document.radioCity.radioSelectedCity[i].checked = true;
     }
    }
    else
     {
     if(len==undefined && document.radioCity.radioSelectedCity.checked==true ){
     document.radioCity.radioSelectedCity.checked=false;
      }
      for (var i = 0; i < document.radioCity.radioSelectedCity.length; i++)
        {
        if (document.radioCity.radioSelectedCity[i].className.indexOf(passStateName) != -1)
        document.radioCity.radioSelectedCity[i].checked = false;
         }
      }
    }

    function citySelection() {
        var radioSelectedCitys = "";
        for (var k = 0; k < document.radioCity.radioSelectedCity.length; k++)
        {
            if (document.radioCity.radioSelectedCity[k].checked) {
                radioSelectedCitys = document.radioCity.radioSelectedCity[k].value;
            }
        }
        if (document.radioCity.radioSelectedCity.checked) {
            radioSelectedCitys = document.radioCity.radioSelectedCity.value;
        }
        if (radioSelectedCitys == "") {
            window.alert("Please select at least one city.");
            return false;
        }
    }

  $(document).ready(function(){
    if($(".mainBox").length>1){
       $("#selectAllDiv").show();
    }
  });

</script>
    <body>
       <div id="container1" style="height: auto;margin-top:0px;">
   <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>
     
       <div style="margin-top:20px;margin-left: 30px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by City - <font color="#00a9f1">Radio Format <s:property value="radioDisplayFormat"/></font></font></div><br/>
  <form name="radioCity" action="radioFormatSelectByCity.action" method="post">
      
  <div id="selectAllDiv" style="margin-left: 52px;display: none;"><input type="checkbox" id="master" name="selectAll" onclick="checkAll();" value="" ><font style="font: 1em/0.25em sans-serif;">&nbsp;Select All</font></div>
  
  <div style="margin-top:-13px;">
        <%   
            if(session.getAttribute("Radio_Format_City_Map")!=null)
            {
                Map sortedMap = (Map)session.getAttribute("Radio_Format_City_Map");
                if(null != sortedMap && sortedMap.size() > 0)
                {
                   Iterator iterator = sortedMap.keySet().iterator();
                    String stateName = "";
                    while(iterator. hasNext())
                    {
                        stateName = (String)iterator.next();
        %>  
        
        
  <div class="mainBox" style="margin-left: 40px;margin-top:34px;background: white;min-height: 80px;width: 880px;border-radius: 12px 10px 0px 0px;height: auto;border: solid 2px #595959;">
        <div style="background: #666666;height: 25px;width:880px;margin-top: 0px;border-radius: 10px 8px 0px 0px;border-bottom: solid 2px #00a9f1;">
        <p style="margin-left: 10px; margin-top: 3px; text-align: justify; color: white; font: bold 1.1em/1em Cambria;position: absolute;">
            <input type="checkbox" id="<%=stateName%>" name="<%=stateName%>" onclick="this.value=checkStateAll('<%=stateName%>');" value=""><font color="white" size="3">&nbsp;Select all Cities in</font>&nbsp;
         <b><font color="yellow" size="4"><%= stateName %></font></b></p>
        </div>
        <div style="width:860px; height:70px;margin-left: 7px;margin-top: 13px; overflow:auto;">
        <table border="0" id="myScrollTable">

                 <%
                        int maxCols = 6;
                        int temp = 0;
                        ArrayList<String> cityNamesList = new ArrayList<String>();
                        cityNamesList = (ArrayList<String>)sortedMap.get(stateName);
                       Collections.sort(cityNamesList);
                        if(null != cityNamesList && cityNamesList.size() > 0)
                        { 
                            float noOfIter=(float)cityNamesList.size()/maxCols;
                            int iterationSize=(int)Math.ceil(noOfIter);
                            for(int i =0; i<iterationSize;i++)
                            {

                 %>
                                <tr>

                                    <%
                                        if(maxCols >= cityNamesList.size())
                                        {
                                            maxCols = cityNamesList.size();
                                        }

                                        for(int j = temp; j < maxCols; j++)
                                        {
                                    %>

                                            <td>
                                                <input type="checkbox" name="radioSelectedCity" class="<%=stateName%>" value="<%= cityNamesList.get(j)+"&&"+stateName  %>"/>
                                            </td>


                                            <td>
                                                <%= cityNamesList.get(j)  %>
                                            </td>
                                            <td width="20">
                                                &nbsp;
                                            </td>
                                    <%
                                            temp++;
                                        }
                                        maxCols = maxCols + 6;
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
  </div><br/>
  
  <div align="center" style="margin-top: 15px;margin-left: 0px;">
      <table style="margin-left: 38px;margin-top:0px;position: absolute">
          <tr><td><button type="submit" name="method:backMove" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
      </table>

      <table style="margin-left: 808px;margin-top: 0px;position: absolute">
          <tr><td><button type="submit" name="method:radioNamesForRadioFormat"  onclick="return citySelection();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -2px;position: relative;">NEXT</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
      </table>
  </div> 
        
        </form>
  <br/><br/><br/><br/><br/><br/>
   </div></div>
    </body>
</html>
