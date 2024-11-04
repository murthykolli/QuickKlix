/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bmf.quickklix.core.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.log4j.Logger;

/**
 *
 * @author varaprasads
 */
public class QuickklixPageReceiver extends HttpServlet {
    Logger log = Logger.getLogger(QuickklixPageReceiver.class);

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        String userName = request.getParameter("userName");
        HttpSession sn = request.getSession();
        sn.setAttribute("userName", userName);
        String page = request.getParameter("page");
        
    if (page.equals("userLandingHome")) {
        response.sendRedirect("/QuickKlix/userLandingHome.action");
    } 
    
    else if (page.equals("radioRequestForm")) {
        response.sendRedirect("/QuickKlix/radioRequestForm.action");
    }

    else if (page.equals("televisionRequestForm")) {
        response.sendRedirect("/QuickKlix/televisionRequestForm.action");
    }

    else if (page.equals("newspaperRequestForm")) {
        response.sendRedirect("/QuickKlix/newspaperRequestForm.action");
    }

    else if (page.equals("magazineRequestForm")) {
        response.sendRedirect("/QuickKlix/magazineRequestForm.action");
    }

    else if (page.equals("otherMediaRequestForm")) {
        response.sendRedirect("/QuickKlix/otherMediaRequestForm.action");
    }

    else if (page.equals("campaignPlanRedirection")) {
        response.sendRedirect("/QuickKlix/campaignPlanRedirection.action");
    }

    else if (page.equals("manageCampaignsSaving")) {
        response.sendRedirect("/QuickKlix/manageCampaignsSaving.action");
    }

    else if (page.equals("campaignCreation")) {
        response.sendRedirect("/QuickKlix/campaignCreation.action");
    }

    else if (page.equals("manageClientsSaving")) {
        response.sendRedirect("/QuickKlix/manageClientsSaving.action");
    }

    else if (page.equals("clientCreation")) {
        response.sendRedirect("/QuickKlix/clientCreation.action");
    }

    else if (page.equals("sendInvitation")) {
        response.sendRedirect("/QuickKlix/sendInvitation.action");
    }

    else if (page.equals("targetMarketRedirection")) {
        response.sendRedirect("/QuickKlix/targetMarketRedirection.action");
    }

    else if (page.equals("tmStatesRedirection")) {
        response.sendRedirect("/QuickKlix/tmStatesRedirection.action");
    }

    else if (page.equals("tmStatesCreation")) {
        response.sendRedirect("/QuickKlix/tmStatesCreation.action");
    }

    else if (page.equals("tmCitiesRedirection")) {
        response.sendRedirect("/QuickKlix/tmCitiesRedirection.action");
    }

    else if (page.equals("tmCitiesCreation")) {
        response.sendRedirect("/QuickKlix/tmCitiesCreation.action");
    }

    else if (page.equals("mediaPlanRedirection")) {
        response.sendRedirect("/QuickKlix/mediaPlanRedirection.action");
    }

    else if (page.equals("mediaPlanCreation")) {
        response.sendRedirect("/QuickKlix/mediaPlanCreation.action");
    }

    else if (page.equals("analyticsRedirection")) {
        response.sendRedirect("/QuickKlix/analyticsRedirection.action");
    }

    else if (page.equals("userAccountSettings")) {
        response.sendRedirect("/QuickKlix/userAccountSettings.action");
    }
    
    else if (page.equals("userLogout")) {
        response.sendRedirect("/QuickKlix/userLogout.action");
    }

    }

    @Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
