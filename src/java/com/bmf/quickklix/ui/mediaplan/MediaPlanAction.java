/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.mediaplan;

import com.bmf.quickklix.core.dao.MediaPlanDAO;
import com.bmf.quickklix.ui.util.EmailSending;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class MediaPlanAction extends ActionSupport implements ModelDriven {
    Logger log = Logger.getLogger(MediaPlanAction.class);
    MediaPlanBean mpBean = new MediaPlanBean();
    MediaPlanDAO mpDAO = new MediaPlanDAO();

public Object getModel() {
    return mpBean;
    }

    @Override
public String execute(){
        return "success";
    }

public String mediaPlanRedirection(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List mediaPlansList = (ArrayList)mpDAO.mediaPlanDetailsTakeFromDB(mpBean.getUserName());
    int mpCount = mediaPlansList.size();

    if(mpCount == 0){
    ret = "goToMediaPlanHome";
    }else{
    ret = "goToMediaPlanSaving";
    }
    return ret;
}

public String mpClientDetailsSaving(){
    Map session = ActionContext.getContext().getSession();    
    String ret="success";
    session.put("mpClientNameInSession", mpBean.getMpClientName());
    int res = mpDAO.mpClientDetailsSavingToDB(mpBean.getUserName(),mpBean.getMpClientName(),mpBean.getClientAddress1(),mpBean.getClientAddress2(),mpBean.getCityName(),mpBean.getStateName(),mpBean.getCountryName(),mpBean.getZipCode(),mpBean.getContactPerson(),mpBean.getContactPhoneNo(),mpBean.getContactEmail());
    if(res == 1){    
    ret = "goToMpCreation";    
    } else if(res == 111){
      mpBean.setClientNameAlreadyExist("AlreadyExist");
      ret = "input";
    }
    return ret;
}

public String mpCampRedirection(){
    Map session = ActionContext.getContext().getSession();
    String mpClientName = (String)session.get("mpClientNameInSession");
    if(mpClientName != null){
    mpBean.setMpClientName(mpClientName);
    }
    return "success";
}

public String mpCampaignDataSaving(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    int res = mpDAO.mpCampaignFormSaving(mpBean.getUserName(),mpBean.getMpClientName(),mpBean.getMpCampaignName(),mpBean.getMissionObjective(),mpBean.getExistedCampaignProducts(),mpBean.getCampaignStartDate(),mpBean.getCampaignEndDate(),mpBean.getCampaignBudget());
    if(res == 1){  
    session.put("mpCampaignNameInSession", mpBean.getMpCampaignName());
    ret = "goToMpCreation";
    } else if(res == 111){
        mpBean.setCampaignNameAlreadyExist("AlreadyExisted");
        ret = "input";
    }
    return ret;
}

public String goToTmMpDataCreation() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();    
    String mpClName = (String)session.get("mpClientNameInSession");
    String mpCpName = (String)session.get("mpCampaignNameInSession");
    String mpTmName = (String)session.get("mpTMNameInSession");
    mpBean.setMpClientName(mpClName);
    mpBean.setMpCampaignName(mpCpName);
    mpBean.setMpTargetMarketName(mpTmName);
    ret = "goToMpCreation";
    return ret;
}

public String mediaplanFormSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();    
    int res = mpDAO.mediaplanDetailsSavingInToDB(mpBean.getUserName(),mpBean.getMpClientName(),mpBean.getMpCampaignName(),mpBean.getMpTargetMarketName(),mpBean.getMediaPlanName(),mpBean.getMpMissionObjective(),mpBean.getCpStartDate(),mpBean.getCpEndDate(),mpBean.getCpBudget(), mpBean.getMpStartDate(),mpBean.getMpEndDate(),mpBean.getMpBudget());
    
    String cpBudject = mpBean.getCpBudget().replaceAll(",", "");
    String[] cBudject = cpBudject.split("\\.");
    long campBudject = Long.parseLong(cBudject[0]);
    
    String mpBudject = mpBean.getMpBudget().replaceAll(",", "");
    String[] mBudject = mpBudject.split("\\.");
    long mediaBudject = Long.parseLong(mBudject[0]);
   
    
    if(res == 1){        
    if(mediaBudject > campBudject){
    long overBudget = mediaBudject - campBudject;
    String overMpBudget = Long.toString(overBudget);
    overMpBudget = overMpBudget+".00";    
    mpDAO.updateOverBudgetInDB(mpBean.getUserName(),mpBean.getMpClientName(),mpBean.getMpCampaignName(),mpBean.getMpTargetMarketName(),mpBean.getMediaPlanName(),overMpBudget);
    }
    
    ret = "goToMediaPlanSaving";
    }else if(res == 111){
    mpBean.setMediaplanNameAlreadyExist("AlreadyExisted");
    ret = "input";
    }
    return ret;
}

public String deleteMediaPlan() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String[] combName = mpBean.getCombinationalName().split(", ");
    mpDAO.deleteMediaplanInDB(mpBean.getUserName(),combName[0],combName[1],combName[2],combName[3]);
    
    List mediaPlansList = (ArrayList)mpDAO.mediaPlanDetailsTakeFromDB(mpBean.getUserName());
    int mpCount = mediaPlansList.size();

    if(mpCount == 0){
    ret = "goToMediaPlanCreation";
    }else{
    ret = "goToMediaPlanSaving";
    }
    return ret;
}

public String mediaPlanCreation() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    ret = "goToMediaPlanCreation";
    return ret;
}

public String mediasSelection() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String[] combName = mpBean.getCombinationalName().split(", ");    
    session.put("ClientNameInSession", combName[0]);
    session.put("CampaignNameInSession", combName[1]);
    session.put("TargetMarketNameInSession", combName[2]);
    session.put("MediaPlanNameInSession", combName[3]);
    session.put("MpStartDateInSession", combName[8]);
    session.put("MPEndDateInSession", combName[9]);
    ret = "goToMediasSelection";
    return ret;
}

public String mediaPlanModification(){
       String ret = "success";
       Map session = ActionContext.getContext().getSession();
       String[] combName = mpBean.getCombinationalName().split(", ");
       session.put("MediaPlanNameInSession", combName[3]);
       
       mpBean.setMpClientName(combName[0]);
       mpBean.setMpCampaignName(combName[1]);
       mpBean.setMpTargetMarketName(combName[2]);
       mpBean.setMediaPlanName(combName[3]);
       mpBean.setMpMissionObjective(combName[4]);
       mpBean.setCpStartDate(combName[5]);
       mpBean.setCpEndDate(combName[6]);
       mpBean.setCpBudget(combName[7]);
       mpBean.setMpStartDate(combName[8]);
       mpBean.setMpEndDate(combName[9]);
       mpBean.setMpBudget(combName[10]);
       ret = "goToMediaPlanModification";
       return ret;
}

public String mediaPlanFormModification(){
     String ret = "success";
     Map session = ActionContext.getContext().getSession();
     String oldMediaPlanName = (String) session.get("MediaPlanNameInSession");
     String cpBudject = mpBean.getCpBudget().replaceAll(",", "");
    String[] cBudject = cpBudject.split("\\.");
    long campBudject = Long.parseLong(cBudject[0]);
    
    String mpBudject = mpBean.getMpBudget().replaceAll(",", "");
    String[] mBudject = mpBudject.split("\\.");
    long mediaBudject = Long.parseLong(mBudject[0]);
     int res = mpDAO.mediaplanDetailsModifyInToDB(mpBean.getUserName(), mpBean.getMpClientName(),mpBean.getMpCampaignName(),mpBean.getMpTargetMarketName(),mpBean.getMediaPlanName(),mpBean.getMpMissionObjective(),mpBean.getCpStartDate(),mpBean.getCpEndDate(),mpBean.getCpBudget(), mpBean.getMpStartDate(),mpBean.getMpEndDate(),mpBean.getMpBudget(),oldMediaPlanName);
     if(res == 1){     
     if(mediaBudject > campBudject){
    long overBudget = mediaBudject - campBudject;
    String overMpBudget = Long.toString(overBudget);
    overMpBudget = overMpBudget+".00";    
    mpDAO.updateOverBudgetInDB(mpBean.getUserName(),mpBean.getMpClientName(),mpBean.getMpCampaignName(),mpBean.getMpTargetMarketName(),mpBean.getMediaPlanName(),overMpBudget);
    } else{
    mpDAO.deleteOverBudgetInDB(mpBean.getUserName(),mpBean.getMpClientName(),mpBean.getMpCampaignName(),mpBean.getMpTargetMarketName(),mpBean.getMediaPlanName());     
    }  
    ret = "goToMediaPlanSaving";
    }
    else if(res == 111){
    mpBean.setMediaplanNameAlreadyExist("AlreadyExisted");
    ret = "input";
    }
    return ret;
}





}