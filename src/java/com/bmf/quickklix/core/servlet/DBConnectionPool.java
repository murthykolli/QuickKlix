/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

/**
 *
 * @author trimurthulub
 */
/**
 * This servlet creates/manages a data source/connection pool for the application.
 * It also provided utility methods to get and return a db connection
 * from the application's data source/connection pool.
 * <P>
 * This servlet is <B>NEVER</B> called by a client, but should be called <B>ONLY</B> during
 * web application initialization, i.e. when the servlet engine starts.
 * <P>
 * The following lines should be inserted to the web.xml file for the web
 * application based on the type of connection pool usage:
 *
 * <p>
 * To use JDBC DataSources on WebLogic Application Server (WLS)
 * <pre>
 *  &lt;servlet&gt;
 *    &lt;servlet-name&gt;DBConnectionPool&lt;/servlet-name&gt;
 *    &lt;servlet-class&gt;com.biperf.nds.web.DBConnectionPool&lt;/servlet-class&gt;
 *    &lt;init-param&gt;
 *      &lt;param-name&gt;dataSourceName&lt;/param-name&gt;
 *      &lt;param-value&gt;jdbc/gm/pullboard&lt;/param-value&gt;
 *    &lt;/init-param&gt;
 *    &lt;load-on-startup&gt;2(or your preferred startup order)&lt;/load-on-startup&gt;
 *  &lt;/servlet&gt;
 * </pre>
 * <p>
 * <strong>Note:</strong> <em>Please make sure the logger is loaded and initialized prior to
 * loading this servlet at start-up.</em>
 * <P>
 *
 */

public class DBConnectionPool extends HttpServlet
{
  // constants
  private static final String CLASS_NAME = "DBConnectionPool";

  /**
   * logger
   */
  //private static final Logger logger = (Logger) Logger.getLogger( DBConnectionPool.class.getName() );
  static Logger logger = Logger.getLogger(CLASS_NAME);

  // static members
  private static String dataSourceName = "";

  private static DataSource dataSource = null;

  private static ServletConfig servletConfig = null;

/*******************************************************************************
 *
 *                               HttpServlet Methods
 *
 *******************************************************************************/

/******************************************************************************/
  /**
   * Initializes this servlet. The servlet engine calls this method once,
   * automatically, each time it loads the servlet. This method is guaranteed
   * to finish before the servlet accepts any requests to its service method.
   * The init method stores the ServletConfig object it receives from the servlet
   * engine.
   *
   * @exception javax.servlet.ServletException - if an exception occurs that interrupts
   *          the servlet's normal operation
   *
   */
    @Override
  public void init()
      throws ServletException
  {
    super.init();
      logger.debug("control came to init method");
    // save the ServletConfig into the static member
    servletConfig = getServletConfig();

    dataSourceName = getInitParameter( "dataSourceName" );
    logger.debug("data source name:"+dataSourceName);

    if ( dataSourceName == null )
    {
      logger.error( CLASS_NAME+ "init"+ "Must specify the parameter 'dataSourceName'." );

      throw new ServletException( "Must specify the parameter 'dataSourceName'." );
    }

    try
    {
        if ( dataSource == null )
        {
          InitialContext jndiContext = new InitialContext();
   dataSource = (DataSource) jndiContext.lookup( dataSourceName );
        }
    }
    catch( NamingException namingException )
    {
      logger.error( CLASS_NAME+ "init"+ "NamingException occurred: " + namingException.getMessage() );

      throw new ServletException( CLASS_NAME + ".init - unable to get the initial context", namingException );
    }

    logger.error( CLASS_NAME+ "init"+ "dataSourceName: " + dataSourceName );
  }

  /**
   * Called by the servlet container to indicate to a servlet that the servlet is being taken out of service.
   *
   * @see javax.servlet.GenericServlet
   */
    @Override
  public void destroy()
  {
    super.destroy();

    // clear all the static members
    servletConfig = null;
    dataSourceName = null;
    dataSource = null;
    logger.debug("destroying the object..");
  }

  /**
   * Throws a ServletException.
   */
    @Override
  public void service( HttpServletRequest aRequest, HttpServletResponse aResponse )
      throws ServletException, IOException
  {
    throw new ServletException( "Servlet only used for DataSource initialization" );
  }

  /**
   * Returns a short description of the servlet.
   */
    @Override
  public String getServletInfo()
  {
    return this.getClass().getName() + " version: 1.6 - Initializes the DataSource";
  }

/******************************************************************************/
  /**
   * Get the DB connection from the application's dedicated connection pool manager.
   *
   * @exception java.sql.SQLException a connection cannot be obtained
   */
  public static Connection getConnection() throws SQLException
  {
    Connection t_connection = null;

    if ( logger.isDebugEnabled() )
    {
        logger.debug( CLASS_NAME+ "getConnection"+ "dataSourceName: " + dataSourceName
                                                   + ", dataSource: " + dataSource );
    }

    if ( dataSource == null )
    {
      logger.error( CLASS_NAME+ "getConnection"+ "DBConnectionPool is not properly initialized." );

      throw new SQLException( "DBConnectionPool is not properly initialized." );
    }

    t_connection = dataSource.getConnection();

    return t_connection;
  }

/******************************************************************************/
  /**
   * Free the DB connection and return it
   * back to the application's connection pool manager.
   *
   * @param aConnection the connection being returned
   */
  public static void freeConnection( Connection aConnection )
  {
      logger.info("entered into freeconnection()");
    final String METHOD_NAME = "freeConnection";

    if ( aConnection == null )
    {
      logger.error( CLASS_NAME+ METHOD_NAME+ "passed in a null database connection" );
    }
    else
    {
      // If you don't commit before closing, it will roll back...
      try
      {
          if ( ! aConnection.getAutoCommit() )
          {
            aConnection.rollback();
            aConnection.setAutoCommit( true );
          }
      }
      catch( SQLException aSQLException )
      {
        logger.error( CLASS_NAME + METHOD_NAME+ "a SQLException occurred trying to rollback: " + aSQLException.getMessage() );
      }

      try
      {
        aConnection.close();
        aConnection = null;
        logger.debug("CONNECTION CLOSED");
      }
      catch( SQLException aSQLException )
      {
        logger.error( CLASS_NAME+ METHOD_NAME+ "a SQLException occurred: " + aSQLException.getMessage() );
      }
    }
  }

} // end class DBConnectionPool