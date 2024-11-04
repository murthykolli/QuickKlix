/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao;

import com.bmf.quickklix.core.dao.util.Constants;
import com.bmf.quickklix.core.dao.util.DAOUtilities;
import com.bmf.quickklix.core.dao.util.ParamObjects;
import com.bmf.quickklix.core.servlet.DBConnectionPool;
import com.bmf.quickklix.ui.mediaplan.MediasBean;
import com.opensymphony.xwork2.ActionContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class MediasDAO {
    Logger log = Logger.getLogger(MediasDAO.class);
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
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return userId;
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

public Integer mediaPlanIdTakeFromDBUsingName(String userName,String mpName){
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    Integer mpId = 0;
    String qry = "SELECT \"Media_Plan_Id\" from \"MP\".\"Media_Plan_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Mediaplan_Name\" = \'" + mpName + "\' and \"Status\" = \'A\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mpId = rs.getInt(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mpId;
    }
}

public String mediaPlanNameTakeFromDBUsingId(int mpId){
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"Mediaplan_Name\" from \"MP\".\"Media_Plan_Saving\" where \"Media_Plan_Id\" = \'" + mpId + "\' and \"Status\" = \'A\'";
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

public Integer mediaTypeIdTakeFromDBUsingName(String mediaType){
    Map session = ActionContext.getContext().getSession();
    ResultSet rs = null;
    Integer mpId = 0;
    String qry = "SELECT \"Media_Type_Id\" from \"MP\".\"Media_Types\" where \"Media_Type\" = \'" + mediaType + "\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mpId = rs.getInt(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mpId;
    }
}

public String mediaTypeTakeFromDBUsingId(int mediaTypeId){
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"Media_Type\" from \"MP\".\"Media_Types\" where \"Media_Type_Id\" = \'" + mediaTypeId + "\'";
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

//Newspapers Methods

public List mouseOverValuesForNP() {
    List npcount = new ArrayList();
    String qry = "select count(\"Newspaper_Name\"),\"State\" from \"MP\".\"Newspapers_General_Info\" group by \"State\" order by \"State\" ";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    npcount.add(rs.getString(1));
    }
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return npcount;
    }
}

public HashMap<String,ArrayList> npcityNamesByState(String stateNames){
    ResultSet rs = null;
    HashMap<String,ArrayList> stateAndCityMap = new HashMap<String,ArrayList>();
    String[] states = stateNames.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<states.length;i++){
    String qry = "select DISTINCT \"City\" from \"MP\".\"Newspapers_General_Info\" where \"State\" = \'" + states[i] + "\' and \"City\" is not null";

    rs = DAOUtilities.ExecuteStatement(qry, conn);
    ArrayList cityList = new ArrayList();
    while (rs.next()) {
    cityList.add(rs.getString(1));
    }
    stateAndCityMap.put(states[i],cityList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return stateAndCityMap;
    }
}

public HashMap<String,ArrayList> top100NewspaperByCity(String stateNames){
    ResultSet rs = null;
    HashMap<String,ArrayList> stateAndNpMap = new HashMap<String,ArrayList>();
    String[] states = stateNames.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<states.length;i++){
    String qry = " select DISTINCT \"Newspaper_Name\",\"City\",\"Newspaper_General_Info_Id\" from \"MP\".\"Newspapers_General_Info\" where \"State\" = \'" + states[i] + "\' and \"Top_100_Ranks\" is not null order by \"Newspaper_Name\" ASC";

    rs = DAOUtilities.ExecuteStatement(qry, conn);
    ArrayList npAndCityList = new ArrayList();
    ArrayList npList = new ArrayList();
    ArrayList cityList = new ArrayList();
    ArrayList npIdsList = new ArrayList();
    while (rs.next()) {
    npList.add(rs.getString(1));
    cityList.add(rs.getString(2));
    npIdsList.add(rs.getInt(3));
    }
    npAndCityList.add(npList);
    npAndCityList.add(cityList);
    npAndCityList.add(npIdsList);
    if(npList.size()>0){
    stateAndNpMap.put(states[i],npAndCityList);
    }
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return stateAndNpMap;
    }
}

public HashMap<String,ArrayList> newspaperByCity(String cityAndStateNames){
    ResultSet rs = null;
    Map session = ActionContext.getContext().getSession();
    String stateName = (String)session.get("npStatesInSession");
    cityAndStateNames = cityAndStateNames.replace(", ", "','");
    HashMap<String,ArrayList> npMap = new HashMap<String,ArrayList>();
    try { conn = DBConnectionPool.getConnection();
    String[] stateNames = stateName.split(", ");
    for(int i=0;i<stateNames.length;i++){
    ArrayList cityAndNpList=new ArrayList();
    ArrayList newspaperList=new ArrayList();
    ArrayList npIdsList=new ArrayList();
    ArrayList cityList=new ArrayList();
    String qry = "select \"Newspaper_Name\",\"City\",\"Newspaper_General_Info_Id\" from \"MP\".\"Newspapers_General_Info\" where \"City\"||\'&&\'||\"State\" in ('" + cityAndStateNames + "') and \"State\"=\'" + stateNames[i] + "\' order by \"Newspaper_Name\"";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    newspaperList.add(rs.getString(1));
    cityList.add(rs.getString(2));
    npIdsList.add(rs.getInt(3));
    }
    cityAndNpList.add(newspaperList);
    cityAndNpList.add(cityList);
    cityAndNpList.add(npIdsList);
    if(newspaperList.size()>0){
    npMap.put(stateNames[i],cityAndNpList);
    } } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return npMap;
    }
}

public ArrayList newspaperContactInfo(String newspaper) {    
    ArrayList npInfoList = new ArrayList();
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    String[] npIds = newspaper.split(", ");
    for(int i=0;i<npIds.length;i++){
    String qry = "select  \"Newspaper_Name\", \"City\", \"State\", \"Website\", \"Contact_Person\",TO_CHAR(\"Circulation\", '999G999G990'), \"Phone_No\", \"Fax_No\", \"Email\", \"Newspaper_General_Info_Id\" "
                + "from \"MP\".\"Newspapers_General_Info\" where \"Newspaper_General_Info_Id\" = \'" + npIds[i] + "\'";
    rs = DAOUtilities.ExecuteStatement(qry, conn);

    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    String newspaper1 = rs.getString(1);
    newspaper1 = newspaper1.replace("'", "\\'");
    mdBean.setNpAdsNewspaper(newspaper1);
    mdBean.setNewspaperName(rs.getString(1));
    mdBean.setNpCity(rs.getString(2));
    mdBean.setNpState(rs.getString(3));
    mdBean.setNpWebsite(rs.getString(4));
    mdBean.setNpContactPerson(rs.getString(5));
    if(rs.getString(6) != null){
    mdBean.setNpCirculation(rs.getString(6));
    }else{
    mdBean.setNpCirculation("Not Available");
    }
    mdBean.setNpPhoneNumber(rs.getString(7));
    mdBean.setNpFaxNumber(rs.getString(8));
    mdBean.setNpEmail(rs.getString(9));
    mdBean.setMediaTypeId(rs.getInt(10));
    npInfoList.add(mdBean);
    }
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return npInfoList;
    }
}

public List newsPaperNamesAndIdsTakeFromDB(String combinationalName) {
    List npIdList = new ArrayList();
    List npNamesList = new ArrayList();
    List idNamesList = new ArrayList();    
    ResultSet rs = null;
    String[] combName = combinationalName.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<combName.length;i++){
    String qry = "select \"Newspaper_Name\",\"Newspaper_General_Info_Id\" from \"MP\".\"Newspapers_General_Info\" where \"Newspaper_General_Info_Id\" = \'" + combName[i] + "\'";
        
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    npNamesList.add(rs.getString(1));
    int mediasCount  = npNamesList.size();
    Map session = ActionContext.getContext().getSession();
    session.put("NpMediasCount", mediasCount);

    npIdList.add(rs.getInt(2));
    }    
    idNamesList.add(npNamesList);
    idNamesList.add(npIdList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return idNamesList;
    }
}

public List mediasNamesAndIdsTakeMediaDataSavingTable(String userName,String mediaPlanName,String mediaType) {
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    Integer mpId = this.mediaPlanIdTakeFromDBUsingName(userName,mediaPlanName);
    Integer mediaTypeId = this.mediaTypeIdTakeFromDBUsingName(mediaType);
    List mediaIdList = new ArrayList();
    String mediaIds = null;
    ResultSet rs = null;
    try {
    String qry = "select \"Media_Ids\" from \"MP\".\"Media_Details_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Media_Plan_Id\" = \'" + mpId + "\' and \"Media_Type_Id\" = \'" + mediaTypeId + "\' and \"Status\" = \'A\'";
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mediaIds = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    mediaIdList = Arrays.asList(mediaIds.split(", "));
    return mediaIdList;
    }
}

public String mediaDetailsDataUpdateInSavingTable(String userName,String mediaPlanName,String mediaType,String mediaNames,String mediaIds,int count){
    ResultSet rs = null;
    String mediaData = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    Integer mpId = this.mediaPlanIdTakeFromDBUsingName(userName,mediaPlanName);
    Integer mediaTypeId = this.mediaTypeIdTakeFromDBUsingName(mediaType);
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "UPDATE \"MP\".\"Media_Details_Saving\" set \"Media_Names\" = \'" + mediaNames + "\',\"Media_Ids\" = \'" + mediaIds + "\',\"Count\" = \'" + count + "\',\"Updated_Date\" =  current_timestamp  where \"User_Id\" = \'" + userId + "\' and \"Media_Plan_Id\" = \'" + mpId + "\' and \"Media_Type_Id\" = \'" + mediaTypeId + "\' and \"Status\" = \'A\'";
    
    DAOUtilities.ExecuteNonStatment(qry, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return mediaData;
}

public int newsPapersDataSaving(String userName, String mediaPlanName, String mediaType, String combinationalName, String mpStartDate, String mpEndDate) {
    List paramList = new ArrayList();
    Map session = ActionContext.getContext().getSession();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MP\".\"mediaDetailsSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[9];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mediaPlanName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mediaType);
    
    List npNamesAndIdList = this.newsPaperNamesAndIdsTakeFromDB(combinationalName);
    String npNamesList = npNamesAndIdList.get(0).toString();
//    String npIdsList = npNamesAndIdList.get(1).toString();
    npNamesList = npNamesList.replace("[", "");
    npNamesList = npNamesList.replace("]", "");
//    npIdsList = npIdsList.replace("[", "");
//    npIdsList = npIdsList.replace("]", "");
    int count = (Integer)session.get("NpMediasCount");
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, npNamesList);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, combinationalName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, mpStartDate);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, mpEndDate);
    dtype = Constants.INTEGER;
    param[8] = new ParamObjects(dtype, count);
    for (int i = 0; i < 9; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    return retObj.INTEGER;
    }
}

public List newsPapersDataTakeFromDBToJsp(String userName,String mediaPlanName) {
    List magazinelist = new ArrayList();
    ResultSet rs = null;
    Map session = ActionContext.getContext().getSession();
    String mediaType = (String)session.get("MediaName");
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    Integer mpId = this.mediaPlanIdTakeFromDBUsingName(userName,mediaPlanName);
    Integer mediaTypeId = this.mediaTypeIdTakeFromDBUsingName(mediaType);
    
    String qry = "select \"Media_Names\",to_char(\"Media_Plan_Start_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),to_char(\"Media_Plan_End_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),to_char(\"Created_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),to_char(\"Updated_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),\"Media_Ids\" "
               + "from \"MP\".\"Media_Details_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Media_Plan_Id\" = \'" + mpId + "\' and \"Media_Type_Id\" = \'" + mediaTypeId + "\' and \"Status\" = \'A\' order by \"Created_Date\" DESC nulls last,\"Updated_Date\" DESC nulls last";
    
    try {
    conn = DBConnectionPool.getConnection();           
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();    
    mdBean.setMediaPlanName(mediaPlanName);
    mdBean.setMediaType(mediaType);
    mdBean.setNewspaperName(rs.getString(1));
                    
    mdBean.setMediaPlanStartDate(rs.getString(2));
    mdBean.setMediaPlanEndDate(rs.getString(3));
    mdBean.setCreatedDate(rs.getString(4));
    mdBean.setUpdatedDate(rs.getString(5));
    mdBean.setNpMediaIds(rs.getString(6));
    magazinelist.add(mdBean);
    }
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return magazinelist;
    }
}

public List allMediasDataTakeFromDBToJsp(String userName,String mediaPlanName) {
    List magazinelist = new ArrayList();
    ResultSet rs = null;       
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    Integer mpId = this.mediaPlanIdTakeFromDBUsingName(userName,mediaPlanName);

    String qry = "select mt.\"Media_Type\", md.\"Media_Names\", to_char(md.\"Media_Plan_Start_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(md.\"Media_Plan_End_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(md.\"Created_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(md.\"Updated_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), md.\"Count\", md.\"Media_Ids\" "
               + "from \"MP\".\"Media_Details_Saving\" md, \"MP\".\"Media_Types\" mt "
               + "where md.\"User_Id\" = \'" + userId + "\' and md.\"Media_Type_Id\" = mt.\"Media_Type_Id\" and md.\"Media_Plan_Id\" = \'" + mpId + "\' and md.\"Status\" = \'A\' order by md.\"Created_Date\" DESC nulls last, md.\"Updated_Date\" DESC nulls last";
    
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();    
    mdBean.setMediaPlanName(mediaPlanName);
    mdBean.setMediaType(rs.getString(1));
    mdBean.setNewspaperName(rs.getString(2));
    mdBean.setMediaPlanStartDate(rs.getString(3));
    mdBean.setMediaPlanEndDate(rs.getString(4));
    mdBean.setCreatedDate(rs.getString(5));
    mdBean.setUpdatedDate(rs.getString(6));
    mdBean.setMediasCount(rs.getInt(7));
    mdBean.setAllMediaIds(rs.getString(8));
    magazinelist.add(mdBean);
    }
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return magazinelist;
    }
}

public ArrayList newspaperTop100ContactInfo() {
    ArrayList npInfoList = new ArrayList();
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "select  \"Newspaper_Name\", \"City\", \"State\", \"Website\", \"Contact_Person\", TO_CHAR(\"Circulation\", '999G999G990'), \"Phone_No\", \"Fax_No\", \"Email\", \"Newspaper_General_Info_Id\" "
                + "from \"MP\".\"Newspapers_General_Info\" where \"Top_100_Ranks\" is not null order by \"Top_100_Ranks\"";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    String newspaper1 = rs.getString(1);
    newspaper1 = newspaper1.replace("'", "\\'");
    mdBean.setNpAdsNewspaper(newspaper1);
    mdBean.setNewspaperName(rs.getString(1));
    mdBean.setNpCity(rs.getString(2));
    mdBean.setNpState(rs.getString(3));
    mdBean.setNpWebsite(rs.getString(4));
    mdBean.setNpContactPerson(rs.getString(5));
    mdBean.setNpCirculation(rs.getString(6));
    mdBean.setNpPhoneNumber(rs.getString(7));
    mdBean.setNpFaxNumber(rs.getString(8));
    mdBean.setNpEmail(rs.getString(9));
    mdBean.setMediaTypeId(rs.getInt(10));
    npInfoList.add(mdBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return npInfoList;
    }
}

//Magazines DAO methods

public HashMap<String, ArrayList> selectMagazinesFromDB(String category) {
    HashMap<String, ArrayList> map = new HashMap<String, ArrayList>();
    ResultSet rs = null;    
    category = category.replaceAll("'", "''");
    String[] media = category.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
   
    for(int i=0;i<media.length;i++){
    String qry = "select \"Magazine_Name\",\"Magazine_General_Info_Id\" from \"MP\".\"Magazines_General_Info\" where \"Category\" = \'" + media[i] + "\'";
    
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    ArrayList mgNameList = new ArrayList();
    ArrayList mgIdsList = new ArrayList();
    ArrayList mgNameAndIdsList = new ArrayList();
    while (rs.next()) {
    mgNameList.add(rs.getString(1));
    mgIdsList.add(rs.getInt(2));
    }
    mgNameAndIdsList.add(mgNameList);
    mgNameAndIdsList.add(mgIdsList);
    map.put(media[i], mgNameAndIdsList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return map;
}

public List magazinesContactInfoTakeFromDBToJsp(String magazineIds) {
    List mgList = new ArrayList();
    ResultSet rs = null;    
    try {
    conn = DBConnectionPool.getConnection();
    String[] media = magazineIds.split(", ");
    for(int i=0;i<media.length;i++){
    String qry = "select \"Magazine_Name\",TO_CHAR(\"Circulation\", '999G999G990'),\"Phone_No\",\"Fax_No\",\"Category\",\"Frequency\",\"Editor\",\"Website\",\"Email\",\"Magazine_General_Info_Id\" "
                + "from \"MP\".\"Magazines_General_Info\" where \"Magazine_General_Info_Id\" = \'" + media[i] + "\' ORDER BY  \"Circulation\" DESC";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mb = new MediasBean();
    mb.setMagazineName(rs.getString(1));
    if (null != rs.getString(2)) {
    mb.setCirculationMg(rs.getString(2));
    } else {
    mb.setCirculationMg("Not Available");
    }
    mb.setMgContactNo(rs.getString(3));
    mb.setMgFax(rs.getString(4));
    mb.setMgCategory(rs.getString(5));
    mb.setMgFrequency(rs.getString(6));
    mb.setMgEditor(rs.getString(7));
    mb.setMgWebsite(rs.getString(8));
    mb.setMgEmail(rs.getString(9));
    mb.setMediaTypeId(rs.getInt(10));
    mgList.add(mb);
    } } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return mgList;
}

public List magazinesTop100ContactInfo() {
    List mgList = new ArrayList();
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "select \"Magazine_Name\",TO_CHAR(\"Circulation\", '999G999G990'),\"Phone_No\",\"Fax_No\",\"Category\",\"Frequency\",\"Editor\",\"Website\",\"Email\",\"Magazine_General_Info_Id\" "
               + "from \"MP\".\"Magazines_General_Info\" where \"Top_100_Ranks\" notnull ORDER BY  \"Top_100_Ranks\" DESC";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mb = new MediasBean();
    mb.setMagazineName(rs.getString(1));
    if (null != rs.getString(2)) {
    mb.setCirculationMg(rs.getString(2));
    } else {
    mb.setCirculationMg("Not Available");
    }
    mb.setMgContactNo(rs.getString(3));
    mb.setMgFax(rs.getString(4));
    mb.setMgCategory(rs.getString(5));
    mb.setMgFrequency(rs.getString(6));
    mb.setMgEditor(rs.getString(7));
    mb.setMgWebsite(rs.getString(8));
    mb.setMgEmail(rs.getString(9));
    mb.setMediaTypeId(rs.getInt(10));
    mgList.add(mb);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return mgList;
}

public List magazinesNamesAndIdsTakeFromDB(String combinationalName) {
    List mgIdsList = new ArrayList();
    List mgNamesList = new ArrayList();
    List mgNamesandIdsList = new ArrayList();
    ResultSet rs = null;
    String[] combName = combinationalName.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<combName.length;i++){
    String qry = "select \"Magazine_Name\",\"Magazine_General_Info_Id\" from \"MP\".\"Magazines_General_Info\" where \"Magazine_General_Info_Id\" = \'" + combName[i] + "\'";
   
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    String mgNameList = rs.getString(1);
    mgNameList = mgNameList.replace("'", "\\'");
    mgNamesList.add(mgNameList);
    int mediasCount  = mgNamesList.size();
    Map session = ActionContext.getContext().getSession();
    session.put("mgMediasCount", mediasCount);
    mgIdsList.add(rs.getInt(2));
    }
    mgNamesandIdsList.add(mgNamesList);
    mgNamesandIdsList.add(mgIdsList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mgNamesandIdsList;
    }
}

public int mgDataSavingInToDB(String userName, String mediaPlanName, String mediaName, String combinationalName, String mpStartDate, String mpEndDate) {
    List paramList = new ArrayList();
    Map session = ActionContext.getContext().getSession();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MP\".\"mediaDetailsSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[9];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mediaPlanName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mediaName);

    List mgNamesAndIdList = this.magazinesNamesAndIdsTakeFromDB(combinationalName);
    String mgNamesString = mgNamesAndIdList.get(0).toString();
//    String mgIdsString = mgNamesAndIdList.get(1).toString();
    mgNamesString = mgNamesString.replace("[", "");
    mgNamesString = mgNamesString.replace("]", "");
//    mgIdsString = mgIdsString.replace("[", "");
//    mgIdsString = mgIdsString.replace("]", "");
    int count = (Integer)session.get("mgMediasCount");

    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, mgNamesString);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, combinationalName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, mpStartDate);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, mpEndDate);
    dtype = Constants.INTEGER;
    param[8] = new ParamObjects(dtype, count);
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

public List magazinesDataTakeFromDBToJsp(String userName,String mediaPlanName) {
    List magazinelist = new ArrayList();
    ResultSet rs = null;
    Map session = ActionContext.getContext().getSession();
    String mediaType = (String)session.get("MediaName");
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    Integer mpId = this.mediaPlanIdTakeFromDBUsingName(userName,mediaPlanName);
    Integer mediaTypeId = this.mediaTypeIdTakeFromDBUsingName(mediaType);
    
    String qry = "select \"Media_Names\",to_char(\"Media_Plan_Start_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),to_char(\"Media_Plan_End_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),to_char(\"Created_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),to_char(\"Updated_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),\"Media_Ids\" "
               + "from \"MP\".\"Media_Details_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Media_Plan_Id\" = \'" + mpId + "\' and \"Media_Type_Id\" = \'" + mediaTypeId + "\' and \"Status\" = \'A\' order by \"Created_Date\" DESC nulls last,\"Updated_Date\" DESC nulls last";

    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    mdBean.setMediaPlanName(mediaPlanName);
    mdBean.setMediaType(mediaType);
    mdBean.setSelectedCategory(rs.getString(1));
    mdBean.setMediaPlanStartDate(rs.getString(2));
    mdBean.setMediaPlanEndDate(rs.getString(3));
    mdBean.setCreatedDate(rs.getString(4));
    mdBean.setUpdatedDate(rs.getString(5));
    mdBean.setNpMediaIds(rs.getString(6));
    magazinelist.add(mdBean);
    }
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return magazinelist;
    }
}

public int mediaDetailsDataDeletionInSavingTable(String userName, String mediaPlanName, String mediaType) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MP\".\"mediaDetailsDeletion\"";
    ParamObjects param[] = new ParamObjects[4];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mediaPlanName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mediaType);
    for (int i = 0; i < 4; i++) {
    paramList.add(param[i]);
    }
    try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    return retObj.INTEGER;
    }
}

//Radio Methods

public List mouseOverValuesForRadio() {
    List radioMapCount = new ArrayList();
    String qry = "select count(DISTINCT \"Radio_Id\"),\"State\" from \"MP\".\"Radio_General_Info\"  group by \"State\" order by \"State\" ";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    radioMapCount.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return radioMapCount;
    }
}

public HashMap<String,ArrayList> radioCityNamesByState(String stateNames){
    ResultSet rs = null;
    HashMap<String,ArrayList> radioCityMap = new HashMap<String,ArrayList>();
    String[] states = stateNames.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<states.length;i++){
    String qry = "select DISTINCT \"City\" from \"MP\".\"Radio_General_Info\" where \"State\" = \'" + states[i] + "\' and \"City\" is not null";

    rs = DAOUtilities.ExecuteStatement(qry, conn);
    ArrayList cityList=new ArrayList();
    while (rs.next()) {
    cityList.add(rs.getString(1));
    }
    radioCityMap.put(states[i],cityList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return radioCityMap;
    }
}

public HashMap<String,ArrayList> radioNamesByCity(String cityAndStateNames){
    ResultSet rs = null;
    HashMap<String,ArrayList> radioMap = new HashMap<String,ArrayList>();
    cityAndStateNames=cityAndStateNames.replace(", ","','");
    Map session = ActionContext.getContext().getSession();
    String stateName = (String)session.get("radioStatesInSession");
    String[] stateNames = stateName.split(", ");
    try{
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<stateNames.length;i++){
    ArrayList cityAndRadioList=new ArrayList();
    ArrayList radioList=new ArrayList();
    ArrayList cityList=new ArrayList();
    ArrayList idList=new ArrayList();
    String qry = "select DISTINCT \"Radio_Station_Name\"||'-'||\"Band\",\"City\",\"Radio_Id\" from \"MP\".\"Radio_General_Info\" where \"City\"||\'&&\'||\"State\" in ('" + cityAndStateNames + "') and \"State\" = \'" + stateNames[i] + "\'";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    radioList.add(rs.getString(1));
    cityList.add(rs.getString(2));
    idList.add(rs.getInt(3));
    }
    cityAndRadioList.add(radioList);
    cityAndRadioList.add(cityList);
    cityAndRadioList.add(idList);
    if(radioList.size()>0){
    radioMap.put(stateNames[i],cityAndRadioList);
    } } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return radioMap;
    }
}

public List radioFormatsInfoFromDB(){
    ResultSet rs = null;
    List radioFormatList=new ArrayList();
    ArrayList formatList=new ArrayList();
    ArrayList radioCountList=new ArrayList();
    String qry = "select \"Format\",count(\"Format\") from \"MP\".\"Radio_General_Info\" where \"Format_Rank\" is not null group by \"Format\" order by \"Format\"";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    formatList.add(rs.getString(1));
    radioCountList.add(rs.getInt(2));
    }
    radioFormatList.add(formatList);
    radioFormatList.add(radioCountList);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return radioFormatList;
    }
}

public HashMap<String,ArrayList> stateNamesForRadioFormat(String radioFormat){
    ResultSet rs = null;
    HashMap<String,ArrayList> radioStateMap = new HashMap<String,ArrayList>();
    String radFormat=radioFormat.replaceAll("'", "''");
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "select DISTINCT \"State\" from \"MP\".\"Radio_General_Info\" where \"Format\" =\'"+ radFormat + "\' and \"State\" is not null";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    ArrayList stateList=new ArrayList();
    while (rs.next()) {
    stateList.add(rs.getString(1));
    }
    String key=radioFormat.replace("'", "");
    radioStateMap.put(key,stateList);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return radioStateMap;
    }
}

public HashMap<String, ArrayList> cityNamesForRadioFormatByState(String radioFormat, String stateName) {
    HashMap<String, ArrayList> cityMap = new HashMap<String, ArrayList>();
    ResultSet rs = null;
    radioFormat = radioFormat.replaceAll("'", "''");
    String[] states = stateName.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for (int i = 0; i < states.length; i++) {
    String qry = "select DISTINCT \"City\" from \"MP\".\"Radio_General_Info\" where \"Format\"=\'" + radioFormat + "\' and \"State\"=\'" + states[i] + "\' and \"City\" is not null";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    ArrayList<String> cityList = new ArrayList<String>();
    while (rs.next()) {
    cityList.add(rs.getString(1));
    }
    cityMap.put(states[i], cityList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return cityMap;
    }
}

public HashMap<String,ArrayList> radioNamesForRadioFormatByCity(String radioFormat, String cityAndStateNames){
    ResultSet rs = null;
    radioFormat = radioFormat.replaceAll("'", "''");
    cityAndStateNames=cityAndStateNames.replace(", ", "','");
    HashMap<String,ArrayList> radioMap = new HashMap<String,ArrayList>();
    Map session = ActionContext.getContext().getSession();
    String stateName = (String)session.get("radioFormatStatesInSession");
    String[] stateNames = stateName.split(", ");
    try{
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<stateNames.length;i++){
    ArrayList cityAndRadioList=new ArrayList();
    ArrayList radioList=new ArrayList();
    ArrayList cityList=new ArrayList();
    ArrayList radioIdList=new ArrayList();
    String qry = "select DISTINCT \"Radio_Station_Name\"||'-'||\"Band\", \"City\", \"Radio_Id\" from  \"MP\".\"Radio_General_Info\" where \"Format\" = \'" + radioFormat + "\' and \"City\"||\'&&\'||\"State\"  in ('" + cityAndStateNames + "') and \"State\" = \'" + stateNames[i] + "\'";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    radioList.add(rs.getString(1));
    cityList.add(rs.getString(2));
    radioIdList.add(rs.getInt(3));
    }
    cityAndRadioList.add(radioList);
    cityAndRadioList.add(cityList);
    cityAndRadioList.add(radioIdList);
    if(radioList.size()>0){
    radioMap.put(stateNames[i],cityAndRadioList);
    } } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return radioMap;
    }
}

public ArrayList radioContactInfo(String radioIds) {
    ArrayList radioInfoList = new ArrayList();
    radioIds = radioIds.replaceAll(", ", "','");
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "select distinct \"Radio_Id\", \"Radio_Station_Name\", \"Band\", \"City\", \"State\", \"Contact_Person\",\"Rank\", \"Format1\", \"Phone_No\", \"Fax_No\", \"Website\", \"Email\" "
                    + "from \"MP\".\"Radio_General_Info\" where \"Radio_Id\" in ('" + radioIds + "')";
   
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    mdBean.setMediaTypeId(rs.getInt(1));
    mdBean.setRadioStationName(rs.getString(2));
    mdBean.setRadioBand(rs.getString(3));
    mdBean.setRadioCity(rs.getString(4));
    mdBean.setRadioState(rs.getString(5));
    mdBean.setRadioContactPerson(rs.getString(6));
    if(rs.getString(7)!=null){
    mdBean.setRadioRank(rs.getString(7));
    }else{
    mdBean.setRadioRank("Not Available");
    }
    mdBean.setRadioFormat(rs.getString(8));
    mdBean.setRadioPhoneNumber(rs.getString(9));
    mdBean.setRadioFaxNumber(rs.getString(10));
    mdBean.setRadioWebsite(rs.getString(11));
    mdBean.setRadioEmail(rs.getString(12));
    radioInfoList.add(mdBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return radioInfoList;
    }
}

public List radioNamesAndIdsTakeFromDB(String combinationalName) {
    List radioIdList = new ArrayList();
    List radioNamesList = new ArrayList();
    List idNamesList = new ArrayList();
    ResultSet rs = null;
    String[] combName = combinationalName.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for (int i = 0; i < combName.length; i++) {
    String qry = "select distinct \"Radio_Station_Name\",\"Radio_Id\" from \"MP\".\"Radio_General_Info\" where \"Radio_Id\" = \'" + combName[i] + "\'";
   
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    radioNamesList.add(rs.getString(1));
    int mediasCount = radioNamesList.size();
    Map session = ActionContext.getContext().getSession();
    session.put("rdMediasCount", mediasCount);
    radioIdList.add(rs.getInt(2));
    }
    idNamesList.add(radioNamesList);
    idNamesList.add(radioIdList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return idNamesList;
    }
}

public int radioDataSaving(String userName, String mediaPlanName, String mediaType, String combinationalName, String mpStartDate, String mpEndDate) {
    List paramList = new ArrayList();
    Map session = ActionContext.getContext().getSession();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MP\".\"mediaDetailsSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[9];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mediaPlanName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mediaType);

    List radioNamesAndIdList = this.radioNamesAndIdsTakeFromDB(combinationalName);
    String radioNamesList = radioNamesAndIdList.get(0).toString();
//    String radioIdsList = radioNamesAndIdList.get(1).toString();
    radioNamesList = radioNamesList.replace("[", "");
    radioNamesList = radioNamesList.replace("]", "");
//    radioIdsList = radioIdsList.replace("[", "");
//    radioIdsList = radioIdsList.replace("]", "");
    int count = (Integer)session.get("rdMediasCount");
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, radioNamesList);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, combinationalName);

    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, mpStartDate);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, mpEndDate);
    dtype = Constants.INTEGER;
    param[8] = new ParamObjects(dtype, count);
    for (int i = 0; i < 9; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    return retObj.INTEGER;
    }
}

//TV DAO Methods

public List mouseOverValuesForTV() {
    List tvcount = new ArrayList();
    String qry = "select count(\"Channel_Name\"),\"State\" from \"MP\".\"Television_General_Info\"  group by \"State\" order by \"State\" ";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tvcount.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvcount;
    }
}

public List mouseOverValuesForNetWork(String network) {
    List tvcount = new ArrayList();
    String qry = "select distinct c.\"count\",a.\"State\" from \"MP\".\"Television_General_Info\" a " 
               + "LEFT OUTER JOIN (SELECT \"State\",count(\"Channel_Name\") AS \"count\" FROM \"MP\".\"Television_General_Info\" WHERE \"Network\"=\'" + network + "\' "
               + "GROUP BY \"State\" order by \"State\") c ON a.\"State\" = c.\"State\" order by a.\"State\" ";
     
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tvcount.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvcount;
    }
}

public HashMap<String,ArrayList> tvCityNamesByState(String stateNames){
    ResultSet rs = null;
    HashMap<String,ArrayList> tvStateByCityMap = new HashMap<String,ArrayList>();
    String[] states=stateNames.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<states.length;i++){
    String qry = "select DISTINCT \"City\" from \"MP\".\"Television_General_Info\" where \"State\"=\'" + states[i] + "\' and \"City\" is not null";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    ArrayList cityList=new ArrayList();
    while (rs.next()) {
    cityList.add(rs.getString(1));
    }
    tvStateByCityMap.put(states[i],cityList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvStateByCityMap;
    }
}

public HashMap<String,ArrayList> tvNamesByCity(String cityAndStateNames){
    ResultSet rs = null;
    Map session = ActionContext.getContext().getSession();
    String stateName = (String)session.get("tvStatesInSession");
    cityAndStateNames = cityAndStateNames.replace(", ", "','");
    HashMap<String,ArrayList> tvMap = new HashMap<String,ArrayList>();
    try { conn = DBConnectionPool.getConnection();
    String[] stateNames = stateName.split(", ");
    for(int i=0;i<stateNames.length;i++){
    ArrayList cityAndTvList=new ArrayList();
    ArrayList tvList=new ArrayList();
    ArrayList tvIdsList=new ArrayList();
    ArrayList cityList=new ArrayList();
    String qry = "select \"Channel_Name\",\"City\",\"Television_Id\" from \"MP\".\"Television_General_Info\" where \"City\"||\'&&\'||\"State\" in ('" + cityAndStateNames + "') and \"State\"=\'" + stateNames[i] + "\' order by \"Channel_Name\"";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tvList.add(rs.getString(1));
    cityList.add(rs.getString(2));
    tvIdsList.add(rs.getInt(3));
    }
    cityAndTvList.add(tvList);
    cityAndTvList.add(cityList);
    cityAndTvList.add(tvIdsList);
    if(tvList.size()>0){
    tvMap.put(stateNames[i],cityAndTvList);
    } } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvMap;
    }
}


public ArrayList televisionContactInfo(String tVIds) {
    ArrayList tvList = new ArrayList();
    String[] tVIdString = tVIds.split(", ");
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    for(int i = 0; i<tVIdString.length; i++){
    String qry1 = "select  \"Channel_Name\", \"City\", \"State\", \"Contact_Person\",\"Phone_No\",\"Rank\","
                + " \"Fax_No\", \"Email\", \"Network\", \"Television_Id\" from \"MP\".\"Television_General_Info\" where \"Television_Id\" = \'"+tVIdString[i]+"\'";
    rs = DAOUtilities.ExecuteStatement(qry1, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    mdBean.setTelevisionName(rs.getString(1));
    mdBean.setTvCity(rs.getString(2));
    mdBean.setTvState(rs.getString(3));
    mdBean.setTvContactPerson(rs.getString(4));
    mdBean.setTvPhoneNumber(rs.getString(5));
    mdBean.setTvRank(rs.getString(6));
    mdBean.setTvFaxNumber(rs.getString(7));
    mdBean.setTvEmail(rs.getString(8));
    mdBean.setTvNetwork(rs.getString(9));
    mdBean.setMediaTypeId(rs.getInt(10));
    tvList.add(mdBean);
    } } }catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvList;
    }
}

public List televisionNamesAndIdsTakeFromDB(String combinationalName) {
    List tvIdList = new ArrayList();
    List tvNamesList = new ArrayList();
    List tvIdNamesList = new ArrayList();
    ResultSet rs = null;
    String[] combName = combinationalName.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<combName.length;i++){
    String qry = "select \"Channel_Name\",\"Television_Id\" from \"MP\".\"Television_General_Info\" where \"Television_Id\" = \'" + combName[i] + "\'";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tvNamesList.add(rs.getString(1));
    int mediasCount  = tvNamesList.size();
    Map session = ActionContext.getContext().getSession();
    session.put("TvMediasCount", mediasCount);
    tvIdList.add(rs.getInt(2));
    }
    tvIdNamesList.add(tvNamesList);
    tvIdNamesList.add(tvIdList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvIdNamesList;
    }
}

public int televisionDataSaving(String userName, String mediaPlanName, String mediaName, String combinationalName, String mpStartDate, String mpEndDate) {
    List paramList = new ArrayList();
    Map session = ActionContext.getContext().getSession();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MP\".\"mediaDetailsSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[9];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mediaPlanName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mediaName);
    List tvNamesAndIdList = this.televisionNamesAndIdsTakeFromDB(combinationalName);
    String tvNamesList = tvNamesAndIdList.get(0).toString();
//    String tvIdsList = tvNamesAndIdList.get(1).toString();
    tvNamesList = tvNamesList.replace("[", "");
    tvNamesList = tvNamesList.replace("]", "");
//    tvIdsList = tvIdsList.replace("[", "");
//    tvIdsList = tvIdsList.replace("]", "");
    int count = (Integer)session.get("TvMediasCount");
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, tvNamesList);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, combinationalName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, mpStartDate);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, mpEndDate);
    dtype = Constants.INTEGER;
    param[8] = new ParamObjects(dtype, count);
    for (int i = 0; i < 9; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    return retObj.INTEGER;
    }
}

public ArrayList tvSelectByNetworkAndItsCount(){
    ResultSet rs = null;
    ArrayList tvNetworkAndCountList=new ArrayList();
    try {
    conn = DBConnectionPool.getConnection();
    ArrayList tvNetworkList=new ArrayList();
    ArrayList tvNetworkCountList=new ArrayList();
    String qry = "select DISTINCT \"Network\",count(\"Network\") from \"MP\".\"Television_General_Info\" where \"Network\" notnull group by \"Network\"" ;
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tvNetworkList.add(rs.getString(1));
    tvNetworkCountList.add(rs.getString(2));
    }
    tvNetworkAndCountList.add(tvNetworkList);
    tvNetworkAndCountList.add(tvNetworkCountList);
    }  catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvNetworkAndCountList;
    }
}

public HashMap<String,ArrayList> stateByCityNamesForTvNetwork(String stateNames, String networkName){
    ResultSet rs = null;
    HashMap<String,ArrayList> tvStateByCityMap = new HashMap<String,ArrayList>();
    String[] states=stateNames.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<states.length;i++){
    String qry = "select DISTINCT \"City\" from \"MP\".\"Television_General_Info\" where \"State\"=\'" + states[i] + "\' and \"Network\"= \'" + networkName + "\' and \"City\" is not null";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    ArrayList cityList=new ArrayList();
    while (rs.next()) {
    cityList.add(rs.getString(1));
    }
    tvStateByCityMap.put(states[i],cityList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvStateByCityMap;
    }
}

 public HashMap<String,ArrayList> tvNetworkNamesByCity(String cityAndStateNames, String networkName){
    ResultSet rs = null;    
    Map session = ActionContext.getContext().getSession();
    String stateName = (String)session.get("tvNetworkStatesInSession");
    cityAndStateNames = cityAndStateNames.replace(", ", "','");
    HashMap<String,ArrayList> tvMap = new HashMap<String,ArrayList>();
    try { conn = DBConnectionPool.getConnection();
    String[] stateNames = stateName.split(", ");
    for(int i=0;i<stateNames.length;i++){
    ArrayList cityAndTvList=new ArrayList();
    ArrayList tvList=new ArrayList();
    ArrayList tvIdsList=new ArrayList();
    ArrayList cityList=new ArrayList();
    String qry = "select \"Channel_Name\",\"City\",\"Television_Id\" from \"MP\".\"Television_General_Info\" where \"City\"||\'&&\'||\"State\" in ('" + cityAndStateNames + "') and \"State\"=\'" + stateNames[i] + "\' and \"Network\" = \'" + networkName + "\' order by \"Channel_Name\"";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tvList.add(rs.getString(1));
    cityList.add(rs.getString(2));
    tvIdsList.add(rs.getInt(3));
    }
    cityAndTvList.add(tvList);
    cityAndTvList.add(cityList);
    cityAndTvList.add(tvIdsList);
    if(tvList.size()>0){
    tvMap.put(stateNames[i],cityAndTvList);
    } } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tvMap;
    }
}

//Internet Methods

public List USTopInternetSitesByRankContactInfo() {
    List websiteInfoList = new ArrayList();
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "select  \"Internet_USA_Id\", \"Website_Name\", \"Rank\", \"Category\", TO_CHAR(\"Unique_Visitors\", '999G999G990'), \"Reach\", TO_CHAR(\"Page_View\", '999G999G999G999G990'), \"Phone_Number\", \"Fax_Number\", \"Website\", \"Email\" "
               + "from \"MP\".\"Internet_USA\" order by \"Rank\"";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    mdBean.setMediaTypeId(rs.getInt(1));
    mdBean.setWebsiteName(rs.getString(2));
    mdBean.setInternetRank(rs.getString(3));
    mdBean.setInternetCategory(rs.getString(4));
    if(rs.getString(5)!=null){
    mdBean.setInternetVisitors(rs.getString(5));
    }else{
    mdBean.setInternetVisitors("Not Available");
    }
    if(rs.getString(6)!=null){
    mdBean.setInternetReach(rs.getString(6));
    }else{
    mdBean.setInternetReach("Not Available");
    }
    if(rs.getString(7)!=null){
    mdBean.setInternetPageViews(rs.getString(7));
    }else{
    mdBean.setInternetPageViews("Not Available");
    }
    mdBean.setInternetPhoneNo(rs.getString(8));
    mdBean.setInternetFaxNo(rs.getString(9));
    mdBean.setInternetWebsite(rs.getString(10));
    mdBean.setInternetEmail(rs.getString(11));
    websiteInfoList.add(mdBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return websiteInfoList;
    }
}

public List internetCategoryInfoFromDB(){
    ResultSet rs = null;
    List radioFormatList=new ArrayList();
    ArrayList formatList=new ArrayList();
    ArrayList radioCountList=new ArrayList();
    String qry = "select \"Category\",count(\"Website_Name\") from \"MP\".\"Internet_USA\" where \"Category\" is not null group by \"Category\" order by \"Category\"";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    formatList.add(rs.getString(1));
    radioCountList.add(rs.getInt(2));
    }
    radioFormatList.add(formatList);
    radioFormatList.add(radioCountList);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return radioFormatList;
    }
}

public Map websiteNamesByInternetCategory(String internetCategory) {
    ResultSet rs = null;
    HashMap<String,ArrayList> internetMap = new HashMap<String,ArrayList>();
    try{
    conn = DBConnectionPool.getConnection();
    ArrayList internetList=new ArrayList();
    ArrayList websiteNameList=new ArrayList();
    ArrayList siteIdList=new ArrayList();
    String qry = "select DISTINCT \"Website_Name\"||' ('||trim(TO_CHAR(\"Unique_Visitors\", '999G999G990'))||')', \"Internet_USA_Id\" from  \"MP\".\"Internet_USA\" where \"Category\" = \'" + internetCategory + "\'";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    websiteNameList.add(rs.getString(1));
    siteIdList.add(rs.getInt(2));
    }
    internetList.add(websiteNameList);
    internetList.add(siteIdList);
    internetMap.put(internetCategory,internetList);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return internetMap;
    }
}

public List USInternetSitesContactInfo(String websiteIds) {
    List websiteInfoList = new ArrayList();
    websiteIds=websiteIds.replace(", ","','");
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "select  \"Internet_USA_Id\", \"Website_Name\", \"Rank\", \"Category\", TO_CHAR(\"Unique_Visitors\", '999G999G990'), \"Reach\", TO_CHAR(\"Page_View\", '999G999G999G999G990'), \"Phone_Number\", \"Fax_Number\", \"Website\", \"Email\" "
               + "from \"MP\".\"Internet_USA\"  where \"Internet_USA_Id\" in  ('" + websiteIds + "')";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    mdBean.setMediaTypeId(rs.getInt(1));
    mdBean.setWebsiteName(rs.getString(2));
    mdBean.setInternetRank(rs.getString(3));
    mdBean.setInternetCategory(rs.getString(4));
    if(rs.getString(5)!=null){
    mdBean.setInternetVisitors(rs.getString(5));
    }else{
    mdBean.setInternetVisitors("Not Available");
    }
    if(rs.getString(6)!=null){
    mdBean.setInternetReach(rs.getString(6));
    }else{
    mdBean.setInternetReach("Not Available");
    }
    if(rs.getString(7)!=null){
    mdBean.setInternetPageViews(rs.getString(7));
    }else{
    mdBean.setInternetPageViews("Not Available");
    }
    mdBean.setInternetPhoneNo(rs.getString(8));
    mdBean.setInternetFaxNo(rs.getString(9));
    mdBean.setInternetWebsite(rs.getString(10));
    mdBean.setInternetEmail(rs.getString(11));
    websiteInfoList.add(mdBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return websiteInfoList;
    }
}

public List internetUSNamesAndIdsTakeFromDB(String combinationalName) {
    List websiteIdList = new ArrayList();
    List websiteNamesList = new ArrayList();
    List idNamesList = new ArrayList();
    ResultSet rs = null;
    String[] combName = combinationalName.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for (int i = 0; i < combName.length; i++) {
    String qry = "select \"Website_Name\",\"Internet_USA_Id\" from \"MP\".\"Internet_USA\" where \"Internet_USA_Id\" = \'" + combName[i] + "\'";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    websiteNamesList.add(rs.getString(1));
    int mediasCount = websiteNamesList.size();
    Map session = ActionContext.getContext().getSession();
    session.put("InternetMediasCount", mediasCount);
    websiteIdList.add(rs.getInt(2));
    }
    idNamesList.add(websiteNamesList);
    idNamesList.add(websiteIdList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return idNamesList;
    }
}

public List internetSitesWorldWideContactInfo() {
    List websiteInfoList = new ArrayList();
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "select  \"Internet_worldwide_Id\", \"Website_Name\", \"Rank\", \"Category\", TO_CHAR(\"Unique_Visitors\", '999G999G990'), \"Reach\", TO_CHAR(\"Page_View\", '999G999G999G999G990'), \"Phone_Number\", \"Fax_Number\", \"Website\", \"Email\" "
               + "from \"MP\".\"Internet_worldwide\" order by \"Rank\"";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    mdBean.setMediaTypeId(rs.getInt(1));
    mdBean.setWebsiteName(rs.getString(2));
    mdBean.setInternetRank(rs.getString(3));
    mdBean.setInternetCategory(rs.getString(4));
    if(rs.getString(5)!=null){
    mdBean.setInternetVisitors(rs.getString(5));
    }else{
    mdBean.setInternetVisitors("Not Available");
    }
    if(rs.getString(6)!=null){
    mdBean.setInternetReach(rs.getString(6));
    }else{
    mdBean.setInternetReach("Not Available");
    }
    if(rs.getString(7)!=null){
    mdBean.setInternetPageViews(rs.getString(7));
    }else{
    mdBean.setInternetPageViews("Not Available");
    }
    mdBean.setInternetPhoneNo(rs.getString(8));
    mdBean.setInternetFaxNo(rs.getString(9));
    mdBean.setInternetWebsite(rs.getString(10));
    mdBean.setInternetEmail(rs.getString(11));
    websiteInfoList.add(mdBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return websiteInfoList;
    }
}

public List internetWorldWideModifyContactInfo(String websiteIds) {
    List websiteInfoList = new ArrayList();
    websiteIds=websiteIds.replace(", ","','");
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "select  \"Internet_worldwide_Id\", \"Website_Name\", \"Rank\", \"Category\", TO_CHAR(\"Unique_Visitors\", '999G999G990'), \"Reach\", TO_CHAR(\"Page_View\", '999G999G999G999G990'), \"Phone_Number\", \"Fax_Number\", \"Website\", \"Email\" "
               + "from \"MP\".\"Internet_worldwide\"  where \"Internet_worldwide_Id\" in  ('" + websiteIds + "')";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    mdBean.setMediaTypeId(rs.getInt(1));
    mdBean.setWebsiteName(rs.getString(2));
    mdBean.setInternetRank(rs.getString(3));
    mdBean.setInternetCategory(rs.getString(4));
    if(rs.getString(5)!=null){
    mdBean.setInternetVisitors(rs.getString(5));
    }else{
    mdBean.setInternetVisitors("Not Available");
    }
    if(rs.getString(6)!=null){
    mdBean.setInternetReach(rs.getString(6));
    }else{
    mdBean.setInternetReach("Not Available");
    }
    if(rs.getString(7)!=null){
    mdBean.setInternetPageViews(rs.getString(7));
    }else{
    mdBean.setInternetPageViews("Not Available");
    }
    mdBean.setInternetPhoneNo(rs.getString(8));
    mdBean.setInternetFaxNo(rs.getString(9));
    mdBean.setInternetWebsite(rs.getString(10));
    mdBean.setInternetEmail(rs.getString(11));
    websiteInfoList.add(mdBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return websiteInfoList;
    }
}

public List internetWorldWideNamesAndIdsTakeFromDB(String combinationalName) {
    List websiteIdList = new ArrayList();
    List websiteNamesList = new ArrayList();
    List idNamesList = new ArrayList();
    ResultSet rs = null;
    String[] combName = combinationalName.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for (int i = 0; i < combName.length; i++) {
    String qry = "select \"Website_Name\",\"Internet_worldwide_Id\" from \"MP\".\"Internet_worldwide\" where \"Internet_worldwide_Id\" = \'" + combName[i] + "\'";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    websiteNamesList.add(rs.getString(1));
    int mediasCount = websiteNamesList.size();
    Map session = ActionContext.getContext().getSession();
    session.put("InternetMediasCount", mediasCount);
    websiteIdList.add(rs.getInt(2));
    }
    idNamesList.add(websiteNamesList);
    idNamesList.add(websiteIdList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return idNamesList;
    }
}

public int internetDataSaving(String userName, String mediaPlanName, String mediaType, String combinationalName, String combinationalIds, String mpStartDate, String mpEndDate,int count) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MP\".\"mediaDetailsSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[9];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mediaPlanName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mediaType);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, combinationalName);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, combinationalIds);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, mpStartDate);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, mpEndDate);
    dtype = Constants.INTEGER;
    param[8] = new ParamObjects(dtype, count);
    for (int i = 0; i < 9; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    return retObj.INTEGER;
    }
}

//Mobile Apps DAO methods

public ArrayList mobileAppsAndItsCount(){
    ResultSet rs = null;
    ArrayList mAppAndCountList=new ArrayList();
    try {
    conn = DBConnectionPool.getConnection();
    ArrayList appCategoryList=new ArrayList();
    ArrayList appCategoryCountList=new ArrayList();
    String qry = "select DISTINCT \"Category\",count(\"Category\") from \"MP\".\"Mobile_App_General_Info\" where \"Category\" notnull group by \"Category\"" ;
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    appCategoryList.add(rs.getString(1));
    appCategoryCountList.add(rs.getString(2));
    }
    mAppAndCountList.add(appCategoryList);
    mAppAndCountList.add(appCategoryCountList);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mAppAndCountList;
    }
}

public HashMap<String, ArrayList> selectedByMobileAppsCategory(String category) {
    HashMap<String, ArrayList> appsMap = new HashMap<String, ArrayList>();
    ResultSet rs = null;
    String[] media = category.split(", ");
    try {
    int i = 0;
    conn = DBConnectionPool.getConnection();
    while (i < media.length) {
    ArrayList<String> appNameList = new ArrayList<String>();
    ArrayList<String> appIdsList = new ArrayList<String>();
    ArrayList appNamesAndIdsList = new ArrayList();
    String qry = "select \"App_Name\",\"Mobile_App_Id\" from \"MP\".\"Mobile_App_General_Info\" where\"Category\"=\'" + media[i] + "\' and \"Category\" is not null order by \"App_Name\"";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    appNameList.add(rs.getString(1));
    appIdsList.add(rs.getString(2));
    }
    appNamesAndIdsList.add(appNameList);
    appNamesAndIdsList.add(appIdsList);
    appsMap.put(media[i], appNamesAndIdsList);
    i++;
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return appsMap;
}

public List mobileAppsOsNameFromDB(String mAppsCategory) {
    List operatingsys = new ArrayList();
    String qry = "select DISTINCT \"Operating_System\" from \"MP\".\"Mobile_App_General_Info\" where \"Category\"=\'" + mAppsCategory + "\'";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    operatingsys.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return operatingsys;
    }
}

public HashMap<String, ArrayList> selectedByMobileAppsOSCategory(String category) {
    HashMap<String, ArrayList> appsMap = new HashMap<String, ArrayList>();
    List operatingsys = this.mobileAppsOsNameFromDB(category);
    ResultSet rs = null;
    String[] media = category.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i< operatingsys.size();i++) {
    ArrayList<String> appNameList = new ArrayList<String>();
    ArrayList<String> appIdsList = new ArrayList<String>();
    ArrayList appNamesAndIdsList = new ArrayList();
    String qry = "select \"App_Name\",\"Mobile_App_Id\" from \"MP\".\"Mobile_App_General_Info\" where  \"Operating_System\"=\'" + operatingsys.get(i).toString() + "\' and \"Category\"=\'" + category + "\' and \"Category\" notnull order by \"App_Name\"";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    appNameList.add(rs.getString(1));
    appIdsList.add(rs.getString(2));
    }
    appNamesAndIdsList.add(appNameList);
    appNamesAndIdsList.add(appIdsList);
    appsMap.put(operatingsys.get(i).toString(), appNamesAndIdsList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return appsMap;
}

public List mobileAppsNamesAndIdsTakeFromDB(String combinationalName) {
    List appIdList = new ArrayList();
    List appsNamesList = new ArrayList();
    List appsIdNamesList = new ArrayList();
    ResultSet rs = null;
    String[] combName = combinationalName.split(", ");
    try {
    conn = DBConnectionPool.getConnection();
    for(int i=0;i<combName.length;i++){
    String qry = "select \"App_Name\",\"Mobile_App_Id\" from \"MP\".\"Mobile_App_General_Info\" where \"Mobile_App_Id\" = \'" + combName[i] + "\'";
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    appsNamesList.add(rs.getString(1));
    int mediasCount  = appsNamesList.size();
    Map session = ActionContext.getContext().getSession();
    session.put("MAppMediasCount", mediasCount);
    appIdList.add(rs.getInt(2));
    }
    appsIdNamesList.add(appsNamesList);
    appsIdNamesList.add(appIdList);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return appsIdNamesList;
    }
}

public int mobileAppsDataSaving(String userName, String mediaPlanName, String mediaName, String combinationalName, String mpStartDate, String mpEndDate) {
    List paramList = new ArrayList();
    Map session = ActionContext.getContext().getSession();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MP\".\"mediaDetailsSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[9];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mediaPlanName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mediaName);
    List maNamesAndIdList = this.mobileAppsNamesAndIdsTakeFromDB(combinationalName);
    String maNamesList = maNamesAndIdList.get(0).toString();
//    String maIdsList = maNamesAndIdList.get(1).toString();
    maNamesList = maNamesList.replace("[", "");
    maNamesList = maNamesList.replace("]", "");
//    maIdsList = maIdsList.replace("[", "");
//    maIdsList = maIdsList.replace("]", "");
    int count = (Integer)session.get("MAppMediasCount");
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, maNamesList);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, combinationalName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, mpStartDate);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, mpEndDate);
    dtype = Constants.INTEGER;
    param[8] = new ParamObjects(dtype, count);
    for (int i = 0; i < 9; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    return retObj.INTEGER;
    }
}

public List mobileAppsContactInfoTakeFromDB(String mobileIds) {
    ArrayList appsList = new ArrayList();
    String[] mobileIdString = mobileIds.split(", ");
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    for(int i = 0; i<mobileIdString.length; i++){
    String qry1 = "select  \"App_Name\", \"Operating_System\", \"Type_Of_App\", \"Version\",\"Developer/Company\",\"No_Of_Downloads\","
                + " \"Email\", \"Phone_No\", \"Fax_No\",\"Category\",\"Mobile_App_Id\" from \"MP\".\"Mobile_App_General_Info\" where \"Mobile_App_Id\" = \'"+mobileIdString[i]+"\'";
    rs = DAOUtilities.ExecuteStatement(qry1, conn);
    while (rs.next()) {
    MediasBean mdBean = new MediasBean();
    mdBean.setMobileAppsName(rs.getString(1));
    mdBean.setOperatingSystemName(rs.getString(2));
    mdBean.setTypeOfMobileApp(rs.getString(3));
    mdBean.setMobileAppsVersion(rs.getString(4));
    mdBean.setMobileAppsDeveloper(rs.getString(5));
    mdBean.setMobileAppsDownload(rs.getString(6));
    mdBean.setMobileAppsEmail(rs.getString(7));
    mdBean.setMobileAppsPhoneNo(rs.getString(8));
    mdBean.setMobileAppsFaxNo(rs.getString(9));
    mdBean.setMobileAppsCategory(rs.getString(10));
    mdBean.setMobileAppsId(rs.getString(11));
    appsList.add(mdBean);
    } } }catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return appsList;
    }
}

 

  
}
