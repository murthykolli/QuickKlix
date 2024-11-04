/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao;

import com.bmf.quickklix.core.dao.util.Constants;
import com.bmf.quickklix.core.dao.util.DAOUtilities;
import com.bmf.quickklix.core.dao.util.ParamObjects;
import com.bmf.quickklix.core.servlet.DBConnectionPool;

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
public class ReportsDAO {
    Logger log = Logger.getLogger(ReportsDAO.class);
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

}
