/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.servlet;

import com.bmf.quickklix.core.dao.UserInformationDAO;
import com.bmf.quickklix.ui.util.EncryptDecryptUrl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

public class ActivateUser extends HttpServlet {
    Logger log = Logger.getLogger(ActivateUser.class);
UserInformationDAO uiDAO = new UserInformationDAO();
    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String enCryptName = request.getParameter("param");
        String enCryptNameRepl = enCryptName.replace(" ", "+");
        EncryptDecryptUrl ht = new EncryptDecryptUrl();
        String userName = ht.decrypt(enCryptNameRepl);
        Integer res = uiDAO.userActivationInDB(userName);

        if (res == 1) {
            response.sendRedirect("registrationSuccess.action");
        } 
        else if (res == 2) {
            response.sendRedirect("accountAlreadyActivated.action");
        }
        else {
            response.sendRedirect("accountAlreadyActivated.action");
        }
        
    }
}

