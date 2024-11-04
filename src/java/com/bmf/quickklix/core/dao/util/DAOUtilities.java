/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bmf.quickklix.core.dao.util;

import java.sql.*;
import java.util.*;
import org.apache.log4j.Logger;

/**
 *
 * @author Murthyk
 */
public class DAOUtilities {


    private DAOUtilities() {
        //default constructor
    }

    public static void closeConnecion(Connection conn) {
        Logger log = Logger.getLogger(DAOUtilities.class);
        try {
            if (conn != null && !(conn.isClosed())) {
                conn.close();
                conn = null;

            }
        } catch (Exception e) {
        }

    }

    //for closing statement object
    public static void closeStatement(Statement stmt) {
        Logger log = Logger.getLogger(DAOUtilities.class);
        if (stmt != null) {
            try {
                stmt.close();
                stmt = null;
            } catch (SQLException ex) {
                //exception occured in closing statement
            }
        }
    }

    //for closing preparestatement object
    public static void closePrepareStatement(PreparedStatement pstmt) {
        Logger log = Logger.getLogger(DAOUtilities.class);
        if (pstmt != null) {
            try {
                pstmt.close();
                pstmt = null;
            } catch (SQLException ex) {
                //exception occured in closing preparestatement
            }
        }
    }

    //for closing callablestatement object
    public static void closeCallableStatement(CallableStatement cstmt) {
        Logger log = Logger.getLogger(DAOUtilities.class);
        if (cstmt != null) {
            try {
                cstmt.close();
                cstmt = null;
            } catch (SQLException ex) {
                //exception occured in closing callable statement
            }
        }
    }

    //for closing resultset object
    public static void closeResultSet(ResultSet rs) {
        Logger log = Logger.getLogger(DAOUtilities.class);
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (SQLException ex) {
                //exception occured in closing resultset
            }
        }
    }

    //executes sql query and
    //returns either resultset object or integer value which resembles no
    //of rows updated..
    public static ParamObjects ExecuteQuery(final String qry, final List param, final Connection conn) {
        Logger log = Logger.getLogger(DAOUtilities.class);
        //return object
        ParamObjects robj = null;
        //holds objects fetched from param collection
        ParamObjects obj;
        //holds the returned value from executequery
        ResultSet rset = null;
        Integer res = null;

        PreparedStatement pstmt = null;
        //holds no of objects in param collection
        Integer paramCount = 0;
        paramCount = param.size();

        try {
            pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            //if param_count is not greater than '1' means
            //the query does not any parameters to be set.....
            //if (param_count != 0 && param_count != 1) {

            if (paramCount > 1) {
                for (int i = 1; i < paramCount; i++) {
                    obj = (ParamObjects) param.get(i);
                    if ((obj.DTYPE).equals(Constants.INTEGER)) {
                        pstmt.setInt(i, obj.INTEGER);
                    } else if ((obj.DTYPE).equals(Constants.STRING)) {
                        pstmt.setString(i, obj.STRING);
                    } else if ((obj.DTYPE).equals(Constants.SQLDATE)) {
                        pstmt.setDate(i, obj.SQLDATE);
                    } else if ((obj.DTYPE).equals(Constants.DOUBLE)) {
                        pstmt.setDouble(i, obj.DOUBLE);
                    } else if ((obj.DTYPE).equals(Constants.FLOAT)) {
                        pstmt.setFloat(i, obj.FLOAT);
                    } else if ((obj.DTYPE).equals(Constants.LONG)) {
                        pstmt.setLong(i, obj.LONG);
                    } else if ((obj.DTYPE).equals(Constants.BLOB)) {
                        pstmt.setBlob(i, obj.BLOB);
                    } else if ((obj.DTYPE).equals(Constants.TIMESTAMP)) {
                        pstmt.setTimestamp(i, obj.TIMESTAMP);
                    } else if ((obj.DTYPE).equals(Constants.BOOLEAN)) {
                        pstmt.setBoolean(i, obj.BOOLEAN);
                    } else if ((obj.DTYPE).equals(Constants.BYTE)) {
                        pstmt.setByte(i, obj.BYTE);
                    }
                }
            }

            obj = (ParamObjects) param.get(0);
            //checking which value should be returned
            if ((obj.DTYPE).equals(Constants.INTEGER)) {
                res = pstmt.executeUpdate();
            } else if ((obj.DTYPE).equals(Constants.RESULTSET)) {
                rset = pstmt.executeQuery();
            }



        } catch (Exception e) {
            //exceptions may occur
        } finally {
            DAOUtilities.closePrepareStatement(pstmt);
            //DBConnectionPool.freeConnection(conn);

//            try{
//                DAOUtilities.closeResultSet(rset);
//            }catch(Exception e){
//            }
            obj = (ParamObjects) param.get(0);
            //preparing object that to be
            //returned
            if ((obj.DTYPE).equals(Constants.INTEGER)) {
                robj = new ParamObjects(Constants.INTEGER, res);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.RESULTSET)) {
                robj = new ParamObjects(Constants.RESULTSET, rset);
                return robj;
            }
            return robj;
        }

    }

    //this function is particularly meant for
    //sql query which does not take any arguments
    public static ResultSet ExecuteStatement(final String qry, final Connection conn) throws Exception {
        Logger log = Logger.getLogger(DAOUtilities.class);
        ResultSet rs = null;

        Statement stmt = null;

        try {
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(qry);
        } catch (SQLException se) {
            //exception may occur for resource not availble
        } finally {
            //DAOUtilities.closeStatement(stmt);

            //DAOUtilities.closeStatement(stmt);
            return rs;
        }
    }

    //executes sql query and returns
    //returns no of rows affected by query
    public static Integer ExecuteNonStatment(final String qry, final Connection conn) {
        Logger log = Logger.getLogger(DAOUtilities.class);
        Integer res = 0;
        Statement stmt = null;

        try {
            stmt = conn.createStatement();
            res = stmt.executeUpdate(qry);

        } catch (SQLException se) {
            //exception may occur for resource already exists
            //exception may occur resource not availble
        } finally {
            DAOUtilities.closeStatement(stmt);
            return res;
        }
    }

    //executes any stored functions  means which
    //takes any no of arguments and any type of return datatype
    public static ParamObjects ExecuteProcedure(final String ProcName, final java.util.List param, final Connection conn) {
        Logger log = Logger.getLogger(DAOUtilities.class);

        CallableStatement cs = null;
        //for holding objects fetched from param collections
        ParamObjects obj = null;

        //the object that is to be returned to calling function
        ParamObjects robj = null;
        //the object which holds values returned by
        //stored function
        ParamObjects retObj = new ParamObjects();


        //holds the count of no of objects in param collection
        Integer paramCount = 0;
        //having procedure name with parameters..
        String proc = null;

        paramCount = param.size();

        //preparing callablestatement parameter
        switch (paramCount) {
            case 1:
                proc = "{?=call " + ProcName + "(" + ")" + "}";
                break;
            case 2:
                proc = "{?=call " + ProcName + "(" + "?" + ")" + "}";
                break;
            case 3:
                proc = "{?=call " + ProcName + "(" + "?,?" + ")" + "}";
                break;
            case 4:
                proc = "{?=call " + ProcName + "(" + "?,?,?" + ")" + "}";
                break;
            case 5:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?" + ")" + "}";
                break;
            case 6:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?" + ")" + "}";
                break;
            case 7:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?" + ")" + "}";
                break;
            case 8:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 9:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 10:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 11:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 12:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 13:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 14:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";

                break;
            case 15:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 16:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 17:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 18:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 19:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 20:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 21:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 22:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 23:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 24:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 25:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 26:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 27:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 28:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 29:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 30:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 31:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 32:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 33:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 34:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 35:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 36:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 37:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 38:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 39:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 40:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
                 case 41:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
            case 42:
                proc = "{?=call " + ProcName + "(" + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?" + ")" + "}";
                break;
             
            default:
                proc = null;
        }


        try {
            conn.setAutoCommit(false);

            cs = conn.prepareCall(proc, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);



            obj = (ParamObjects) param.get(0);

            //setting out parameter

            if ((obj.DTYPE).equals(Constants.INTEGER)) {
                cs.registerOutParameter(1, Types.INTEGER);
            } else if ((obj.DTYPE).equals(Constants.STRING)) {
                cs.registerOutParameter(1, Types.VARCHAR);
            } else if ((obj.DTYPE).equals(Constants.RESULTSET)) {
                cs.registerOutParameter(1, Types.OTHER);
            } else if ((obj.DTYPE).equals(Constants.SQLDATE)) {
                cs.registerOutParameter(1, Types.DATE);
            } else if ((obj.DTYPE).equals(Constants.DOUBLE)) {
                cs.registerOutParameter(1, Types.DOUBLE);
            } else if ((obj.DTYPE).equals(Constants.FLOAT)) {
                cs.registerOutParameter(1, Types.FLOAT);
            } else if ((obj.DTYPE).equals(Constants.BIGDECIMAL)) {
                cs.registerOutParameter(1, Types.BIGINT);
            } else if ((obj.DTYPE).equals(Constants.BLOB)) {
                cs.registerOutParameter(1, Types.BLOB);
            } else if ((obj.DTYPE).equals(Constants.TIMESTAMP)) {
                cs.registerOutParameter(1, Types.TIMESTAMP);
            } else if ((obj.DTYPE).equals(Constants.BOOLEAN)) {
                cs.registerOutParameter(1, Types.BOOLEAN);
            } else if ((obj.DTYPE).equals(Constants.BOOLEAN)) {
                cs.registerOutParameter(1, Types.SMALLINT);
            }


            //setting parameters
            //if (paramCount != 0 && paramCount != 1) {
            if (paramCount > 1) {
                for (int i = 1; i < paramCount; i++) {
                    obj = (ParamObjects) param.get(i);
                    if ((obj.DTYPE).equals(Constants.INTEGER)) {
                        cs.setInt(i + 1, obj.INTEGER);
                    } else if ((obj.DTYPE).equals(Constants.STRING)) {
                        cs.setString(i + 1, obj.STRING);
                    } else if ((obj.DTYPE).equals(Constants.SQLDATE)) {
                        cs.setDate(i + 1, obj.SQLDATE);
                    } else if ((obj.DTYPE).equals(Constants.DOUBLE)) {
                        cs.setDouble(i + 1, obj.DOUBLE);
                    } else if ((obj.DTYPE).equals(Constants.FLOAT)) {
                        cs.setFloat(i + 1, obj.FLOAT);
                    } else if ((obj.DTYPE).equals(Constants.LONG)) {
                        cs.setLong(i + 1, obj.LONG);
                    } else if ((obj.DTYPE).equals(Constants.BLOB)) {
                        cs.setBlob(i + 1, obj.BLOB);
                    } else if ((obj.DTYPE).equals(Constants.TIMESTAMP)) {
                        cs.setTimestamp(i + 1, obj.TIMESTAMP);
                    } else if ((obj.DTYPE).equals(Constants.BOOLEAN)) {
                        cs.setBoolean(i + 1, obj.BOOLEAN);
                    } else if ((obj.DTYPE).equals(Constants.BYTE)) {
                        cs.setByte(i + 1, obj.BYTE);
                    }
                }
            }

            cs.execute();


            //getting return value
            //from procedure into ParamObjects object
            obj = (ParamObjects) param.get(0);
            if ((obj.DTYPE).equals(Constants.INTEGER)) {
                retObj.INTEGER = new Integer(cs.getInt(1));
            } else if ((obj.DTYPE).equals(Constants.STRING)) {
                retObj.STRING = cs.getString(1);
            } else if ((obj.DTYPE).equals(Constants.RESULTSET)) {
                retObj.RESULTSET = (ResultSet) cs.getObject(1);
            } else if ((obj.DTYPE).equals(Constants.SQLDATE)) {
                retObj.SQLDATE = cs.getDate(1);
            } else if ((obj.DTYPE).equals(Constants.DOUBLE)) {
                retObj.DOUBLE = cs.getDouble(1);
            } else if ((obj.DTYPE).equals(Constants.FLOAT)) {
                retObj.FLOAT = cs.getFloat(1);
            } else if ((obj.DTYPE).equals(Constants.LONG)) {
                retObj.LONG = cs.getLong(1);
            } else if ((obj.DTYPE).equals(Constants.BLOB)) {
                retObj.BLOB = cs.getBlob(1);
            } else if ((obj.DTYPE).equals(Constants.TIMESTAMP)) {
                retObj.TIMESTAMP = cs.getTimestamp(1);
            } else if ((obj.DTYPE).equals(Constants.BOOLEAN)) {
                retObj.BOOLEAN = cs.getBoolean(1);
            } else if ((obj.DTYPE).equals(Constants.BYTE)) {
                retObj.BYTE = cs.getByte(1);
            }


        } catch (Exception e) {
        } finally {

            try {
                conn.commit();
            } catch (Exception e) {
                //exception occures in commiting transaction
            }
            DAOUtilities.closeCallableStatement(cs);
            //DAOUtilities.closeConnecion(conn);

            //preparing return object
            obj = (ParamObjects) param.get(0);
            if ((obj.DTYPE).equals(Constants.INTEGER)) {
                robj = new ParamObjects(Constants.INTEGER, retObj.INTEGER);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.STRING)) {
                robj = new ParamObjects(Constants.STRING, retObj.STRING);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.RESULTSET)) {
                robj = new ParamObjects(Constants.RESULTSET, retObj.RESULTSET);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.SQLDATE)) {
                // robj = new ParamObjects("String", retObj.Date);
                robj = new ParamObjects(Constants.SQLDATE, retObj.SQLDATE);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.DOUBLE)) {
                robj = new ParamObjects(Constants.DOUBLE, retObj.DOUBLE);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.FLOAT)) {
                robj = new ParamObjects(Constants.FLOAT, retObj.FLOAT);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.LONG)) {
                robj = new ParamObjects(Constants.LONG, retObj.LONG);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.BLOB)) {
                robj = new ParamObjects(Constants.BLOB, retObj.BLOB);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.TIMESTAMP)) {
                robj = new ParamObjects(Constants.TIMESTAMP, retObj.TIMESTAMP);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.BOOLEAN)) {
                robj = new ParamObjects(Constants.BOOLEAN, retObj.BOOLEAN);
                return robj;
            } else if ((obj.DTYPE).equals(Constants.BYTE)) {
                robj = new ParamObjects(Constants.BYTE, retObj.BYTE);
                return robj;
            }
            return robj;

        }

    }
}