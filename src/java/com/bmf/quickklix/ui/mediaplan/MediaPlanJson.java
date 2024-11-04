/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.mediaplan;

import com.bmf.quickklix.core.dao.MediaPlanDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.StrutsStatics;
import java.util.*;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */

public class MediaPlanJson {
    Logger log=Logger.getLogger(MediaPlanJson.class);
     MediaPlanDAO mpDAO = new MediaPlanDAO();
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

public String mpCampaignSelection(){
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String clientName = request.getParameter("data");
     session.put("mpClientNameInSession", clientName);
     List campaignList = new ArrayList();
     String userName = (String)session.get("userName");
     campaignList = mpDAO.campaignNamesTakeFromDB(userName,clientName);
     jsonResponse = toJSON(campaignList);
     jsonRequest="";
     return Action.SUCCESS;
}
public String mpTargetMarketSelection(){
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String clientName = request.getParameter("data");
     String campaignName = request.getParameter("data1");
     List tmList = new ArrayList();
     String userName = (String)session.get("userName");
     session.put("mpCampaignNameInSession", campaignName);
     session.put("mpClientNameInSession", clientName);
     tmList = mpDAO.targetMarketNamesTakeFromDB(userName,clientName,campaignName);
     MediaPlanBean mps = mpDAO.campaignFullDetailsTakeFromDB(userName,clientName,campaignName);
     String cpStartDate = mps.getCpStartDate();
     String cpEndDate = mps.getCpEndDate();
     String cpBudget = mps.getCpBudget();
     String combValue = cpStartDate+"&,&"+cpEndDate+"&,&"+cpBudget;
     
     jsonResponse = toJSON(tmList);
     jsonRequest = combValue;
     return Action.SUCCESS;
}

public String mediaPlanCreationNameExistChecking(){    
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();     
     String combValue = request.getParameter("data");
     String[] combValues = combValue.split("&,&");
     String userName = (String)session.get("userName");
        String mpsName = null;
        String mpName = mpDAO.mediaPlanNameTakeFromDB(userName,combValues[0],combValues[1],combValues[2],combValues[3]);
        String mpNameUsingId = mpDAO.mediaPlanNameTakeFromDBUsingUserId(userName,combValues[3]);
        if(mpNameUsingId != null){
        mpsName = mpNameUsingId;
        } else if(mpName != null){
        mpsName = mpName;
        } else{
        mpsName = "null";
        }

     jsonResponse = mpsName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String mpClCpAndTmValidationCheckingInDB(){    
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();     
     String combValue = request.getParameter("data");
     String[] combValues = combValue.split("&,&");
     String userName = (String)session.get("userName");
        String mpsName = null;
        String mpName = mpDAO.mpClCpAndTmValidationDataCheckingInDB(userName,combValues[0],combValues[1],combValues[2]);
        if(mpName != null){
        mpsName = mpName;
        } else{
        mpsName = "null";
        }

     jsonResponse = mpsName;
     jsonRequest="";
     return Action.SUCCESS;
}

public String mediaPlanModifyNameExistChecking(){
     ActionContext actionContext = ActionContext.getContext();
     HttpServletRequest request =(HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
     Map session = ActionContext.getContext().getSession();
     String combValue = request.getParameter("data");
     String[] combValues = combValue.split("&,&");
     String userName = (String)session.get("userName");
     String oldMpName = (String)session.get("MediaPlanNameInSession");    
        String mpsName = null;
        String mpName = mpDAO.mediaPlanNameTakeFromDB(userName,combValues[0],combValues[1],combValues[2],combValues[3]);
        String mpNameUsingId = mpDAO.mediaPlanNameTakeFromDBUsingUserId(userName,combValues[3]);
        if(mpNameUsingId != null && (!mpNameUsingId.equals(oldMpName)) && mpName != null){
        mpsName = mpNameUsingId;
        } else{
        mpsName = "null";
        }

     jsonResponse = mpsName;
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