/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bmf.quickklix.core.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;


/**
 *
 * @author varaprasads
 */
public class CampaignPageForward extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sh = request.getSession();

        String userName = (String) sh.getAttribute("userName");
        String firstName = (String) sh.getAttribute("firstName");
        String userType = (String) sh.getAttribute("userType");
        String page = (String) sh.getAttribute("page");

        PrintWriter out = response.getWriter();
        out.println("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html\"; charset=\"UTF-8\"></head><body>");

        out.println("<form name=\"Param\" action=\"/MF_CampaignPlan/pagereceiver.serv\" method=\"POST\">");

        out.println("<input type=\"hidden\" name=\"userName\" value=\"" + userName + "\">");
        out.println("<input type=\"hidden\" name=\"firstName\" value=\"" + firstName + "\">");
        out.println("<input type=\"hidden\" name=\"userType\" value=\"" + userType + "\">");
        out.println("<input type=\"hidden\" name=\"page\" value=\"" + page + "\">");
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
