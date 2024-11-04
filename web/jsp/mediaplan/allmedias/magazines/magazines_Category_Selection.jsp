<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="s" uri="/struts-tags" %>
<html>
  <head>
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
    <script type="text/javascript">
        function categorySelection(){
          var choicess="";
          for(var k=0; k < document.mgcategory.mgchoices.length; k++)
          {
          if(document.mgcategory.mgchoices[k].checked){
          choicess=document.mgcategory.mgchoices[k].value;
          }
          }
          if (document.mgcategory.mgchoices.checked) {
          choicess = document.mgcategory.mgchoices.value;
          }
          if (choicess == "" || choicess == undefined) {
          window.alert("Please select at least one magazine category.");
          return false;
          }
     }
        function checkAll()
        {
        if(document.mgcategory.master.checked== true)
        {
        for(var i=0; i < document.mgcategory.mgchoices.length; i++)
        {
        document.mgcategory.mgchoices[i].checked=true;
        }
        }
        else
        {
        for (var i = 0; i < document.mgcategory.mgchoices.length; i++)
        {
        document.mgcategory.mgchoices[i].checked = false;
        }
        }
        }
     </script>
    </head>

    <body>
        <div id="container1" style="height: auto;margin-top:0px;">
        <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 620px;height: auto;border-radius: 30px 30px 0 0;"><br/>
        <div style="margin-top:20px;margin-left: 30px;font-family: Calibri;font-size: 22px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Category - <font color="#00a9f1">Magazines</font></font></div><br/>
     
        <form action="mgnameselectioncategory.action" name="mgcategory" method="post">
        <div style="margin-top:-13px;">    
        <div style="margin-left: 40px;margin-top:34px;background: white;min-height: 80px;width: 870px;border-radius: 12px 10px 0px 0px;height: auto;border: solid 2px #595959;">
        <div style="background: #666666;height: 25px;width:870px;margin-top: 0px;border-radius: 10px 8px 0px 0px;border-bottom: solid 2px #00a9f1;">
        <p style="margin-left: 12px; margin-top: 3px; text-align: justify; color: white; font: bold 1.1em/1em Cambria;position: absolute;">
        <input type="checkbox" name="master" onclick="checkAll();" style="margin-left: 10px;margin-top: 0px;" value="">&nbsp;<font color="white" size="3">Select All</font></p>
        </div>
          <table style="font: 26px;color: black;background-color: white;height: 275px;width: 800px;margin-top: 10px;margin-left: 15px;overflow: scroll;">

                   <tr><td> <input type="checkbox" name="mgchoices" value="Agriculture"> Agriculture</td><td><input type="checkbox" name="mgchoices" value="Entertainment"> Entertainment</td><td><input type="checkbox" name="mgchoices" value="Occupation/ Industry"> Occupation/ Industry</td></tr>
                    <tr><td><input type="checkbox" name="mgchoices" value="Animals"> Animals</td><td><input type="checkbox" name="mgchoices" value="Environment"> Environment</td><td><input type="checkbox" name="mgchoices" value="Office"> Office</td></tr>
                    <tr><td><input type="checkbox" name="mgchoices" value="Architecture & Construction"> Architecture & Construction</td><td><input type="checkbox" name="mgchoices" value="Fashion/Beauty"> Fashion/Beauty</td><td><input type="checkbox" name="mgchoices" value="Other"> Other</td></tr>
                    <tr><td><input type="checkbox" name="mgchoices" value="Arts"> Arts</td><td><input type="checkbox" name="mgchoices" value="Food"> Food</td><td><input type="checkbox" name="mgchoices" value="Religion"> Religion</td></tr>
                    <tr><td><input type="checkbox" name="mgchoices" value="Automotives"> Automotives</td><td><input type="checkbox" name="mgchoices" value="Government"> Government</td><td><input type="checkbox" name="mgchoices" value="Spanish"> Spanish</td></tr>
                    <tr><td><input type="checkbox" name="mgchoices" value="Aviation"> Aviation</td><td><input type="checkbox" name="mgchoices" value="Health"> Health</td><td><input type="checkbox" name="mgchoices" value="Sports"> Sports</td></tr>
                    <tr><td><input type="checkbox" name="mgchoices" value="Books"> Books</td><td><input type="checkbox" name="mgchoices" value="Homes/ Housewares"> Homes/ Housewares</td><td><input type="checkbox" name="mgchoices" value="Travel"> Travel</td></tr>
                    <tr><td><input type="checkbox" name="mgchoices" value="Electronics"> Electronics</td><td><input type="checkbox" name="mgchoices" value="Interest"> Interest</td></tr>
                </table>
        </div>
        </div><br/><br/>

         <div align="center" style="margin-top: 0px;margin-left: 0px;">
         <table style="margin-left: 40px;margin-top:0px;position: absolute">
             <tr><td><button type="submit" name="method:moveBack" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;margin-top: 1px;"/> <font style="top: -2px;position: relative;">BACK</font></button></td></tr>
         </table>

         <table style="margin-left: 795px;margin-top: 0px;position: absolute">
             <tr><td><button type="submit" name="method:magazinesSelection" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" onclick="return categorySelection();"><font style="top: -2px;position: relative;">NEXT</font> <img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/></button></td></tr>
         </table>
         </div>

    
    </form>
  <br/><br/><br/><br/>
   </div></div>
    </body>
</html>
