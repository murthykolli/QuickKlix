<%-- 
    Document   : radio_Format_Selection
    Created on : 16 Jul, 2014, 4:28:01 PM
    Author     : anusha
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<link type="text/css" rel="stylesheet" href="/QuickKlix/CSS/pichartReportscss.css" />
        <script src="/QuickKlix/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
        <title>Select by Format - Radio | quickklix.com</title>
        
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
              if(session.getAttribute("RadioFormatListInSession")!=null)
            {
                List formatList = (List)session.getAttribute("RadioFormatListInSession");
                if(formatList != null && formatList.size() > 0)
                {
                 ArrayList formatName = new ArrayList();
                 ArrayList radioCount = new ArrayList();
                 formatName=(ArrayList)formatList.get(0);
                 radioCount=(ArrayList)formatList.get(1);
          %>

        <script type="text/javascript">

            // Run the code when the DOM is ready
            $( pieChart );

            function pieChart() {

                // Config settings
                var chartSizePercent = 70;                        // The chart radius relative to the canvas width/height (in percent)
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

                        if(slice == 0)
                        {
                            radiomedia_submit("<%=formatName.get(0)%>");
                        }

                        else if(slice == 1)
                        {
                            radiomedia_submit("<%=formatName.get(1)%>");
                        }
                        else if(slice == 2)
                        {
                            radiomedia_submit("<%=formatName.get(2)%>");
                        }
                        else if(slice == 3)
                        {
                            radiomedia_submit("<%=formatName.get(3)%>");
                        }
                        else if(slice == 4)
                        {
                            radiomedia_submit("<%=formatName.get(4)%>");
                        }
                        else if(slice == 5)
                        {
                            radiomedia_submit("<%=formatName.get(5)%>");
                        }
                        else if(slice == 6)
                        {
                            radiomedia_submit("<%=formatName.get(6)%>");
                        }
                        else if(slice == 7)
                        {
                            radiomedia_submit("<%=formatName.get(7)%>");
                        }
                        else if(slice == 8)
                        {
                            radiomedia_submit("<%=formatName.get(8)%>");
                        }
                        else if(slice == 9)
                        {
                            radiomedia_submit("<%=formatName.get(9)%>");
                        }
                        else if(slice == 10)
                        {
                            radiomedia_submit("<%=formatName.get(10)%>");
                        }
                        else if(slice == 11)
                        {
                            radiomedia_submit("<%=formatName.get(11)%>");
                        }
                        else if(slice == 12)
                        {

                            radiomedia_submit("<%=formatName.get(12)%>");
                        }
                        else if(slice == 13)
                        {
                            radiomedia_submit("<%=formatName.get(13)%>");
                        }
                        else if(slice == 14)
                        {
                            radiomedia_submit("<%=formatName.get(14)%>");
                        }
                        else if(slice == 15)
                        {
                            radiomedia_submit("<%=formatName.get(15)%>");
                        }
                        else if(slice == 16)
                        {
                            radiomedia_submit("<%=formatName.get(16)%>");
                        }
                        else if(slice == 17)
                        {
                            radiomedia_submit("<%=formatName.get(17)%>");
                        }
                        else if(slice == 18)
                        {
                            radiomedia_submit("<%=formatName.get(18)%>");
                        }
                        else if(slice == 19)
                        {
                            radiomedia_submit("<%=formatName.get(19)%>");
                        }
                        else if(slice == 20)
                        {
                            radiomedia_submit("<%=formatName.get(20)%>");
                        }
                        else if(slice == 21)
                        {
                            radiomedia_submit("<%=formatName.get(21)%>");
                        }
                        else if(slice == 22)
                        {
                            radiomedia_submit("<%=formatName.get(22)%>");
                        }
                        else if(slice == 23)
                        {
                            radiomedia_submit("<%=formatName.get(23)%>");
                        }
                        else if(slice == 24)
                        {
                            radiomedia_submit("<%=formatName.get(24)%>");
                        }
                        else if(slice == 25)
                        {
                            radiomedia_submit("<%=formatName.get(25)%>");
                        }
                        else if(slice == 26)
                        {
                            radiomedia_submit("<%=formatName.get(26)%>");
                        }
                        else if(slice == 27)
                        {
                            radiomedia_submit("<%=formatName.get(27)%>");
                        }
                        else if(slice == 28)
                        {
                            radiomedia_submit("<%=formatName.get(28)%>");
                        }
                        else if(slice == 29)
                        {
                            radiomedia_submit("<%=formatName.get(29)%>");
                        }
                        else if(slice == 30)
                        {
                            radiomedia_submit("<%=formatName.get(30)%>");
                        }
                        else if(slice == 31)
                        {
                            radiomedia_submit("<%=formatName.get(31)%>");
                        }
                        else if(slice == 32)
                        {
                            radiomedia_submit("<%=formatName.get(32)%>");
                        }
                        else if(slice == 33)
                        {
                            radiomedia_submit("<%=formatName.get(33)%>");
                        }
                        else if(slice == 34)
                        {
                            radiomedia_submit("<%=formatName.get(34)%>");
                        }
                        else if(slice == 35)
                        {
                            radiomedia_submit("<%=formatName.get(35)%>");
                        }
                        else if(slice == 36)
                        {
                            radiomedia_submit("<%=formatName.get(36)%>");
                        }
                        else if(slice == 37)
                        {
                            radiomedia_submit("<%=formatName.get(37)%>");
                        }
                        else if(slice == 38)
                        {
                            radiomedia_submit("<%=formatName.get(38)%>");
                        }
                        else if(slice == 39)
                        {
                             radiomedia_submit("<%=formatName.get(39)%>");
                        }
                        else if(slice == 40)
                        {
                            radiomedia_submit("<%=formatName.get(40)%>");
                        }
                        else if(slice == 41)
                        {
                            radiomedia_submit("<%=formatName.get(41)%>");
                        }
                        else if(slice == 42)
                        {
                            radiomedia_submit("<%=formatName.get(42)%>");
                        }
                        else if(slice == 43)
                        {
                            radiomedia_submit("<%=formatName.get(43)%>");
                        }
                        else if(slice == 44)
                        {
                            radiomedia_submit("<%=formatName.get(44)%>");
                        }
                        else{
                        }
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
     
  <div style="margin-top:20px;margin-left: 20px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Format - <font color="#00a9f1">Radio</font></font></div><br/>
  <div style="margin-top:40px;margin-left:20px;">
 <div>
          <canvas id="chart" width="520" height="600" style="margin-left: 435px; margin-top: -30px;" ></canvas>
                    
          <table id="chartData" style="margin-top: -580px; margin-left: 20px;width:220px;">

              <tr>
                  <th style="line-height:1.2em;"><font color="black" style="white-space: nowrap;">Radio Category</font></th><th><font color="black">No.of Stations</font></th>
              </tr>

              <tr style="color: #566D7E" onClick="radiomedia_submit('<%=formatName.get(0)%>');return false">
                  <td><%=formatName.get(0)%></td><td><%=radioCount.get(0)%></td>
              </tr>

              <tr style="color: #C11B17" onClick="radiomedia_submit('<%=formatName.get(1)%>');return false">
                  <td><%=formatName.get(1)%></td><td><%=radioCount.get(1)%></td>
              </tr>

              <tr style="color: #893BFF" onClick="radiomedia_submit('<%=formatName.get(2)%>');return false">
                  <td><%=formatName.get(2)%></td><td><%=radioCount.get(2)%></td>
              </tr>

              <tr style="color: #342D7E" onClick="radiomedia_submit('<%=formatName.get(3)%>');return false">
                  <td><%=formatName.get(3)%></td><td><%=radioCount.get(3)%></td>
              </tr>

              <tr style="color: #0041C2" onClick="radiomedia_submit('<%=formatName.get(4)%>');return false">
                  <td><%=formatName.get(4)%></td><td><%=radioCount.get(4)%></td>
              </tr>

              <tr style="color: #E67451" onClick="radiomedia_submit('<%=formatName.get(5)%>');return false">
                  <td><%=formatName.get(5)%></td><td><%=radioCount.get(5)%></td>
              </tr>

              <tr style="color: #2B60DE" onClick="radiomedia_submit('<%=formatName.get(6)%>');return false">
                  <td><%=formatName.get(6)%></td><td><%=radioCount.get(6)%></td>
              </tr>

              <tr style="color: #6960EC" onClick="radiomedia_submit('<%=formatName.get(7)%>');return false">
                  <td><%=formatName.get(7)%></td><td><%=radioCount.get(7)%></td>
              </tr>

              <tr style="color: #368BC1" onClick="radiomedia_submit('<%=formatName.get(8)%>');return false">
                  <td><%=formatName.get(8)%></td><td><%=radioCount.get(8)%></td>
              </tr>

              <tr style="color: #7D0552" onClick="radiomedia_submit('<%=formatName.get(9)%>');return false">
                  <td><%=formatName.get(9)%></td><td><%=radioCount.get(9)%></td>
              </tr>
              <tr style="color: #2B547E" onClick="radiomedia_submit('<%=formatName.get(10)%>');return false">
                  <td><%=formatName.get(10)%></td><td><%=radioCount.get(10)%></td>
              </tr>

              <tr style="color: #1589FF" onClick="radiomedia_submit('<%=formatName.get(11)%>');return false">
                  <td><%=formatName.get(11)%></td><td><%=radioCount.get(11)%></td>
              </tr>

              <tr style="color: #3EA99F" onClick="radiomedia_submit('<%=formatName.get(12)%>');return false">
                  <td><%=formatName.get(12)%></td><td><%=radioCount.get(12)%></td>
              </tr>

              <tr style="color: #808000" onClick="radiomedia_submit('<%=formatName.get(13)%>');return false">
                  <td><%=formatName.get(13)%></td><td><%=radioCount.get(13)%></td>
              </tr>

              <tr style="color: #008080" onClick="radiomedia_submit('<%=formatName.get(14)%>');return false">
                  <td><%=formatName.get(14)%></td><td><%=radioCount.get(14)%></td>
              </tr>
          

              <%--<tr>
                  <th style="line-height:1.2em;"><font color="black">Radio Category</font></th><th><font color="black">No.of Stations</font></th>
              </tr>--%>

              <tr style="color: #728C00" onClick="radiomedia_submit('<%=formatName.get(15)%>');return false">
                  <td><%=formatName.get(15)%></td><td><%=radioCount.get(15)%></td>
              </tr>

              <tr style="color: #306754" onClick="radiomedia_submit('<%=formatName.get(16)%>');return false">
                  <td><%=formatName.get(16)%></td><td><%=radioCount.get(16)%></td>
              </tr>

              <tr style="color: #437C17" onClick="radiomedia_submit('<%=formatName.get(17)%>');return false">
                  <td><%=formatName.get(17)%></td><td><%=radioCount.get(17)%></td>
              </tr>

              <tr style="color: #4AA02C" onClick="radiomedia_submit('<%=formatName.get(18)%>');return false">
                  <td><%=formatName.get(18)%></td><td><%=radioCount.get(18)%></td>
              </tr>

              <tr style="color: #FFA62F" onClick="radiomedia_submit('<%=formatName.get(19)%>');return false">
                  <td><%=formatName.get(19)%></td><td><%=radioCount.get(19)%></td>
              </tr>
              <tr style="color: #D4A017" onClick="radiomedia_submit('<%=formatName.get(20)%>');return false">
                  <td><%=formatName.get(20)%></td><td><%=radioCount.get(20)%></td>
              </tr>

              <tr style="color: #806517" onClick="radiomedia_submit('<%=formatName.get(21)%>');return false">
                  <td><%=formatName.get(21)%></td><td><%=radioCount.get(21)%></td>
              </tr>

              </table>

              <table id="chartData" style="margin-top: -543px; margin-left: 0px;width:190px;">

              <tr style="color: #493D26" onClick="radiomedia_submit('<%=formatName.get(22)%>');return false">
                  <td><%=formatName.get(22)%></td><td><%=radioCount.get(22)%></td>
              </tr>

              <tr style="color: #7F5217" onClick="radiomedia_submit('<%=formatName.get(23)%>');return false">
                  <td><%=formatName.get(23)%></td><td><%=radioCount.get(23)%></td>
              </tr>
              <tr style="color: #C35817" onClick="radiomedia_submit('<%=formatName.get(24)%>');return false">
                  <td><%=formatName.get(24)%></td><td><%=radioCount.get(24)%></td>
              </tr>

              <tr style="color: #F87217" onClick="radiomedia_submit('<%=formatName.get(25)%>');return false">
                  <td><%=formatName.get(25)%></td><td><%=radioCount.get(25)%></td>
              </tr>

              

              <tr style="color: #1569C7" onClick="radiomedia_submit('<%=formatName.get(26)%>');return false">
                  <td><%=formatName.get(26)%></td><td><%=radioCount.get(26)%></td>
              </tr>
              <tr style="color: #E77471" onClick="radiomedia_submit('<%=formatName.get(27)%>');return false">
                  <td><%=formatName.get(27)%></td><td><%=radioCount.get(27)%></td>
              </tr>

              <tr style="color: #008000" onClick="radiomedia_submit('<%=formatName.get(28)%>');return false">
                  <td><%=formatName.get(28)%></td><td><%=radioCount.get(28)%></td>
              </tr>

              <tr style="color: #8C001A" onClick="radiomedia_submit('<%=formatName.get(29)%>');return false">
                  <td><%=formatName.get(29)%></td><td><%=radioCount.get(29)%></td>
              </tr>

         
              <tr style="color: #3090C7" onClick="radiomedia_submit('<%=formatName.get(30)%>');return false">
                  <td><%=formatName.get(30)%></td><td><%=radioCount.get(30)%></td>
              </tr>

              <tr style="color: #C12283" onClick="radiomedia_submit('<%=formatName.get(31)%>');return false">
                  <td><%=formatName.get(31)%></td><td><%=radioCount.get(31)%></td>
              </tr>

              <tr style="color: #571B7E" onClick="radiomedia_submit('<%=formatName.get(32)%>');return false">
                  <td><%=formatName.get(32)%></td><td><%=radioCount.get(32)%></td>
              </tr>

              <tr style="color: #5E5A80" onClick="radiomedia_submit('<%=formatName.get(33)%>');return false">
                  <td><%=formatName.get(33)%></td><td><%=radioCount.get(33)%></td>
              </tr>

              <tr style="color: #7D1B7E" onClick="radiomedia_submit('<%=formatName.get(34)%>');return false">
                  <td><%=formatName.get(34)%></td><td><%=radioCount.get(34)%></td>
              </tr>

              <tr style="color: #6C2DC7" onClick="radiomedia_submit('<%=formatName.get(35)%>');return false">
                  <td><%=formatName.get(35)%></td><td><%=radioCount.get(35)%></td>
              </tr>

              <tr style="color: #8D38C9" onClick="radiomedia_submit('<%=formatName.get(36)%>');return false">
                  <td><%=formatName.get(36)%></td><td><%=radioCount.get(36)%></td>
              </tr>

              <tr style="color: #2B547E" onClick="radiomedia_submit('<%=formatName.get(37)%>');return false">
                  <td><%=formatName.get(37)%></td><td><%=radioCount.get(37)%></td>
              </tr>

              <tr style="color: #B041FF" onClick="radiomedia_submit('<%=formatName.get(38)%>');return false">
                  <td><%=formatName.get(38)%></td><td><%=radioCount.get(38)%></td>
              </tr>

              <tr style="color: #4863A0" onClick="radiomedia_submit('<%=formatName.get(39)%>');return false">
                  <td><%=formatName.get(39)%></td><td><%=radioCount.get(39)%></td>
              </tr>
              <tr style="color: #306EFF" onClick="radiomedia_submit('<%=formatName.get(40)%>');return false">
                  <td><%=formatName.get(40)%></td><td><%=radioCount.get(40)%></td>
              </tr>

              <tr style="color: #FFA500" onClick="radiomedia_submit('<%=formatName.get(41)%>');return false">
                  <td><%=formatName.get(41)%></td><td><%=radioCount.get(41)%></td>
              </tr>

              <tr style="color: #4CC417" onClick="radiomedia_submit('<%=formatName.get(42)%>');return false">
                  <td><%=formatName.get(42)%></td><td><%=radioCount.get(42)%></td>
              </tr>

              <tr style="color: #43C6DB" onClick="radiomedia_submit('<%=formatName.get(43)%>');return false">
                  <td><%=formatName.get(43)%></td><td><%=radioCount.get(43)%></td>
              </tr>

              <tr style="color: #FFA62F" onClick="radiomedia_submit('<%=formatName.get(44)%>');return false">
                  <td><%=formatName.get(44)%></td><td><%=radioCount.get(44)%></td>
              </tr>

          </table>
          
          <%
                }}
          %>
         </div>
         
        <s:form name="radiosubmit" action="radioFormatSelection">
        <input type="hidden" name="radioFormat">
        </s:form>
        
        <script type="text/javascript">
        function radiomedia_submit(type)
        {
        document.radiosubmit.radioFormat.value = type;
        document.radiosubmit.submit();
        }

        </script>
        </div>
        <br/><br/><br/><br/><br/><br/><br/><br/>
  </div></div>
 </body>
</html>

