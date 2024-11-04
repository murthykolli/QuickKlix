/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function total(ability){
       var intabilityvalue=0;

    var abilityCount = ability.indexOf("; ");
        if(abilityCount!=-1){
           var abilityValues = ability.split("; ");
           for(var a=0; a < abilityValues.length; a++){
                   if(a==0){
                        var ability1=abilityValues[a].split(":");
                            while(ability1[1].indexOf(",") != -1){
                              ability1[1]=ability1[1].replace(",","");
                              }
                                    intabilityvalue=parseInt(ability1[1]);
                                  }
                               else{
                               var ability2=abilityValues[a].split(":");
                               while(ability2[1].indexOf(",") != -1){
                              ability2[1]=ability2[1].replace(",","");
                              }
                               intabilityvalue+=parseInt(ability2[1]);
                                }
                            }
                } else{
              var a1=ability.split(":");
              while(a1[1].indexOf(",") != -1){
                              a1[1]=a1[1].replace(",","");
                              }
               intabilityvalue=parseInt(a1[1]);
            }
           return intabilityvalue;
     }




function jsonformat(categoryName,sc){

var jsonObj = {
    categoryName: []
};


var abilityCount = sc.indexOf("; ");
        if(abilityCount!=-1){
           var abilityValues = sc.split("; ");
           for(var a=0; a < abilityValues.length; a++){
                   if(a==0){
                        var ability1=abilityValues[a].split(":");
                            while(ability1[1].indexOf(",") != -1){
                              ability1[1]=ability1[1].replace(",","");
                              }
                              jsonObj.categoryName.push({
                                 "selectedSubCategory" : ability1[0],
                                 "Value"  :ability1[1]
                               });

                                  }
                               else{
                               var ability2=abilityValues[a].split(":");
                               while(ability2[1].indexOf(",") != -1){
                              ability2[1]=ability2[1].replace(",","");
                              }
                              jsonObj.categoryName.push({
                                 "selectedSubCategory" : ability2[0],
                                 "Value"  :ability2[1]
                               });
                               }
                            }
                } else{
              var a1=sc.split(":");
              while(a1[1].indexOf(",") != -1){
                              a1[1]=a1[1].replace(",","");
                              }
                            jsonObj.categoryName.push({
                                 "selectedSubCategory" : a1[0],
                                 "Value"  :a1[1]
                               });
              }
              return jsonObj;
}


function Cookie() {
}



function WriteCookie(cookieName, data) {
    var cookie=cookieName+"="+data
    document.cookie=cookie
}

function ReadCookie(cookieName) {
var allcookies=document.cookie
if (allcookies=="") {
return ""
}
var start= allcookies.indexOf(cookieName+'=')
if (start== -1) {
return ""
}
start += cookieName.length+1
var end=allcookies.indexOf(';',start)
if (end == -1) end=allcookies.length
var cookieval = allcookies.substring(start,end)
var a = cookieval.split('&')
for (var i=0;i<a.length;i++) a[i]=a[i].split(':')
for (var i=0;i<a.length;i++) this[a[i][0]]=unescape(a[i][1])
return cookieval;
}
function toJSON(cookieName){
    return "{'Age':['3','4'],'Citizenship':['2','3'],'Education':['7','10']}";
}

function addToJSON(cookieName,data){
WriteCookie(cookieName,data)
}


function DeleteCookie(cookieName) {
    var cookie = cookieName+'='
    cookie+='; expires=Fri, 02-Jan-1970 00:00:00 GMT' // MAKE IT EXPIRE!
    document.cookie=cookie
}

new Cookie()
Cookie.prototype.write = WriteCookie
Cookie.prototype.del = DeleteCookie
Cookie.prototype.read = ReadCookie
Cookie.prototype.json = toJSON
Cookie.prototype.add = addToJSON

function sampletest(category,value){
   var retstring="";
   var value1=value.split("&&");
   for(var i =0; i<value1.length; i++){
       value1[i]=value1[i].substring(1);
       var value2 = value1[i].split(",");
         if(value2[0]==category){
            value1[i]="";
     }
      retstring+=value1[i];
   }
   return retstring;
}

var json={"ss":[a,a,b]};
function pumaCodeSplit(value11,value){
        var obj = {};
        var keyName = value11;
        obj[ keyName ] = [];
        value=value.substring(1);
        var value1=value.split("&");
    for(var i=0; i <value1.length; i++){
         obj[ keyName ].push(value1[i]);
      }
return obj;
}

    function json(categoryName,sc){
        var arrayObject = new Array();
         var arrayObject1 = new Array();
    var jsonObj=jsonformat(categoryName,sc);
    var i=0;
    arrayObject1.push(categoryName);
    for(i=0;i<jsonObj.categoryName.length;i++)
      {
      arrayObject1.push(jsonObj.categoryName[i].selectedSubCategory, jsonObj.categoryName[i].Value);
      }
      arrayObject=arrayObject.concat("&&",arrayObject1);
      alert(arrayObject.toJSONString());
      alert(arrayObject.toJSONString().parseJSON());
      }



   function checkcookie() {
  var myCookie = new Cookie(); // non persistent cookie
  myCookie.write('testcookie',arrayObject.toJSONString().parseJSON());
  }

  function cookieRead(){
        var myCookie = new Cookie();
       var value = myCookie.read('testcookie');
        }

 function ajaxToDB(url,data,success,dataType){
    $.ajax({
  type: 'POST',
  url: url,
  data: data,
  success: success,
  dataType: dataType
});

$.post('ajax/test.html', function(data) {
  $('.result').html(data);
});

}



function isEven(value) {
        if (value%2 == 0){
                return true;
        }
        else{
                return false;
        }
}

function getCount(data){
    var objCount=0;
  for(var obj in data){
      objCount++;
     }
   return objCount;
   }

function finalTMValue(){
    var finalTM= new Array();
     $("#tbl .tableCell3").each(function(){
           var finaltar=$(this).text();
           finaltar=finaltar.replace(",","");
               finalTM.push(finaltar);
               
       });
      finalTM=finalTM.sort();
    return finalTM[0];
}
