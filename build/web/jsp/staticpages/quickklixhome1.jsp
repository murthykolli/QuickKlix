<%-- 
    Document   : quickklixhome
    Created on : 13 Feb, 2014, 2:54:17 PM
    Author     : MurthyK
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset=utf-8 />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <script language="javascript" type="text/javascript" src="/QuickKlix/scripts/jquery-1.6.1.min.js"></script>
        <script language="javascript" type="text/javascript" src="/QuickKlix/scripts/slider/jquery.flexslider.js"></script>
        <link type="text/css" rel="stylesheet" href="/QuickKlix/CSS/homepageSlider.css" />
        <link type="text/css" rel="stylesheet" href="/QuickKlix/CSS/homePageStyle.css" />
        



        <script type="text/javascript">
    $(document).ready(function(){
    $(function(){
      SyntaxHighlighter.all();
    });

      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          }
      });
    });
  </script>

</head>

<body  onLoad="flipper()" class="body_page">    
        
    <div id="container1" style="min-height: 482px;height: auto;margin-top:2px;">
    <div style=" width: 950px;margin-top: -19px;margin-left: 10px;height: auto;"><br/>

        <div class="flexslider" style=" height: 365px;margin-left:0px;margin-top: 13px;width: 950px;border:none;">
          <ul class="slides">
           <li><img src="images/Homepage/HomeImage1.png" style="height: 365px;" alt="legalnod Home Page Image1"/></li>
  	   <li><img src="images/Homepage/HomeImage2.png" style="height: 365px;" alt="legalnod Home Page Image2"/></li>
  	   <li><img src="images/Homepage/HomeImage3.png" style="height: 365px;" alt="legalnod Home Page Image3"/></li>
  	   <li><img src="images/Homepage/HomeImage4.png" style="height: 365px;" alt="legalnod Home Page Image4"/></li>
           <li><img src="images/Homepage/HomeImage5.png" style="height: 365px;" alt="legalnod Home Page Image5"/></li>
           <li><img src="images/Homepage/HomeImage6.png" style="height: 365px;" alt="legalnod Home Page Image6"/></li>
  	  </ul>
        </div>        

        <%--<div style="margin-left: -2px;margin-top: -506px;font-weight: bold;font-family: Cambria, Georgia, serif;width:960px;position: absolute;">
            <p style="text-decoration: none;position:absolute;color: #1c1c1c;text-align: left;font: bold 1.3em/1.25em Cambria;">STEPS</p>
        </div>--%>

        <div style="margin-top: -67px;margin-left:-3px;">
         <img name=image src="images/HomePageDataImg.png" width="960px" alt="Quickklix Home Page Data Image"/>
        </div>

        <div style="margin-left: -20px;margin-top: -505px;width:960px;position: absolute;">
            <p style="text-decoration: none;position:absolute;color: #2c2c2c;margin-left: 23px;text-align: left;font: bold 1.2em/1.25em Cambria;">Step #1</p>
            <p style="text-decoration: none;position:absolute;color: #2c2c2c;margin-left: 350px;text-align: left;font: bold 1.2em/1.25em Cambria;">Step #2</p>
            <p style="text-decoration: none;position:absolute;color: #2c2c2c;margin-left: 700px;text-align: left;font: bold 1.2em/1.25em Cambria;">Step #3</p>
        </div>

        <div style="margin-left: -20px;margin-top: -460px;width:960px;position: absolute;">
            <p style="text-decoration: none;position:absolute;color: black;margin-left: 23px;text-align: left;width:300px;font: 1em/1.25em sans-serif;line-height: 1.25em;">Create a Campaign Plan to help achieve your advertising goals!</p>
            <p style="text-decoration: none;position:absolute;color: black;margin-left: 350px;text-align: left;width:300px;font: 1em/1.25em sans-serif;line-height: 1.25em;">Use our unique data trees to help identify and define your Target Market!</p>
            <p style="text-decoration: none;position:absolute;color: black;margin-left: 700px;text-align: left;width:300px;font: 1em/1.25em sans-serif;line-height: 1.25em;">Construct a Media Plan to determine which media vehicles are effective!</p>
        </div>


        <p style="margin-top: -350px;color:#595959;"><strong><font style="font-size: 35px;">Welcome to </font></strong></p>
        <img src="images/QuickKlix.png" style=" margin-top: 0px;margin-left: -8px;border:none;"/>

        <p style="text-align: justify;width: 340px;margin-top:5px;color:#595959"><font color="#00a9f1">Quick</font><font  color="#292929">Klix's</font> tools will guide you towards achieving your ADVERTISING goals. Our user-friendly interface will allow you to access a wealth of data to help you guide you through the process within moments! Imagine successful results backed by cost effective methods and continued valued service!</p><br/>
        
            <form action="/QuickKlix/userRegistration.action" method="post">
            <div style="margin-left: 408px; margin-top: -230px;">
            <input  align="center" type="image" src="images/QuickKlixSignupImg.png"  Style=" margin-top: 0px;margin-left: 0px;border:none;"/>
            </div>
            </form>

                <div style="margin-top: -213px; margin-left: 647px;">
                <a class="sublime zoomable"  target="_blank" href="http://www.youtube.com/embed/GvcEGk6wUE0?rel=0&autoplay=1" frameborder="0" allowfullscreen>
		<img src="images/QuickklixDemoVedioImg.png" width="307" height="200" alt="Screencast" />
		</a>
                 </div>



        <div style="margin-top: 91px;margin-left:0px;">
         <img name=image src="/QuickKlix/images/quickklix_image_Y6.png" width="960px" alt="legalnod Home Page Data Image"/>
        </div><br/><br/><br/><br/><br/><br/><br/><br/><br/>

            

	</div>
        </div>

</body>
</html>
