/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao;

import com.bmf.quickklix.core.dao.util.Constants;
import com.bmf.quickklix.core.dao.util.DAOUtilities;
import com.bmf.quickklix.core.dao.util.ParamObjects;
import com.bmf.quickklix.core.servlet.DBConnectionPool;
import com.bmf.quickklix.ui.userinformation.LoginBean;
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
public class UserInformationDAO {
    Logger log = Logger.getLogger(UserInformationDAO.class);
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

public int userRegistration(String userName,String password) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"UI\".\"userRegistration\"";
    ParamObjects param[] = new ParamObjects[3];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, password);
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

public String loginVerification(String userName, String password) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"UI\".\"userLoginVerification\"";
    ParamObjects param[] = new ParamObjects[3];
    dtype = Constants.STRING;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, password);
    for (int i = 0; i < 3; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    }
    return retObj.STRING;
}

public Integer userActivationInDB(String userName) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"UI\".\"userActivation\"";
    ParamObjects param[] = new ParamObjects[2];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    for (int i = 0; i < 2; i++) {
    paramList.add(param[i]);
    } try {
    conn = DBConnectionPool.getConnection();
    retObj = DAOUtilities.ExecuteProcedure(procName, paramList, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    if (retObj.INTEGER == 1) {
    return 1;
    } else if (retObj.INTEGER == 2) {
    return 2;
    }else {
    return 3;
    }
    }

}

public List industryListTakeFromDB() {
    List industrylist = new ArrayList();
    ResultSet rs = null;
    try {
    String qry = "select \"Industry_Description\" from \"UI\".\"Industry\"";
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    industrylist.add(rs.getString(1));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return industrylist;
    }
}

public int primaryContactInformationSavingInDB(String userName,String firstName, String lastName, String phoneNumber, String companyName, String industryName, String mediaselection, String mediaType) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"UI\".\"primaryContactInfoSaving\"";
    ParamObjects param[] = new ParamObjects[9];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, firstName);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, lastName);
    dtype = Constants.STRING;
    param[4] = new ParamObjects(dtype, phoneNumber);
    dtype = Constants.STRING;
    param[5] = new ParamObjects(dtype, companyName);
    dtype = Constants.STRING;
    param[6] = new ParamObjects(dtype, industryName);
    dtype = Constants.STRING;
    param[7] = new ParamObjects(dtype, mediaselection);
    dtype = Constants.STRING;
    param[8] = new ParamObjects(dtype, mediaType);

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

public String primaryContactUserNameTakeFromDB(String userName){
    ResultSet rs = null;
    String usersName = null;
    String qry = "SELECT \"User_Name\" from \"UI\".\"Primary_Contact_Info\" where \"User_Name\" = \'" + userName + "\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    usersName = rs.getString(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return usersName;
    }
}

public Integer passwordChange(String userName, String oldPassword, String newPassword) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String dtype;
    String procName = "\"UI\".\"passwordChangeWithCurrentPassword\"";
    ParamObjects param[] = new ParamObjects[4];
    dtype = Constants.INTEGER;
    param[0] = new ParamObjects(dtype);
    dtype = Constants.STRING;
    param[1] = new ParamObjects(dtype, userName);
    dtype = Constants.STRING;
    param[2] = new ParamObjects(dtype, oldPassword);
    dtype = Constants.STRING;
    param[3] = new ParamObjects(dtype, newPassword);
    
    for (int i = 0; i < 4; i++) {
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

public String updatePrimaryContactInformation(String userName, String firstName, String lastName, String phoneNumber, String companyName){
    ResultSet rs = null;
    String status = null;
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    try {
    conn = DBConnectionPool.getConnection();
    String qry1 = "UPDATE \"UI\".\"Primary_Contact_Info\" set \"First_Name\" = \'" + firstName + "\',\"Last_Name\" = \'" + lastName + "\', \"Phone\" = \'" + phoneNumber + "\', \"Company_Name\" = \'" + companyName + "\', \"Updated_Date\"  = current_date where \"User_Id\" = \'" + userId + "\' ";
    DAOUtilities.ExecuteNonStatment(qry1, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    }
    return status;
}

public LoginBean primaryContactsListTakeFromDB(String userName) {
    LoginBean lBean = new LoginBean();
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    String qry = "select \"First_Name\",\"Last_Name\",\"Phone\",\"Company_Name\" from \"UI\".\"Primary_Contact_Info\" where \"User_Id\" = \'" + userId + "\'";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    lBean.setFirstName(rs.getString(1));
    lBean.setLastName(rs.getString(2));
    lBean.setPhoneNumber(rs.getString(3));
    lBean.setCompanyName(rs.getString(4));
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return lBean;
    }
}


public String forgotPassEmailVarify(String email) {
    String userName = null;
    String qry = "select \"User_Name\" from \"UI\".\"Users_Information\" where \"User_Name\"= \'" + email + "\'";
    ResultSet rs = null;
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    userName = rs.getString(1);
    } }catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return userName;
    }
}

public void securityPinSaving(String email,String securityPIN) {
    try {
    conn = DBConnectionPool.getConnection();
    String qry = "UPDATE \"UI\".\"Users_Information\" set \"Security_Pin\" = \'" +securityPIN + "\'  where  \"User_Name\" = \'" +email + "\' ";
    DAOUtilities.ExecuteNonStatment(qry, conn);
    } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    }
}

public int passwordChangewithSecurityPin(String userName, String password, String securityPin) {
    List paramList = new ArrayList();
    ParamObjects retObj = null;
    String procName = "\"UI\".\"passwordChangewithSecurityPin\"";
    ParamObjects ParamObjects[] = new ParamObjects[4];
    String Dtype = "Integer";
    ParamObjects[0] = new ParamObjects(Dtype);
    Dtype = Constants.STRING;
    ParamObjects[1] = new ParamObjects(Dtype, userName);
    Dtype = Constants.STRING;
    ParamObjects[2] = new ParamObjects(Dtype, password);
    Dtype = Constants.STRING;
    ParamObjects[3] = new ParamObjects(Dtype, securityPin);
    for (int i = 0; i < 4; i++) {
    paramList.add(ParamObjects[i]);
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

public int campaignCountTakeFromDB(String userName) {
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    int campaignCount = 0;
    String qry = "SELECT count(\"Campaign_Id\") from \"CP\".\"Campaigns_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    campaignCount = rs.getInt(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return campaignCount;
    }
}

public int targetMarketCountTakeFromDB(String userName) {
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    int tmCount = 0;
    String qry = "SELECT count(\"Target_Market_Id\") from \"TM\".\"Target_Market_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    tmCount = rs.getInt(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return tmCount;
    }
}

public int mediaPlanCountTakeFromDB(String userName) {
    Integer userId = this.userIdTakeFromDBUsingUserName(userName);
    ResultSet rs = null;
    int mpCount = 0;
    String qry = "SELECT count(\"Media_Plan_Id\") from \"MP\".\"Media_Plan_Saving\" where \"User_Id\" = \'" + userId + "\' and \"Status\" = \'A\' ";
    try {
    conn = DBConnectionPool.getConnection();
    rs = DAOUtilities.ExecuteStatement(qry, conn);
    while (rs.next()) {
    mpCount = rs.getInt(1);
    } } catch (Exception e) {
    } finally {
    DBConnectionPool.freeConnection(conn);
    DAOUtilities.closeResultSet(rs);
    return mpCount;
    }
}


}
