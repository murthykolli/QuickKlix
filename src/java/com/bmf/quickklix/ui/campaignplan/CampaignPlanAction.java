/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.campaignplan;
import com.bmf.quickklix.core.dao.CampaignPlanDAO;
import com.bmf.quickklix.ui.util.EmailSending;
import com.bmf.quickklix.ui.util.EncryptDecryptUrl;
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
public class CampaignPlanAction extends ActionSupport implements ModelDriven {
    Logger log = Logger.getLogger(CampaignPlanAction.class);
    CampaignPlanBean cpBean = new CampaignPlanBean();
    CampaignPlanDAO cpDAO = new CampaignPlanDAO();
    EmailSending emailer = new EmailSending();

public Object getModel() {
    return cpBean;
    }

    @Override
public String execute(){
        return "success";
    }

public String campaignPlanRedirection() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);


    if(campaignCount == 0 && clientCount == 0){
    ret = "goToCampaignHome";
    }else if(campaignCount == 0 && clientCount > 0){
    ret = "goToClientManagement";
    }else if(campaignCount > 0 && clientCount == 0){
    ret = "goToCampaignManagement";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    }
    return ret;
}

public String campaignCreation() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);


    if(campaignCount == 0 && clientCount == 0){
    ret = "goToCampaignHome";
    }else{
    ret = "goToCampaignCreation";
    }
    return ret;
}

public String campaignDataSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    int res = cpDAO.campaignFormSaving(cpBean.getUserName(),cpBean.getCampaignClientName(),cpBean.getCampaignName(),cpBean.getMissionObjective(),cpBean.getExistedCampaignProducts(),cpBean.getCampaignStartDate(),cpBean.getCampaignEndDate(),cpBean.getCampaignBudget());
    if(res == 1){
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();
    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);

    if(campaignCount == 0 && clientCount == 0){
    ret = "goToCampaignHome";
    }else if(campaignCount > 0 && clientCount == 0){
    ret = "goToCampaignManagement";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    }
    } else if(res == 111){
        cpBean.setContactPerson("AlreadyExisted");
        ret = "input";
    }
    return ret;
}

public String campaignModification() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String[] combName = cpBean.getCombinationalName().split(", ");
    session.put("CampaignNameInSession", combName[0]);
    session.put("ClientNameInSession", combName[1]);
    cpBean.setCampaignName(combName[0]);
    cpBean.setCampaignClientName(combName[1]);
    cpBean.setMissionObjective(combName[2]);
    cpBean.setExistedCampaignProducts(combName[3]);
    cpBean.setCampaignStartDate(combName[4]);
    cpBean.setCampaignEndDate(combName[5]);
    cpBean.setCampaignBudget(combName[6]);
    cpBean.setMpStartDate(combName[7]);
    cpBean.setMpEndDate(combName[8]);
    cpBean.setMpBudget(combName[9]);
    ret = "goToCampaignModification";
    return ret;
}

public String campaignModificationDataSaving() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);

    String oldCampaignName = (String)session.get("CampaignNameInSession");
    String oldCpClientName = (String)session.get("ClientNameInSession");

    int res = cpDAO.campaignModificationDataSavingInToDB(cpBean.getUserName(),cpBean.getCampaignClientName(),cpBean.getCampaignName(),cpBean.getMissionObjective(),cpBean.getExistedCampaignProducts(),cpBean.getCampaignStartDate(),cpBean.getCampaignEndDate(),cpBean.getCampaignBudget(),oldCampaignName);
    if(res == 1){    
    if(campaignCount > 0 && clientCount == 0){
    ret = "goToCampaignManagement";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    } }
    else if(res == 111){
        cpBean.setContactPerson("AlreadyExisted");
        ret = "input";
    }
    return ret;
}

public String clientDetailsSaving(){
    Map session = ActionContext.getContext().getSession();
    String ret="success";
    int res = cpDAO.clientDetailsSavingToDB(cpBean.getUserName(),cpBean.getClientName(),cpBean.getClientAddress1(),cpBean.getClientAddress2(),cpBean.getCityName(),cpBean.getStateName(),cpBean.getCountryName(),cpBean.getZipCode(),cpBean.getContactPerson(),cpBean.getContactPhoneNo(),cpBean.getContactEmail());
    if(res == 1){
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);

    if(campaignCount == 0 && clientCount == 0){
    ret = "goToCampaignHome";
    }else if(campaignCount == 0 && clientCount > 0){
    ret = "goToClientManagement";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    }
    } else if(res == 111){
      cpBean.setClientNameAlreadyExist("AlreadyExist");
      ret = "input";
    }
    return ret;
}

public String clientModification() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String[] combName = cpBean.getCombinationalName().split(", ");
    session.put("ClientNameInSession", combName[0]);
    CampaignPlanBean clBean = cpDAO.clientModifiedValuesTakeFromDBTOJsp(cpBean.getUserName(),combName[0]);
    cpBean.setClientName(clBean.getClientName());
    cpBean.setClientAddress1(clBean.getClientAddress1());
    cpBean.setClientAddress2(clBean.getClientAddress2());
    cpBean.setCityName(clBean.getCityName());
    cpBean.setStateName(clBean.getStateName());
    cpBean.setCountryName(clBean.getCountryName());
    cpBean.setZipCode(clBean.getZipCode());
    cpBean.setContactPerson(clBean.getContactPerson());
    cpBean.setContactPhoneNo(clBean.getContactPhoneNo());
    cpBean.setContactEmail(clBean.getContactEmail());
    cpBean.setCreatedDate(clBean.getCreatedDate());
    cpBean.setModifiedDate(clBean.getModifiedDate());
    ret = "goToClientModification";
    return ret;
}

public String clientCreation() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);
    ret = "goToClientCreation";
    return ret;
}

public String deleteCampaign() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String[] combName = cpBean.getCombinationalName().split(", ");
    String tmName = cpDAO.tmNameTakeFromDB(cpBean.getUserName(),combName[0],combName[1]);
    if(tmName != null){
    cpBean.setTmExisted("TMExisted");
    }else{
    cpDAO.deleteCampaignsInDB(cpBean.getUserName(),combName[0],combName[1]);
    }
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);

    if(campaignCount == 0 && clientCount == 0){
    ret = "goToClientCreation";
    }else if(campaignCount == 0 && clientCount > 0){
    ret = "goToCampaignCreation";
    }else if(campaignCount > 0 && clientCount == 0){
    ret = "goToCampaignManagement";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    }
    return ret;
}

public String deleteClient() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String[] combName = cpBean.getCombinationalName().split(", ");
    int res = cpDAO.deleteClientssInDB(cpBean.getUserName(),combName[0]);
    if(res == 2){
    cpBean.setCapaignExisted("CampaignExisted");
    }
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);

    if(campaignCount == 0 && clientCount == 0){
    ret = "goToClientCreation";
    }else if(campaignCount == 0 && clientCount > 0){
    ret = "goToClientManagement";
    }else if(campaignCount > 0 && clientCount == 0){
    ret = "goToClientCreation";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    }
    return ret;
}

public String clientBackMove() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);

    if(campaignCount == 0 && clientCount == 0){
    ret = "goToCampaignHome";
    }else if(campaignCount == 0 && clientCount > 0){
    ret = "goToClientManagement";
    }else if(campaignCount > 0 && clientCount == 0){
    ret = "goToClientCreation";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    }
    return ret;
}


public String manageCampaignsSaving() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);

    if(campaignCount == 0 && clientCount == 0){
    ret = "goToCampaignHome";
    }else if(campaignCount == 0 && clientCount > 0){
    ret = "goToCampaignCreation";
    }else if(campaignCount > 0 && clientCount == 0){
    ret = "goToCampaignManagement";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    }
    return ret;
}

public String manageClientsSaving() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List campaignList = (ArrayList)cpDAO.campaignDetailsTakeFromDB(cpBean.getUserName());
    List clientList = (ArrayList)cpDAO.clientDetailsTakeFromDB(cpBean.getUserName());

    int campaignCount = campaignList.size();
    int clientCount = clientList.size();

    session.put("CampaignCount", campaignCount);
    session.put("ClientCount", clientCount);

    if(campaignCount == 0 && clientCount == 0){
    ret = "goToCampaignHome";
    }else if(campaignCount == 0 && clientCount > 0){
    ret = "goToClientManagement";
    }else if(campaignCount > 0 && clientCount == 0){
    ret = "goToClientCreation";
    }else if(campaignCount > 0 && clientCount > 0){
    ret = "goToBothManagement";
    }
    return ret;
}

public String campaignClientDetailsSaving(){
    Map session = ActionContext.getContext().getSession();
    String ret="success";
    int res = cpDAO.clientDetailsSavingToDB(cpBean.getUserName(),cpBean.getClientName(),cpBean.getClientAddress1(),cpBean.getClientAddress2(),cpBean.getCityName(),cpBean.getStateName(),cpBean.getCountryName(),cpBean.getZipCode(),cpBean.getContactPerson(),cpBean.getContactPhoneNo(),cpBean.getContactEmail());
    if(res == 1){
    cpBean.setCampaignClientName(cpBean.getClientName());  
    ret = "goToCampaignCreation";
    } else if(res == 111){
      cpBean.setClientNameAlreadyExist("AlreadyExist");
      ret = "input";
    }
    return ret;
}

public String campaignClientModificationDetailsSaving(){
    Map session = ActionContext.getContext().getSession();
    String ret="success";
    int res = cpDAO.clientDetailsSavingToDB(cpBean.getUserName(),cpBean.getClientName(),cpBean.getClientAddress1(),cpBean.getClientAddress2(),cpBean.getCityName(),cpBean.getStateName(),cpBean.getCountryName(),cpBean.getZipCode(),cpBean.getContactPerson(),cpBean.getContactPhoneNo(),cpBean.getContactEmail());
    if(res == 1){
    cpBean.setCampaignClientName(cpBean.getClientName());
    String campName = (String)session.get("CampaignNameInSession");
    String clientName = (String)session.get("ClientNameInSession");

//    CampaignPlanBean campBean = cpDAO.campaignValuesTakeFromDB(cpBean.getUserName(),campName, clientName);
//    cpBean.setCampaignName(campBean.getCampaignName());
//    cpBean.setMissionObjective(campBean.getMissionObjective());
//    cpBean.setExistedCampaignProducts(campBean.getExistedCampaignProducts());
//    cpBean.setCampaignStartDate(campBean.getCampaignStartDate());
//    cpBean.setCampaignEndDate(campBean.getCampaignEndDate());
//    cpBean.setCampaignBudget(campBean.getCampaignBudget());
    ret = "goToCampaignModification";
    } else if(res == 111){
      cpBean.setClientNameAlreadyExist("AlreadyExist");
      ret = "input";
    }
    return ret;
}

public String sendInvitationToUser() throws Exception {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String senderFname = cpBean.getSenderName();
    String userFName = cpBean.getUserFirstName();
    String senderEmail = cpBean.getSenderEmail();
    String userId = cpDAO.userIdForSendInvitationFromDB(cpBean.getSenderEmail());
    if(userId != null) {
    session.put("invitation111", "registeredUser");
    ret = "input";    
    }
    else{
    int result = cpDAO.sendInvitationsavedIntoDB(cpBean.getUserName(),cpBean.getSenderName(),cpBean.getSenderEmail());
    if(result == 1){
    String userID = cpBean.getUserName();
                String cntStr = userID;
                EncryptDecryptUrl cl = new EncryptDecryptUrl();
                String eStr = cl.encrypt(cntStr);
                String url = "http://192.168.12.18:8080/QuickKlix/sendInvitator.sevt?param=" + eStr;

    String body = "<body> <div style='margin-left: 30px;margin-top:10px;background: #f1f1f1;min-height: 250px;width: 730px;box-shadow: 3px 3px 0px #7e7e7e;height: auto;'> "
                + "<div style='background: #666666;height: 10px;width:731px;margin-top:-3px;margin-left: 0px;'>"
                + "<br><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='white' size='5' style='position: absolute;font-family:Cambria;'><b> Quickklix <font color='yellow'>-</font> User Invitation</b></font></p> "
                + "</div> "

                + "<div style='margin-left: 20px;margin-top: 20px; width: 700px; height: auto;font: 1.1em/1.25em sans-serif;'> "
                + "<br><br><font>"
                + "Dear "
                + "<b style=' color:  #00a9f1'>"
                + senderFname + "</b> ," + "<br><br>"

                + "<font>Welcome to <b>QuickKlix's Media Platform! </b></font> <br/><br/> "
                + "<font><font color='#00a9f1'>" + userFName + "</font> has invited you to open an account with us so that you don't miss out on any of the excitement!</font> <br/><br/> "

                    + "<font>As a user, you'll experience all the business advantages of using <b>QuickKlix</b> "
                    + "as your media planning destination so "
                    + "<a href="+url+">Join Now!!</a>"+"<br><br></font>"

                    + "<font>For any concerns, questions, or suggestions please contact us at <u>info@quickklix.com</u> </font><br><br>"
                    + "<font>Thank you in advance for joining the <b>QuickKlix</b> family!</font><br> "

                    + "<br><br><br><br>"

                    + "<table><font color='#999999' size='2'width:750px'>"
                        + "This message was intended for " + senderEmail + ".<br>"
                        + "If you do not wish to receive this type of email from <b>QuickKlix</b> in the future," + "<br>"
                        + "please <a href='http://192.168.12.18:8080/QuickKlix/homePage.action'>click here </a>to unsubscribe.<br>"

                        + "QuickKlix Inc. P.O. Box 10005, chicago, IL.<br><br><br>"
                        + "</font>"
                    + "</table><br><br>"
                + "</div></div></body> ";
    

    String type = "text/html";
    String subject = "Send Invitation";
    String fromAdd = "info@quickklix.com";
    
    emailer.sendEmail(senderEmail, subject, body, type,fromAdd);
    session.put("invitation111", "emailsent");
    ret = "goToInvitation";
    }
    else{
    session.put("invitation111", "alreadysend");
    ret = "input";
    } }
    return ret;
}


}
