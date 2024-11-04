<%-- 
    Document   : radio_Format_State_Selection
    Created on : 17 Jul, 2014, 10:21:07 AM
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
    if(document.radioState.selectAll.checked== true)
    {
    for(var i=0; i < document.radioState.radioSelectedStates.length; i++)
    {
    document.radioState.radioSelectedStates[i].checked=true;
    }
    }
    else
    {
    for(var i=0; i < document.radioState.radioSelectedStates.length; i++)
    {
    document.radioState.radioSelectedStates[i].checked=false;
    } } }
    
    function checkStateAll(passradioCategory)
    {
    var stateChecked = document.getElementById(passradioCategory).checked;
    var len=document.radioState.radioSelectedStates.length;
    
     if(stateChecked== true)
     {
     if(len==undefined){
     document.radioState.radioSelectedStates.checked=true;
      }   
      for(var i=0; i < document.radioState.radioSelectedStates.length; i++)
     {         
       if (document.radioState.radioSelectedStates[i].className.indexOf(passradioCategory) != -1)
       document.radioState.radioSelectedStates[i].checked = true;
     }
    }
    else
     {
     if(len==undefined && document.radioState.radioSelectedStates.checked==true ){
     document.radioState.radioSelectedStates.checked=false;
      }
      for (var i = 0; i < document.radioState.radioSelectedStates.length; i++)
        {
        if (document.radioState.radioSelectedStates[i].className.indexOf(passradioCategory) != -1)
        document.radioState.radioSelectedStates[i].checked = false;
         }
      }
    }

    function stateSelection() {
        var radioSelectedStates = "";
        for (var k = 0; k < document.radioState.radioSelectedStates.length; k++)
        {
            if (document.radioState.radioSelectedStates[k].checked) {
                radioSelectedStates = document.radioState.radioSelectedStates[k].value;
            }
        }
        if (document.radioState.radioSelectedStates.checked) {
            radioSelectedStates = document.radioState.radioSelectedStates.value;
        }
        if (radioSelectedStates == "") {
            window.alert("Please select at least one state.");
            return false;
        }
    }

</script>
    <body>
       <div id="container1" style="height: auto;margin-top:0px;">
   <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>
     
  <div style="margin-top:20px;margin-left: 30px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by State - <font color="#00a9f1">Radio</font></font></div><br/>
  <form name="radioState" action="radioFormatSelectByState.action" method="post">
      
  
  <div style="margin-top:-13px;">
        <%   
            if(session.getAttribute("Radio_Format_State_Map")!=null)
            {
                Map sortedMap = (Map)session.getAttribute("Radio_Format_State_Map");
                if(null != sortedMap && sortedMap.size() > 0)
                {
                   Iterator iterator = sortedMap.keySet().iterator();
                    String radioCategory = "";
                    while(iterator. hasNext())
                    {
                        radioCategory = (String)iterator.next();
        %>  
        
        
  <div class="mainBox" style="margin-left: 40px;margin-top:34px;background: white;min-height: 80px;width: 880px;border-radius: 12px 10px 0px 0px;height: auto;border: solid 2px #595959;">
        <div style="background: #666666;height: 25px;width:880px;margin-top: 0px;border-radius: 10px 8px 0px 0px;border-bottom: solid 2px #00a9f1;">
        <p style="margin-left: 10px; margin-top: 3px; text-align: justify; color: white; font: bold 1.1em/1em Cambria;position: absolute;">
            <input type="checkbox" id="<%=radioCategory%>" name="<%=radioCategory%>" onclick="this.value=checkStateAll('<%=radioCategory%>');" value=""><font color="white" size="3">&nbsp;Select all States in</font>&nbsp;
            <b><font color="yellow" size="4"><s:property value="radioDisplayFormat"/></font></b></p>
        </div>
        <div style="width:860px; height:100px;margin-left: 7px;margin-top: 13px; overflow:auto;">
        <table border="0" id="myScrollTable">

                 <%
                        int maxCols = 6;
                        int temp = 0;
                        ArrayList<String> stateNamesList = new ArrayList<String>();
                        stateNamesList = (ArrayList<String>)sortedMap.get(radioCategory);
                       Collections.sort(stateNamesList);
                        if(null != stateNamesList && stateNamesList.size() > 0)
                        { 
                            float noOfIter=(float)stateNamesList.size()/maxCols;
                            int iterationSize=(int)Math.ceil(noOfIter);
                            for(int i =0; i<iterationSize;i++)
                            {

                 %>
                                <tr>

                                    <%
                                        if(maxCols >= stateNamesList.size())
                                        {
                                            maxCols = stateNamesList.size();
                                        }

                                        for(int j = temp; j < maxCols; j++)
                                        {
                                    %>

                                            <td>
                                                <input type="checkbox" name="radioSelectedStates" class="<%=radioCategory%>" value="<%= stateNamesList.get(j)%>"/>
                                            </td>


                                            <td>
                                                <%= stateNamesList.get(j)  %>
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
          <tr><td><button type="submit" name="method:radioFormatCityNames"  onclick="return stateSelection();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -2px;position: relative;">NEXT</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
      </table>
  </div> 
        
        </form>
  <br/><br/><br/><br/><br/><br/>
   </div></div>
    </body>
</html>
