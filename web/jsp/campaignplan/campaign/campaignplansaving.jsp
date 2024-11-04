<%-- 
    Document   : campaignplansaving
    Created on : 3 Jun, 2014, 3:48:56 PM
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
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        
       <script type="text/javascript" src="/QuickKlix/scripts/jquery.tablesorter.js"></script>
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
      //alert("not inited");
      return;
     }

        //var oldPageAnchor = document.getElementById('pg'+this.currentPage);
        //oldPageAnchor.className = 'pg-normal';

        this.currentPage = pageNumber;
        //var newPageAnchor = document.getElementById('pg'+this.currentPage);
        //newPageAnchor.className = 'pg-selected';

        var from = (pageNumber - 1) * itemsPerPage + 1;
        var to = from + itemsPerPage - 1;
        this.showRecords(from, to);
    }

    this.prev = function()
    {
    	//alert("Current Page :" + this.currentPage + ">> Pages :" + this.pages);
        if (this.currentPage > 1)
        {
            this.showPage(this.currentPage - 1);
        }
        if(this.currentPage == 1)
        {
        	document.getElementById("cmdPrevId").style.display = "none";
        	document.getElementById("cmdNextId").style.display = "";
        }
        var curPg = eval(this.currentPage);
        var page1 = eval(this.pages);
        //alert("Cur Page :" + curPg + ">> Pages :" + page1);
        if(this.currentPage < this.pages)
        {
        	//alert("Here");
        	document.getElementById("cmdNextId").style.display = "";
        }
    }

    this.next = function()
    {
    	//alert("Current Page :" + this.currentPage + ">> Pages :" + this.pages);
        if (this.currentPage < this.pages)
        {
            this.showPage(this.currentPage + 1);
        }
        document.getElementById("cmdPrevId").style.display = "";
        if(this.currentPage == this.pages)
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
      //alert("not inited");
      return;
     }
     var element = document.getElementById(positionId);
      var pagerHtml ='<table border="0" id="navigation" align="left"> <tr><td align="left" width="130">';
        pagerHtml += '<input type="button"  style="margin-left:0px;" id="cmdPrevId" name="Prev" value="<-- View Prev" onclick="' + pagerName + '.prev();" class="pg-normal"/>  &nbsp; &nbsp; ';
        pagerHtml += '</td><td width="635">&nbsp;<td>';

        pagerHtml += '<td  align="right">';
        pagerHtml += '<input type="button" style="margin-left:0px" id="cmdNextId" name="Next" value="View Next -->" onclick="'+pagerName+'.next();" class="pg-normal"/>';
        pagerHtml += '</td></tr></table>';

        element.innerHTML = pagerHtml;
    }


}

 function onLoadProperties()
    {
    	document.getElementById("cmdPrevId").style.display = "none";
    	alert("Number of Rows :" + document.getElementById("tableLengthId").value);
    	var numnerOfCampaigns = document.getElementById("tableLengthId").value;
    	numnerOfCampaigns = eval(numnerOfCampaigns);
    	if(numnerOfCampaigns < 11)
    	{
    		alert("If");
    		document.getElementById("cmdNextId").style.display = "none";
    	}
    	else
    	{
    		alert("Else");
    		document.getElementById("cmdNextId").style.display = "";
    	}

    	//showPage(1);
    }

    function changeColor(chk){
                if(chk.checked==true || document.campaignFormName.combinationalName[chk].checked==true){
                    var i;
                    var table = document.getElementById('insured_list');
                    if(chk=="[object HTMLInputElement]"){
                    var par=chk.parentNode;
                    while(par.nodeName.toLowerCase()!='tr'){
                        par=par.parentNode;
                    }
                    i=par.rowIndex;
                    }
                    else{
                        i=chk+1;
                    }
                    var rowlen=table.getElementsByTagName('tr').length;
                    for(var k=1;k<=rowlen;k++){
                        var row = table.getElementsByTagName('tr')[k];
                        var cell=row.getElementsByTagName('td');
                        var len=cell.length;
                        if(k==i){
                            for(var j=0;j<len;j++){
                                cell[j].style.backgroundColor="#00a9f1";
                                cell[j].style.color="white";
                            }
                        }
                        else{
                            for(var j=0;j<len;j++){
                                cell[j].style.backgroundColor="";
                                cell[j].style.color="black";
                            } } } } }


            function highlightTableRows(tableId) {
                var table = document.getElementById(tableId);
                var rows = table.getElementsByTagName("tr");
                for (var i=0; i < rows.length; i++) {
                    rows[i].onmouseover = function() {
                        this.style.cursor='pointer';
                        var j=this.rowIndex;
                        var row = table.getElementsByTagName("tr")[j];
                        var cell=row.getElementsByTagName('td');
                        if((rows.length==2 && document.campaignFormName.combinationalName.checked==false) || (document.campaignFormName.combinationalName[j-1].checked==false)){
                            for(var k=0;k<cell.length;k++){
                                cell[k].style.backgroundColor="#00a9f1";
                                cell[k].style.color="white";

                            } }  };
                    rows[i].onmouseout = function() {
                        this.style.cursor='';
                        var j=this.rowIndex;
                        var row = table.getElementsByTagName("tr")[j];
                        var cell=row.getElementsByTagName('td');
                        if((rows.length==2 && document.campaignFormName.combinationalName.checked==false) || (document.campaignFormName.combinationalName[j-1].checked==false)){
                            for(var k=0;k<cell.length;k++){
                                cell[k].style.backgroundColor="";
                                cell[k].style.color="black";
                            } }  };
                    rows[i].onclick=function(){
                        var l=this.rowIndex;
                        if(rows.length==2){
                            var row = table.getElementsByTagName('tr')[l];
                            var cell=row.getElementsByTagName('td');
                            for(var k=0;k<cell.length;k++){
                                cell[k].style.backgroundColor="#00a9f1";
                            }
                            document.campaignFormName.combinationalName.checked=true;

                        }
                        else{
                            document.campaignFormName.combinationalName[l-1].checked=true;
                            changeColor(l-1);
                            } };}  }



</script>
       
       <script defer="pager">
        $(document).ready(function(){
        if("<s:property value="tmExisted"/>" == "TMExisted"){
        alert("This camapaign has a target market, so delete target market first.");    
        }
        });
        </script>



    </head>
    <body class="body_page">
    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 400px;height: auto;border-radius: 30px 30px 0 0;"><br/>

       <div style="margin-top:38px;margin-left: 54px;position: absolute;font-family: Cambria;"><font style="font: bold 1.45em/1em Cambria;color:#595959;">My Account</font></div><br/>

        <table style="margin-left: 24px;margin-top:31px;position: absolute;">
            <tr><td style="border-bottom: 27px solid #7e7e7e;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="manageCampaignsSaving.action" title="Campaigns Saving" style="position: relative;top:25px;cursor: pointer;text-decoration: none;" ><font color="white" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='white';"><b>&nbsp;Campaigns Saving&nbsp;<font style="color: #00A9F1;font: bold 1.0em/1.25em Cambria;"> - <s:property value="campaignCount"/>&nbsp;</font></b></font></a> </td>
                <td style="border-bottom: 27px solid #f1f1f1;border-left: 15px solid transparent;border-right: 15px solid transparent;white-space: nowrap;"> <a href="manageClientsSaving.action" title="Clients Saving" style="position: relative;top:25px;cursor: pointer;text-decoration: none;"><font color="#6f6e6e" style="font: bold 1.15em/1.25em Cambria;" onMouseOver="this.style.color='#00a9f1';" onMouseOut="this.style.color='#6f6e6e';" ><b>&nbsp;Clients Saving&nbsp;<font style="color: #00A9F1;font: bold 1.0em/1.25em Cambria;"> - <s:property value="clientCount"/>&nbsp;</font></b></font></a> </td>
            </tr>
        </table>

     <div style="background: white;border-top:  solid 3px #d0d0d0;border-bottom:  solid 2px #d0d0d0;border-left:  solid 2px #d0d0d0;border-right:  solid 2px #d0d0d0;box-shadow: 4px 4px 1px #dddddd;width: 902px;margin-left: 25px;margin-top: 82px;height: auto;">



         <div style=" min-height: 200px;">

     <s:form  action="campaignManagementSaving" name="campaignFormName" id="campaignFormId">


                <table>
                    <tr>
                        <td width="880px" align="right">
                            <div  style=" margin-top: 0px;margin-left: 0px;"> <font style="font-size: 14px;font-weight:bold;" color="#00a9f1">Total&nbsp;campaigns&nbsp;:&nbsp;<span id="displayCount" style="color: #595959;"></span></font></div>
                        </td>
                    </tr>
                </table>



                <div style="margin-left: 0px;width: 902px;margin-top: -15px;">
                    <div style="margin-left: 20px;width:860px;overflow-x: auto;overflow: auto; overflow-y:hidden;white-space:nowrap;text-overflow:ellipsis;display:inline-block;">

                <display:table  id="insured_list"  class="tablesorter" name="campaignDetailsTakeFromDBToManagement">
                    <display:column headerClass="sortDisabled">
                        <input type="radio" style=" cursor: pointer;" onclick="changeColor(this);" name="combinationalName" value="${insured_list.campaignName}, ${insured_list.campaignClientName}, ${insured_list.missionObjective}, ${insured_list.campaignProducts}, ${insured_list.campaignStartDate}, ${insured_list.campaignEndDate}, ${insured_list.campaignBudget}, ${insured_list.mpStartDate}, ${insured_list.mpEndDate}, ${insured_list.mpBudget}"/>
                    </display:column>
                    <display:column property ="campaignName" title="Campaign Name"/>
                    <display:column property ="campaignClientName" title="Client Name" />
                    <display:column property ="campaignProducts" title="Products" />
                    <display:column property ="campaignStartDate" title="Start Date" />
                    <display:column property ="campaignEndDate" title="End Date" />
                    <display:column property ="campaignBudget" title="Budget" />
                    <display:column property ="createdDate" title="Started On" />
                    <display:column property ="modifiedDate" title="Last Edited" />
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

        <input type="hidden" name="tableLengthName" id="tableLengthId" value="displayCount"/>
        <div id="pageNavPosition"></div>
        <script type="text/javascript"><!--
        var pager = new Pager('insured_list', 10);
        pager.init();
        pager.showPageNav('pager', 'pageNavPosition');
        pager.showPage(1);
        //--></script>

        </div></div>

          <div align="center" style="margin-top: 50px;margin-left: 190px;">
           <table style="margin-left: 0px;margin-top:0px;position: absolute;">
               <tr><td><button type="submit" onclick="return edit()" name="method:campaignModification" onMouseOver="this.style.color='#00a9f1';document.getElementById('ModifyButtonImg1').src='/QuickKlix/images/SSImgs/FormEditMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('ModifyButtonImg1').src='/QuickKlix/images/SSImgs/FormEditImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.3em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" ><img id="ModifyButtonImg1" src="/QuickKlix/images/SSImgs/FormEditImg.png" style="position: relative;margin-top: 1px;"/><font style="top: -2px;position: relative;">&nbsp;MODIFY</font></button></td></tr>
           </table>

           <table style="margin-left: 147px;margin-top: 0px;position: absolute">
               <tr><td><button type="submit"  onclick="return deleteForm();" name="method:deleteCampaign" onMouseOver="this.style.color='#00a9f1';document.getElementById('DeleteButtonImg1').src='/QuickKlix/images/SSImgs/DeleteMOImage.png';" onMouseOut="this.style.color='white';document.getElementById('DeleteButtonImg1').src='/QuickKlix/images/SSImgs/DeleteImage.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.3em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="DeleteButtonImg1" src="/QuickKlix/images/SSImgs/DeleteImage.png" style="position: relative;top: 1px;"/><font style="top: -2px;position: relative;">&nbsp;DELETE</font></button></td></tr>
           </table>

           <table style="margin-left: 287px;margin-top: 0px;position: absolute">
               <tr><td><button type="submit"  name="method:campaignCreation" onMouseOver="this.style.color='#00a9f1';document.getElementById('NewButtonImg1').src='/QuickKlix/images/SSImgs/NewDocCreationMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('NewButtonImg1').src='/QuickKlix/images/SSImgs/NewDocCreationImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 36px; font: bold 1.3em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><img id="NewButtonImg1" src="/QuickKlix/images/SSImgs/NewDocCreationImg.png" style="position: relative;top: 1px;"/><font style="top: -2px;position: relative;">&nbsp;NEW CAMPAIGN</font></button></td></tr>
           </table>
        </div>
         <br/><br/><br/><br/><br/><br/>


      </s:form>

                <font color="white" id="text" size="3"><br><br><br></font>

                 <script>
        window.onload = function(){

        //alert("ON LOAD");
        var count="<s:property value="campaignFormsCount"/>";
        // document.getElementById("cmdPrevId").style.display = "none";
        //alert("CAMPAIGN COUNT :" + count);
        // alert("Number of Rows :" + document.getElementById("tableLengthId").value);
        //var numnerOfCampaigns = document.getElementById("tableLengthId").value;
        var  numnerOfCampaigns = eval(count);
        // alert("numnerOfCampaigns :" + numnerOfCampaigns);
        if(numnerOfCampaigns < 11)
        {
        //alert("If :" + document.getElementById("cmdNextId"));
        if(document.getElementById("cmdNextId") != null)
        {
        //alert("Here");
        document.getElementById("cmdNextId").style.display = "none";
        }
        if(document.getElementById("cmdPrevId") != null)
        {
        //alert("No..Here");
        document.getElementById("cmdPrevId").style.display = "none";
        }
        //document.getElementById("cmdPrevId").style.display = "none";
        }
        else
        {
        //alert("Else");
        document.getElementById("cmdPrevId").style.display = "none";
        document.getElementById("cmdNextId").style.display = "";
        }

       //alert("Count :" + count);
       var radList = document.getElementsByName("combinationalName");
       for (var i = 0; i < radList.length; i++) {
       if(radList[i].checked) radList[i].checked = false;
       }
       var form=document.getElementById("combinationalName");
       var text=document.getElementById("text");
       if(count=="0"){
       form.style.display="none";
       }
       else{
       text.style.display="none";
       var ele =document.getElementById("displayCount");
       var countele = document.createTextNode(count);
       ele.appendChild(countele);
       }
       var table=document.getElementById("insured_list");
       var row = table.getElementsByTagName("tr");
       var text = new Array();
       for(var i=0; i < row.length; i++){
       var column=row[i].getElementsByTagName("td");
       for(var j=0; j < column.length; j++){
       if(j==1){
       //column[j].onclick=function(){modelDisplay(this.innerHTML)}
       //column[j].style.cursor="pointer";
       }   }  }
       delError();
       modifyError();
       approve();

       }

            function deleteForm(){
                var combinationalNames="";
                for(var k=0; k < document.campaignFormName.combinationalName.length; k++)
                {
                    if(document.campaignFormName.combinationalName[k].checked){
                        combinationalNames=document.campaignFormName.combinationalName[k].value;
                    }
                }
                if(document.campaignFormName.combinationalName.checked){
                    combinationalNames=document.campaignFormName.combinationalName.value;
                  }
                if(combinationalNames != ""){
                    combinationalNames = combinationalNames.split(", ");
                    var where_to= confirm("Do you want to delete Campaign "+combinationalNames[0]+" and Client "+combinationalNames[1]+" ?");
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
                    window.alert("Please select a campaign.");
                    return false;
                }
            }
            function edit(){
                var combinationalNames="";
                for(var k=0; k < document.campaignFormName.combinationalName.length; k++)
                {
                    if(document.campaignFormName.combinationalName[k].checked){
                        combinationalNames=document.campaignFormName.combinationalName[k].value;
                    }
                }
                if(document.campaignFormName.combinationalName.checked){
                    combinationalNames=document.campaignFormName.combinationalName.value;
                  }
                if(combinationalNames == ""){
                    window.alert("Please select a campaign.");
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
