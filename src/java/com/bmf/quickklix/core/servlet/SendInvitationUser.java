/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bmf.quickklix.core.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import com.bmf.quickklix.ui.util.EncryptDecryptUrl;
import org.apache.log4j.Logger;
import javax.servlet.http.*;

public class SendInvitationUser extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        Logger log = Logger.getLogger(SendInvitationUser.class);
        response.setContentType("text/html");

        response.sendRedirect("/QuickKlix/userRegistration.action");
    }
}
