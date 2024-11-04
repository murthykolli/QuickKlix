/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao;

import com.bmf.quickklix.core.dao.util.Constants;
import com.bmf.quickklix.core.dao.util.DAOUtilities;
import com.bmf.quickklix.core.dao.util.ParamObjects;
import com.bmf.quickklix.core.servlet.DBConnectionPool;
import com.bmf.quickklix.ui.campaignplan.CampaignPlanBean;
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
public class CampaignPlanDAO {
    Logger log = Logger.getLogger(CampaignPlanDAO.class);
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
    String qry = "SELECT distinct \"Client_Id\" from \"CP\".\"Clients_Saving\" where \"Client_Name\" = \'" + clientName + "\' and \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\'";
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
    String qry = "SELECT distinct \"Client_Name\" from \"CP\".\"Clients_Saving\" where \"Client_Id\" = \'" + clientId + "\' and \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\' ";
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

public List clientNamesListFromDB(String userName) {
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    List clientNamesList = new ArrayList();
    String qry = "select distinct \"Client_Name\" from \"CP\".\"Clients_Saving\"  where \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\' order by \"Client_Name\" ASC  ";
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

public Integer campaignIdTakeFromDBUsingCampaignName(String userName,String campaignName,String clientName){
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

public int  campaignFormSaving(String userName, String campaignClientName, String campaignName, String missionObjective, String campaignProducts, String campaignStartDate, String campaignEndDate, String campaignBudget) {
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

public int  campaignModificationDataSavingInToDB(String userName, String campaignClientName, String campaignName, String missionObjective, String campaignProducts, String campaignStartDate, String campaignEndDate, String campaignBudget, String oldCampName) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"CP\".\"campaignDetailsModification\"";
    ParamObjects param[] = new ParamObjects[10];
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
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, oldCampName);
    
    for (int i = 0; i < 10; i++) {
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

public List campaignDetailsTakeFromDB(String userName) {
    List campaignSavinglist = new ArrayList();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select cp.\"Campaign_Name\", cl.\"Client_Name\", cp.\"Mission_Objective\", cp.\"Products\", to_char(cp.\"Start_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(cp.\"End_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), cp.\"Budget\", to_char(cp.\"Created_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(cp.\"Updated_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), "
               + "to_char(cp.\"Media_Plan_Start_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), to_char(cp.\"Media_Plan_End_Date\",'mm'||'/'||'dd'||'/'||'yyyy'), cp.\"Media_Plan_Budget\" " 
               + "from \"CP\".\"Clients_Saving\" cl, \"CP\".\"Campaigns_Saving\" cp "
               + "where cp.\"User_Id\" = \'" + userId + "\' and cl.\"User_Id\" = cp.\"User_Id\" and cl.\"Client_Id\" = cp.\"Client_Id\" and cp.\"Status\" = \'A\' and cl.\"Status\" = \'A\' order by cp.\"Created_Date\" DESC nulls last,cp.\"Updated_Date\" DESC nulls last";
    
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    CampaignPlanBean cpBean = new CampaignPlanBean();
    cpBean.setCampaignName(rs.getString(1));
    cpBean.setCampaignClientName(rs.getString(2));
    cpBean.setMissionObjective(rs.getString(3));
    cpBean.setCampaignProducts(rs.getString(4));
    cpBean.setCampaignStartDate(rs.getString(5));
    cpBean.setCampaignEndDate(rs.getString(6));
    cpBean.setCampaignBudget(rs.getString(7));
    cpBean.setCreatedDate(rs.getString(8));
    cpBean.setModifiedDate(rs.getString(9));
    String mpStartDate = rs.getString(10);
    String mpEndDate = rs.getString(11);
    String mpBudget = rs.getString(12);
    if(mpStartDate == null){
    cpBean.setMpStartDate("MpStartDate");    
    }else{
    cpBean.setMpStartDate(mpStartDate);    
    } if(mpEndDate == null){
    cpBean.setMpEndDate("MpEndDate");    
    }else{
    cpBean.setMpEndDate(mpEndDate);    
    } if(mpBudget == null){
    cpBean.setMpBudget("MpBudget");    
    }else{
    cpBean.setMpBudget(mpBudget);    
    } 
    campaignSavinglist.add(cpBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return campaignSavinglist;
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

  public int clientDetailsSavingToDB(String userName,String clientName, String clientAddress1, String clientAddress2, String cityName, String stateName, String countryName, String zipCode, String contactPerson, String contactPhoneNo, String contactEmail) {
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

public List clientDetailsTakeFromDB(String userName) {
    List campaignSavinglist = new ArrayList();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select \"Client_Name\",\"City\",\"State_Name\",\"Country_Name\",\"Zip_Code\",\"Contact_Person_Name\",\"Contact_Phone_Number\",\"Contact_Email\",to_char(\"Created_Date\",'mm'||'/'||'dd'||'/'||'yyyy'),to_char(\"Updated_Date\",'mm'||'/'||'dd'||'/'||'yyyy') "
               + "from \"CP\".\"Clients_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\' order by \"Created_Date\" DESC nulls last,\"Updated_Date\" DESC nulls last";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    CampaignPlanBean cpBean = new CampaignPlanBean();
    cpBean.setClientName(rs.getString(1));
    cpBean.setCityName(rs.getString(2));
    cpBean.setStateName(rs.getString(3));
    cpBean.setCountryName(rs.getString(4));
    cpBean.setZipCode(rs.getString(5));
    cpBean.setContactPerson(rs.getString(6));
    cpBean.setContactPhoneNo(rs.getString(7));
    cpBean.setContactEmail(rs.getString(8));
    cpBean.setCreatedDate(rs.getString(9));
    cpBean.setModifiedDate(rs.getString(10));

    campaignSavinglist.add(cpBean);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return campaignSavinglist;
}

public String deleteCampaignsInDB(String userName,String campaignName,String clientName){
    ResultSet rs = null;
    Integer clientId = this.clientIdTakeFromDBUsingClientName(userName,clientName);
    String deletedStatus = null;
    try {
    conn = DBConnectionPool.getConnection();
    String qry1 = "UPDATE \"CP\".\"Campaigns_Saving\" set \"Status\" = \'I\',\"Deleted_Date\" = current_timestamp  where \"Client_Id\" = \'" +clientId + "\' and \"Campaign_Name\" = \'" + campaignName + "\' and \"Status\" = \'A\'";
    DAOUtilities.ExecuteNonStatment(qry1, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return deletedStatus;
}

public int deleteClientssInDB(String userName,String clientName){
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"CP\".\"deleteClientsDataFromDB\"";
    ParamObjects param[] = new ParamObjects[3];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, clientName);
    dtype = Constants.STRING;

    for (int i = 0; i < 3; i++) {
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

public CampaignPlanBean clientModifiedValuesTakeFromDBTOJsp(String userName,String clientName) {
    CampaignPlanBean cpBean = new CampaignPlanBean();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select \"Client_Name\",\"Address_1\",\"Address_2\",\"City\",\"State_Name\",\"Country_Name\",\"Zip_Code\",\"Contact_Person_Name\",\"Contact_Phone_Number\",\"Contact_Email\" "
               + "from \"CP\".\"Clients_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Client_Name\" = \'" + clientName + "\' and \"Status\" = \'A\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    cpBean.setClientName(rs.getString(1));
    cpBean.setClientAddress1(rs.getString(2));
    cpBean.setClientAddress2(rs.getString(3));
    cpBean.setCityName(rs.getString(4));
    cpBean.setStateName(rs.getString(5));
    cpBean.setCountryName(rs.getString(6));
    cpBean.setZipCode(rs.getString(7));
    cpBean.setContactPerson(rs.getString(8));
    cpBean.setContactPhoneNo(rs.getString(9));
    cpBean.setContactEmail(rs.getString(10));
    cpBean.setCreatedDate(rs.getString(11));
    cpBean.setModifiedDate(rs.getString(12));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return cpBean;
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

public String campaignNameTakeFromDB(String userName,String campaignsName){
    ResultSet rs = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    String clientName = null;
    String qry = "SELECT distinct \"Campaign_Name\" from \"CP\".\"Campaigns_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Campaign_Name\" = \'" + campaignsName + "\' and \"Status\" = \'A\'";
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

public int clientModifiedDataUpdateInToDB(String userName,String clientName,String attrValue,String attrName){
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"CP\".\"clientModifiedDataUpdateInToDB\"";
    ParamObjects param[] = new ParamObjects[5];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, clientName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, attrValue);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, attrName);

    for (int i = 0; i < 5; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    e.printStackTrace();
    } finally {
    DBConnectionPool.freeConnection(conn);
    }    
    return retObj.INTEGER;
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

public String mediaMemberRequestTypeTakeFromDB(String userName){
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String typeOfMedia = null;
    String qry = "SELECT \"Type_of_Media\" from \"UI\".\"Primary_Contact_Info\" where \"User_Id\" = \'" + userId + "\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    typeOfMedia = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return typeOfMedia;
    }
}

public int sendInvitationsavedIntoDB(String userName, String senderName, String senderEmail) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"CP\".\"sendInvitationDetailsSaving\"";
    ParamObjects param[] = new ParamObjects[4];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, senderName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, senderEmail);
    dtype = Constants.STRING;
    for (int i = 0; i < 4; i++) {
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

public String tmNameTakeFromDB(String userName,String campaignName,String clientName) {
    Integer campaignId = this.campaignIdTakeFromDBUsingCampaignName(userName,campaignName, clientName);
    String tmName = null;
    String qry = "select distinct \"Target_Market_Name\" from \"TM\".\"Target_Market_Saving\"  where \"Campaign_Id\" = \'" + campaignId + "\' and \"Status\" = \'A\' ";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tmName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tmName;
    }
}

public String userIdForSendInvitationFromDB(String senderEmail) {
    String userName = null;
    String qry = "select \"User_Name\" from \"UI\".\"Users_Information\"  where \"User_Name\" = \'" + senderEmail + "\' and (\"User_Status\" = \'A\' or \"User_Status\" = \'M\') ";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    userName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return userName;
    }
}








}
