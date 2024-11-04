<%-- 
    Document   : campaigns_per_ Client
    Created on : 9 Sep, 2014, 11:34:56 AM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix="s" uri="/struts-tags" %>
<html>
  <head>        
    <script src="/QuickKlix/scripts/fusioncharts/fusioncharts.js" type="text/javascript"></script>

  </head>   
  <body class="body_page">
        <div id="container1" style="height: auto;margin-top:0px;">
        <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 550px;height: auto;border-radius: 30px 30px 0 0;"><br/>

            <div style="margin-top:40px;margin-left: 45px;position: absolute;font-family: Cambria;"><font style="font: bold 1.45em/1em Cambria;color:#595959;">User Reports</font></div><br/>   
            <div id="chartContainer" style="margin-left: 50px;margin-top: 100px;"></div>          
    
            <script type="text/javascript">
            var myChart = new FusionCharts( "Pie2D", "myChartId", "500", "400" );
            
            var strXML = "<chart xAxisName='Client' yAxisName='Count' yAxisMinValue ='0' showValues= '0'>"+

            "<set label = '<s:property value="userName"/>' value='1'/>"+
            "<set label = 'Client2' value='1'/>"+
            "<set label = 'Client3' value='1'/>"+
            "<set label = 'Client4' value='1'/>"+
            "</chart>" ; 
            
            myChart.setXMLData(strXML);
            myChart.render("chartContainer");
            </script>  

        </div>
        </div>

  </body> 
</html>