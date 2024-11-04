/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao;

import com.bmf.quickklix.core.dao.util.Constants;
import com.bmf.quickklix.core.dao.util.DAOUtilities;
import com.bmf.quickklix.core.dao.util.ParamObjects;
import com.bmf.quickklix.core.servlet.DBConnectionPool;
import com.bmf.quickklix.ui.userinformation.MediaMemberBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class MediaMemberDAO {
    Logger log = Logger.getLogger(MediaMemberDAO.class);
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

public int tvStationRequestFormSavingAndUpdatingInToDB(String userName, String tvStationName, String tvStationWebsite,
    String tvStationCity, String tvStationState, String tvStationContactName, String tvStationContactNumber,
    String tvStationEmail, String tvStationReach, String tvStationDemographics, String tvStationAdSlot, String tvStationAdTypes) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MI\".\"tvStationInfoSavingAndUpdating\"";
    
    ParamObjects param[] = new ParamObjects[13];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, tvStationName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, tvStationWebsite);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, tvStationCity);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, tvStationState);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, tvStationContactName);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, tvStationContactNumber);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, tvStationEmail);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, tvStationReach);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, tvStationDemographics);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, tvStationAdSlot);
    dtype = Constants.STRING;
    param[12] = new ParamObjects(dtype, tvStationAdTypes);
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

public int radioStationRequestFormSavingAndUpdatingInToDB(String userName,String radioStationName,String radioStationFrequency,
    String radioStationFormat,String radioStationSalesConName,String raioStationContactNo,String radioStationContactEmail,
    String radioStationDemographics,String radioStationBroadcast,String radioStationPurchasingAd,String radioStationAdSlot,
    String radioStationAdTypes,String radioStationDaypart,String radioOtherDaypart, String radioMorningDrive,String radioAveRate1,
    String radioPerSecond1,String radioMidday,String radioAveRate2,String radioPerSecond2,String radioAfternoonDrive,
    String radioAveRate3,String radioPerSecond3,String radioEvenings,String radioAveRate4,String radioPerSecond4,
    String radioOvernight,String radioAveRate5,String radioPerSecond5,String radioWeekend,String radioAveRate6,String radioPerSecond6) {

    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MI\".\"radioStationInfoSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[33];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, radioStationName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, radioStationFrequency);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, radioStationFormat);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, radioStationSalesConName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, raioStationContactNo);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, radioStationContactEmail);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, radioStationDemographics);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, radioStationBroadcast);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, radioStationPurchasingAd);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, radioStationAdSlot);
    dtype = Constants.STRING;
    param[12] = new ParamObjects(dtype, radioStationAdTypes);
    dtype = Constants.STRING;
    param[13] = new ParamObjects(dtype, radioStationDaypart);
    dtype = Constants.STRING;
    param[14] = new ParamObjects(dtype, radioOtherDaypart);
    dtype = Constants.STRING;
    param[15] = new ParamObjects(dtype, radioMorningDrive);
    dtype = Constants.STRING;
    param[16] = new ParamObjects(dtype, radioAveRate1);
    dtype = Constants.STRING;
    param[17] = new ParamObjects(dtype, radioPerSecond1);
    dtype = Constants.STRING;
    param[18] = new ParamObjects(dtype, radioMidday);
    dtype = Constants.STRING;
    param[19] = new ParamObjects(dtype, radioAveRate2);
    dtype = Constants.STRING;
    param[20] = new ParamObjects(dtype, radioPerSecond2);
    dtype = Constants.STRING;
    param[21] = new ParamObjects(dtype, radioAfternoonDrive);
    dtype = Constants.STRING;
    param[22] = new ParamObjects(dtype, radioAveRate3);
    dtype = Constants.STRING;
    param[23] = new ParamObjects(dtype, radioPerSecond3);
    dtype = Constants.STRING;
    param[24] = new ParamObjects(dtype, radioEvenings);
    dtype = Constants.STRING;
    param[25] = new ParamObjects(dtype, radioAveRate4);
    dtype = Constants.STRING;
    param[26] = new ParamObjects(dtype, radioPerSecond4);
    dtype = Constants.STRING;
    param[27] = new ParamObjects(dtype, radioOvernight);
    dtype = Constants.STRING;
    param[28] = new ParamObjects(dtype, radioAveRate5);
    dtype = Constants.STRING;
    param[29] = new ParamObjects(dtype, radioPerSecond5);
    dtype = Constants.STRING;
    param[30] = new ParamObjects(dtype, radioWeekend);
    dtype = Constants.STRING;
    param[31] = new ParamObjects(dtype, radioAveRate6);
    dtype = Constants.STRING;
    param[32] = new ParamObjects(dtype, radioPerSecond6);
    for (int i = 0; i < 33; i++) {
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

public MediaMemberBean tvStationRequestFormInfoFromDB(String userName) {
    MediaMemberBean mMebBean = new MediaMemberBean();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select \"Station_Name\",\"Station_Website\",\"City\",\"State_Name\",\"Contact_Person_Name\" ,\"Phone_No\" ,\"Email\" ,\"Reach_of_Station\" ,\"Demographics\" ,\"Available_Ad_Slots\" ,\"Type_of_Ads\"  from \"MI\".\"TV_Info_Saving\" where \"User_Id\" = \'" + userId + "\'";
    
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mMebBean.setTvStationName(rs.getString(1));
    mMebBean.setTvStationWebsite(rs.getString(2));
    mMebBean.setTvStationCity(rs.getString(3));
    mMebBean.setTvStationState(rs.getString(4));
    mMebBean.setTvStationContactName(rs.getString(5));
    mMebBean.setTvStationContactNumber(rs.getString(6));
    mMebBean.setTvStationEmail(rs.getString(7));
    mMebBean.setTvStationReach(rs.getString(8));
    mMebBean.setTvStationDemographics(rs.getString(9));
    mMebBean.setTvStationAdSlot(rs.getString(10));
    mMebBean.setTvStationAdTypes(rs.getString(11));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mMebBean;
    }
}

public MediaMemberBean radioStationRequestFormInfoFromDB(String userName) {
    MediaMemberBean mMebBean = new MediaMemberBean();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select \"Radio_Station_Name\",\"Frequency\",\"Format\",\"Contact_Person_Name\",\"Phone_No\" ,\"Email\" ,\"Demographics\" ,\"Broadcast_Area\" ,\"Lead_Time\" ,\"Ad_Slot_Type\" ,\"Ad_Type\", "
            +"\"Station_Daypart\",\"Description_of_Daypart\",\"Morning_Drive\",\"Avg_Price\",\"Per_Sec\" ,\"Midday_Drive\" ,\"Midday_Avg_Price\" ,\"Midday_Per_Sec\" ,\"Afternoon_Drive\" ,\"Afternoon_Avg_Price\" ,\"Afternoon_Per_Sec\", "
            + "\"Evenings_Drive\",\"Evenings_Avg_Price\",\"Evenings_Per_Sec\",\"Overnight_Drive\",\"Overnight_Avg_Price\" ,\"Overnight_Per_Sec\" ,\"Weekend_Drive\" ,\"Weekend_Avg_Price\" ,\"Weekend_Per_Sec\"   from \"MI\".\"Radio_Info_Saving\" where \"User_Id\" = \'" + userId + "\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mMebBean.setRadStationName(rs.getString(1));
    mMebBean.setRadioStationFrequency(rs.getString(2));
    mMebBean.setRadioStationFormat(rs.getString(3));
    mMebBean.setRadioStationSalesConName(rs.getString(4));
    mMebBean.setRaioStationContactNo(rs.getString(5));
    mMebBean.setRadioStationContactEmail(rs.getString(6));
    mMebBean.setRadioStationDemographics(rs.getString(7));
    mMebBean.setRadioStationBroadcast(rs.getString(8));
    mMebBean.setRadioStationPurchasingAd(rs.getString(9));
    mMebBean.setRadioStationAdSlot(rs.getString(10));
    mMebBean.setRadioStationAdTypes(rs.getString(11));
    mMebBean.setRadioStationDaypart(rs.getString(12));
    mMebBean.setRadioOtherDaypart(rs.getString(13));
    mMebBean.setRadioMorningDrive(rs.getString(14));
    mMebBean.setRadioAveRate1(rs.getString(15));
    mMebBean.setRadioPerSecond1(rs.getString(16));
    mMebBean.setRadioMidday(rs.getString(17));
    mMebBean.setRadioAveRate2(rs.getString(18));
    mMebBean.setRadioPerSecond2(rs.getString(19));
    mMebBean.setRadioAfternoonDrive(rs.getString(20));
    mMebBean.setRadioAveRate3(rs.getString(21));
    mMebBean.setRadioPerSecond3(rs.getString(22));
    mMebBean.setRadioEvenings(rs.getString(23));
    mMebBean.setRadioAveRate4(rs.getString(24));
    mMebBean.setRadioPerSecond4(rs.getString(25));
    mMebBean.setRadioOvernight(rs.getString(26));
    mMebBean.setRadioAveRate5(rs.getString(27));
    mMebBean.setRadioPerSecond5(rs.getString(28));
    mMebBean.setRadioWeekend(rs.getString(29));
    mMebBean.setRadioAveRate6(rs.getString(30));
    mMebBean.setRadioPerSecond6(rs.getString(31));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mMebBean;
    }
}

public int newsPaperRequestFormSavingAndUpdatingInToDB(String userName, String newspaperName, String newsPapaerWebsite, String newsPaperCity, String newsPaperState, String newsPaperAdSalesContactName, String newsPaperContactNumber, String newsPaperContactEmail, String reachOfNewsPaper, String newsPaperDemographics, String newsPaperAdvSlots, String newsPaperTypeofAds,String newsPaperAdsPrice) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MI\".\"newsPaperInfoSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[14];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, newspaperName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, newsPapaerWebsite);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, newsPaperCity);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, newsPaperState);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, newsPaperAdSalesContactName);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, newsPaperContactNumber);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, newsPaperContactEmail);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, reachOfNewsPaper);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, newsPaperDemographics);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, newsPaperAdvSlots);
    dtype = Constants.STRING;
    param[12] = new ParamObjects(dtype, newsPaperTypeofAds);
    dtype = Constants.STRING;
    param[13] = new ParamObjects(dtype, newsPaperAdsPrice);

    for (int i = 0; i < 14; i++) {
    paramList.add(param[i]);
    }
    try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    }
    return retObj.INTEGER;
    }


public MediaMemberBean newsPaperRequestFormInfoFromDB(String userName) {
    MediaMemberBean mMebBean = new MediaMemberBean();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select \"Newspaper_Name\",\"Newspaper_Website\",\"City\",\"State_Name\",\"Contact_Person_Name\" ,\"Phone_No\" ,\"Email\" ,\"Reach_of_Newspaper\" ,\"Demographics\" ,\"Available_Ad_Slots\" ,\"Type_of_Ad\",\"Ad_Price\"  from \"MI\".\"Newspaper_Info_Saving\"  where \"User_Id\" = \'" + userId + "\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mMebBean.setNameOfNewsPaper(rs.getString(1));
    mMebBean.setNewsPaperWebsite(rs.getString(2));
    mMebBean.setNewsPaperCity(rs.getString(3));
    mMebBean.setNewsPaperState(rs.getString(4));
    mMebBean.setNewsPaperAdSalesContactName(rs.getString(5));
    mMebBean.setNewsPaperContactNumber(rs.getString(6));
    mMebBean.setNewsPaperContactEmail(rs.getString(7));
    mMebBean.setReachOfNewsPaper(rs.getString(8));
    mMebBean.setNewsPaperDemographics(rs.getString(9));
    mMebBean.setNewsPaperAdvSlots(rs.getString(10));
    mMebBean.setNewsPaperTypeofAds(rs.getString(11));
    mMebBean.setNewsPaperAdPrices(rs.getString(12));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mMebBean;
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

public int magazineRequestFormSavingAndUpdatingInToDB(String userName,String magazineName, String magzineWebsite, String magzineCity, String magzineState, String magzineContactName, String magzineContactNo, String magzineContactEmail, String magzineReach, String magzineDemographics, String magzineAdSlot, String magzineAdType, String magzineAdPrice) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MI\".\"magzineInfoSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[14];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, magazineName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, magzineWebsite);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, magzineCity);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, magzineState);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, magzineContactName);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, magzineContactNo);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, magzineContactEmail);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, magzineReach);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, magzineDemographics);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, magzineAdSlot);
    dtype = Constants.STRING;
    param[12] = new ParamObjects(dtype, magzineAdType);
    dtype = Constants.STRING;
    param[13] = new ParamObjects(dtype, magzineAdPrice);
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

public MediaMemberBean magazineRequestFormInfoFromDB(String userName) {
    MediaMemberBean mMebBean = new MediaMemberBean();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select \"Magazine_Name\",\"Magazine_Website\",\"City\",\"State_Name\",\"Contact_Person_Name\",\"Phone_No\",\"Email\",\"Reach_of_Magazine\",\"Demographics\",\"Available_Ad_Slots\",\"Type_of_Ad\",\"Ad_Price\""
               + "from \"MI\".\"Magazines_Info_Saving\" where \"User_Id\"=\'" + userId + "\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mMebBean.setMagzineName(rs.getString(1));
    mMebBean.setMagzineWebsite(rs.getString(2));
    mMebBean.setMagzineCity(rs.getString(3));
    mMebBean.setMagzineState(rs.getString(4));
    mMebBean.setMagzineContactName(rs.getString(5));
    mMebBean.setMagzineContactNo(rs.getString(6));
    mMebBean.setMagzineContactEmail(rs.getString(7));
    mMebBean.setMagzineReach(rs.getString(8));
    mMebBean.setMagzineDemographics(rs.getString(9));
    mMebBean.setMagzineAdSlot(rs.getString(10));
    mMebBean.setMagzineAdType(rs.getString(11));
    mMebBean.setMagzineAdPrice(rs.getString(12));

    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return mMebBean;
}

public int othMediaRequestFormSavingAndUpdatingInToDB(String userName, String othMediaName, String othMediaWebsite, String othMediaCity, String othMediaState,String othMediaContactName, String othMediaContactNumber, String othMediaEmail, String othMediaReach,String othMediaDemographics, String othMediaAdSlots) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"MI\".\"otherMediaInfoSavingAndUpdating\"";
    ParamObjects param[] = new ParamObjects[12];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, othMediaName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, othMediaWebsite);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, othMediaCity);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, othMediaState);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, othMediaContactName);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, othMediaContactNumber);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, othMediaEmail);
    dtype = Constants.STRING;
    param[9] = new ParamObjects(dtype, othMediaReach);
    dtype = Constants.STRING;
    param[10] = new ParamObjects(dtype, othMediaDemographics);
    dtype = Constants.STRING;
    param[11] = new ParamObjects(dtype, othMediaAdSlots);
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

public MediaMemberBean otherMediaRequestFormInfoFromDB(String userName) {
    MediaMemberBean mMebBean = new MediaMemberBean();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select \"Media_Name\",\"Media_Website\",\"City\",\"State_Name\",\"Contact_Person_Name\" ,\"Phone_No\" ,\"Email\" ,\"Reach_of_Media\" ,\"Demographics\" ,\"Available_Ad_Slots\"  from \"MI\".\"Other_Media_Info_Saving\" where \"User_Id\" = \'" + userId + "\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mMebBean.setOthMediaName(rs.getString(1));
    mMebBean.setOthMediaWebsite(rs.getString(2));
    mMebBean.setOthMediaCity(rs.getString(3));
    mMebBean.setOthMediaState(rs.getString(4));
    mMebBean.setOthMediaContactName(rs.getString(5));
    mMebBean.setOthMediaContactNumber(rs.getString(6));
    mMebBean.setOthMediaEmail(rs.getString(7));
    mMebBean.setOthMediaReach(rs.getString(8));
    mMebBean.setOthMediaDemographics(rs.getString(9));
    mMebBean.setOthMediaAdSlots(rs.getString(10));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mMebBean;
    }
}








}
