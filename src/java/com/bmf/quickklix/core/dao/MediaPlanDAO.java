/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao;

import com.bmf.quickklix.core.dao.util.Constants;
import com.bmf.quickklix.core.dao.util.DAOUtilities;
import com.bmf.quickklix.core.dao.util.ParamObjects;
import com.bmf.quickklix.core.servlet.DBConnectionPool;
import com.bmf.quickklix.ui.mediaplan.MediaPlanBean;
import com.opensymphony.xwork2.ActionContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class MediaPlanDAO {
    Logger log = Logger.getLogger(MediaPlanDAO.class);
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
    String qry = "SELECT \"Client_Id\" from \"CP\".\"Clients_Saving\" where \"Client_Name\" = \'" + clientName + "\' and \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\'";
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
    String qry = "SELECT \"Target_Market_Id\" from \"TM\".\"Target_Market_Saving\" where \"Campaign_Id\" = \'" + campaignId + "\' and \"Target_Market_Name\" = \'" + tmName + "\' and \"Status\" = \'A\' ";
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

public String clientNameTakeFromDBUsingId(int clientId){
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"Client_Name\" from \"CP\".\"Clients_Saving\" where \"Client_Id\" = \'" + clientId + "\' and \"Status\" = \'A\'";
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

public String clientNameTakeFromDB(String userName,String clientsName){
    ResultSet rs = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    String clientName = null;
    String qry = "SELECT distinct \"Client_Name\" from \"CP\".\"Clients_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Client_Name\" = \'" + clientsName + "\' and \"Status\" = \'A\'";
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

public String campaignNameTakeFromDBUsingId(int campaignId){
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"Campaign_Name\" from \"CP\".\"Campaigns_Saving\" where \"Campaign_Id\" = \'" + campaignId + "\' and \"Status\" = \'A\'";
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

public String tmNameTakeFromDBUsingId(int tmId){
    ResultSet rs = null;
    String clientName = null;
    String qry = "SELECT \"Target_Market_Name\" from \"TM\".\"Target_Market_Saving\" where \"Target_Market_Id\" = \'" + tmId + "\' and \"Status\" = \'A\'";
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

public List mediaPlanDetailsTakeFromDB(String userName) {
    List mediaPlanSavinglist = new ArrayList();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select cl.\"Client_Name\", cp.\"Campaign_Name\", tm.\"Target_Market_Name\", mp.\"Mediaplan_Name\", mp.\"Objective_of_Media_Plan\", to_char(mp.\"Campaign_Start_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(mp.\"Campaign_End_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), mp.\"Campaign_Budget\", "
               + "to_char(mp.\"Media_Plan_Start_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(mp.\"Media_Plan_End_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), mp.\"Media_Plan_Budget\", '$'||ltrim(TO_CHAR(mp.\"Over_Budget\",'999G999G999G999G999D99')), to_char(mp.\"Created_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(mp.\"Updated_Date\",'mm'||'/'||'dd'||'/'||'yyyy') "
               + "from \"CP\".\"Clients_Saving\" cl, \"CP\".\"Campaigns_Saving\" cp, \"TM\".\"Target_Market_Saving\" tm, \"MP\".\"Media_Plan_Saving\" mp "
               + "where mp.\"User_Id\" = \'" + userId + "\' and cl.\"User_Id\" = mp.\"User_Id\" and cp.\"User_Id\" = mp.\"User_Id\" and tm.\"User_Id\" = mp.\"User_Id\" "
               + "and cl.\"Client_Id\" = mp.\"Client_Id\" and cp.\"Client_Id\" = mp.\"Client_Id\" and tm.\"Client_Id\" = mp.\"Client_Id\" and cp.\"Campaign_Id\" = mp.\"Campaign_Id\" and tm.\"Campaign_Id\" = mp.\"Campaign_Id\" and tm.\"Target_Market_Id\" = mp.\"Target_Market_Id\" "
               + "and cl.\"Status\" = \'A\' and cp.\"Status\" = \'A\' and tm.\"Status\" = \'A\' and mp.\"Status\" = \'A\' order by mp.\"Created_Date\" DESC nulls last, mp.\"Updated_Date\" DESC nulls last";
    
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    MediaPlanBean mpBean = new MediaPlanBean();

    mpBean.setMpClientName(rs.getString(1));
    mpBean.setMpCampaignName(rs.getString(2));
    mpBean.setMpTargetMarketName(rs.getString(3));
    mpBean.setMediaPlanName(rs.getString(4));
    mpBean.setMpMissionObjective(rs.getString(5));
    mpBean.setCpStartDate(rs.getString(6));
    mpBean.setCpEndDate(rs.getString(7));
    mpBean.setCpBudget(rs.getString(8));
    mpBean.setMpStartDate(rs.getString(9));
    mpBean.setMpEndDate(rs.getString(10));
    mpBean.setMpBudget(rs.getString(11));
    mpBean.setOverBudget(rs.getString(12));
    mpBean.setCreatedDate(rs.getString(13));
    mpBean.setUpdatedDate(rs.getString(14));

    mediaPlanSavinglist.add(mpBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return mediaPlanSavinglist;
}

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

public List targetMarketNamesTakeFromDB(String userName, String clientName, String campaignName) {    
    ResultSet rs = null;
    Integer campaignId = this.campaignIdTakeFromDBUsingCampaignName(userName,clientName,campaignName);
    List tmList = new ArrayList();
    String qry = "SELECT distinct \"Target_Market_Name\" from \"TM\".\"Target_Market_Saving\" where \"Campaign_Id\" = \'" + campaignId + "\' and \"Status\" = \'A\'";
   
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tmList.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tmList;
    }
}

public MediaPlanBean campaignFullDetailsTakeFromDB(String userName, String clientName, String campaignName) {
    ResultSet rs = null;
    MediaPlanBean mpsBean = new MediaPlanBean();
    Integer campaignId = this.campaignIdTakeFromDBUsingCampaignName(userName,clientName,campaignName);    
    String qry = "SELECT to_char(\"Start_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),to_char(\"End_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),\"Budget\"  from \"CP\".\"Campaigns_Saving\" where \"Campaign_Id\" = \'" + campaignId + "\' and \"Status\" = \'A\'";
    
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mpsBean.setCpStartDate(rs.getString(1));
    mpsBean.setCpEndDate(rs.getString(2));
    mpsBean.setCpBudget(rs.getString(3));

    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mpsBean;
    }
}

public int mediaplanDetailsSavingInToDB(String username,String mpClientName,String mpCampaignName,String mpTargetMarketName,String mediaplanName,String mpMissionObjective,String mpCampaignStartDate,
                                        String mpCampaignEndDate, String mpCampaignBudget, String mediaplanStartDate, String mediaplanEndDate, String mediaplanBudget) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;

    String procName = "\"MP\".\"mediaPlanDetailsSaving\"";
    ParamObjects param[] = new ParamObjects[13];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, username);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mpClientName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mpCampaignName);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, mpTargetMarketName);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, mediaplanName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, mpMissionObjective);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, mpCampaignStartDate);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, mpCampaignEndDate);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, mpCampaignBudget);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, mediaplanStartDate);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, mediaplanEndDate);
    dtype = Constants.STRING;
    param[12] = new ParamObjects(dtype, mediaplanBudget);
    for (int i = 0; i < 13; i++) {
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

public int mpClientDetailsSavingToDB(String userName,String clientName, String clientAddress1, String clientAddress2, String cityName, String stateName, String countryName, String zipCode, String contactPerson, String contactPhoneNo, String contactEmail) {
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

public int  mpCampaignFormSaving(String userName, String campaignClientName, String campaignName, String missionObjective, String campaignProducts, String campaignStartDate, String campaignEndDate, String campaignBudget) {
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

public String deleteMediaplanInDB(String userName,String clientName,String campaignName,String tmName,String mpName){
    ResultSet rs = null;
    Integer tmId = this.tmIdTakeFromDBUsingTMName(userName,clientName,campaignName,tmName);
    String deletedStatus = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry1 = "UPDATE \"MP\".\"Media_Plan_Saving\" set \"Status\" = \'I\',\"Deleted_Date\" = current_timestamp  where \"Target_Market_Id\" = \'" +tmId + "\' and \"Mediaplan_Name\" = \'" + mpName + "\' and \"Status\" = \'A\'";
    DAOUtilities.ExecuteNonStatment(qry1, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return deletedStatus;
}

public int  mediaplanDetailsModifyInToDB(String userName, String mpClientName, String mpCampaignName, String mpTargetMarketName, String mediaPlanName, String mpMissionObjective, String cpStartDate, String cpEndDate, String cpBudget, String mpStartDate, String mpEndDate, String mpBudget, String oldMediaPlanName) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MP\".\"mediaplanDetailsModification\"";
    ParamObjects param[] = new ParamObjects[14];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, mpClientName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, mpCampaignName);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, mpTargetMarketName);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, mediaPlanName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, mpMissionObjective);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, cpStartDate);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, cpEndDate);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, cpBudget);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, mpStartDate);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, mpEndDate);
     dtype = Constants.STRING;
    param[12] = new ParamObjects(dtype, mpBudget);
     dtype = Constants.STRING;
    param[13] = new ParamObjects(dtype, oldMediaPlanName);
    for (int i = 0; i < 14; i++) {
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

public String mediaPlanNameTakeFromDB(String userName,String clientName,String campaignName,String tmName,String mpName){
    ResultSet rs = null;
    Integer tmId = this.tmIdTakeFromDBUsingTMName(userName,clientName,campaignName,tmName);
    String mediaPlanName = null;
//    String qry = "SELECT distinct \"Mediaplan_Name\" from \"MP\".\"Media_Plan_Saving\" where \"Target_Market_Id\" = \'" + tmId + "\' and \"Mediaplan_Name\" = \'" + mpName + "\' and \"Status\" = \'A\'";
    String qry = "SELECT distinct \"Mediaplan_Name\" from \"MP\".\"Media_Plan_Saving\" where \"Target_Market_Id\" = \'" + tmId + "\' and \"Status\" = \'A\'";
    
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

public String mpClCpAndTmValidationDataCheckingInDB(String userName,String clientName,String campaignName,String tmName){
    ResultSet rs = null;
    Integer tmId = this.tmIdTakeFromDBUsingTMName(userName,clientName,campaignName,tmName);
    String mediaPlanName = null;
    String qry = "SELECT distinct \"Mediaplan_Name\" from \"MP\".\"Media_Plan_Saving\" where \"Target_Market_Id\" = \'" + tmId + "\' and \"Status\" = \'A\'";
    
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

public String mediaPlanNameTakeFromDBUsingUserId(String userName,String mpName){
    ResultSet rs = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    String mediaPlanName = null;
//    String qry = "SELECT distinct \"Mediaplan_Name\" from \"MP\".\"Media_Plan_Saving\" where \"Target_Market_Id\" = \'" + tmId + "\' and \"Mediaplan_Name\" = \'" + mpName + "\' and \"Status\" = \'A\'";
    String qry = "SELECT distinct \"Mediaplan_Name\" from \"MP\".\"Media_Plan_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Mediaplan_Name\" = \'" + mpName + "\' and \"Status\" = \'A\'";
    
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

public String updateOverBudgetInDB(String userName,String clientName,String campaignName,String tmName,String mpName,String overBudget){
    ResultSet rs = null;
    Integer tmId = this.tmIdTakeFromDBUsingTMName(userName,clientName,campaignName,tmName);
    String updatedStatus = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "UPDATE \"MP\".\"Media_Plan_Saving\" set \"Over_Budget\" = \'" +overBudget + "\' where \"Target_Market_Id\" = \'" +tmId + "\' and \"Mediaplan_Name\" = \'" + mpName + "\' and \"Status\" = \'A\'";
    DAOUtilities.ExecuteNonStatment(qry, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return updatedStatus;
}

public String deleteOverBudgetInDB(String userName,String clientName,String campaignName,String tmName,String mpName){
    ResultSet rs = null;
    Integer tmId = this.tmIdTakeFromDBUsingTMName(userName,clientName,campaignName,tmName);
    String deletedStatus = null;    
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "UPDATE \"MP\".\"Media_Plan_Saving\" set \"Over_Budget\" = null where \"Target_Market_Id\" = \'" +tmId + "\' and \"Mediaplan_Name\" = \'" + mpName + "\' and \"Status\" = \'A\'";
    DAOUtilities.ExecuteNonStatment(qry, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return deletedStatus;
}



}
