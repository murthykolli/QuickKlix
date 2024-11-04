
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
<head>
<script type="text/javascript">
         function magazineSelection(){
         var choicess="";
         for(var k=0; k < document.magazine.categoryBasedMagazine.length; k++)
         {
         if(document.magazine.categoryBasedMagazine[k].checked){
         choicess=document.magazine.categoryBasedMagazine[k].value;
         }
         }
         if(document.magazine.categoryBasedMagazine.checked){
         choicess=document.magazine.categoryBasedMagazine.value;
         }
         if(choicess == ""){
         window.alert("Please select at least one magazine.");
         return false;
         }
         }
         
         function checkAll()
         {
         if(document.magazine.master.checked== true)
         {
         for(var i=0; i < document.magazine.categoryBasedMagazine.length; i++)
         {
         document.magazine.categoryBasedMagazine[i].checked=true;
         }
         }
         else
         {
         for (var i = 0; i < document.magazine.categoryBasedMagazine.length; i++)
         {
         document.magazine.categoryBasedMagazine[i].checked = false;
         }
         }
         }
         
         function checkStateAll(passStateName)
         {
         var stateChecked = document.getElementById(passStateName).checked;
         if(stateChecked== true)
         {
         var len=document.magazine.categoryBasedMagazine.length;
         if(len==undefined){
         document.magazine.categoryBasedMagazine.checked=true;
         }
         for(var i=0; i < document.magazine.categoryBasedMagazine.length; i++)
         {
         if (document.magazine.categoryBasedMagazine[i].className.indexOf(passStateName) !=-1)
         document.magazine.categoryBasedMagazine[i].checked=true;
         }
         }
         else
         {
         if(len==undefined && document.magazine.categoryBasedMagazine.checked==true ){
         document.magazine.categoryBasedMagazine.checked=false;
         }
         for(var i=0; i < document.magazine.categoryBasedMagazine.length; i++)
         {
         if (document.magazine.categoryBasedMagazine[i].className.indexOf(passStateName) !=-1)
         document.magazine.categoryBasedMagazine[i].checked=false;
         }
         }}
     
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
    <div style="margin-top:20px;margin-left: 30px;font-family: Calibri;font-size: 22px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Magazines Name - <font color="#00a9f1">Magazines</font></font></div><br/>   
        
       
     <form action="selectedmagazinename.action" name="magazine" method="post">
          
             <div id="selectAllDiv" style="margin-left: 50px;display: none;"><input type="checkbox" id="master" name="master" onclick="checkAll();" value="" ><font style="font: 1em/0.25em sans-serif;">&nbsp;Select All</font></div>
         
       <div style="margin-top:-13px;">     
       <%
              if (null != session.getAttribute("CAT_Magazines_MAP")) {
              Map sortedMap = (Map) session.getAttribute("CAT_Magazines_MAP");
              if (null != sortedMap && sortedMap.size() > 0) {
              Iterator iterator = sortedMap.keySet().iterator();
              String category = "";
              while (iterator.hasNext()) {
              category = (String) iterator.next();
              %>
              <div class="mainBox" style="margin-left: 40px;margin-top:34px;background: white;min-height: 80px;width: 880px;border-radius: 12px 10px 0px 0px;height: auto;border: solid 2px #595959;">
        <div style="background: #666666;height: 25px;width:880px;margin-top: 0px;border-radius: 10px 8px 0px 0px;border-bottom: solid 2px #00a9f1;">
        <p style="margin-left: 10px; margin-top: 3px; text-align: justify; color: white; font: bold 1.1em/1em Cambria;position: absolute;">
        <input type="checkbox" id="<%= category%>" name="<%= category%>" onclick="this.value=checkStateAll('<%= category%>');" value=""><font color="white" size="3">&nbsp;Select all Magazines published in&nbsp;</font><font color="yellow" size="4"><%= category%></font></p>
        </div>
         <div style="width:860px; height:100px;margin-left: 7px;margin-top: 10px; overflow:auto;">
        
            <table border="0" id="myScrollTable">
              
              <%
              int maxCols = 5;
              int temp = 0;
              ArrayList mgNameAndIdsList = new ArrayList();
              mgNameAndIdsList = (ArrayList)sortedMap.get(category);
                        ArrayList mgNamesList = new ArrayList();
                        ArrayList mgIdsList = new ArrayList();
                        mgNamesList = (ArrayList)mgNameAndIdsList.get(0);
                        mgIdsList = (ArrayList)mgNameAndIdsList.get(1);

              Collections.sort(mgNamesList);
              if (null != mgNamesList && mgNamesList.size() > 0) {
                  float noOfIter=(float)mgNamesList.size()/maxCols;
                  int iterationSize=(int)Math.ceil(noOfIter);
                  for (int i = 0; i < iterationSize; i++) {
                %>
             <tr>

              <%
                if (maxCols >= mgNamesList.size()) {
                maxCols = mgNamesList.size();
                }
                for (int j = temp; j < maxCols; j++) {
                %>
                <td>
                 <input type="checkbox" name="categoryBasedMagazine" class="<%= category%>" value="<%= mgIdsList.get(j)%>"/>
                 </td>
                 <td>
                 <%= mgNamesList.get(j)%>
                 </td>
                 <td width="20">
                 &nbsp;
                 </td>
                 <%
                 temp++;
                 }
                 maxCols = maxCols + 5;
                 %>
                 </tr>
            <%
            }
            }
            %>
            </table>
            </div>
             <div style="height:4px;"></div>
           </div>
            <%
            }
            %>
            <%
            }
            }
            %>
       </div> <br/>

         <div align="center" style="margin-top: 20px;margin-left: 0px;">
         <table style="margin-left: 40px;margin-top:0px;position: absolute">
             <tr><td><button type="submit" name="method:moveBack" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;margin-top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
         </table>

         <table style="margin-left: 800px;margin-top: 0px;position: absolute">
             <tr><td><button type="submit" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" onclick="return magazineSelection();"><font style="top: -2px;position: relative;">NEXT</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
         </table>
         </div>
                  
     
     
     </form>
  <br/><br/><br/><br/><br/><br/><br/><br/>
   </div></div>
    </body>
</html>
