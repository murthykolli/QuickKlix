/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author narayanak
 */
public class ReportPageForward extends HttpServlet {

    Logger log = Logger.getLogger(ReportPageForward.class);

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sn = request.getSession();

        String userName = (String) sn.getAttribute("userName");
        PrintWriter out = response.getWriter();
        out.println("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html\"; charset=\"UTF-8\"></head><body>");
        out.println("<form name=\"Param\" action=\"/Reports/reportsPageReceiver.serv\" method=\"POST\">");

        out.println("<input type=\"hidden\" name=\"userName\" value=\"" + userName + "\">");        
        out.println("</form>");
        out.println("<script>");
        out.println("document.forms[\"Param\"].submit();");
        out.println("</script></body></html>");
    }

    @Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}