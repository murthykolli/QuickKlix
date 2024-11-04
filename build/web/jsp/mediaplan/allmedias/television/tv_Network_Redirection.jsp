<%-- 
    Document   : tv_Network_Selection
    Created on : 17 Jul, 2014, 4:11:46 PM
    Author     : ramadevi
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval()%>;url=/QuickKlix/sessionTimeOut.action" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <script src="/QuickKlix/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
        <title>Select by Network - Television | quickklix.com</title>
        <style type="text/css">
            .wideBox {
            clear: both;
            text-align: center;
            margin-bottom: 50px;
            padding: 10px;
            background: #ebedf2;
            border: 1px solid #333;
            line-height: 80%;
            }
            #container {
            width: 900px;
            margin: 0 auto;
            }
            #chart, #chartData {
             margin-top: -40px;
             margin-left:220px;
             cursor: pointer;
             }
            #chartData {
            width: 100px;
            margin: 0 40px 0 0;
            float: left;
            margin-left:26px;
            margin-top:6px;
            border-collapse: collapse;
            box-shadow: 0 0 1em rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 0 1em rgba(0, 0, 0, 0.5);
            -webkit-box-shadow: 0 0 1em rgba(0, 0, 0, 0.5);
            background-position: 0 -100px;
            font-size: 12px;
            }
            #chartData th, #chartData td {
            border: 1px solid #00A9F1;
            line-height: 100%;
            padding: 0.5em;
            text-align: left;
            }
             #chartData th {
            border-bottom: 2px solid #333;
            text-transform: uppercase;
            }
            #chartData td {
            cursor: pointer;
            }
            #chartData td.highlight {
            background: yellow;
            }
            #chartData tr:hover td {
            background: #ffffa8;
            }

        </style>
          <% 
        if(session.getAttribute("TVNetworkAndCountInSession")!=null)
        {
        ArrayList networkList = (ArrayList)session.getAttribute("TVNetworkAndCountInSession");
        if(networkList.size() > 0)
        {   
        ArrayList networkName = new ArrayList();
        ArrayList networkCount = new ArrayList();
        networkName=(ArrayList)networkList.get(0);
        networkCount=(ArrayList)networkList.get(1);
        %>

        <script type="text/javascript">
            
           // Run the code when the DOM is ready
         
            $( pieChart );

            function pieChart() {

                // Config settings
                var chartSizePercent = 60;                        // The chart radius relative to the canvas width/height (in percent)
                var sliceBorderWidth = 1;                         // Width (in pixels) of the border around each slice
                var sliceBorderStyle = "#fff";                    // Colour of the border around each slice
                var sliceGradientColour = "#ddd";                 // Colour to use for one end of the chart gradient
                var maxPullOutDistance = 25;                      // How far, in pixels, to pull slices out when clicked
                var pullOutFrameStep = 4;                         // How many pixels to move a slice with each animation frame
                var pullOutFrameInterval = 40;                    // How long (in ms) between each animation frame
                var pullOutLabelPadding = 30;                     // Padding between pulled-out slice and its label
                var pullOutLabelFont = "bold 16px 'Trebuchet MS', Verdana, sans-serif";  // Pull-out slice label font
                var pullOutValueFont = "bold 12px 'Trebuchet MS', Verdana, sans-serif";  // Pull-out slice value font
                var pullOutValuePrefix = "";                     // Pull-out slice value prefix
                var pullOutShadowColour = "rgba( 0, 0, 0, .5 )";  // Colour to use for the pull-out slice shadow
                var pullOutShadowOffsetX = 5;                     // X-offset (in pixels) of the pull-out slice shadow
                var pullOutShadowOffsetY = 5;                     // Y-offset (in pixels) of the pull-out slice shadow
                var pullOutShadowBlur = 5;                        // How much to blur the pull-out slice shadow
                var pullOutBorderWidth = 2;                       // Width (in pixels) of the pull-out slice border
                var pullOutBorderStyle = "#333";                  // Colour of the pull-out slice border
                var chartStartAngle = -.5 * Math.PI;              // Start the chart at 12 o'clock instead of 3 o'clock

                // Declare some variables for the chart
                var canvas;                       // The canvas element in the page
                var currentPullOutSlice = -1;     // The slice currently pulled out (-1 = no slice)
                var currentPullOutDistance = 0;   // How many pixels the pulled-out slice is currently pulled out in the animation
                var animationId = 0;              // Tracks the interval ID for the animation created by setInterval()
                var chartData = [];               // Chart data (labels, values, and angles)
                var chartColours = [];            // Chart colours (pulled from the HTML table)
                var totalValue = 0;               // Total of all the values in the chart
                var canvasWidth;                  // Width of the canvas, in pixels
                var canvasHeight;                 // Height of the canvas, in pixels
                var centreX;                      // X-coordinate of centre of the canvas/chart
                var centreY;                      // Y-coordinate of centre of the canvas/chart
                var chartRadius;                  // Radius of the pie chart, in pixels
               // Set things up and draw the chart
                init();
                /**
                 * Set up the chart data and colours, as well as the chart and table click handlers,
                 * and draw the initial pie chart
                 */
                function init() {
                // Get the canvas element in the page
                canvas = document.getElementById('chart');
                // Exit if the browser isn't canvas-capable
                if ( typeof canvas.getContext === 'undefined' ) return;
                 // Initialise some properties of the canvas and chart
                 canvasWidth = canvas.width;
                 canvasHeight = canvas.height;
                 centreX = canvasWidth / 2;
                 centreY = canvasHeight / 2;
                 chartRadius = Math.min( canvasWidth, canvasHeight ) / 2 * ( chartSizePercent / 100 );
                 // Grab the data from the table,
                 // and assign click handlers to the table data cells
                  var currentRow = -1;
                  var currentCell = 0;
                  $('#chartData td').each( function() {
                   currentCell++;
                   if ( currentCell % 2 != 0 ) {
                   currentRow++;
                   chartData[currentRow] = [];
                   chartData[currentRow]['label'] = $(this).text();
                   } else {
                   var value = parseFloat($(this).text());
                   totalValue += value;
                   value = value.toFixed(2);
                   chartData[currentRow]['value'] = value;
                   }
                    // Store the slice index in this cell, and attach a click handler to it
                    $(this).data( 'slice', currentRow );
                    $(this).click( handleTableClick );
                    // Extract and store the cell colour
                    if ( rgb = $(this).css('color').match( /rgb\((\d+), (\d+), (\d+)/) ) {
                    chartColours[currentRow] = [ rgb[1], rgb[2], rgb[3] ];
                    } else if ( hex = $(this).css('color').match(/#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/) ) {
                    chartColours[currentRow] = [ parseInt(hex[1],16) ,parseInt(hex[2],16), parseInt(hex[3], 16) ];
                    } else {
                    alert( "Error: Colour could not be determined! Please specify table colours using the format '#xxxxxx'" );
                    return;
                    }
            } );
                // Now compute and store the start and end angles of each slice in the chart data
                var currentPos = 0; // The current position of the slice in the pie (from 0 to 1)
                for ( var slice in chartData ) {
                chartData[slice]['startAngle'] = 2 * Math.PI * currentPos;
                chartData[slice]['endAngle'] = 2 * Math.PI * ( currentPos + ( chartData[slice]['value'] / totalValue ) );
                currentPos += chartData[slice]['value'] / totalValue;
                }
                // All ready! Now draw the pie chart, and add the click handler to it
                drawChart();
                $('#chart').click ( handleChartClick );
                }
                $("canvas").on("mouseover", function(clickEvent) {
                <%--$("canvas").mousemove(function(clickEvent) {--%>
                var mouseX = clickEvent.pageX - this.offsetLeft;
                var mouseY = clickEvent.pageY - this.offsetTop;
                var xFromCentre = mouseX - centreX;
                var yFromCentre = mouseY - centreY;
                var distanceFromCentre = Math.sqrt( Math.pow( Math.abs( xFromCentre ), 2 ) + Math.pow( Math.abs( yFromCentre ), 2 ) );
                if ( distanceFromCentre <= chartRadius ) {
                var clickAngle = Math.atan2( yFromCentre, xFromCentre ) - chartStartAngle;
                if ( clickAngle < 0 ) clickAngle = 2 * Math.PI + clickAngle;
                for ( var slice in chartData ) {
                if ( clickAngle >= chartData[slice]['startAngle'] && clickAngle <= chartData[slice]['endAngle'] ) {
                if(slice==0){
                this.setAttribute("title",'<%=networkName.get(0)%>');
                }
                if(slice==1){
                this.setAttribute("title",'<%=networkName.get(1)%>');
                }
                if(slice == 2)
                {
                canvas.setAttribute("title",'<%=networkName.get(2)%>');
                }
                if(slice == 3)
                {
                canvas.setAttribute("title",'<%=networkName.get(3)%>');
                }
                if(slice == 4)
                {
                canvas.setAttribute("title",'<%=networkName.get(4)%>');
                }
                if(slice == 5)
                {
                canvas.setAttribute("title",'<%=networkName.get(5)%>');
                }
                if(slice == 6)
                {
                canvas.setAttribute("title",'<%=networkName.get(6)%>');
                }
                if(slice == 7)
                {
                canvas.setAttribute("title",'<%=networkName.get(7)%>');
                }
                if(slice == 8)
                {
                canvas.setAttribute("title",'<%=networkName.get(9)%>');
                }
                if(slice == 9)
                {
                canvas.setAttribute("title",'<%=networkName.get(10)%>');
                }
                if(slice == 10)
                {
                canvas.setAttribute("title",'<%=networkName.get(11)%>');
                }
                return;
                }
                }
                }
                });

                /**
                 * Process mouse clicks in the chart area.
                 *
                 * If a slice was clicked, toggle it in or out.
                 * If the user clicked outside the pie, push any slices back in.
                 *
                 * @param Event The click event
                 */

                function handleChartClick ( clickEvent ) {
                 // Get the mouse cursor position at the time of the click, relative to the canvas
                 var mouseX = clickEvent.pageX - this.offsetLeft;
                 var mouseY = clickEvent.pageY - this.offsetTop;
                 // Was the click inside the pie chart?
                 var xFromCentre = mouseX - centreX;
                 var yFromCentre = mouseY - centreY;
                 var distanceFromCentre = Math.sqrt( Math.pow( Math.abs( xFromCentre ), 2 ) + Math.pow( Math.abs( yFromCentre ), 2 ) );
                 if ( distanceFromCentre <= chartRadius ) {
                 // Yes, the click was inside the chart.
                 // Find the slice that was clicked by comparing angles relative to the chart centre.
                 var clickAngle = Math.atan2( yFromCentre, xFromCentre ) - chartStartAngle;
                 if ( clickAngle < 0 ) clickAngle = 2 * Math.PI + clickAngle;
                 for ( var slice in chartData ) {
                 if ( clickAngle >= chartData[slice]['startAngle'] && clickAngle <= chartData[slice]['endAngle'] ) {
                 // Slice found. Pull it out or push it in, as required.
                 toggleSlice ( slice );
                 return;
                 }
                 }
                 }
                // User must have clicked outside the pie. Push any pulled-out slice back in.
                pushIn();
                }

               /**
                 * Process mouse clicks in the table area.
                 *
                 * Retrieve the slice number from the jQuery data stored in the
                 * clicked table cell, then toggle the slice
                 *
                 * @param Event The click event
                 */

                function handleTableClick ( clickEvent ) {
                 var slice = $(this).data('slice');
                 toggleSlice ( slice );
                }
                  /**
                 * Push a slice in or out.
                 *
                 * If it's already pulled out, push it in. Otherwise, pull it out.
                 *
                 * @param Number The slice index (between 0 and the number of slices - 1)
                 */

                function toggleSlice ( slice ) {
                 if ( slice == currentPullOutSlice ) {
                 pushIn();
                 } else {
                 startPullOut ( slice );
                 }
                }

                /**
                 * Start pulling a slice out from the pie.
                 *
                 * @param Number The slice index (between 0 and the number of slices - 1)
                 */

                function startPullOut ( slice ) {
                 // Exit if we're already pulling out this slice
                if ( currentPullOutSlice == slice ) return;
                // Record the slice that we're pulling out, clear any previous animation, then start the animation
                currentPullOutSlice = slice;
                currentPullOutDistance = 0;
                clearInterval( animationId );
                animationId = setInterval( function() { animatePullOut( slice ); }, pullOutFrameInterval );
                // Highlight the corresponding row in the key table
                $('#chartData td').removeClass('highlight');
                var labelCell = $('#chartData td:eq(' + (slice*2) + ')');
                var valueCell = $('#chartData td:eq(' + (slice*2+1) + ')');
                labelCell.addClass('highlight');
                valueCell.addClass('highlight');
                }
                 /**
                 * Draw a frame of the pull-out animation.
                 *
                 * @param Number The index of the slice being pulled out
                 */

                function animatePullOut ( slice ) {
                // Pull the slice out some more
                currentPullOutDistance += pullOutFrameStep;
                // If we've pulled it right out, stop animating
                if ( currentPullOutDistance >= maxPullOutDistance ) {
                clearInterval( animationId );
                return;
                }
                // Draw the frame
                drawChart();
                }
                 /**
                 * Push any pulled-out slice back in.
                 *
                 * Resets the animation variables and redraws the chart.
                 * Also un-highlights all rows in the table.
                 */

                function pushIn() {
                currentPullOutSlice = -1;
                currentPullOutDistance = 0;
                clearInterval( animationId );
                drawChart();
                $('#chartData td').removeClass('highlight');
                }
                /**
                 * Draw the chart.
                 *
                 * Loop through each slice of the pie, and draw it.
                 */

                function drawChart() {
                // Get a drawing context
                var context = canvas.getContext('2d');
                // Clear the canvas, ready for the new frame
                context.clearRect ( 0, 0, canvasWidth, canvasHeight );
                // Draw each slice of the chart, skipping the pull-out slice (if any)
                for ( var slice in chartData ) {
                if ( slice != currentPullOutSlice ) drawSlice( context, slice );
                }
                // If there's a pull-out slice in effect, draw it.
                // (We draw the pull-out slice last so its drop shadow doesn't get painted over.)
                if ( currentPullOutSlice != -1 ) drawSlice( context, currentPullOutSlice );
                }
                 /**
                 * Draw an individual slice in the chart.
                 *
                 * @param Context A canvas context to draw on
                 * @param Number The index of the slice to draw
                 */

                function drawSlice ( context, slice ) {
                // Compute the adjusted start and end angles for the slice
                var startAngle = chartData[slice]['startAngle']  + chartStartAngle;
                var endAngle = chartData[slice]['endAngle']  + chartStartAngle;
                if ( slice == currentPullOutSlice ) {
                // We're pulling (or have pulled) this slice out.
                // Offset it from the pie centre, draw the text label,
                // and add a drop shadow.
                var midAngle = (startAngle + endAngle) / 2;
                var actualPullOutDistance = currentPullOutDistance * easeOut( currentPullOutDistance/maxPullOutDistance, .8 );
                startX = centreX + Math.cos(midAngle) * actualPullOutDistance;
                startY = centreY + Math.sin(midAngle) * actualPullOutDistance;
                context.fillStyle = 'rgb(' + chartColours[slice].join(',') + ')';
                context.textAlign = "center";
                context.font = pullOutLabelFont;
                context.fillText( chartData[slice]['label'], centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) );
                context.font = pullOutValueFont;
                //context.fillText( pullOutValuePrefix + chartData[slice]['value'] + " (" + ( parseInt( chartData[slice]['value'] / totalValue * 100 + .5 ) ) +  "%)", centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) + 20 );
                context.fillText( pullOutValuePrefix + " (" + ( parseInt( chartData[slice]['value'] / totalValue * 100 + .5 ) ) +  "%)", centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) + 20 );
                context.shadowOffsetX = pullOutShadowOffsetX;
                context.shadowOffsetY = pullOutShadowOffsetY;
                context.shadowBlur = pullOutShadowBlur;
                } else {
                // This slice isn't pulled out, so draw it from the pie centre
                startX = centreX;
                startY = centreY;
                }
                // Set up the gradient fill for the slice
                var sliceGradient = context.createLinearGradient( 0, 0, canvasWidth*.75, canvasHeight*.75 );
                sliceGradient.addColorStop( 0, sliceGradientColour );
                sliceGradient.addColorStop( 1, 'rgb(' + chartColours[slice].join(',') + ')' );
                // Draw the slice
                context.beginPath();
                context.moveTo( startX, startY );
                context.arc( startX, startY, chartRadius, startAngle, endAngle, false );
                context.lineTo( startX, startY );
                context.closePath();
                context.fillStyle = sliceGradient;
                context.shadowColor = ( slice == currentPullOutSlice ) ? pullOutShadowColour : "rgba( 0, 0, 0, 0 )";
                context.fill();
                context.shadowColor = "rgba( 0, 0, 0, 0 )";
                // Style the slice border appropriately
                if ( slice == currentPullOutSlice ) {
                context.lineWidth = pullOutBorderWidth;
                context.strokeStyle = pullOutBorderStyle;
                if(slice == 0){                            
                tvmedia_submit('<%=networkName.get(0)%>');
                }
                else if(slice == 1)
                {
                tvmedia_submit('<%=networkName.get(1)%>');
                }
                else if(slice == 2)
                {
                tvmedia_submit('<%=networkName.get(2)%>');
                }
                else if(slice == 3)
                {
                tvmedia_submit('<%=networkName.get(3)%>');
                }
                else if(slice == 4)
                {
                tvmedia_submit('<%=networkName.get(4)%>');
                }
                else if(slice == 5)
                {
                tvmedia_submit('<%=networkName.get(5)%>');
                }
                else if(slice == 6)
                {
                tvmedia_submit('<%=networkName.get(6)%>');
                }
                else if(slice == 7)
                {
                tvmedia_submit('<%=networkName.get(7)%>');
                }
                else if(slice == 8)
                {
                tvmedia_submit('<%=networkName.get(9)%>');
                }
                else if(slice == 9)
                {
                tvmedia_submit('<%=networkName.get(10)%>');
                }
                else if(slice == 10)
                {
                tvmedia_submit('<%=networkName.get(11)%>');
                }else{}
                } else {
                context.lineWidth = sliceBorderWidth;
                context.strokeStyle = sliceBorderStyle;
                }
                // Draw the slice border
                context.stroke();
                }
                 /**
                 * Easing function.
                 *
                 * A bit hacky but it seems to work! (Note to self: Re-read my school maths books sometime)
                 *
                 * @param Number The ratio of the current distance travelled to the maximum distance
                 * @param Number The power (higher numbers = more gradual easing)
                 * @return Number The new ratio
                 */

                function easeOut( ratio, power ) {
                    return ( Math.pow ( 1 - ratio, power ) + 1 );
                }

            };

        </script>

    </head>
    <body>
 <div id="container1" style="height: auto;margin-top:0px;width: 960px;">
    
  <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>
     
  <div style="margin-top:20px;margin-left: 30px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Network - <font color="#00a9f1">Television</font></font></div><br/>
  <div style="margin-top:40px;margin-left:30px;">

  <div>
          <canvas id="chart" width="480" height="560" style="margin-left: 380px; margin-top: -130px;" ></canvas>
          
          <table id="chartData" style="margin-top: -435px; margin-left: 120px;position:absolute;">

              <tr>
                  <th style="line-height: 1.2em;"><font color="black">Network</font></th><th><font color="black" style="white-space: nowrap;">No.of channels </font></th>
              </tr>

              <%--<tr style="color: #0DA068" onClick="window.location.href='selectbynetworkcity.action'">--%>
              <tr style="color: #d05032" onClick="tvmedia_submit('<%=networkName.get(0)%>');return false">
                  <td><%=networkName.get(0)%></td><td><%=networkCount.get(0)%></td>
              </tr>

              <tr style="color: #bea505" onClick="tvmedia_submit('<%=networkName.get(1)%>');return false">
                  <td><%=networkName.get(1)%></td><td><%=networkCount.get(1)%></td>
              </tr>

              <tr style="color: #799d9e" onClick="tvmedia_submit('<%=networkName.get(2)%>');return false">
                  <td><%=networkName.get(2)%></td><td><%=networkCount.get(2)%></td>
              </tr>

              <tr style="color: #716155" onClick="tvmedia_submit('<%=networkName.get(3)%>');return false">
                  <td><%=networkName.get(3)%></td><td><%=networkCount.get(3)%></td>
              </tr>

              <tr style="color: #71946e" onClick="tvmedia_submit('<%=networkName.get(4)%>');return false">
                  <td><%=networkName.get(4)%></td><td><%=networkCount.get(4)%></td>
              </tr>

              <tr style="color: #b7752c" onClick="tvmedia_submit('<%=networkName.get(5)%>');return false">
                  <td><%=networkName.get(5)%></td><td><%=networkCount.get(5)%></td>
              </tr>

              <tr style="color: #dc8c80" onClick="tvmedia_submit('<%=networkName.get(6)%>');return false">
                  <td><%=networkName.get(6)%></td><td><%=networkCount.get(6)%></td>
              </tr>

              <tr style="color: #736AFF" onClick="tvmedia_submit('<%=networkName.get(7)%>');return false">
                  <td><%=networkName.get(7)%></td><td><%=networkCount.get(7)%></td>
              </tr>

              <%-- <tr style="color: #b7752c" onClick="tvmedia_submit('PAX');return false">
                   <td>PAX</td><td>2</td>
               </tr>--%>

              <tr style="color: #4E9258" onClick="tvmedia_submit('<%=networkName.get(9)%>');return false">
                  <td><%=networkName.get(9)%></td><td><%=networkCount.get(9)%></td>
              </tr>

              <tr style="color: #F87217" onClick="tvmedia_submit('<%=networkName.get(10)%>');return false">
                  <td><%=networkName.get(10)%></td><td><%=networkCount.get(10)%></td>
              </tr>

              <tr style="color: #A74AC7" onClick="tvmedia_submit('<%=networkName.get(11)%>');return false">
                  <td><%=networkName.get(11)%></td><td><%=networkCount.get(11)%></td>
              </tr>

            </table>
            </div>
         
   <s:form name="televisionsubmit" action="tvmediasubmit" action="televisionNetworkSelection">
     <input type="hidden" name="televisionName">
   </s:form>
   <script type="text/javascript">
   function tvmedia_submit(type)
   {
   document.televisionsubmit.televisionName.value=type;
   document.televisionsubmit.submit();
   }

   </script>
  </div> </div>
 
 <% }}%>
 </div>
 </body>
</html>
