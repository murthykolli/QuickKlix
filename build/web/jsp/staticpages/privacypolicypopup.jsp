<%-- 
    Document   : privacypolicypopup
    Created on : 2 Sep, 2013, 11:03:37 AM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <title>Privacy Policy</title>
        
  <style>
  .modal {
    background-color: none;
    color: black;   
    padding: 10px;
    display: block;
    position: absolute;
    top: 20px;
    left: 300px;
    width: 750px;
    height: 1800px;

  }
  .background {
  background-color: black;
  width: 100%;
  min-height: 330%;
  overflow: hidden;
  position: absolute;
  top: 0;
  left: 0;
  color: white;
}

  </style>
</head>

<body>
  <div class="background"></div>
  <div class="modal">
      <img src="/QuickKlix/images/closeimg.jpeg" title="Close" style="margin-left: 728px;margin-top: 2px;position: absolute;cursor: pointer;" OnClick="self.close()" alt="Close"/>
      <img src="/QuickKlix/images/PrivacyPolicyImg.png" alt="PrivacyPolicyImg"/>


  </div>

</body>
</html>
