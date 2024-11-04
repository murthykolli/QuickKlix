/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao;

import com.bmf.quickklix.core.dao.util.Constants;
import com.bmf.quickklix.core.dao.util.DAOUtilities;
import com.bmf.quickklix.core.dao.util.ParamObjects;
import com.bmf.quickklix.core.dao.util.TMUtil;
import com.bmf.quickklix.core.servlet.DBConnectionPool;
import com.bmf.quickklix.ui.targetmarket.TargetMarketStatesBean;
import com.opensymphony.xwork2.ActionContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class TargetMarketStatesDAO {
    Logger log = Logger.getLogger(TargetMarketStatesDAO.class);
    Connection conn = null;

private Integer userIdTakeFromDBUsingUserName(String userName) {
    ResultSet rs = null;
    Integer userId = 0;
    String qry = "select \"User_Id\" from \"UI\".\"Users_Information\" where \"User_Name\" = \'" + userName + "\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    if (rs.next()) {
    userId = rs.getInt(1);
    }
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return userId;
}

public Integer clientIdTakeFromDBUsingClientName(String userName,String clientName){
    ResultSet rs = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    Integer clientId = 0;
    String qry = "SELECT \"Client_Id\" from \"CP\".\"Clients_Saving\" where \"Client_Name\" = \'" + clientName + "\' and \"User_Id\" = \'" + userId + "\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    clientId = rs.getInt(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return clientId;
    }
}

public String clientNameTakeFromDBUsingId(int userId,int clientId){
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"Client_Name\" from \"CP\".\"Clients_Saving\" where \"Client_Id\" = \'" + clientId + "\' and \"User_Id\" = \'" + userId + "\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    clientName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return clientName;
    }
}

public String campaignNameTakeFromDBUsingId(int userId,int clientId,int campaignId){
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"Campaign_Name\" from \"CP\".\"Campaigns_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Client_Id\" = \'" + clientId + "\' and \"Campaign_Id\" = \'" + campaignId + "\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    clientName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return clientName;
    }
}

public String tmNameTakeFromDBUsingId(int userId,int clientId,int campaignId){
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"Target_Market_Name\" from \"TM\".\"Target_Market\" where \"User_Id\" = \'" + userId + "\' and \"Client_Id\" = \'" + clientId + "\' and \"Campaign_Id\" = \'" + campaignId + "\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    clientName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return clientName;
    }
}

public Integer campaignIdTakeFromDBUsingCampaignName(String userName,String clientName,String campaignName){
    ResultSet rs = null;    
    Integer clientId = this.clientIdTakeFromDBUsingClientName(userName,clientName);
    Integer campaignId = 0;
    String qry = "SELECT \"Campaign_Id\" from \"CP\".\"Campaigns_Saving\" where \"Client_Id\" = \'" + clientId + "\' and \"Campaign_Name\" = \'" + campaignName + "\'and \"Status\" = \'A\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    campaignId = rs.getInt(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return campaignId;
    }
}

public Integer tmIdTakeFromDBUsingTMName(String userName,String clientName,String campaignName,String tmName){
    ResultSet rs = null;
    Integer campaignId = this.campaignIdTakeFromDBUsingCampaignName(userName,clientName,campaignName);
    Integer targetMarkId = 0;
//    String qry = "SELECT \"Target_Market_Id\" from \"TM\".\"Target_Market_Saving\" where \"Campaign_Id\" = \'" + campaignId + "\' and \"Target_Market_Name\" = \'" + tmName + "\' and \"Status\" = \'A\' ";
    String qry = "SELECT \"Target_Market_Id\" from \"TM\".\"Target_Market_Saving\" where \"Campaign_Id\" = \'" + campaignId + "\' and \"Status\" = \'A\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    targetMarkId = rs.getInt(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return targetMarkId;
    }
}

public List stateIdsTakeFromDBUsingName(String stateNames) {
    List stateIdsList = new ArrayList();     
    ResultSet rs = null;
    String[] stateName = stateNames.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<stateName.length;i++){
    String qry = "select \"Puma_State_Code\" from \"TM\".\"Puma_Geo_Codes\" where \"State_Name\" = \'" + stateName[i] + "\'";
    
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    stateIdsList.add(rs.getInt(1));    
    } } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return stateIdsList;
    }
}

public String userFirstNameTakeFromDB(String userName){
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"First_Name\" from \"UI\".\"Primary_Contact_Info\" where \"User_Id\" = \'" + userId + "\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    clientName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return clientName;
    }
}

public List targerMarketDetailsTakeFromDB(String userName) {
    List mediaPlanSavinglist = new ArrayList();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select cl.\"Client_Name\", cp.\"Campaign_Name\", tm.\"Target_Market_Name\", tm.\"Geo_Name\", tm.\"Dimension_Names\", tm.\"Targeted_People\", to_char(tm.\"Created_Datetime\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(tm.\"Updated_Datetime\",'mm'||'/'||'dd'||'/'||'yyyy'), tm.\"Target_Market_Id\" "
               + "from \"CP\".\"Clients_Saving\" cl, \"CP\".\"Campaigns_Saving\" cp, \"TM\".\"Target_Market_Saving\" tm "
               + "where tm.\"User_Id\" = \'" + userId + "\' and cl.\"User_Id\" = tm.\"User_Id\" and cp.\"User_Id\" = tm.\"User_Id\" and cl.\"Client_Id\" = tm.\"Client_Id\" and cp.\"Client_Id\" = tm.\"Client_Id\" and cp.\"Campaign_Id\" = tm.\"Campaign_Id\" "
               + "and cl.\"Status\" = \'A\' and cp.\"Status\" = \'A\' and tm.\"Status\" = \'A\' "
               + "order by tm.\"Created_Datetime\" DESC nulls last, tm.\"Updated_Datetime\" DESC nulls last";

    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    TargetMarketStatesBean tmsBean = new TargetMarketStatesBean();

    tmsBean.setTmsClientName(rs.getString(1));
    tmsBean.setTmsCampaignName(rs.getString(2));
    tmsBean.setTmsName(rs.getString(3));
    tmsBean.setStateName(rs.getString(4));
    tmsBean.setGeoName(rs.getString(5));
    tmsBean.setTargetedPeople(rs.getString(6));
    tmsBean.setCreatedDate(rs.getString(7));
    tmsBean.setUpdatedDate(rs.getString(8));
    tmsBean.setTmId(rs.getInt(9));

    mediaPlanSavinglist.add(tmsBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return mediaPlanSavinglist;
}

public String tmDimentionCookieValueTakeFromDB(String userName,int tmId){
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String dimCookieVal = null;
    String qry = "SELECT \"Dimension_Cookie_Values\" from \"TM\".\"Target_Market_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Target_Market_Id\" = \'" + tmId + "\' and \"Status\" = \'A\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    dimCookieVal = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return dimCookieVal;
    }
}

public String tmCookieDataTakeFromDB(String userName,int tmId){
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String dimCookieVal = null;
    String qry = "SELECT \"Cookie_Data\" from \"TM\".\"Target_Market_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Target_Market_Id\" = \'" + tmId + "\' and \"Status\" = \'A\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    dimCookieVal = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return dimCookieVal;
    }
}

public List  mouseOverValuesForTMStatesMap() {
    List mapCount = new ArrayList();
    String qry = "select TO_CHAR(\"Population\", '999G999G990'),\"State\" from \"TM\".\"TM_Population\" order by \"State\" ";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mapCount.add(rs.getString(1));
    }
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mapCount;
    }
}

public List tmSelectedStatesListAndCountTakeFromDB(String statesNames){
    ResultSet rs = null;
    Map session = ActionContext.getContext().getSession(); 
    NumberFormat defaultFormat = NumberFormat.getInstance();
    List selStatesListAndCount = new ArrayList();   
    String[] statesName = statesNames.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    int count = 0;
    int totalCount = 0;
    for(int i=0;i<statesName.length;i++){ 
    String qry = "select \"Population\",\"State\" from \"TM\".\"TM_Population\" where \"State\" = \'" + statesName[i] + "\' order by \"State\" ";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    count = rs.getInt(1);
    totalCount = totalCount + count;    
    String stateName = rs.getString(2);    
    String statesCount = defaultFormat.format(count);
    String stNameAndCount = stateName+" : "+statesCount;   
    selStatesListAndCount.add(stNameAndCount);
    } }
    String totalStCount = defaultFormat.format(totalCount);
    session.put("AllStatesCount",totalStCount);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return selStatesListAndCount;
    }
}

public String dimensionNameTakeFromDB(int dimansionId){    
    ResultSet rs = null;
    String dimensionName = null;
    String qry = "SELECT \"Dimension_Name\" from \"TM\".\"Dimension_Name_List\" where \"Dimension_Name_List_Id\" = \'" + dimansionId + "\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    dimensionName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return dimensionName;
    }
}

//Target Market single and combinational data display

//public List tmCatIdsTakeFromDBUsingDimensionsNames(String pumaCodes,String dimensionName){
//    ResultSet rs = null;
//    List dimensionAndCodeList = new ArrayList();    
//    String[] catList = pumaCodes.split("&&, ");
//    try {    
//    for(int i=0;i<catList.length;i++){
//    String[] cateString = catList[i].split(" - ");    
//    conn = DBConnectionPool.getConnection();    
//    String qry = "select DISTINCT \"Puma_Code\" from \"TM\".\"Puma_Attribute_Codes\" where \"Attribute_Name\" = \'" + cateString[0] + "\' and \"Dimension_Name\" = \'" + dimensionName + "\' order by \"Puma_Code\" ";
//    rs = DAOUtilities.ExecuteStatement(qry, conn);
//    while (rs.next()) {
//    dimensionAndCodeList.add(rs.getInt(1));
//    } } } catch (Exception e) {
//    } finally {
//    DBConnectionPool.freeConnection(conn);
//    DAOUtilities.closeResultSet(rs);
//    return dimensionAndCodeList;
//    }
//}

public  Map<String, Map<String, String>> getTargetMarketCountJSON(String stateCodes, String type, Map<String, String[]> dataMap){
    Map<String, Map<String, String>> completeData = null;
    completeData = new HashMap<String, Map<String, String>>();
    Map<String, String[]> criteriaSoFar = new HashMap<String, String[]>();
    try {
    Map<String, String> catResult = null;
    int index = 1;
    boolean lastEntry = false;
    for (Map.Entry<String,String[]> cat : dataMap.entrySet()) {
    if(index == dataMap.size()) {
    lastEntry = true;
    } else {
    index++;
    }
    criteriaSoFar.put(cat.getKey(), cat.getValue());
    if(lastEntry) {
    catResult = TMUtil.lookupCacheJSON(stateCodes, cat.getKey(), criteriaSoFar, 1,0);
    } else {
    catResult = TMUtil.lookupCacheJSON(stateCodes, cat.getKey(), criteriaSoFar, 0,0);
    }

    if ( catResult == null) {
    if(lastEntry) {
    catResult = this.getTMCountFromDBJSON(stateCodes, cat.getKey(), criteriaSoFar, true);
    TMUtil.addToCacheJSON(stateCodes, cat.getKey(), dataMap, catResult, 1);
    } else {
    catResult = this.getTMCountFromDBJSON(stateCodes, cat.getKey(), criteriaSoFar, false);
    TMUtil.addToCacheJSON(stateCodes, cat.getKey(), dataMap, catResult, 0);
    }
    }
    completeData.put(cat.getKey(), catResult);
    } } catch (Exception ioe) {
    }
   
    return completeData;
}

public Map<String, Map<String, String>> getTargetMarketCountJSON1(String stateCodes, String type, Map<String, String[]> dataMap) {
   
    Map<String, Map<String, String>> completeData = null;
    completeData = new LinkedHashMap<String, Map<String, String>>();
    Map<String, String[]> criteriaSoFar = new LinkedHashMap<String, String[]>();
    Map<String, String> catResult = new LinkedHashMap<String, String>();
    Map<String, String> catResult1 = new HashMap<String, String>();
    Map<String, String[]> catSelectMap = null;
    
    try {
    if(type==null || type.equalsIgnoreCase(null) || type.equals("")) {
       
    for (Map.Entry<String,String[]> cat : dataMap.entrySet()) {
    catSelectMap = new HashMap<String, String[]>();
    catSelectMap.put(cat.getKey(), cat.getValue());
    Map <String, String> catSelectTotal = new HashMap<String, String>();
              
    catSelectTotal = TMUtil.lookupCacheJSON(stateCodes, cat.getKey(), catSelectMap, 1,0);
    try{
    if ( catSelectTotal == null) {
    String catTotal = this.getTMTotalJSON(stateCodes, cat.getKey(), catSelectMap);
    catSelectTotal = new HashMap<String, String>();
    
    catSelectTotal.put("total", catTotal);
    TMUtil.addToCacheJSON(stateCodes, cat.getKey(), catSelectMap, catSelectTotal, 1);
    } } catch(Exception ex){
    }
    try{
    criteriaSoFar.put(cat.getKey(), cat.getValue());
    catResult = TMUtil.lookupCacheJSON(stateCodes, cat.getKey(), criteriaSoFar, 0,0);

    if ( catResult == null) {
    catResult = this.getTMCountFromDBJSON(stateCodes, cat.getKey(), criteriaSoFar, false);
    
    TMUtil.addToCacheJSON(stateCodes, cat.getKey(), dataMap, catResult, 0);
    }else{
    }

    catResult.put("total", catSelectTotal.get("total"));
    completeData.put(cat.getKey(), catResult);
    } catch(Exception ex){
    } } }
    
    else{
    catResult = this.getTMCountFromDBJSON(stateCodes, type, dataMap, true);
    TMUtil.addToCacheJSON(stateCodes, type, dataMap, catResult, 1);
    completeData.put(type, catResult);
    }
    } catch (Exception ioe)
    { }
    
    return completeData;
}

public String getTMTotalJSON(String State,String type,Map<String, String[]> map) {
    String nqry = TMUtil.generateGroupBySQL(State,type,map);
    NumberFormat defaultFormat = NumberFormat.getInstance(); 
    String totalPumaCount = null;
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(nqry, conn);
    while(rs.next()) {
    int totalCount = Integer.parseInt(rs.getString(1));    
    totalCount = totalCount * 20;    
    String pumaTotalCount = defaultFormat.format(totalCount);    
    totalPumaCount = pumaTotalCount;
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }    
    return totalPumaCount;
}

private Map<String, String>  getTMCountFromDBJSON(String stateCodes, String type, Map<String, String[]> map, boolean incl) {
    String qry = null;
    
    HashMap<String,ArrayList> catAndCountList = new HashMap<String,ArrayList>();
    ArrayList pumaCodeList = new ArrayList();
    NumberFormat defaultFormat = NumberFormat.getInstance(); 
    String tmQry = null;
    if(incl){
    tmQry = "GenerateSQL";
    qry = TMUtil.generateSQL(stateCodes,type,map);
    }
    else {        
    tmQry = "GenerateGroupByAllSQL";    
    qry = TMUtil.generateGroupByAllSQL(stateCodes,type,map);
    }
    
    Map<String, String> results = null;
    if(incl){
    results = new LinkedHashMap<String, String>();
    }else{
    results = new HashMap<String, String>();
    }
    ResultSet rs = null;
    int totalPumaCount = 0;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    
    if(tmQry.equals("GenerateSQL")){    
    while(rs.next()) {    
    int dimenCount = Integer.parseInt(rs.getString(2)); 
    dimenCount = dimenCount * 20;
    String pumaCodeCounts = defaultFormat.format(dimenCount);    
    pumaCodeList.add((rs.getString(3)+"<font color='#00a9f1'> - ("+pumaCodeCounts+")</font>") +"&,&"+rs.getString(1));    
    results.put(rs.getString(1),(pumaCodeCounts));    
    totalPumaCount = totalPumaCount + dimenCount;    
    } 
    Map session = ActionContext.getContext().getSession();
    catAndCountList.put(type,pumaCodeList);    
    session.put("DimenAndCountInSession", catAndCountList);
    String totalPumaCounts = defaultFormat.format(totalPumaCount);
    session.put("TotalPumaCountInSession", totalPumaCounts); 
    } 
    
    else if(tmQry.equals("GenerateGroupByAllSQL")){   
    while(rs.next()) {
    int dimCount = Integer.parseInt(rs.getString(2));
    dimCount = dimCount * 20;
    String dimeCount = defaultFormat.format(dimCount);    
    results.put(rs.getString(1),(dimeCount));
    } }
    
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    fillDefaultsForZeros(map.get(type), results);    
    
    return results;
}

private boolean fillDefaultsForZeros(String[] pumacodes,Map<String, String> results) {
    try {
    for (String code : pumacodes) {
    if(!results.containsKey(code)) {
    results.put(code, "0");
    } } } catch (Exception e) {
    return false;
    }
    return true;
}

//Target Market Saving

public List clientNamesListFromDB(String userName) {
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    List clientNamesList = new ArrayList();
    String qry = "select distinct \"Client_Name\" from \"CP\".\"Clients_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\' order by \"Client_Name\" ASC  ";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    clientNamesList.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return clientNamesList;
    }
}

public List statesListTakeFromDB() {
    List statesList = new ArrayList();
    ResultSet rs = null;
    try {
    String qry = "select distinct \"State_Name\" from \"CP\".\"States\" order by \"State_Name\"";
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    statesList.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return statesList;
    }
}

public List countryNamesListTakeFromDB() {
    List countrylist = new ArrayList();
    ResultSet rs = null;
    try {
    String qry = "select \"Country_Name\" from \"CP\".\"Country\"";
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    countrylist.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return countrylist;
    }
}

public List campaignNamesTakeFromDB(String userName,String clientName) {
    ResultSet rs = null;
    Integer clientId = this.clientIdTakeFromDBUsingClientName(userName,clientName);
    List campaignList = new ArrayList();
    String qry = "SELECT distinct \"Campaign_Name\" from \"CP\".\"Campaigns_Saving\" where \"Client_Id\" = \'" + clientId + "\' and \"Status\" = \'A\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    campaignList.add(rs.getString(1));

    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return campaignList;
    }
}

public int tmClientDetailsSavingToDB(String userName,String clientName, String clientAddress1, String clientAddress2, String cityName, String stateName, String countryName, String zipCode, String contactPerson, String contactPhoneNo, String contactEmail) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"CP\".\"ClientDetailsSaving\"";
    ParamObjects param[] = new ParamObjects[12];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, clientName);
    dtype = Constants.STRING;

    param[3] = new ParamObjects(dtype, clientAddress1);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, clientAddress2);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, cityName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, stateName);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, countryName);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, zipCode);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, contactPerson);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, contactPhoneNo);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, contactEmail);
    for (int i = 0; i < 12; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    }
    return retObj.INTEGER;
}

public int  tmCampaignFormSaving(String userName, String campaignClientName, String campaignName, String missionObjective, String campaignProducts, String campaignStartDate, String campaignEndDate, String campaignBudget) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"CP\".\"campaignDetailsSaving\"";
    ParamObjects param[] = new ParamObjects[9];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, campaignClientName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, campaignName);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, missionObjective);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, campaignProducts);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, campaignStartDate);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, campaignEndDate);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, campaignBudget);
    for (int i = 0; i < 9; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);

    }
    return retObj.INTEGER;
}

public int targetMarketDetailsSavingInToDB(String username,String tmClientName,String tmCampaignName,String mpTargetMarketName,String tmStateNames,String targetedPeoples,String dimentionCookie,String dimentionCookieList,String cookieData,String reportsTMData) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"TM\".\"targetMarketDetailsSaving\"";
    ParamObjects param[] = new ParamObjects[11];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, username);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, tmClientName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, tmCampaignName);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, mpTargetMarketName);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, tmStateNames);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, targetedPeoples);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, dimentionCookie);
    dtype = Constants.STRING;
    String dimCookieList = null;
    if(!dimentionCookieList.equals("")){
    dimCookieList = dimentionCookieList;    
    }else{
    dimCookieList = "No Category Selected";    
    }
    param[8] = new ParamObjects(dtype, dimCookieList);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, cookieData);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, reportsTMData);
    
    for (int i = 0; i < 11; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    }
    return retObj.INTEGER;
}

public int targetMarketDetailsUpdatingInToDB(String username,String tmClientName,String tmCampaignName,String mpTargetMarketName,String tmStateNames,String targetedPeoples,String dimentionCookie,String dimentionCookieList,String cookieData,String tmOldName,String reportsTMData) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;

    String procName = "\"TM\".\"targetMarketDetailsUpdating\"";
    ParamObjects param[] = new ParamObjects[12];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, username);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, tmClientName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, tmCampaignName);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, mpTargetMarketName);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, tmStateNames);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, targetedPeoples);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, dimentionCookie);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, dimentionCookieList);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, cookieData);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, tmOldName);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, reportsTMData);
    
    for (int i = 0; i < 12; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    }
    return retObj.INTEGER;
}

public String deleteTargetMarketsInDB(String userName,int tmId){
    ResultSet rs = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    String deletedStatus = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry1 = "UPDATE \"TM\".\"Target_Market_Saving\" set \"Status\" = \'I\',\"Deleted_Date\" = current_timestamp  where \"User_Id\" = \'" +userId + "\' and \"Target_Market_Id\" = \'" + tmId + "\' and \"Status\" = \'A\'";
    DAOUtilities.ExecuteNonStatment(qry1, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return deletedStatus;
}

public String mpNameTakeFromDB(String userName,int tmId){
    ResultSet rs = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    String mpName = null;
    String qry = "SELECT \"Mediaplan_Name\" from \"MP\".\"Media_Plan_Saving\" where \"Target_Market_Id\" = \'" + tmId + "\' and \"User_Id\" = \'" +userId + "\' and \"Status\" = \'A\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mpName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mpName;
    }
}

public String tmJsonNameTakeFromDB(String userName,String clientName,String campaignName,String tmName){
    ResultSet rs = null;
    Integer tmId = this.tmIdTakeFromDBUsingTMName(userName,clientName,campaignName,tmName);
    String tmsName = null;
    String qry = "SELECT \"Target_Market_Name\" from \"TM\".\"Target_Market_Saving\" where \"Target_Market_Id\" = \'" + tmId + "\' and \"Status\" = \'A\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tmsName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tmsName;
    }
}

public String tmClAndCpValidationCheckingInDB(String userName,String clientName,String campaignName){
    ResultSet rs = null;
    Integer cpId = this.campaignIdTakeFromDBUsingCampaignName(userName,clientName,campaignName);
    String tmsName = null;
    String qry = "SELECT \"Target_Market_Name\" from \"TM\".\"Target_Market_Saving\" where \"Campaign_Id\" = \'" + cpId + "\' and \"Status\" = \'A\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tmsName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tmsName;
    }
}

public String tmJsonNameTakeFromDBUsingUserId(String userName,String tmName){
    ResultSet rs = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    String mediaPlanName = null;
    String qry = "SELECT \"Target_Market_Name\" from \"TM\".\"Target_Market_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Target_Market_Name\" = \'" + tmName + "\' and \"Status\" = \'A\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mediaPlanName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mediaPlanName;
    }
}




}
