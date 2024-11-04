/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.campaignplan;

import com.bmf.quickklix.core.dao.CampaignPlanDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.StrutsStatics;
import java.util.*;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class CampaignPlanJson {
    Logger log=Logger.getLogger(CampaignPlanJson.class);
     CampaignPlanDAO cpDAO = new CampaignPlanDAO();
     String jsonRequest;
     String jsonResponse;

public String getJsonRequest() {
     return jsonRequest;
}

public void setJsonRequest(String jsonRequest) {
     this.jsonRequest = jsonRequest;
}

public String getJsonResponse() {
     return jsonResponse;
}

public void setJsonResponse(String jsonResponse) {
     this.jsonResponse = jsonResponse;
}

public String modifyClientDataSavingInDB(){
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String combName = request.getParameter("data");
     String combiName[] = combName.split("&,&");
     String userName = (String)session.get("userName");
     String fieldVal = combiName[0];
     String fieldName = combiName[1];
    
     String modClientValue = null;
        String clientNameInSession = (String)session.get("ClientNameInSession");
        String newClientName = cpDAO.clientNameTakeFromDB(userName,fieldVal);
        if(newClientName != null && fieldName.equals("ClientName")){
        if(clientNameInSession.equals(newClientName)){
        modClientValue = fieldVal;
        session.put("ClientNameInSession", fieldVal);
        }else{
        modClientValue = "null";
        } }else{
        int attrValueUpdate = cpDAO.clientModifiedDataUpdateInToDB(userName,clientNameInSession,fieldVal,fieldName);
        if(fieldName.equals("ClientName")){
        session.put("ClientNameInSession", fieldVal);
        }
        modClientValue = fieldVal;
        }

     jsonResponse = modClientValue+"&,&"+fieldName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String clientCreationExistChecking(){
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String clName = request.getParameter("data");
     String userName = (String)session.get("userName");     

        String clientsName = null;
        String clientName = cpDAO.clientNameTakeFromDB(userName,clName);
        if(clientName != null){
        clientsName = clientName;
        } else{
        clientsName = "null";
        }

     jsonResponse = clientsName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String campaignCreationExistChecking(){
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String campName = request.getParameter("data");
     String userName = (String)session.get("userName");     
        String campaignsName = null;
        String campaignName = cpDAO.campaignNameTakeFromDB(userName,campName);
        if(campaignName != null){
        campaignsName = campaignName;
        } else{
        campaignsName = "null";
        }

     jsonResponse = campaignsName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String campaignModifyExistChecking(){
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String campName = request.getParameter("data");
     String userName = (String)session.get("userName");
     String oldCampaignName = (String)session.get("CampaignNameInSession");     
        String campaignsName = null;
        String campaignName = cpDAO.campaignNameTakeFromDB(userName,campName);
        if(campaignName != null && (!campaignName.equals(oldCampaignName))){
        campaignsName = campaignName;
        } else{
        campaignsName = "null";
        }

     jsonResponse = campaignsName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String toJSON(List list) {
         StringBuffer strBuf = new StringBuffer();
         strBuf.append("{");
         boolean isFirstCat = true;
         for(int i =0;i<list.size(); i++){
         String Value=list.get(i).toString();

             if(isFirstCat)
             {
                 isFirstCat = false;
             } else
             {
                 strBuf.append(",");
             }
             boolean isFirst = true;
             strBuf.append("\'").append(Value).append("\'");
              }

         strBuf.append("}");
         return strBuf.toString();
     }

}
