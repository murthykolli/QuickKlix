
<%--
    Document   : newspapers_State_Selection
    Created on : 4 Jul, 2014, 2:52:09 PM
    Author     : murthyk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/QuickKlix/CSS/mpmapmouseover.css" rel="stylesheet" type="text/css" />
        <script language="javascript" src="/QuickKlix/scripts/mouseoverfunctionality.js"></script>
        <link rel="shortcut icon" href="/QuickKlix/images/BTabIcon/favicon.ico" type="image/x-icon" />
        <link href="/QuickKlix/CSS/chromemapmouseover.css" rel="stylesheet" type="text/chrome/safari" />
        <script>
            function autoGenerateVarFromArray(srcArray, varNamePrefix){
            var i = 0
            while(i < srcArray.length){
            this[varNamePrefix +'_' + i] = srcArray[i];
            i++;
            }
            }
        </script>

        <script>
        function populateState(object){
	document.getElementById("stateSelectionId").style.visibility = "visible";
        var objectName = object.name;
	var objectId = object.id;        
	var selector = document.getElementById('stateLstBox');
	var listLength = selector.length;
	listLength = Number(listLength);
	// If 'Select All' button is clicked
	if(objectId == "cmdSelectAllId"){
            
	if(listLength > 0){
	deleteAllStatesFromList();
	}

	var opt       = document.createElement('option');
	opt.value     = "Alabama";
	opt.innerHTML = "Alabama";
	selector.appendChild(opt);

	var opt1       = document.createElement('option');
	opt1.value     = "Alaska";
	opt1.innerHTML = "Alaska";
	selector.appendChild(opt1);

	var opt2       = document.createElement('option');
	opt2.value     = "Arizona";
	opt2.innerHTML = "Arizona";
	selector.appendChild(opt2);

        var opt3       = document.createElement('option');
	opt3.value     = "Arkansas";
	opt3.innerHTML = "Arkansas";
	selector.appendChild(opt3);

	var opt4       = document.createElement('option');
	opt4.value     = "California";
	opt4.innerHTML = "California";
	selector.appendChild(opt4);

	var opt5       = document.createElement('option');
	opt5.value     = "Colorado";
	opt5.innerHTML = "Colorado";
	selector.appendChild(opt5);

        var opt6       = document.createElement('option');
	opt6.value     = "Connecticut";
	opt6.innerHTML = "Connecticut";
	selector.appendChild(opt6);

	var opt7       = document.createElement('option');
	opt7.value     = "Delaware";
	opt7.innerHTML = "Delaware";
	selector.appendChild(opt7);

        var opt9       = document.createElement('option');
	opt9.value     = "Florida";
	opt9.innerHTML = "Florida";
	selector.appendChild(opt9);

	var opt10       = document.createElement('option');
	opt10.value     = "Georgia";
	opt10.innerHTML = "Georgia";
	selector.appendChild(opt10);

	var opt11       = document.createElement('option');
	opt11.value     = "Hawaii";
	opt11.innerHTML = "Hawaii";
	selector.appendChild(opt11);

        var opt12       = document.createElement('option');
	opt12.value     = "Idaho";
	opt12.innerHTML = "Idaho";
	selector.appendChild(opt12);

	var opt13       = document.createElement('option');
	opt13.value     = "Illinois";
	opt13.innerHTML = "Illinois";
	selector.appendChild(opt13);

	var opt14       = document.createElement('option');
	opt14.value     = "Indiana";
	opt14.innerHTML = "Indiana";
	selector.appendChild(opt14);

        var opt15       = document.createElement('option');
	opt15.value     = "Iowa";
	opt15.innerHTML = "Iowa";
	selector.appendChild(opt15);

	var opt16       = document.createElement('option');
	opt16.value     = "Kansas";
	opt16.innerHTML = "Kansas";
	selector.appendChild(opt16);

	var opt17       = document.createElement('option');
	opt17.value     = "Kentucky";
	opt17.innerHTML = "Kentucky";
	selector.appendChild(opt17);

        var opt18       = document.createElement('option');
	opt18.value     = "Louisiana";
	opt18.innerHTML = "Louisiana";
	selector.appendChild(opt18);

	var opt19       = document.createElement('option');
	opt19.value     = "Maine";
	opt19.innerHTML = "Maine";
	selector.appendChild(opt19);

	var opt20       = document.createElement('option');
	opt20.value     = "Maryland";
	opt20.innerHTML = "Maryland";
	selector.appendChild(opt20);

        var opt21       = document.createElement('option');
	opt21.value     = "Massachusetts";
	opt21.innerHTML = "Massachusetts";
	selector.appendChild(opt21);

	var opt22       = document.createElement('option');
	opt22.value     = "Michigan";
	opt22.innerHTML = "Michigan";
	selector.appendChild(opt22);

	var opt23       = document.createElement('option');
	opt23.value     = "Minnesota";
	opt23.innerHTML = "Minnesota";
	selector.appendChild(opt23);

        var opt24       = document.createElement('option');
	opt24.value     = "Mississippi";
	opt24.innerHTML = "Mississippi";
	selector.appendChild(opt24);

	var opt25       = document.createElement('option');
	opt25.value     = "Missouri";
	opt25.innerHTML = "Missouri";
	selector.appendChild(opt25);

	var opt26       = document.createElement('option');
	opt26.value     = "Montana";
	opt26.innerHTML = "Montana";
	selector.appendChild(opt26);

        var opt27       = document.createElement('option');
	opt27.value     = "Nebraska";
	opt27.innerHTML = "Nebraska";
	selector.appendChild(opt27);

	var opt28      = document.createElement('option');
	opt28.value     = "Nevada";
	opt28.innerHTML = "Nevada";
	selector.appendChild(opt28);

	var opt29       = document.createElement('option');
	opt29.value     = "New Hampshire";
	opt29.innerHTML = "New Hampshire";
	selector.appendChild(opt29);

        var opt30       = document.createElement('option');
	opt30.value     = "New Jersey";
	opt30.innerHTML = "New Jersey";
	selector.appendChild(opt30);

	var opt31       = document.createElement('option');
	opt31.value     = "New Mexico";
	opt31.innerHTML = "New Mexico";
	selector.appendChild(opt31);

	var opt32       = document.createElement('option');
	opt32.value     = "New York";
	opt32.innerHTML = "New York";
	selector.appendChild(opt32);

        var opt33       = document.createElement('option');
	opt33.value     = "North Carolina";
	opt33.innerHTML = "North Carolina";
	selector.appendChild(opt33);

	var opt34       = document.createElement('option');
	opt34.value     = "North Dakota";
	opt34.innerHTML = "North Dakota";
	selector.appendChild(opt34);

	var opt35       = document.createElement('option');
	opt35.value     = "Ohio";
	opt35.innerHTML = "Ohio";
	selector.appendChild(opt35);

        var opt36       = document.createElement('option');
	opt36.value     = "Oklahoma";
	opt36.innerHTML = "Oklahoma";
	selector.appendChild(opt36);

	var opt37       = document.createElement('option');
	opt37.value     = "Oregon";
	opt37.innerHTML = "Oregon";
	selector.appendChild(opt37);

	var opt38       = document.createElement('option');
	opt38.value     = "Pennsylvania";
	opt38.innerHTML = "Pennsylvania";
	selector.appendChild(opt38);

        var opt39       = document.createElement('option');
	opt39.value     = "Rhode Island";
	opt39.innerHTML = "Rhode Island";
	selector.appendChild(opt39);

        var opt40       = document.createElement('option');
	opt40.value     = "South Carolina";
	opt40.innerHTML = "South Carolina";
	selector.appendChild(opt40);

	var opt41       = document.createElement('option');
	opt41.value     = "South Dakota";
	opt41.innerHTML = "South Dakota";
	selector.appendChild(opt41);

        var opt42       = document.createElement('option');
	opt42.value     = "Tennessee";
	opt42.innerHTML = "Tennessee";
	selector.appendChild(opt42);

	var opt43       = document.createElement('option');
	opt43.value     = "Texas";
	opt43.innerHTML = "Texas";
	selector.appendChild(opt43);

        var opt44      = document.createElement('option');
	opt44.value     = "Utah";
	opt44.innerHTML = "Utah";
	selector.appendChild(opt44);

        var opt45       = document.createElement('option');
	opt45.value     = "Vermont";
	opt45.innerHTML = "Vermont";
	selector.appendChild(opt45);

	var opt46       = document.createElement('option');
	opt46.value     = "Virginia";
	opt46.innerHTML = "Virginia";
	selector.appendChild(opt46);

	var opt47       = document.createElement('option');
	opt47.value     = "Washington";
	opt47.innerHTML = "Washington";
	selector.appendChild(opt47);

        var opt48       = document.createElement('option');
	opt48.value     = "West Virginia";
	opt48.innerHTML = "West Virginia";
	selector.appendChild(opt48);

	var opt49       = document.createElement('option');
	opt49.value     = "Wisconsin";
	opt49.innerHTML = "Wisconsin";
	selector.appendChild(opt49);

	var opt50       = document.createElement('option');
	opt50.value     = "Wyoming";
	opt50.innerHTML = "Wyoming";
	selector.appendChild(opt50);
        }
// If a hot spot on imageis clicked
	else{
	var result = "";
	var myTokens = objectId.split( "-" );
  	var stateCd = "";
  	var stateName = "";
  	stateCd = myTokens[0];
  	stateName = myTokens[1];
  	var isStateAlreadExists = false;
  	for (var i = 0; i < selector.length; i++){
        result += "\n " + selector.options[i].text;
        if(stateName == selector.options[i].text){
	isStateAlreadExists = true;
 	}
  	}
  	if(!isStateAlreadExists){
	var stateToAdd = document.createElement('option');
	stateToAdd.value     = stateCd;
	stateToAdd.innerHTML = stateName;
	selector.appendChild(stateToAdd);
	} } }

	function deleteAllStatesFromList(){
	var selector = document.getElementById('stateLstBox');
	var listLength = selector.length;
        listLength = Number(listLength);

	for (var i=selector.options.length-1; i>=0; i--){
    	selector.options[i] = null;
  	}
        selector.selectedIndex = -1;
 	}

	function deleteState(object) {
        var selector = document.getElementById('stateLstBox');
        if(selector.options.length == 0) {
        window.alert("Please select at least one state.");
        return false;
        }
        var lanth1 = selector.options.length;
        var i;            
        for(i=selector.options.length-1;i>=0;i--) {
        if(selector.options[i].selected){
        selector.remove(i);
        }
        }            
        var lanth2 = selector.options.length;            
        if(lanth1 == lanth2){
        window.alert("Please select at least one state.");    
        }
        selector = document.getElementById('stateLstBox');
        if(selector.options.length == 0) {
        document.getElementById("stateSelectionId").style.visibility = "show";
        }
	}

	window.onload=function(){
	document.getElementById("stateSelectionId").style.visibility = "show";
        var someString = '<s:property value="tmMapCount"/>';
        autoGenerateVarFromArray(someString.split(', '), 'mcount');

        var mapmouseover1=this.mcount_0;
        var mapmouseoverval=mapmouseover1.split("[");
        mapmouseovers1=mapmouseoverval[1];
        mapmouseover2=this.mcount_1;
        mapmouseover3=this.mcount_2;
        mapmouseover4=this.mcount_3;
        mapmouseover5=this.mcount_4;
        mapmouseover6=this.mcount_5;
        mapmouseover7=this.mcount_6;
        mapmouseover8=this.mcount_7;
        mapmouseover9=this.mcount_8;
        mapmouseover10=this.mcount_9;
        mapmouseover11=this.mcount_10;

        mapmouseover12=this.mcount_11;
        mapmouseover13=this.mcount_12;
        mapmouseover14=this.mcount_13;
        mapmouseover15=this.mcount_14;
        mapmouseover16=this.mcount_15;
        mapmouseover17=this.mcount_16;
        mapmouseover18=this.mcount_17;
        mapmouseover19=this.mcount_18;
        mapmouseover20=this.mcount_19;
        mapmouseover21=this.mcount_20;

        mapmouseover22=this.mcount_21;
        mapmouseover23=this.mcount_22;
        mapmouseover24=this.mcount_23;
        mapmouseover25=this.mcount_24;
        mapmouseover26=this.mcount_25;
        mapmouseover27=this.mcount_26;
        mapmouseover28=this.mcount_27;
        mapmouseover29=this.mcount_28;
        mapmouseover30=this.mcount_29;
        mapmouseover31=this.mcount_30;

        mapmouseover32=this.mcount_31;
        mapmouseover33=this.mcount_32;
        mapmouseover34=this.mcount_33;
        mapmouseover35=this.mcount_34;
        mapmouseover36=this.mcount_35;
        mapmouseover37=this.mcount_36;
        mapmouseover38=this.mcount_37;
        mapmouseover39=this.mcount_38;
        mapmouseover40=this.mcount_39;

        mapmouseover41=this.mcount_40;
        mapmouseover42=this.mcount_41;
        mapmouseover43=this.mcount_42;
        mapmouseover44=this.mcount_43;
        mapmouseover45=this.mcount_44;
        mapmouseover46=this.mcount_45;
        mapmouseover47=this.mcount_46;
        mapmouseover48=this.mcount_47;
        mapmouseover49=this.mcount_48;
        mapmouseover50=this.mcount_49;
        var mapmouseoverval1=mapmouseover50.split("]");
        mapmouseovers51=mapmouseoverval1[0];
        };

        function stateValidation(){
        var ret=false;
        var selector = document.getElementById('stateLstBox');
        if(selector.options.length == 0){
        window.alert("Please select at least one state.");
        return false;
	}
        else{
        for (var i=0; i<selector.options.length; i++){
        selector.options[i].selected = true;
        }
        ret = true;
        }
        return ret;
        }
        </script>
        
    </head>
    <body>

    <div id="container1" style="height: auto;margin-top:0px;">
    <div style="background-color: white;width: 950px;margin-top: 30px;margin-left: 10px;min-height: 500px;height: auto;border-radius: 30px 30px 0 0;"><br/>

    <div style="margin-top:40px;margin-left: 40px;font-family: Calibri;font-size: 22px;"><font style="font-family: Calibri;font-size: 22px;font-weight: bold;color:#6f6d6d;">Select by Location - <font color="#00a9f1">Target Market</font></font></div><br/>

    <div style=" margin-left: 640px; margin-top: 55px;font-weight: bold; font-family:ariar narrow ;"><font size="3" color="#595959"><b>Selected States</b></font></div>

    <div style=" margin-left: 80px; margin-top: 50px;">
        <br/>
    <s:form name="selection" action="tmSelectByState">

        <TR>
        <TD align="center"><IMG align="center" style="margin-top: -225px;height:258px; width:388px;" border="0" src="/QuickKlix/images/mediaplan/USAMap.png" alt="USA Map" usemap="#USMap">
        <MAP name=usmap>

        <AREA shape=POLY alt="Alabama" id="Alabama-Alabama" title="Alabama" coords=259,153,275,152,283,185,265,186,265,194,259,192
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Alabama Population : '+mapmouseovers1, this, event, 'auto')" style="border: none;" >
        <AREA shape=POLY  alt="Alaska" id="Alaska-Alaska" title="Alaska" coords=73,191,101,191,112,230,89,229,80,248,63,225,75,218,68,198
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Alaska Population : '+mapmouseover2, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Arizona" id="Arizona-Arizona" title="Arizona" coords=65,126,98,131,93,180,51,162
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Arizona Population : '+mapmouseover3, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Arkansas" id="Arkansas-Arkansas" title="Arkansas" coords=210,140,237,139,243,147,234,174,209,173
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Arkansas Population : '+mapmouseover4, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="California" id="California-California" title="California" coords=4,63,30,70,22,96,54,142,48,159,33,155,25,141,13,129
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('California Population : '+mapmouseover5, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Colorado" id="Colorado-Colorado" title="Colorado" coords=105,94,152,101,149,133,103,128
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Colorado Population : '+mapmouseover6, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Connecticut" id="Connecticut-Connecticut" title="Connecticut" coords=362,123,384,123,384,135,363,135
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Connecticut Population : '+mapmouseover7, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Delaware" id="Delaware-Delaware" title="Delaware" coords=362,153,384,153,384,165,362,165
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Delaware Population : '+mapmouseover8, this, event, 'auto')" style="border: none;"><%--
        <AREA shape=POLY alt="District of Columbia" id="District of Columbia-District of Columbia" title="District of Columbia" coords=363,183,384,183,384,196,361,196
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('District of Columbia Population : '+mapmouseover, this, event, 'auto')" style="border: none;">--%>
        <AREA shape=POLY alt="Florida" id="Florida-Florida" title="Florida" coords=268,188,314,188,333,223,328,235,306,206,298,193,287,195
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Florida Population : '+mapmouseover9, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Georgia" id="Georgia-Georgia" title="Georgia" coords=277,151,293,149,315,172,311,186,286,184
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Georgia Population : '+mapmouseover10, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt= alt="Hawaii" id="Hawaii-Hawaii" title="Hawaii" coords=11,185,30,185,29,201,8,199  
               href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Hawaii Population : '+mapmouseover11, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Idaho" id="Idaho-Idaho" title="Idaho" coords=67,12,73,14,77,47,87,61,96,57,90,79,53,71,64,40
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Idaho Population : '+mapmouseover12, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Illinois" id="Illinois-Illinois" title="Illinois" coords=238,84,255,84,256,120,247,131,230,101
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Illinois Population : '+mapmouseover13, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Indiana" id="Indiana-Indiana" title="Indiana" coords=257,90,272,88,277,112,271,122,257,123
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Indiana Population : '+mapmouseover14, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Iowa" id="Iowa-Iowa" title="Iowa" coords=195,75,229,75,238,90,228,100,199,100
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Iowa Population : '+mapmouseover15, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Kansas" id="Kansas-Kansas" title="Kansas" coords=155,106,204,109,204,134,154,131
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Kansas Population : '+mapmouseover16, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Kentucky" id="Kentucky-Kentucky" title="Kentucky" coords=262,125,283,114,296,116,296,129,247,137
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Kentucky Population : '+mapmouseover17, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Louisiana" id="Louisiana-Louisiana" title="Louisiana" coords=214,177,236,178,232,191,241,193,248,204,237,206,230,200,216,200,216,183
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Louisiana Population : '+mapmouseover18, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Maine" id="Maine-Maine" title="Maine" coords=365,18,375,15,385,34,365,53,362,35
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Maine Population : '+mapmouseover19, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Maryland" id="Maryland-Maryland" title="Maryland" coords=363,167,384,167,384,181,362,181
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Maryland Population : '+mapmouseover20, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Massachusetts" id="Massachusetts-Massachusetts" title="Massachusetts" coords=362,108,384,108,384,121,362,121
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Massachusetts Population : '+mapmouseover21, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Michigan" id="Michigan-Michigan" title="Michigan" coords=239,41,259,42,270,43,290,72,286,78,285,82,282,87,264,85,262,55
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Michigan Population : '+mapmouseover22, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Minnesota" id="Minnesota-Minnesota" title="Minnesota" coords=194,25,231,35,216,53,226,72,195,71
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Minnesota Population : '+mapmouseover23, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Mississippi" id="Mississippi-Mississippi" title="Mississippi" coords=242,155,258,154,257,192,243,193,236,183
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Mississippi Population : '+mapmouseover24, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Missouri" id="Missouri-Missouri" title="Missouri" coords=203,102,229,102,248,136,208,139,209,115
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Missouri Population : '+mapmouseover25, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Montana" id="Montana-Montana" title="Montana" coords=74,13,145,22,143,58,83,50 
              href="" onclick="populateState(this); return false;" class="hintanchor"onMouseover="showhintmap('Montana Population : '+mapmouseover26, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Nebraska" id="Nebraska-Nebraska" title="Nebraska" coords=142,77,195,85,199,107,155,103,153,96,141,93
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Nebraska Population : '+mapmouseover27, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Nevada" id="Nevada-Nevada" title="Nevada" coords=33,71,71,80,60,129,53,137,27,95
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Nevada Population : '+mapmouseover28, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="New Hampshire" id="New Hampshire-New Hampshire" title="New Hampshire" coords=339,6,359,6,358,22,336,21 
              href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('New Hampshire Population : '+mapmouseover29, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="New Jersey" id="New Jersey-New Jersey" title="New Jersey" coords=362,137,384,137,384,151,362,151
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('New Jersey Population : '+mapmouseover30, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="New Mexico" id="New Mexico-New Mexico" title="New Mexico" coords=100,131,145,135,139,179,95,175
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('New Mexico Population : '+mapmouseover31, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="New York" id="New York-New York" title="New York" coords=315,66,329,64,331,52,345,43,350,80,337,71,310,77
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('New York  Population : '+mapmouseover32, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="North Carolina" id="North Carolina-North Carolina" title="North Carolina" coords=304,131,344,128,348,133,330,152,308,143,285,149,290,143
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('North Carolina Population : '+mapmouseover33, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="North Dakota" id="North Dakota-North Dakota" title="North Dakota" coords=149,23,146,22,190,24,192,49,146,48
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('North Dakota Population : '+mapmouseover34, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Ohio" id="Ohio-Ohio" title="Ohio" coords=289,88,305,84,303,104,293,113,278,111,275,87
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Ohio Population : '+mapmouseover35, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Oklahoma" id="Oklahoma-Oklahoma" title="Oklahoma" coords=150,134,208,137,208,163,166,156,167,139
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Oklahoma Population : '+mapmouseover36, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Oregon" id="Oregon-Oregon" title="Oregon" coords=16,27,63,41,50,70,3,57 
              href="" onclick="populateState(this); return false;"class="hintanchor" onMouseover="showhintmap('Oregon Population : '+mapmouseover37, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Pennsylvania" id="Pennsylvania-Pennsylvania" title="Pennsylvania" coords=306,80,341,75,344,92,307,99
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Pennsylvania Population : '+mapmouseover38, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Rhode Island" id="Rhode Island-Rhode Island" title="Rhode Island" coords=363,92,384,92,384,106,362,106
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Rhode Island Population : '+mapmouseover39, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="South Carolina" id="South Carolina-South Carolina" title="South Carolina" coords=297,150,307,145,330,154,315,170
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('South Carolina Population : '+mapmouseover40, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="South Dakota" id="South Dakota-South Dakota" title="South Dakota" coords=146,51,191,52,192,81,143,74
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('South Dakota Population : '+mapmouseover41, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Tennessee" id="Tennessee-Tennessee" title="Tennessee" coords=247,138,301,132,281,149,242,152
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Tennessee Population : '+mapmouseover42, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Texas" id="Texas-Texas" title="Texas" coords=146,139,166,141,165,160,204,170,214,201,184,217,183,237,152,199,133,203,115,181,144,181
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Texas Population : '+mapmouseover43, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Utah" id="Utah-Utah" title="Utah" coords=74,79,93,82,92,92,105,94,98,127,64,121
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Utah Population : '+mapmouseover44, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Vermont" id="Vermont-Vermont" title="Vermont" coords=311,17,332,17,330,33,309,31
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Vermont Population :'+mapmouseover45, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Virginia" id="Virginia-Virginia" title="Virginia" coords=330,103,343,123,297,130,300,126,314,123,324,103
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Virginia Population : '+mapmouseover46, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Washington" id="Washington-Washington" title="Washington" coords=25,11,39,2,65,11,59,36,16,22
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Washington Population : '+mapmouseover47, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="West Virginia" id="West Virginia-West Virginia" title="West Virginia" coords=308,101,313,103,315,106,321,100,322,103,316,111,309,121,301,124,297,117
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('West Virginia Population : '+mapmouseover48, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY alt="Wisconsin" id="Wisconsin-Wisconsin" title="Wisconsin" coords=226,46,243,50,248,52,250,56,253,82,233,81,222,53
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Wisconsin Population : '+mapmouseover49, this, event, 'auto')" style="border: none;">
        <AREA shape=POLY  alt="Wyoming" id="Wyoming-Wyoming" title="Wyoming" coords=98,56,143,60,139,92,93,88
                href="" onclick="populateState(this); return false;" class="hintanchor" onMouseover="showhintmap('Wyoming Population : '+mapmouseovers51, this, event, 'auto')" style="border: none;">

        </MAP></TD></TR>

        <div id="stateSelectionId" style="margin-left:561px;  margin-top: -63px;width:130px;">
	<select id="stateLstBox" name="tmSelectedStates" style=" background-color: #595959;width: 130px; border-color: #595959; color: white;" multiple="multiple" size="10">
        <% String stateList = (String)session.getAttribute("TMStateNamesInSession");
        String[] states = null;
        if(stateList != null && stateList.length() > 0) {
        states = stateList.split(", ");
        for (String npState : states) {
        out.println("<option>" + npState + "</option>");
        }
        }
        %>
	</select>
	</div>


      <div style="margin-left: 418px; margin-top: -125px;width: 150px;position:absolute;"> <button type="button" id="cmdSelectAllId" onMouseOver="this.style.color='#00a9f1';document.getElementById('SelectButtonImg1').src='/QuickKlix/images/SSImgs/AddButtonMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('SelectButtonImg1').src='/QuickKlix/images/SSImgs/AddButtonImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" onclick="populateState(this); return false;"><img id="SelectButtonImg1" src="/QuickKlix/images/SSImgs/AddButtonImg.png" /> <font style="top: -2px;position: relative;">Select All</font></button></div>
      <div style="margin-left: 418px; margin-top: -75px;width: 150px;position:absolute;"> <button type="button" id="cmdUnselectId" onMouseOver="this.style.color='#00a9f1';document.getElementById('UnselectButtonImg1').src='/QuickKlix/images/SSImgs/RemoveButtonMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('UnselectButtonImg1').src='/QuickKlix/images/SSImgs/RemoveButtonImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;" onclick="deleteState(this);return false;"><img id="UnselectButtonImg1" src="/QuickKlix/images/SSImgs/RemoveButtonImg.png" /> <font style="top: -2px;position: relative;">Unselect&nbsp;</font></button></div>

      <div style="margin-top: -100px; margin-left: 730px;width: 120px;position:absolute;"> <button type="submit" onclick="return stateValidation();" onMouseOver="this.style.color='#00a9f1';document.getElementById('MapNextButtonImg1').src='/QuickKlix/images/SSImgs/MapNextMOImg.png';" onMouseOut="this.style.color='white';document.getElementById('MapNextButtonImg1').src='/QuickKlix/images/SSImgs/MapNextImg.png';" style="background: #595959;border-radius: 7px;cursor: pointer; border: 1px solid #595959; color: white; height: 28px; font: bold 1.0em/1em Verdana,Geneva,Arial,Helvetica,sans-serif;box-shadow: 3px 3px 1px #999999;"><font style="top: -2px;position: relative;"> Next &nbsp;</font><img id="MapNextButtonImg1" src="/QuickKlix/images/SSImgs/MapNextImg.png" /></button></div>
      </div>


    </s:form>

</div></div>

 </body>
</html>