Date.dayNames=["S","M","T","W","T","F","S"];
Date.abbrDayNames=["S","M","T","W","T","F","S"];
Date.monthNames=["1","2","3","4","5","6","7","8","9","10","11","12"];
Date.abbrMonthNames=["1","2","3","4","5","6","7","8","9","10","11","12"];
var month=new Array(12);
month[0]="Jan";
month[1]="Feb";
month[2]="Mar";
month[3]="Apr";
month[4]="May";
month[5]="June";
month[6]="July";
month[7]="Aug";
month[8]="Sept";
month[9]="Oct";
month[10]="Nov";
month[11]="Dec";
Date.firstDayOfWeek=0;
Date.format="mm/dd/yyyy";
Date.fullYearStart="20";
(function(){
    function b(c,d){
        if(!Date.prototype[c]){
            Date.prototype[c]=d
            }
        }
    b("isLeapYear",function(){
    var c=this.getFullYear();
    return(c%4==0&&c%100!=0)||c%400==0
    });
b("isWeekend",function(){
    return this.getDay()==0||this.getDay()==6
    });
b("isWeekDay",function(){
    return !this.isWeekend()
    });
b("getDaysInMonth",function(){
    return[31,(this.isLeapYear()?29:28),31,30,31,30,31,31,30,31,30,31][this.getMonth()]
    });
b("getDayName",function(c){
    return c?Date.abbrDayNames[this.getDay()]:Date.dayNames[this.getDay()]
    });
b("getMonthName",function(c){
    return c?Date.abbrMonthNames[this.getMonth()]:Date.monthNames[this.getMonth()]
    });
b("getDayOfYear",function(){
    var c=new Date("1/1/"+this.getFullYear());
    return Math.floor((this.getTime()-c.getTime())/86400000)
    });
b("getWeekOfYear",function(){
    return Math.ceil(this.getDayOfYear()/7)
    });
b("setDayOfYear",function(c){
    this.setMonth(0);
    this.setDate(c);
    return this
    });
b("addYears",function(c){
    this.setFullYear(this.getFullYear()+c);
    return this
    });
b("addMonths",function(d){
    var c=this.getDate();
    this.setMonth(this.getMonth()+d);
    if(c>this.getDate()){
        this.addDays(-this.getDate())
        }
        return this
    });
b("addDays",function(c){
    this.setTime(this.getTime()+(c*86400000));
    return this
    });
b("addHours",function(c){
    this.setHours(this.getHours()+c);
    return this
    });
b("addMinutes",function(c){
    this.setMinutes(this.getMinutes()+c);
    return this
    });
b("addSeconds",function(c){
    this.setSeconds(this.getSeconds()+c);
    return this
    });
b("zeroTime",function(){
    this.setMilliseconds(0);
    this.setSeconds(0);
    this.setMinutes(0);
    this.setHours(0);
    return this
    });
b("asString",function(d){
    var c=d||Date.format;
    if(c.split("mm").length>1){
        c=c.split("mmmm").join(this.getMonthName(false)).split("mmm").join(this.getMonthName(true)).split("mm").join(a(this.getMonth()+1))
        }else{
        c=c.split("m").join(this.getMonth()+1)
        }
        c=c.split("yyyy").join(this.getFullYear()).split("yy").join((this.getFullYear()+"").substring(2)).split("dd").join(a(this.getDate())).split("d").join(this.getDate());
    return c
    });
Date.fromString=function(t){
    var n=Date.format;
    var p=new Date("01/01/1970");
    if(t==""){
        return p
        }
        t=t.toLowerCase();
    var m="";
    var e=[];
    var c=/(dd?d?|mm?m?|yy?yy?)+([^(m|d|y)])?/g;
    var k;
    while((k=c.exec(n))!=null){
        switch(k[1]){
            case"d":case"dd":case"m":case"mm":case"yy":case"yyyy":
                m+="(\\d+\\d?\\d?\\d?)+";
                e.push(k[1].substr(0,1));
                break;
            case"mmm":
                m+="([a-z]{3})";
                e.push("M");
                break
                }
                if(k[2]){
            m+=k[2]
            }
        }
    var l=new RegExp(m);
    var q=t.match(l);
    for(var h=0;h<e.length;h++){
    var o=q[h+1];
    switch(e[h]){
        case"d":
            p.setDate(o);
            break;
        case"m":
            p.setMonth(Number(o)-1);
            break;
        case"M":
            for(var g=0;g<Date.abbrMonthNames.length;g++){
            if(Date.abbrMonthNames[g].toLowerCase()==o){
                break
            }
        }
        p.setMonth(g);
        break;
    case"y":
        p.setYear(o);
        break
        }
    }
return p
};

var a=function(c){
    var d="0"+c;
    return d.substring(d.length-2)
    }
})();
(function(d){
    d.fn.extend({
        renderCalendar:function(t){
            var C=function(i){
                return document.createElement(i)
                };

            t=d.extend({},d.fn.datePicker.defaults,t);
            if(t.showHeader!=d.dpConst.SHOW_HEADER_NONE){
                var o=d(C("tr"));
                for(var x=Date.firstDayOfWeek;x<Date.firstDayOfWeek+7;x++){
                    var h=x%7;
                    var v=Date.dayNames[h];
                    o.append(jQuery(C("th")).attr({
                        scope:"col",
                        abbr:v,
                        title:v,
                        "class":(h==0||h==6?"weekend":"weekday")
                        }).html(t.showHeader==d.dpConst.SHOW_HEADER_SHORT?v.substr(0,1):v))
                    }
                }
                var e=d(C("table")).attr({
            cellspacing:0,
            cellpadding:0
        }).addClass("jCalendar").append((t.showHeader!=d.dpConst.SHOW_HEADER_NONE?d(C("thead")).append(o):C("thead")));
        var f=d(C("tbody"));
        var z=(new Date()).zeroTime();
        var B=t.month==undefined?z.getMonth():t.month;
        var p=t.year||z.getFullYear();
        var m=new Date(p,B,1);
        var l=Date.firstDayOfWeek-m.getDay()+1;
        if(l>1){
            l-=7
            }
            var q=Math.ceil(((-1*l+1)+m.getDaysInMonth())/7);
        m.addDays(l-1);
        var A=function(i){
            return function(){
                if(t.hoverClass){
                    var r=d(this);
                    if(!t.selectWeek){
                        r.addClass(t.hoverClass)
                        }else{
                        if(i&&!r.is(".disabled")){
                            r.parent().addClass("activeWeekHover")
                            }
                        }
                }
        }
    };

var g=function(){
    if(t.hoverClass){
        var i=d(this);
        i.removeClass(t.hoverClass);
        i.parent().removeClass("activeWeekHover")
        }
    };

var n=0;
while(n++<q){
    var u=jQuery(C("tr"));
    var k=t.dpController?m>t.dpController.startDate:false;
    for(var x=0;x<7;x++){
        var j=m.getMonth()==B;
        var y=d(C("td")).text(m.getDate()+"").addClass((j?"current-month ":"other-month ")+(m.isWeekend()?"weekend ":"weekday ")+(j&&m.getTime()==z.getTime()?"today ":"")).data("datePickerDate",m.asString()).hover(A(k),g);
        u.append(y);
        if(t.renderCallback){
            t.renderCallback(y,m,B,p)
            }
            m=new Date(m.getFullYear(),m.getMonth(),m.getDate()+1)
        }
        f.append(u)
    }
    e.append(f);
return this.each(function(){
    d(this).empty().append(e)
    })
},
datePicker:function(e){
    if(!d.event._dpCache){
        d.event._dpCache=[]
        }
        e=d.extend({},d.fn.datePicker.defaults,e);
    return this.each(function(){
        var g=d(this);
        var i=true;
        if(!this._dpId){
            this._dpId=d.event.guid++;
            d.event._dpCache[this._dpId]=new a(this);
            i=false
            }
            if(e.inline){
            e.createButton=false;
            e.displayClose=false;
            e.closeOnSelect=false;
            g.empty()
            }
            var f=d.event._dpCache[this._dpId];
        f.init(e);
        if(!i&&e.createButton){
            f.button=d('<a href="#" class="dp-choose-date" title="'+d.dpText.TEXT_CHOOSE_DATE+'">'+d.dpText.TEXT_CHOOSE_DATE+"</a>").bind("click",function(){
                g.dpDisplay(this);
                this.blur();
                return false
                });
            g.after(f.button)
            }
            if(!i&&g.is(":text")){
            g.bind("dateSelected",function(k,j,l){
                this.value=j.asString()
                }).bind("change",function(){
                if(this.value==""){
                    f.clearSelected()
                    }else{
                    var j=Date.fromString(this.value);
                    if(j){
                        f.setSelected(j,true,true)
                        }
                    }
            });
    if(e.clickInput){
        g.bind("click",function(){
            g.trigger("change");
            g.dpDisplay()
            })
        }
        var h=Date.fromString(this.value);
        if(this.value!=""&&h){
        f.setSelected(h,true,true)
        }
    }
    g.addClass("dp-applied")
})
},
dpSetDisabled:function(e){
    return b.call(this,"setDisabled",e)
    },
dpSetStartDate:function(e){
    return b.call(this,"setStartDate",e)
    },
dpSetEndDate:function(e){
    return b.call(this,"setEndDate",e)
    },
dpGetSelected:function(){
    var e=c(this[0]);
    if(e){
        return e.getSelected()
        }
        return null
    },
dpSetSelected:function(i,g,f,h){
    if(g==undefined){
        g=true
        }
        if(f==undefined){
        f=true
        }
        if(h==undefined){
        h=true
        }
        return b.call(this,"setSelected",Date.fromString(i),g,f,h)
    },
dpSetDisplayedMonth:function(e,f){
    return b.call(this,"setDisplayedMonth",Number(e),Number(f),true)
    },
dpDisplay:function(f){
    return b.call(this,"display",f)
    },
dpSetRenderCallback:function(e){
    return b.call(this,"setRenderCallback",e)
    },
dpSetPosition:function(e,f){
    return b.call(this,"setPosition",e,f)
    },
dpSetOffset:function(e,f){
    return b.call(this,"setOffset",e,f)
    },
dpClose:function(){
    return b.call(this,"_closeCalendar",false,this[0])
    },
_dpDestroy:function(){}
});
var b=function(h,g,e,j,i){
    return this.each(function(){
        var f=c(this);
        if(f){
            f[h](g,e,j,i)
            }
        })
};

function a(e){
    this.ele=e;
    this.displayedMonthAndYear=null
    this.displayedMonth=null;
    this.displayedYear=null;
    this.startDate=null;
    this.endDate=null;
    this.showYearNavigation=null;
    this.closeOnSelect=null;
    this.displayClose=null;
    this.rememberViewedMonth=null;
    this.selectMultiple=null;
    this.numSelectable=null;
    this.numSelected=null;
    this.verticalPosition=null;
    this.horizontalPosition=null;
    this.verticalOffset=null;
    this.horizontalOffset=null;
    this.button=null;
    this.renderCallback=[];
    this.selectedDates={};

    this.inline=null;
    this.context="#dp-popup";
    this.settings={}
}
d.extend(a.prototype,{
    init:function(e){
        this.setStartDate(e.startDate);
        this.setEndDate(e.endDate);
        this.setDisplayedMonth(Number(e.month),Number(e.year));
        this.displayedMonthAndYear=this.displayedMonth;
        this.setRenderCallback(e.renderCallback);
        this.showYearNavigation=e.showYearNavigation;
        this.closeOnSelect=e.closeOnSelect;
        this.displayClose=e.displayClose;
        this.rememberViewedMonth=e.rememberViewedMonth;
        this.selectMultiple=e.selectMultiple;
        this.numSelectable=e.selectMultiple?e.numSelectable:1;
        this.numSelected=0;
        this.verticalPosition=e.verticalPosition;
        this.horizontalPosition=e.horizontalPosition;
        this.hoverClass=e.hoverClass;
        this.setOffset(e.verticalOffset,e.horizontalOffset);
        this.inline=e.inline;
        this.settings=e;
        if(this.inline){
            this.context=this.ele;
            this.display()
            }
        },
setStartDate:function(e){
    if(e){
        this.startDate=Date.fromString(e)
        }
        if(!this.startDate){
        this.startDate=(new Date()).zeroTime()
        }
        this.setDisplayedMonth(this.displayedMonth,this.displayedYear)
    },
setEndDate:function(e){
    if(e){
        this.endDate=Date.fromString(e)
        }
        if(!this.endDate){
        this.endDate=(new Date("12/31/2999"))
        }
        if(this.endDate.getTime()<this.startDate.getTime()){
        this.endDate=this.startDate
        }
        this.setDisplayedMonth(this.displayedMonth,this.displayedYear)
    },
setPosition:function(e,f){
    this.verticalPosition=e;
    this.horizontalPosition=f
    },
setOffset:function(e,f){
    this.verticalOffset=parseInt(e)||0;
    this.horizontalOffset=parseInt(f)||0
    },
setDisabled:function(e){
    $e=d(this.ele);
    $e[e?"addClass":"removeClass"]("dp-disabled");
    if(this.button){
        $but=d(this.button);
        $but[e?"addClass":"removeClass"]("dp-disabled");
        $but.attr("title",e?"":d.dpText.TEXT_CHOOSE_DATE)
        }
        if($e.is(":text")){
        $e.attr("disabled",e?"disabled":"")
        }
    },
setDisplayedMonth:function(f,n,j){
    if(this.startDate==undefined||this.endDate==undefined){
        return
    }
    var i=new Date(this.startDate.getTime());
    i.setDate(1);
    var l=new Date(this.endDate.getTime());
    l.setDate(1);
    var h;
    if((!f&&!n)||(isNaN(f)&&isNaN(n))){
        h=new Date().zeroTime();
        h.setDate(1)
        }else{
        if(isNaN(f)){
            h=new Date(n,this.displayedMonth,1)
            }else{
            if(isNaN(n)){
                h=new Date(this.displayedYear,f,1)
                }else{
                h=new Date(n,f,1)
                }
            }
    }
if(h.getTime()<i.getTime()){
    h=i
    }else{
    if(h.getTime()>l.getTime()){
        h=l
        }
    }
var g=this.displayedMonth;
var k=this.displayedYear;
this.displayedMonth=h.getMonth();
this.displayedYear=h.getFullYear();
if(j&&(this.displayedMonth!=g||this.displayedYear!=k)){
    this._rerenderCalendar();
    d(this.ele).trigger("dpMonthChanged",[this.displayedMonth,this.displayedYear])
    }
},
setSelected:function(l,e,f,h){
    if(l<this.startDate||l>this.endDate){
        return
    }
    var g=this.settings;
    if(g.selectWeek){
        l=l.addDays(-(l.getDay()-Date.firstDayOfWeek+7)%7);
        if(l<this.startDate){
            return
        }
    }
    if(e==this.isSelected(l)){
    return
}
if(this.selectMultiple==false){
    this.clearSelected()
    }else{
    if(e&&this.numSelected==this.numSelectable){
        return
    }
}
if(f&&(this.displayedMonth!=l.getMonth()||this.displayedYear!=l.getFullYear())){
    this.setDisplayedMonth(l.getMonth(),l.getFullYear(),true)
    }
    this.selectedDates[l.toString()]=e;
this.numSelected+=e?1:-1;
var j="td."+(l.getMonth()==this.displayedMonth?"current-month":"other-month");
var k;
d(j,this.context).each(function(){
    if(d(this).data("datePickerDate")==l.asString()){
        k=d(this);
        if(g.selectWeek){
            k.parent()[e?"addClass":"removeClass"]("selectedWeek")
            }
            k[e?"addClass":"removeClass"]("selected")
        }
    });
d("td",this.context).not(".selected")[this.selectMultiple&&this.numSelected==this.numSelectable?"addClass":"removeClass"]("unselectable");
if(h){
    var g=this.isSelected(l);
    $e=d(this.ele);
    var i=Date.fromString(l.asString());
    $e.trigger("dateSelected",[i,k,g]);
    $e.trigger("change")
    }
},
isSelected:function(e){
    return this.selectedDates[e.toString()]
    },
getSelected:function(){
    var e=[];
    for(s in this.selectedDates){
        if(this.selectedDates[s]==true){
            e.push(Date.parse(s))
            }
        }
    return e
},
clearSelected:function(){
    this.selectedDates={};

    this.numSelected=0;
    d("td.selected",this.context).removeClass("selected").parent().removeClass("selectedWeek")
    },
display:function(e){
    if(d(this.ele).is(".dp-disabled")){
        return
    }
    e=e||this.ele;
    var m=this;
    var i=d(e);
    var l=i.offset();
    var n;
    var o;
    var g;
    var j;
    if(m.inline){
        n=d(this.ele);
        o={
            id:"calendar-"+this.ele._dpId,
            "class":"dp-popup dp-popup-inline"
        };

        d(".dp-popup",n).remove();
        j={}
    }else{
    n=d("body");
    o={
        id:"dp-popup",
        "class":"dp-popup"
    };

    j={
        top:l.top+m.verticalOffset-151,
        left:l.left+m.horizontalOffset
        };

    var k=function(r){
        var p=r.target;
        var q=d("#dp-popup")[0];
        while(true){
            if(p==q){
                return true
                }else{
                if(p==document){
                    m._closeCalendar();
                    return false
                    }else{
                    p=d(p).parent()[0]
                    }
                }
        }
};

this._checkMouse=k;
m._closeCalendar(true);
d(document).bind("keydown.datepicker",function(p){
    if(p.keyCode==27){
        m._closeCalendar()
        }
    })
}
if(!m.rememberViewedMonth){
    var h=this.getSelected()[0];
    if(h){
        h=new Date(h);
        this.setDisplayedMonth(h.getMonth(),h.getFullYear(),false)
        }
    }
n.append(d("<div></div>").attr(o).css(j).append(d("<h2></h2>"),d('<div class="dp-nav-prev"></div>').append(d('<a class="dp-nav-prev-year" href="#" title="'+d.dpText.TEXT_PREV_YEAR+'">&laquo;</a>').bind("click",function(){
    return m._displayNewMonth.call(m,this,0,-1)
    }),d('<a class="dp-nav-prev-month" href="#" title="'+d.dpText.TEXT_PREV_MONTH+'">&lt;</a>').bind("click",function(){
    return m._displayNewMonth.call(m,this,-1,0)
    })),d('<div class="dp-nav-next"></div>').append(d('<a class="dp-nav-next-year" href="#" title="'+d.dpText.TEXT_NEXT_YEAR+'">&raquo;</a>').bind("click",function(){
    return m._displayNewMonth.call(m,this,0,1)
    }),d('<a class="dp-nav-next-month" href="#" title="'+d.dpText.TEXT_NEXT_MONTH+'">&gt;</a>').bind("click",function(){
    return m._displayNewMonth.call(m,this,1,0)
    })),d('<div class="dp-calendar"></div>')).bgIframe());
var f=this.inline?d(".dp-popup",this.context):d("#dp-popup");
if(this.showYearNavigation==false){
    d(".dp-nav-prev-year, .dp-nav-next-year",m.context).css("display","none")
    }
    if(this.displayClose){
    f.append(d('<a href="#" id="dp-close">'+d.dpText.TEXT_CLOSE+"</a>").bind("click",function(){
        m._closeCalendar();
        return false
        }))
    }
    m._renderCalendar();
d(this.ele).trigger("dpDisplayed",f);
if(!m.inline){
    if(this.verticalPosition==d.dpConst.POS_BOTTOM){
        f.css("top",l.top+i.height()-f.height()+m.verticalOffset)
        }
        if(this.horizontalPosition==d.dpConst.POS_RIGHT){
        f.css("left",l.left+i.width()-f.width()+m.horizontalOffset)
        }
        d(document).bind("mousedown.datepicker",this._checkMouse)
    }
},
setRenderCallback:function(e){
    if(e==null){
        return
    }
    if(e&&typeof(e)=="function"){
        e=[e]
        }
        this.renderCallback=this.renderCallback.concat(e)
    },
cellRender:function(i,e,g,f){
    var j=this.dpController;
    var h=new Date(e.getTime());
    i.bind("click",function(){
        var k=d(this);
        if(!k.is(".disabled")){
            j.setSelected(h,!k.is(".selected")||!j.selectMultiple,false,true);
            if(j.closeOnSelect){
                j._closeCalendar()
                }
                if(!d.browser.msie){
                d(j.ele).trigger("focus",[d.dpConst.DP_INTERNAL_FOCUS])
                }
            }
    });
if(j.isSelected(h)){
    i.addClass("selected");
    if(j.settings.selectWeek){
        i.parent().addClass("selectedWeek")
        }
    }else{
    if(j.selectMultiple&&j.numSelected==j.numSelectable){
        i.addClass("unselectable")
        }
    }
},
_applyRenderCallbacks:function(){
    var e=this;
    d("td",this.context).each(function(){
        for(var f=0;f<e.renderCallback.length;f++){
            $td=d(this);
            e.renderCallback[f].apply(this,[$td,Date.fromString($td.data("datePickerDate")),e.displayedMonth,e.displayedYear])
            }
        });
return
},
_displayNewMonth:function(f,e,g){
    if(!d(f).is(".disabled")){
        this.setDisplayedMonth(this.displayedMonth+e,this.displayedYear+g,true)
        }
        f.blur();
    return false
    },
_rerenderCalendar:function(){
    this._clearCalendar();
    this._renderCalendar()
    },
_renderCalendar:function(){
    
    d("h2",this.context).html(month[this.displayedMonth]+" / "+this.displayedYear);
    d(".dp-calendar",this.context).renderCalendar(d.extend({},this.settings,{
        month:this.displayedMonth,
        year:this.displayedYear,
        renderCallback:this.cellRender,
        dpController:this,
        hoverClass:this.hoverClass
        }));
    if(this.displayedYear==this.startDate.getFullYear()&&this.displayedMonth==this.startDate.getMonth()){
        d(".dp-nav-prev-year",this.context).addClass("disabled");
        d(".dp-nav-prev-month",this.context).addClass("disabled");
        d(".dp-calendar td.other-month",this.context).each(function(){
            var i=d(this);
            if(Number(i.text())>20){
                i.addClass("disabled")
                }
            });
    var h=this.startDate.getDate();
    d(".dp-calendar td.current-month",this.context).each(function(){
        var i=d(this);
        if(Number(i.text())<h){
            i.addClass("disabled")
            }
        })
}else{
    d(".dp-nav-prev-year",this.context).removeClass("disabled");
    d(".dp-nav-prev-month",this.context).removeClass("disabled");
    var h=this.startDate.getDate();
    if(h>20){
        var f=this.startDate.getTime();
        var g=new Date(f);
        g.addMonths(1);
        if(this.displayedYear==g.getFullYear()&&this.displayedMonth==g.getMonth()){
            d(".dp-calendar td.other-month",this.context).each(function(){
                var i=d(this);
                if(Date.fromString(i.data("datePickerDate")).getTime()<f){
                    i.addClass("disabled")
                    }
                })
        }
    }
}
if(this.displayedYear==this.endDate.getFullYear()&&this.displayedMonth==this.endDate.getMonth()){
    d(".dp-nav-next-year",this.context).addClass("disabled");
    d(".dp-nav-next-month",this.context).addClass("disabled");
    d(".dp-calendar td.other-month",this.context).each(function(){
        var i=d(this);
        if(Number(i.text())<14){
            i.addClass("disabled")
            }
        });
var h=this.endDate.getDate();
d(".dp-calendar td.current-month",this.context).each(function(){
    var i=d(this);
    if(Number(i.text())>h){
        i.addClass("disabled")
        }
    })
}else{
    d(".dp-nav-next-year",this.context).removeClass("disabled");
    d(".dp-nav-next-month",this.context).removeClass("disabled");
    var h=this.endDate.getDate();
    if(h<13){
        var e=new Date(this.endDate.getTime());
        e.addMonths(-1);
        if(this.displayedYear==e.getFullYear()&&this.displayedMonth==e.getMonth()){
            d(".dp-calendar td.other-month",this.context).each(function(){
                var i=d(this);
                if(Number(i.text())>h){
                    i.addClass("disabled")
                    }
                })
        }
    }
}
this._applyRenderCallbacks()
},
_closeCalendar:function(e,f){
    if(!f||f==this.ele){
        d(document).unbind("mousedown.datepicker");
        d(document).unbind("keydown.datepicker");
        this._clearCalendar();
        d("#dp-popup a").unbind();
        d("#dp-popup").empty().remove();
        if(!e){
            d(this.ele).trigger("dpClosed",[this.getSelected()])
            }
        }
},
_clearCalendar:function(){
    d(".dp-calendar td",this.context).unbind();
    d(".dp-calendar",this.context).empty()
    }
});
d.dpConst={
    SHOW_HEADER_NONE:0,
    SHOW_HEADER_SHORT:1,
    SHOW_HEADER_LONG:2,
    POS_TOP:0,
    POS_BOTTOM:1,
    POS_LEFT:0,
    POS_RIGHT:1,
    DP_INTERNAL_FOCUS:"dpInternalFocusTrigger"
};

d.dpText={
    TEXT_PREV_YEAR:"PREV YEAR",
    TEXT_PREV_MONTH:"PREV MONTH",
    TEXT_NEXT_YEAR:"NEXT YEAR",
    TEXT_NEXT_MONTH:"NEXT MONTH",
    TEXT_CLOSE:"CLOSE",
    TEXT_CHOOSE_DATE:"  ",
    HEADER_FORMAT:"yyyy / mmmm"
};

d.dpVersion="$Id: jquery.datePicker.js 70 2009-04-05 19:25:15Z kelvin.luck $";
d.fn.datePicker.defaults={
    month:"new Data().getMonth()",
    year:"new Data()",
    showHeader:d.dpConst.SHOW_HEADER_SHORT,
    startDate:"1/1/1970",
    endDate:"1/1/2100",
    inline:false,
    renderCallback:null,
    createButton:true,
    showYearNavigation:true,
    closeOnSelect:true,
    displayClose:false,
    selectMultiple:false,
    numSelectable:Number.MAX_VALUE,
    clickInput:false,
    rememberViewedMonth:true,
    selectWeek:false,
    verticalPosition:d.dpConst.POS_TOP,
    horizontalPosition:d.dpConst.POS_LEFT,
    verticalOffset:0,
    horizontalOffset:0,
    hoverClass:"dp-hover"
};

function c(e){
    if(e._dpId){
        return d.event._dpCache[e._dpId]
        }
        return false
    }
    if(d.fn.bgIframe==undefined){
    d.fn.bgIframe=function(){
        return this
        }
    }
d(window).bind("unload",function(){
    var f=d.event._dpCache||[];
    for(var e in f){
        d(f[e].ele)._dpDestroy()
        }
    })
})(jQuery);