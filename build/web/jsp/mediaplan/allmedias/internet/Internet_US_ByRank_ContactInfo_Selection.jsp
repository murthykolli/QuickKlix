<%-- 
    Document   : Internet_US_ByRank_ContactInfo_Selection
    Created on : 23 Jul, 2014, 12:30:13 PM
    Author     : anusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

       <script type="text/javascript" src="/QuickKlix/scripts/jquery.tablesorter.pager.js"></script>
       <link rel="stylesheet" href="/QuickKlix/CSS/tableSorter.css" type="text/css" />

       <script type="text/javascript">

    function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;

    this.showRecords = function(from, to) {
        var rows = document.getElementById(tableName).rows;
        document.internet.selectall.checked=false;
        // i starts from 1 to skip table header row
        for (var i = 1; i < rows.length; i++) {
            if (i < from || i > to)
                rows[i].style.display = 'none';
            else
                rows[i].style.display = '';
        }
    }

    this.showPage = function(pageNumber) {
     if (! this.inited) {
      return;
     }

        this.currentPage = pageNumber;
        var from = (pageNumber - 1) * itemsPerPage + 1;
        var to = from + itemsPerPage - 1;
              this.showRecords(from, to);
          }

          this.prev = function()
          {
              if (this.currentPage > 1)
              {
                  this.showPage(this.currentPage - 1);
              }
              if (this.currentPage == 1)
              {
                  document.getElementById("cmdPrevId").style.display = "none";
                  document.getElementById("cmdNextId").style.display = "";
              }
              var curPg = eval(this.currentPage);
              var page1 = eval(this.pages);
              if (this.currentPage < this.pages)
              {
                  document.getElementById("cmdNextId").style.display = "";
              }
          }

          this.next = function()
          {
              if (this.currentPage < this.pages)
              {
                  this.showPage(this.currentPage + 1);
              }
              document.getElementById("cmdPrevId").style.display = "";
              if (this.currentPage == this.pages)
              {
                  document.getElementById("cmdNextId").style.display = "none";
              }
          }

    this.init = function() {
        var rows = document.getElementById(tableName).rows;
        var records = (rows.length - 1);
        this.pages = Math.ceil(records / itemsPerPage);
        this.inited = true;
    }

    this.showPageNav = function(pagerName, positionId) {
     if (! this.inited) {
      return;
     }
     var element = document.getElementById(positionId);
      var pagerHtml ='<table border="0" id="navigation" align="left"> <tr><td align="left" width="130">';
        pagerHtml += '<input type="button"  style="margin-left:0px;" id="cmdPrevId" name="Prev" value="<-- View Prev" onclick="' + pagerName + '.prev();" class="pg-normal"/>  &nbsp; &nbsp; ';
        pagerHtml += '</td><td width="635">&nbsp;<td>';

        pagerHtml += '<td  align="right">';
                pagerHtml += '<input type="button" style="margin-left:0px" id="cmdNextId" name="Next" value="View Next -->" onclick="' + pagerName + '.next();" class="pg-normal"/>';
                pagerHtml += '</td></tr></table>';

                element.innerHTML = pagerHtml;
            }

        }
        
      function changeColor(chk){
          var table = document.getElementById('insured_list');
          var par=chk.parentNode;
          while(par.nodeName.toLowerCase()!='tr'){
          par=par.parentNode;
          }
          var i=par.rowIndex;

          var row = table.getElementsByTagName('tr')[i];
          var cell=row.getElementsByTagName('td');
          var len=cell.length;
          if(chk.checked==false){
          for(var j=0;j<len;j++){
          cell[j].style.backgroundColor="#00a9f1";
          cell[j].style.color="white";
          }
          }
          else{
          for(var j=0;j<len;j++){
          cell[j].style.backgroundColor="";
          cell[j].style.color="black";
          }  }
       }


       function highlightTableRows(tableId) {
        var table = document.getElementById(tableId);
        var rows = table.getElementsByTagName("tr");
        for (var i=0; i < rows.length; i++) {
        rows[i].onmouseover = function() {
        this.style.cursor='pointer';
        var j=this.rowIndex;
        var row = table.getElementsByTagName("tr")[j];
        var cell=row.getElementsByTagName('td');
        if((rows.length==2 && document.internet.combinationalName.checked==false) || (document.internet.combinationalName[j-1].checked==false)){
        for(var k=0;k<cell.length;k++){
        cell[k].style.backgroundColor="#00a9f1";
        cell[k].style.color="white";

        } }  };
        rows[i].onmouseout = function() {
        this.style.cursor='';
        var j=this.rowIndex;
        var row = table.getElementsByTagName("tr")[j];
        var cell=row.getElementsByTagName('td');
        if((rows.length==2 && document.internet.combinationalName.checked==false) || (document.internet.combinationalName[j-1].checked==false)){
        for(var k=0;k<cell.length;k++){
        cell[k].style.backgroundColor="";
        cell[k].style.color="black";
        } }  };
        rows[i].onclick = function() {
        var l = this.rowIndex;
        
        if (rows.length == 2) {
        var row = table.getElementsByTagName('tr')[l];
        var cell = row.getElementsByTagName('td');
        if(document.internet.combinationalName.checked == false){              
        for (var k = 0; k < cell.length; k++) {
        cell[k].style.backgroundColor = "#00a9f1";
        cell[k].style.color = "white";
        }        
        document.internet.combinationalName.checked = true;
        } else{
        for (var k = 0; k < cell.length; k++) {
        cell[k].style.backgroundColor = "";
        cell[k].style.color = "black";
        }
        document.internet.combinationalName.checked = false;    
        } }
    
        if(document.internet.combinationalName[l - 1].checked == false){
        document.internet.combinationalName[l - 1].checked = true;
        }
        else{
        document.internet.combinationalName[l - 1].checked = false;
        changeColor(l - 1);
        } }; }  }

      function selectAllCheckBoxes(chk){
        var rowArray = new Array();
        var checkboxArray = new Array();
        var rows = document.getElementById("insured_list").getElementsByTagName("tr");
        for(var j=0;j<rows.length;j++) {
        if(rows[j].rowIndex!=0 && rows[j].style.display!="none"){
        rowArray.push(rows[j]);
        checkboxArray.push(rows[j].getElementsByTagName('td')[0].getElementsByTagName('input'));
        }}
        if(chk.checked==true){
        for(var k=0;k<rowArray.length;k++){
        var cell=rowArray[k].getElementsByTagName('td');
        checkboxArray[k][0].checked=true;
        if(checkboxArray[k][0].checked==true){
        for(var l=0;l<cell.length;l++){
        cell[l].style.backgroundColor="#00a9f1";
        cell[l].style.color="white";
        } }  } }

        else{
        for(var k=0;k<rowArray.length;k++){
        var cell=rowArray[k].getElementsByTagName('td');
        checkboxArray[k][0].checked=false;
        if(checkboxArray[k][0].checked==false) {
        for(var l=0;l<cell.length;l++){
        cell[l].style.backgroundColor="";
        cell[l].style.color="black";
        } } }
        }
     }

        </script>

    </head>
    <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
  <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br>

  <div style="margin-top:20px;margin-left: 30px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Contact Info - <font color="#00a9f1">Top Internet Sites in the US by Rank</font></font></div><br>
  <div style="margin-left:20px;">
  <s:form id="internet" name="internet" action="USSitesByRankContactInfoSaving">

      <table border="0" width="870" style="margin-left: 30px;">
          <tr>
              <td>  </td>
              <td colspan="3" align="right"><b><font style="font: bold 1em/0.25em sans-serif;" color="#00a9f1">Total&nbsp;internet&nbsp;sites&nbsp;:&nbsp;<span id="displayCount" style="color: #595959;"></span></font></b></td>
          </tr>
      </table>

      <div style="margin-top:-8px;">
          <div style="margin-left: 10px;width:890px;overflow-x: auto;overflow: auto; overflow-y:hidden;white-space:nowrap;text-overflow:ellipsis;display:inline-block;">
          <display:table  id="insured_list"  class="tablesorter" name="internetUSByRankContactInfo" style="width:890px;">
              <display:column headerClass="sortDisabled" style="width:50px;" title="<input type='checkbox' id='selectall' name='selectall' style='cursor: pointer;margin-left:21px;' onclick='selectAllCheckBoxes(this)'/>" media="html">
                  <input type="checkbox" style=" cursor: pointer;" onclick="changeColor(this);" name="combinationalName" value="${insured_list.mediaTypeId}"/>
              </display:column>
              <display:column property ="internetRank" title="Rank" />
              <display:column property ="websiteName" title="Website Name"/>
              <display:column property ="internetCategory" title="Category" />
              <display:column property ="internetReach" title="Reach" />
              <display:column property ="internetVisitors" title="Unique Visitors" />
              <display:column property ="internetPageViews" title="Page Views" />
              <display:column property ="internetPhoneNo" title="Phone No" />
              <display:column property ="internetFaxNo" title="Fax No" />
              <display:column style="white-space:normal;width:300px;display:inline-block;" property ="internetWebsite" title="Website" />
              <display:column property ="internetEmail" title="Email" />
          </display:table>
          <script type="text/javascript">highlightTableRows("insured_list");</script>

      </div><br><br>

        <div id="pager" class="pager"  style=" margin-top: -30px;">
        <select  class="pagesize" style=" background-color: white; display:none; border-right-color: white;  border-color: white; color: white">
        <option value="10">Select PageLimit</option>
        </select>
        <script defer="pager" type="text/javascript">
        $(document).ready(function()
        {
        $("#insured_list")
        .tablesorter({widthFixed: true, widgets: ['pager']})
        .tablesorterPager({container: $("#pager")});
        }
        );
        </script>

        <div id="pageNavPosition"></div>
        <script type="text/javascript">
        var pager = new Pager('insured_list', 10);
        pager.init();
        pager.showPageNav('pager', 'pageNavPosition');
        pager.showPage(1);
       </script>

      </div></div>

      <div align="center" style="margin-top: 50px;margin-left: 200px;">
          <table style="margin-left: -165px;margin-top:-10px;position: absolute">
              <tr><td><button type="submit" name="method:backMove" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 38px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" alt="BACK" /> <font style="top: -3px;position: relative;">BACK</font></button></td></tr>
          </table>

          <table style="margin-left: 565px;margin-top: -10px;position: absolute">
              <tr><td><button type="submit" name="method:internetUSSaving" onclick="return websiteSelection();" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerWhiteImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 38px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/SaveTextPointerBlueImg.png" alt="SAVE" /> <font style="top: -3px;position: relative;">SAVE</font></button></td></tr>
          </table>
      </div>

  </s:form>


        <script type="text/javascript">
        window.onload = function(){
        var count=<s:property value="internetCount"/>;

        if(count<=1){
         document.getElementById("selectall").style.display='none';
        }
        var  numnerOfCampaigns = eval(count);
        if(numnerOfCampaigns < 11)
        {
        if(document.getElementById("cmdNextId") != null)
        {
        document.getElementById("cmdNextId").style.display = "none";
        }
        if(document.getElementById("cmdPrevId") != null)
        {
        document.getElementById("cmdPrevId").style.display = "none";
        }
        }
        else
        {
        document.getElementById("cmdPrevId").style.display = "none";
        document.getElementById("cmdNextId").style.display = "";
        }

       var form=document.getElementById("internet");
       if(count=="0"){
       form.style.display="none";
       }
       else{
       var ele =document.getElementById("displayCount");
       var countele = document.createTextNode(count);
       ele.appendChild(countele);
       }
       };

        function websiteSelection(){
         var selectedWebsite="";
         for(var k=0; k < document.internet.combinationalName.length; k++)
          {
          if(document.internet.combinationalName[k].checked){
           selectedWebsite=document.internet.combinationalName[k].value;
          }
        }
        if(document.internet.combinationalName.checked){
         selectedWebsite=document.internet.combinationalName.value;
         }
         if(selectedWebsite == ""){
         window.alert("Please select at least one internet website.");
         return false;
         }
        }

       </script>
      </div>
 <br><br><br><br><br><br><br><br>
        </div>
    </div>

</body>
</html>
