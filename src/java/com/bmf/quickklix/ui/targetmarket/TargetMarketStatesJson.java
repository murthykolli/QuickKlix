/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.targetmarket;

/**
 *
 * @author murthyk
 */
import com.bmf.quickklix.core.dao.TargetMarketStatesDAO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.struts2.StrutsStatics;

public class TargetMarketStatesJson extends ActionSupport {
    Logger log = Logger.getLogger(TargetMarketStatesJson.class);
    TargetMarketStatesBean tmBean = new TargetMarketStatesBean();
    TargetMarketStatesDAO tmsDAO = new TargetMarketStatesDAO();
    private Map map = new HashMap();
    String jsonRequest;
    String jsonResponse;
    String cookieData;

public String getJsonRequest() {
        return jsonRequest;
}

public void setJsonRequest(String jsonRequest) {
        this.jsonRequest = jsonRequest;
}

public String getJsonResponse() {
        return jsonResponse;
}

public void setJsonResponse(String jsonResponse) {
        this.jsonResponse = jsonResponse;
}

public String getCookieData() {
        return cookieData;
}

public void setCookieData(String cookieData) {
        this.cookieData = cookieData;
}
    
public TargetMarketStatesJson(){
       
}
     @Override
public String execute(){
    return "success";
}    
   
public String tmDimenJsonRedirection() {    
    String cookie="";
    ActionContext actionContext = ActionContext.getContext();
    HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
    HttpSession session =  request.getSession(true);
    Map sn = ActionContext.getContext().getSession();        
    
    Gson gson = new Gson();
    java.lang.reflect.Type type = new TypeToken<Map<String, String[]>>(){}.getType();
    String tmCriteria = request.getParameter("data");
    String dimansionIdString = request.getParameter("type"); 
    String dimensionName = null;
    
    if(dimansionIdString != null){
    int dimansionId = Integer.parseInt(dimansionIdString);        
    dimensionName = tmsDAO.dimensionNameTakeFromDB(dimansionId);
    sn.put("DimensionNameInSession",dimensionName);
    }else{
    dimensionName = dimansionIdString;    
    }
    Map<String, String[]> map1 = new LinkedHashMap<String, String[]>();
    if(tmCriteria !=null && !tmCriteria.equals("")) {
    map1 = gson.fromJson(tmCriteria, type);
    }
    Map<String, String[]> finalMap = new LinkedHashMap<String, String[]>();
    for (Map.Entry<String,String[]> cat : map1.entrySet()) {
    if( cat.getValue() != null && cat.getValue().length > 0) {
    finalMap.put(cat.getKey(),cat.getValue());
    } }
    String stateCodes = (String) session.getAttribute("TMStateIdsInSession");
    Map dataMap = tmsDAO.getTargetMarketCountJSON1(stateCodes, dimensionName, finalMap);
    String json = toJSON(dataMap);   
    if(finalMap.size()>0) {
    cookie=toJSON1(finalMap);
    }
    sn.put("DimenCookieValueInSession", json); 
    sn.put("CookieDataInSession", cookie);    
    jsonResponse = json;
    jsonRequest = dimensionName;
    cookieData = cookie;
    map.put("jsonResponse",dataMap);
    map.put("jsonRequest",dimensionName);
    return Action.SUCCESS;
}

public String tmCampaignSelection(){
     ActionContext actionContext = ActionContext.getContext();     
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String clientName = request.getParameter("data");
     session.put("tmClientNameInSession", clientName);
     List campaignList = new ArrayList();
     String userName = (String)session.get("userName");
     campaignList = tmsDAO.campaignNamesTakeFromDB(userName,clientName);
     jsonResponse = toJSONForTm(campaignList);
     jsonRequest="";
     return Action.SUCCESS;
}

public String tmDimenJsonModification() {    
    String cookie="";
    ActionContext actionContext = ActionContext.getContext();
    HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
    HttpSession session =  request.getSession(true);
    Map sn = ActionContext.getContext().getSession();        
    
    Gson gson = new Gson();
    java.lang.reflect.Type type = new TypeToken<Map<String, String[]>>(){}.getType();
    String tmCriteria = request.getParameter("data"); 
    String tmJsonCookie = request.getParameter("type"); 
    Map<String, String[]> map1 = new LinkedHashMap<String, String[]>();
    if(tmCriteria !=null && !tmCriteria.equals("")) {
    map1 = gson.fromJson(tmCriteria, type);
    }
    Map<String, String[]> finalMap = new LinkedHashMap<String, String[]>();
    for (Map.Entry<String,String[]> cat : map1.entrySet()) {
    if( cat.getValue() != null && cat.getValue().length > 0) {
    finalMap.put(cat.getKey(),cat.getValue());
    } }  
  
    String json = tmJsonCookie;   
    if(finalMap.size()>0) {
    cookie=toJSON1(finalMap);
    } 
    sn.put("DimenCookieValueInSession", json); 
    sn.put("CookieDataInSession", cookie); 
    jsonResponse = json;
    cookieData = cookie;
    return Action.SUCCESS;
}

public String tmCreationNameExistChecking(){    
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();     
     String combValue = request.getParameter("data");
     String[] combValues = combValue.split("&,&");
     String userName = (String)session.get("userName");
        String tmsName = null;
        String tmName = tmsDAO.tmJsonNameTakeFromDB(userName,combValues[0],combValues[1],combValues[2]);
        String tmNameUsingId = tmsDAO.tmJsonNameTakeFromDBUsingUserId(userName,combValues[2]);
        if(tmNameUsingId != null){
        tmsName = tmNameUsingId;
        } else if(tmName != null){
        tmsName = tmName;
        } else{
        tmsName = "null";
        }

     jsonResponse = tmsName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String tmClAndCpValidationChecking(){    
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();     
     String combValue = request.getParameter("data");
     String[] combValues = combValue.split("&,&");
     String userName = (String)session.get("userName");
        String tmsName = null;
        String tmName = tmsDAO.tmClAndCpValidationCheckingInDB(userName,combValues[0],combValues[1]);
        if(tmName != null){
        tmsName = tmName;
        } else{
        tmsName = "null";
        }

     jsonResponse = tmsName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String tmModifyNameExistChecking(){
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String combValue = request.getParameter("data");
     String[] combValues = combValue.split("&,&");
     String userName = (String)session.get("userName");
     String oldTmName = (String)session.get("tmTMNameInSession");    
        String tmsName = null;
        String tmName = tmsDAO.tmJsonNameTakeFromDB(userName,combValues[0],combValues[1],combValues[2]);
        String tmNameUsingId = tmsDAO.tmJsonNameTakeFromDBUsingUserId(userName,combValues[2]);
        if(tmNameUsingId != null && (!tmNameUsingId.equals(oldTmName)) && tmName != null){
        tmsName = tmNameUsingId;
        } else{
        tmsName = "null";
        }

     jsonResponse = tmsName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String toJSON(Map<String, Map<String, String>> dataMap) {         
    StringBuffer strBuf = new StringBuffer();
    strBuf.append("{");
    boolean isFirstCat = true;
    for (Map.Entry<String, Map<String, String>> e : dataMap.entrySet()) {
    if(isFirstCat) {
    isFirstCat = false;
    } else {
    strBuf.append(",");
    }
    boolean isFirst = true;;
    strBuf.append("\"").append(e.getKey()).append("\"").append(":[");
    String eValue = null;
    for (Map.Entry<String, String> entry : e.getValue().entrySet()) {
    if(isFirst) {
    isFirst = false;
    } else {
    strBuf.append(",");
    }
    strBuf.append("\"").append(entry.getKey()).append("\"").append(":").append("\"");
    eValue = entry.getValue();
    strBuf.append((eValue == null || eValue.equalsIgnoreCase("null")) ? "0" : eValue).append("\"");
    }
    strBuf.append("]");
    }
    strBuf.append("}");
    return strBuf.toString();
}

public String toJSON1(Map<String, String[]> dataMap) {
    StringBuffer strBuf = new StringBuffer();
    strBuf.append("{");
    boolean isFirstCat = true;
    for (Map.Entry <String,String[]> e : dataMap.entrySet()) {
    if(isFirstCat) {
    isFirstCat = false;
    } else {
    strBuf.append(",");
    }
    boolean isFirst = true;;
    strBuf.append("\'").append(e.getKey()).append("\'").append(":[");
    String eValue = null;
    for (String entry : e.getValue()) {
    if(isFirst) {
    isFirst = false;
    } else {
    strBuf.append(",");
    }
    strBuf.append("\'").append(entry).append("\'");
    }
    strBuf.append("]");
    }
    strBuf.append("}");
    return strBuf.toString();
}

public String toJSONForTm(List list) {
    StringBuffer strBuf = new StringBuffer();
    strBuf.append("{");
    boolean isFirstCat = true;
    for(int i =0;i<list.size(); i++){
    String Value=list.get(i).toString();

    if(isFirstCat) {
    isFirstCat = false;
    } else {
    strBuf.append(",");
    }
    boolean isFirst = true;
    strBuf.append("\'").append(Value).append("\'");
    }

    strBuf.append("}");
    return strBuf.toString();
}

     
}
