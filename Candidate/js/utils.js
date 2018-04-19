//*********************************************//
//Filename: Utils.js
//Author: Thurstan Mathieson
//Updated:10/1/2011
//
//This file is to be used as an include in the Timesheets online
//web application.
//**********************************************//



//Some Globals
var leavecntl;
var leavelink;
var docChild;
var winChild;

//Converts a time string in format hh:mm am/pm to the number of hours (8:30 am = 8.5)
function ConverttoHours(strHours) {
   
	var newhourvalue= strHours;
	var newminutevalue=strHours;

	if (newhourvalue.indexOf(":")<2) {
		newhourvalue=newhourvalue.substr(0,1);
		newminutevalue=newminutevalue.substr(2,2);
	} else {
		newhourvalue=newhourvalue.substr(0,2);
		newminutevalue=newminutevalue.substr(3,2);
	}
	newhourvalue=parseInt(newhourvalue);
	if(strHours.indexOf("pm")>0 && newhourvalue!=12){
		newhourvalue=newhourvalue+12;
	}
	//need to add handling for 12:00am
	newminutevalue=parseInt(newminutevalue);
	return newhourvalue+(newminutevalue/60);
	
  }
  

 //rounds a given number ot specified decimal places
 function roundNumber(num, dec) {
	var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
	return result;
}

  //checks each of the time values for a single day (passed in) and totals the hours
  //it makes some assumption
  function TotalDayHours(textDay){

	//var strStartTime=createhourstring(textDay+"StartHours", textDay+"StartMinutes", textDay+"StartTimeampm");
      //var strStartTime = document.getElementById(textDay + "StartTime");
      var strStartTime = $("input[idnotserver='" + textDay + "StartTime']");

      
	//var strFinishTime=createhourstring(textDay+"FinishHours", textDay+"FinishMinutes", textDay+"FinishTimeampm");
      var strFinishTime = $("input[idnotserver='" + textDay + "FinishTime']");
    
	if (strStartTime.val().length>0 && strFinishTime.val().length>0) {
		var intStartTime=ConverttoHours(strStartTime.val());
		var intFinishTime=ConverttoHours(strFinishTime.val());
	}
	
	//var strBreakStartTime=createhourstring(textDay+"BreakStartHours", textDay+"BreakStartMinutes", textDay+"BreakStartTimeampm");
    var strBreakStartTime = $("input[idnotserver='" + textDay + "BreakStart']");
	//var strBreakFinishTime=createhourstring(textDay+"BreakFinishHours",textDay+"BreakFinishMinutes", textDay+"BreakFinishTimeampm");
    var strBreakFinishTime = $("input[idnotserver='" + textDay + "BreakFinish']");
	
	if (strBreakStartTime.val().length>0 && strBreakFinishTime.val().length>0) {
		var intBreakStartTime=ConverttoHours(strBreakStartTime.val());
		var intBreakFinishTime=ConverttoHours(strBreakFinishTime.val());
	}
	
	//make sure that the start time and finish time are valid and that the finish is greater than start
	if (intFinishTime && intStartTime){
		if (intFinishTime>intStartTime){
			var intSubTotalDayHours=intFinishTime-intStartTime;
		} else var intSubTotalDayHours=(intFinishTime+12)-intStartTime;
	
		//check if the break times are valid and that the finish is greater than start
		if (intBreakFinishTime && intBreakStartTime) {
			if (intBreakFinishTime>intBreakStartTime) {
				var intTotalDayBreakHours=intBreakFinishTime-intBreakStartTime;
			} else var intTotalDayBreakHours=(intBreakFinishTime+24)-intBreakStartTime;
			var intTotalDayHours=intSubTotalDayHours-intTotalDayBreakHours;
		} else var intTotalDayHours=intSubTotalDayHours;
		return intTotalDayHours;
	} else return false;
	
  }
  
  //goes through each of the days and retrieves the total hours for each day, updates the page with the 
  //day totals and then a week total.
  function TotalWeekHours() {
	var weekday=new Array(7);
	weekday[0]="2day";
    weekday[1] ="3day";
    weekday[2] ="4day";
    weekday[3] ="5day";
    weekday[4] ="6day";
    weekday[5] ="7day";
    weekday[6] ="1day";

	var daytotals=new Array(7);
	var weektotal=0;
	var i=0;
	for (i=0;i<=6;i++) {
        daytotals[i] = TotalDayHours(weekday[i]);
        var cntl = document.getElementsByClassName(weekday[i] + "HoursSubTotal");
        console.log(daytotals[i])
        if (daytotals[i]) {
            cntl.value = roundNumber(daytotals[i], 2);
			cntl.innerHTML=roundNumber(daytotals[i],2);
            weektotal = weektotal + daytotals[i];
            
		} else {
			cntl.innerHTML=0;
		}
	}
	
    var cntlWeekTotal = document.getElementById("WeekTotalHours");  
    cntlWeekTotal.value = roundNumber(weektotal, 2);
  }
  
	//calls a function to create a new window with a list of leave types
	function SelectLeaveType(textday){
		
		leavecntl=textday+"LeaveType";
		leavelink=textday+"Leavelink";
		
		winChild=window.open("","Leave_Type_Picker","toolbar=0,status=0,menubar=0,fullscreen=no,width=195,height=245,resizable=0,top=100,left=100");
		docChild=winChild.document;
		RenderChild();
	}

	//creates a new window with a list of leave types and updates the provided control with the user's selection
	function RenderChild(){
	var vBody;
	
	docChild.open();
	docChild.writeln("<html><head><title>Alpha Online Timesheets - Leave Type</title>");
	docChild.writeln("<link href='../Style/publicstyle.css' rel='stylesheet' type='text/css'>");
	docChild.writeln("<script type='text/javascript'>var winMain=window.opener;</script></head>");

	vBody="<body><FORM><table width='100%'>";
	vBody+="<tr><td><b>Select the Type of Leave:</b></td></tr>";
	vBody+="<tr><td><a href=\"javascript:winMain.document.getElementById('" + leavecntl +"').value='Annual';winMain.document.getElementById('" + leavelink +"').innerHTML='Annual Leave';winMain.document.getElementById('" + leavelink +"').title='click to change';window.close();\">Annual Leave</a></td></tr>";
	vBody+="<tr><td><a href=\"javascript:winMain.document.getElementById('" + leavecntl +"').value='Bereavement';winMain.document.getElementById('" + leavelink +"').innerHTML='Bereavement Leave';winMain.document.getElementById('" + leavelink +"').title='click to change';window.close();\">Bereavement Leave</a></td></tr>";
	vBody+="<tr><td><a href=\"javascript:winMain.document.getElementById('" + leavecntl +"').value='Sick';winMain.document.getElementById('" + leavelink +"').innerHTML='Sick Leave';winMain.document.getElementById('" + leavelink +"').title='click to change';window.close();\">Sick Leave</a></td></tr>";
	vBody+="<tr><td><a href=\"javascript:winMain.document.getElementById('" + leavecntl +"').value='Stat';winMain.document.getElementById('" + leavelink +"').innerHTML='Stat Day in Lieu';winMain.document.getElementById('" + leavelink +"').title='click to change';window.close();\">Stat Day in Lieu</a></td></tr>";
	vBody+="<tr><td><a href=\"javascript:winMain.document.getElementById('" + leavecntl +"').value='Public Hol - W';winMain.document.getElementById('" + leavelink +"').innerHTML='Pub Holiday - Worked';winMain.document.getElementById('" + leavelink +"').title='click to change';window.close();\">Pub Holiday - Worked</a></td></tr>";
	vBody+="<tr><td><a href=\"javascript:winMain.document.getElementById('" + leavecntl +"').value='Public Hol - NW';winMain.document.getElementById('" + leavelink +"').innerHTML='Pub Holiday - Not Worked';winMain.document.getElementById('" + leavelink +"').title='click to change';window.close();\">Pub Holiday - Not Worked</a></td></tr>";
	vBody+="<tr><td><a href=\"javascript:winMain.document.getElementById('" + leavecntl +"').value='None';winMain.document.getElementById('" + leavelink +"').innerHTML='Select Leave type';winMain.document.getElementById('" + leavelink +"').title='click to change';window.close();\">No Leave</a></td></tr>";
	vBody+="<tr><td><INPUT TYPE='BUTTON' VALUE='Cancel' onClick='window.close()'></td></tr>";
	vBody+="</table></FORM></body>";
	docChild.write(vBody);
	docChild.writeln("</html>");
	docChild.close();
}

function clearvalue(controlId){
	//alert(controlId);
    var cntl = document.querySelectorAll('input[idnotserver="' + controlId + '"]')[0];
	cntl.value="";
  }
  
function saveandexit(){
	
	var cntl=document.getElementById("formaction");
	cntl.value="saveandexit";
	document.forms["theform"].submit();
}

function submitforapproval(){

	var cntl=document.getElementById("formaction");
	cntl.value="submitforapproval";
	document.forms["theform"].submit();
}