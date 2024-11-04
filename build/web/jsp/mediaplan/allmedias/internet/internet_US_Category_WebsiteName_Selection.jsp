<%-- 
    Document   : internet_US_Category_WebsiteName_Selection
    Created on : 23 Jul, 2014, 3:01:46 PM
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

    function checkStateAll(passcategoryName)
    {
    var stateChecked = document.getElementById(passcategoryName).checked;
    var len=document.internet.combinationalName.length;
    
     if(stateChecked== true)
     {
     if(len==undefined){
     document.internet.combinationalName.checked=true;
      }   
      for(var i=0; i < document.internet.combinationalName.length; i++)
     {         
       if (document.internet.combinationalName[i].className.indexOf(passcategoryName) != -1)
       document.internet.combinationalName[i].checked = true;
     }
    }
    else
     {
     if(len==undefined && document.internet.combinationalName.checked==true ){
     document.internet.combinationalName.checked=false;
      }
      for (var i = 0; i < document.internet.combinationalName.length; i++)
        {
        if (document.internet.combinationalName[i].className.indexOf(passcategoryName) != -1)
        document.internet.combinationalName[i].checked = false;
         }
      }
    }

    function websiteSelection() {
        var combinationalNames = "";
        for (var k = 0; k < document.internet.combinationalName.length; k++)
        {
            if (document.internet.combinationalName[k].checked) {
                combinationalNames = document.internet.combinationalName[k].value;
            }
        }
        if (document.internet.combinationalName.checked) {
            combinationalNames = document.internet.combinationalName.value;
        }
        if (combinationalNames == "") {
            window.alert("Please select at least one internet website.");
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
     
  <div style="margin-top:20px;margin-left: 30px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Website Name - <font color="#00a9f1">Top Internet Sites in the US by Category</font></font></div><br/>
  <form name="internet" action="USWebsiteNameByCategory.action" method="post">
  
  <div style="margin-top:0px;">
        <%   
            if(session.getAttribute("Internet_WebsiteNames_Map")!=null)
            {
                Map sortedMap = (Map)session.getAttribute("Internet_WebsiteNames_Map");
                if(null != sortedMap && sortedMap.size() > 0)
                {
                   Iterator iterator = sortedMap.keySet().iterator();
                    String categoryName = "";
                    while(iterator. hasNext())
                    {
                        categoryName = (String)iterator.next();
        %>  
        
        
  <div class="mainBox" style="margin-left: 40px;margin-top:34px;background: white;min-height: 80px;width: 880px;border-radius: 12px 10px 0px 0px;height: auto;border: solid 2px #595959;">
        <div style="background: #666666;height: 25px;width:880px;margin-top: 0px;border-radius: 10px 8px 0px 0px;border-bottom: solid 2px #00a9f1;">
        <p style="margin-left: 10px; margin-top: 3px; text-align: justify; color: white; font: bold 1.1em/1em Cambria;position: absolute;">
            <input type="checkbox" id="<%=categoryName%>" name="<%=categoryName%>" onclick="this.value=checkStateAll('<%=categoryName%>');" value=""><font color="white" size="3">&nbsp;Select all Websites in</font>&nbsp;
         <b><font color="yellow" size="4"><%= categoryName %></font></b></p>
        </div>
        <div style="width:860px; height:70px;margin-left: 7px;margin-top: 13px; overflow:auto;">
        <table border="0" id="myScrollTable">

                 <%
                        int maxCols = 4;
                        int temp = 0;
                        ArrayList internetList = new ArrayList();
                        ArrayList websiteNamesList = new ArrayList();
                        ArrayList siteIdList = new ArrayList();
                        internetList = (ArrayList)sortedMap.get(categoryName);
                        websiteNamesList=(ArrayList)internetList.get(0);
                        siteIdList=(ArrayList)internetList.get(1);
                        if(null != internetList && internetList.size() > 0)
                        { 
                            float noOfIter=(float)websiteNamesList.size()/maxCols;
                            int iterationSize=(int)Math.ceil(noOfIter);
                            for(int i =0; i<iterationSize;i++)
                            {

                 %>
                                <tr>

                                    <%
                                        if(maxCols >= websiteNamesList.size())
                                        {
                                            maxCols = websiteNamesList.size();
                                        }

                                        for(int j = temp; j < maxCols; j++)
                                        {
                                    %>

                                            <td>
                                                <input type="checkbox" name="combinationalName" class="<%=categoryName%>" value="<%= siteIdList.get(j) %>"/>
                                            </td>


                                            <td>
                                                <%= websiteNamesList.get(j)  %>
                                            </td>
                                            <td width="20">
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
  </div><br/>

  <div align="center" style="margin-top: 15px;margin-left: 0px;">
      <table style="margin-left: 38px;margin-top:0px;position: absolute">
          <tr><td><button type="submit" name="method:backMove" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
      </table>

      <table style="margin-left: 808px;margin-top: 0px;position: absolute">
          <tr><td><button type="submit" onclick="return websiteSelection();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -2px;position: relative;">NEXT</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
      </table>
  </div>    
  </form>
  <br/><br/><br/><br/><br/><br/>
   </div></div>
    </body>
</html>
