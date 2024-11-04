/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


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



function DeleteCookie(cookieName) {
    var cookie = cookieName+'='
    cookie+='; expires=Fri, 02-Jan-1970 00:00:00 GMT' // MAKE IT EXPIRE!
    document.cookie=cookie
}

new Cookie()
Cookie.prototype.write = WriteCookie
Cookie.prototype.del = DeleteCookie
Cookie.prototype.read = ReadCookie
