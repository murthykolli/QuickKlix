/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bmf.quickklix.core.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

public class Logout extends HttpServlet {
     Logger log = Logger.getLogger(Logout.class);
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        HttpSession sn = request.getSession();
        sn.removeAttribute("userName");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        sn.setAttribute("userName", userName);
        sn.removeAttribute("userName");
        sn.invalidate();
        response.sendRedirect("/QuickKlix/userLogoutRedirection.action");
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}