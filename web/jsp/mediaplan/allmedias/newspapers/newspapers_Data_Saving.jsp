<%--
    Document   : newspapers_Data_Saving
    Created on : 4 Jul, 2014, 3:44:38 PM
    Author     : murthyk
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>


<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
       <script type="text/javascript" src="/QuickKlix/scripts/jquery.tablesorter.js"></script>
       <script type="text/javascript" src="/QuickKlix/scripts/jquery.tablesorter.pager.js"></script>
       <link rel="stylesheet" href="/QuickKlix/CSS/tableSorter.css" type="text/css" />

       <script type="text/javascript">
        $(document).ready(function(){
               var allMediaRed = "<s:property value="allMediaRedirection"/>";
               if(allMediaRed > 0){
               document.getElementById("AllMediasRedirectionId").style.display='block';
               }
          });
        </script>

       <script type="text/javascript">

  function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;

    this.showRecords = function(from, to) {
        var rows = document.getElementById(tableName).rows;
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
//      var pagerHtml ='<table border="0" id="navigation" align="left"> <tr><td align="left" width="130">';
//        pagerHtml += '<input type="button"  style="margin-left:0px;" id="cmdPrevId" name="Prev" value="<-- View Prev" onclick="' + pagerName + '.prev();" class="pg-normal"/>  &nbsp; &nbsp; ';
//        pagerHtml += '</td><td width="635">&nbsp;<td>';
//        pagerHtml += '<td  align="right">';
//        pagerHtml += '<input type="button" style="margin-left:0px" id="cmdNextId" name="Next" value="View Next -->" onclick="' + pagerName + '.next();" class="pg-normal"/>';
//        pagerHtml += '</td></tr></table>';
//        element.innerHTML = pagerHtml;
            }


        }

        function changeColor(chk) {
            if (chk.checked == true || document.newspaper.newspaperName[chk].checked == true) {
                var i;
                var table = document.getElementById('insured_list');
                if (chk == "[object HTMLInputElement]") {
                    var par = chk.parentNode;
                    while (par.nodeName.toLowerCase() != 'tr') {
                        par = par.parentNode;
                    }
                    i = par.rowIndex;
                }
                else {
                    i = chk + 1;
                }
                var rowlen = table.getElementsByTagName('tr').length;
                for (var k = 1; k <= rowlen; k++) {
                    var row = table.getElementsByTagName('tr')[k];
                    var cell = row.getElementsByTagName('td');
                    var len = cell.length;
                    if (k == i) {
                        for (var j = 0; j < len; j++) {
                            cell[j].style.backgroundColor = "#00a9f1";
                            cell[j].style.color = "white";
                        }
                    }
                    else {
                        for (var j = 0; j < len; j++) {
                            cell[j].style.backgroundColor = "";
                            cell[j].style.color = "black";
                     } } } }
             }

        function highlightTableRows(tableId) {
            var table = document.getElementById(tableId);
            var rows = table.getElementsByTagName("tr");
            for (var i = 1; i < rows.length; i++) {
                rows[i].onmouseover = function() {
                    this.style.cursor = 'pointer';
                    var j = this.rowIndex;
                    var row = table.getElementsByTagName("tr")[j];
                    var cell = row.getElementsByTagName('td');
                    if ((rows.length == 2 && document.newspaper.newspaperName.checked == false) || (document.newspaper.newspaperName[j - 1].checked == false)) {
                        for (var k = 0; k < cell.length; k++) {
                            cell[k].style.backgroundColor = "#00a9f1";
                            cell[k].style.color = "white";

                    }  }  };
                rows[i].onmouseout = function() {
                    this.style.cursor = '';
                    var j = this.rowIndex;
                    var row = table.getElementsByTagName("tr")[j];
                    var cell = row.getElementsByTagName('td');
                    if ((rows.length == 2 && document.newspaper.newspaperName.checked == false) || (document.newspaper.newspaperName[j - 1].checked == false)) {
                        for (var k = 0; k < cell.length; k++) {
                            cell[k].style.backgroundColor = "";
                            cell[k].style.color = "black";
                  }  }  };
                rows[i].onclick = function() {
                    var l = this.rowIndex;
                    if (rows.length == 2) {
                        var row = table.getElementsByTagName('tr')[l];
                        var cell = row.getElementsByTagName('td');
                        for (var k = 0; k < cell.length; k++) {
                            cell[k].style.backgroundColor = "#00a9f1";
                            cell[k].style.color = "white";
                        }
                        document.newspaper.newspaperName.checked = true;

                    }
                    else {
                        document.newspaper.newspaperName[l - 1].checked = true;
                        changeColor(l - 1);
                    } }; } }

       </script>
    </head>
    <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>

       <div style="margin-top:38px;margin-left: 54px;position: absolute;font-family: Cambria;"><font style="font: bold 1.45em/1em Cambria;color:#595959;">Newspapers</font></div><br/>

        <table style="margin-left: 24px;margin-top:31px;position: absolute;">
            <tr><td id="AllMediasRedirectionId" style="display: none;border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="allMediasDataSaving.action" title="All Medias" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;All Medias&nbsp;</b></font></a> </td>
                <td style="border-bottom: 27px solid #7e7e7e;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="newspapersRedirection.action" title="Newspapers" style="position: relative;top:25px;cursor: pointer;text-decoration: none;" ><font color="white" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='white';"><b>&nbsp;Newspapers&nbsp;</b></font></a> </td>
                <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="magazinesRedirection.action" title="Magazines" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;Magazines&nbsp;</b></font></a> </td>
                <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="televisionRedirection.action" title="Television" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;TV&nbsp;</b></font></a> </td>
                <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="radioRedirection.action" title="Radio" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;Radio&nbsp;</b></font></a> </td>
                <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="internetRedirection.action" title="Internet" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;Internet&nbsp;</b></font></a> </td>
                <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="mobileAppsRedirection.action" title="Mobile Apps" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;Mobile Apps&nbsp;</b></font></a> </td>
            </tr>
        </table>

     <div style="background: white;border-top:  solid 3px #d0d0d0;border-bottom:  solid 2px #d0d0d0;border-left:  solid 2px #d0d0d0;border-right:  solid 2px #d0d0d0;box-shadow: 4px 4px 1px #dddddd;width: 902px;margin-left: 25px;margin-top: 82px;height: auto;">

     <div style=" min-height: 250px;">

      <s:form  action="manageNewspapersSaving" name="newspaper" id="newspaper">

               <table> <tr> <td width="880" align="right">
                 <div  style=" margin-top: 0px;margin-left: 0px;"> <font style="font-size: 14px;font-weight:bold;" color="#00a9f1">Total newspapers&nbsp;:&nbsp;<span id="displayCount" style="color: #595959;"></span></font></div>
               </td> </tr> </table>

              <div style="margin-left: 0px;width: 902px;margin-top: -15px;">
                <div style="margin-left: 20px;width:860px;overflow-x: auto;overflow: auto; overflow-y:hidden;white-space:nowrap;text-overflow:ellipsis;display:inline-block;">

                <display:table  id="insured_list"  class="tablesorter" name="npListTakeFromDB" style="width:860px;">
                    <display:column headerClass="sortDisabled">
                        <input type="radio" style=" cursor: pointer;" onclick="changeColor(this);" name="newspaperName" value="${insured_list.npMediaIds}"/>
                    </display:column>
                    <display:column property ="mediaPlanName" title="Media Plan Name"/>
                    <display:column property ="mediaType" title="Media Type"/>
                    <display:column style="white-space:normal;width:440px;float: left;text-align: justify;" property ="newspaperName" title="Media Name" />
                    <display:column property ="mediaPlanStartDate" title="Media Plan Start Date" />
                    <display:column property ="mediaPlanEndDate" title="Media Plan End Date" />
                    <display:column property ="createdDate" title="Started On" />
                    <display:column property ="updatedDate" title="Last Edited" />
                 </display:table>
                 <script type="text/javascript">highlightTableRows("insured_list");</script>
                    </div><br/><br/>
        <div id="pager" class="pager"  style=" margin-top: -30px;">
        <select  class="pagesize" style=" background-color: white; display:none; border-right-color: white;  border-color: white; color: white">
        <option value="10">Select PageLimit</option>
        </select>
        <script defer="pager">
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

        <div align="center" style="margin-top: 60px;margin-left: 300px;">
         <table style="margin-left: 0px;margin-top:0px;position: absolute">
             <tr><td><button type="submit" name="method:mediaModification" onMouseOver="this.style.color='#00a9f1';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOPreviousImg.png';" onMouseOut="this.style.color='white';document.getElementById('BackButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerPreViousImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" onclick="return edit();"><img id="BackButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerPreViousImg.png" style="position: relative;margin-top: 1px;"/> <font style="top: -2px;position: relative;">MODIFY</font></button></td></tr>
         </table>

         <table style="margin-left: 160px;margin-top: 0px;position: absolute">
             <tr><td><button type="submit" name="method:mediaDeletion" onMouseOver="this.style.color='#00a9f1';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerWMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NextButtonImg1').src='/QuickKlix/images/SSImgs/TextPointerImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.4em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" onclick="return deleteForm();"><img id="NextButtonImg1" src="/QuickKlix/images/SSImgs/TextPointerImg.png" style="position: relative;top: 1px;"/> <font style="top: -2px;position: relative;">DELETE</font></button></td></tr>
         </table>
         </div>

          <br/><br/><br/><br/><br/><br/>


      </s:form>


     <script>

        window.onload = function(){
        var count=0;

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

       count=<s:property value="mediaNamesCount"/>;
       var form=document.getElementById("newspaper");
       if(count=="0"){
       form.style.display="none";
       }
       else{
       var ele =document.getElementById("displayCount");
       var countele = document.createTextNode(count);
       ele.appendChild(countele);
       }

       };

            function deleteForm(){
                var mediaName="";
                for(var k=0; k < document.newspaper.newspaperName.length; k++)
                {
                    if(document.newspaper.newspaperName[k].checked){
                        mediaName=document.newspaper.newspaperName[k].value;
                    }
                }
                if(document.newspaper.newspaperName.checked){
                    mediaName=document.newspaper.newspaperName.value;
                  }
                if(mediaName != ""){
                    var where_to= confirm("Do you want to delete the Newspaper(s)?");
                    if (where_to)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else{
                    window.alert("Please select a media name.");
                    return false;
                }
            }

            function edit(){
                var mediaName="";
                for(var k=0; k < document.newspaper.newspaperName.length; k++)
                {
                    if(document.newspaper.newspaperName[k].checked){
                        mediaName=document.newspaper.newspaperName[k].value;
                    }
                }
                if(document.newspaper.newspaperName.checked){
                    mediaName=document.newspaper.newspaperName.value;
                  }
                if(mediaName == ""){
                    window.alert("Please select a media name.");
                    return false;
                }

            }


        </script>
     </div>
     </div>

     <br/><br/><br/><br/><br/><br/>

    </div>
    </div>

</body>
</html>


