/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.userinformation;
import com.bmf.quickklix.core.dao.UserInformationDAO;
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
 * @author lakshmi
 */
public class LoginAction extends ActionSupport implements ModelDriven {
    Logger log = Logger.getLogger(LoginAction.class);
    LoginBean lBean = new LoginBean();
    UserInformationDAO uiDAO = new UserInformationDAO();
    EmailSending emailer = new EmailSending();

public Object getModel() {
    return lBean;
}

    @Override
public String execute(){
    return "success";
}
    
public String userRegistration() throws Exception {    
    String ret = "success";
    if(lBean.getUserName() != null && lBean.getPassword() != null){
    Integer res = uiDAO.userRegistration(lBean.getUserName(),lBean.getPassword());
    if (res == 1) {
                EncryptDecryptUrl cl = new EncryptDecryptUrl();
                String eStr = cl.encrypt(lBean.getUserName());
                String url = "http://192.168.12.150:8080/QuickKlix/userID.sevt?param=" + eStr;
                int sindex = (lBean.getUserName()).indexOf("@");
                String fname = (lBean.getUserName()).substring(0, sindex);

                String body = "<body> <div style='margin-left: 30px;margin-top:10px;background: #f1f1f1;min-height: 250px;width: 750px;box-shadow: 3px 3px 0px #7e7e7e;height: auto;'> "
                + "<div style='background: #666666;height: 30px;width:751px;margin-top:-3px;margin-left: 0px;'>"
                + "<br><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='white' size='5' style='position: absolute;font-family:Cambria;'><b> QuickKlix's One Stop Media Platform<font color='yellow'>!</font></b></font></p> "
                + "</div> "

                + "<div style='margin-top: 20px; width: 740px; height: auto;font: 1.1em/1.20em sans-serif;white-space: nowrap;'> "
                + "<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font>"
                + "Dear "
                + "<b style=' color:  #00a9f1'>"
                + fname + "</b> ," + "<br><br>"

                        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thanks for signing up with <b>QuickKlix's One Stop Media Platform!</b><br><br>"
                        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please click on the Link to activate your Account "
                        + "<a href=" + url + ">Activate me</a><br><br>"
                        + "<font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For any concerns, questions, or suggestions please contact us at <u>info@quickklix.com</u></font> <br><br>"
                        + "<font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thank you for joining the <b>One Stop</b> family!</font><br><br> "
                        + "<font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The <b>QuickKlix</b> Team </font><br><br>"
                        + "</font>"
                        + "</div>"
                       
                        + "<br>"
                        + "<table><font color='#999999' size='2'width:750px'>"
                        + "&nbsp;&nbsp;&nbsp;This message was intended for " + lBean.getUserName() + ".<br>"
                        + "&nbsp;&nbsp;&nbsp;If you do not wish to receive this type of email from <b>QuickKlix</b> in the future," + "<br>"
                        + "&nbsp;&nbsp;&nbsp;please <a href='http://192.168.12.150:8080/QuickKlix/homePage.action'>click here </a>to unsubscribe.<br>"

                        + "&nbsp;&nbsp;&nbsp;QuickKlix Inc. P.O. Box 10005, chicago, IL.<br><br><br>"
                        + "</font>"
                        + "</table>"
                        + "</div>"
                        + "</body>";

                String matter = "Thanks for signing up with QuickKlix";
                String type = "text/html";
                String subject = "Please confirm Email address.";

        String fromAdd = "info@quickklix.com";
    emailer.sendEmail(lBean.getUserName(), subject, body, type,fromAdd);
    ret = "goToSuccess";
    } 
    else if (res == 2) {
    addActionError("E-mail already exists!");
    ret = "input";
    } }
    return ret;
}

public String userLoginVerification() throws Exception { 
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String res = uiDAO.loginVerification(lBean.getUserName(),lBean.getPassword());
    String mediaMemberReqType = uiDAO.mediaMemberRequestTypeTakeFromDB(lBean.getUserName());
    String contactUserName = uiDAO.primaryContactUserNameTakeFromDB(lBean.getUserName());

    int cpCount = uiDAO.campaignCountTakeFromDB(lBean.getUserName());
    int tmCount = uiDAO.targetMarketCountTakeFromDB(lBean.getUserName());
    int mpCount = uiDAO.mediaPlanCountTakeFromDB(lBean.getUserName());
    session.put("CpCountInSession", cpCount);
    session.put("TmCountInSession", tmCount);
    session.put("MpCountInSession", mpCount);
    
    lBean.setTmCount(tmCount);
    
    lBean.setMediaPlanCount(mpCount);

    if (res.equals("bothAreCorrectEntry")) {    
    session.put("userName", lBean.getUserName());    
    if(contactUserName != null){         
    ret = "goToUserLandingHome";
    } else{
    ret = "goToPrimaryContact";
    } }
    
    else if (res.equals("mediaMemberUser")) {
    session.put("userName", lBean.getUserName());
    session.put("MediaMemberRequestType", mediaMemberReqType);
    ret = "goToUserLandingHome";
    }
    
    else if (res.equals("userNameIsWrongEntry") || res.equals("passwordIsWrongEntry")) {
    addActionError("Invalid ID or Password.");
    ret = "input";
    } else if (res.equals("userNotActivated")) {
    addActionError("Please activate your account.");
    ret = "input";
    }    
    return ret;
}

public String primaryContactInformation(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();    
    String industryName = null;
    if(lBean.getIndustryName() != null && lBean.getIndustryName().equals("Other")){
    industryName = lBean.getOtherIndustryName();
    } else{
    industryName = lBean.getIndustryName();
    }
    int res = uiDAO.primaryContactInformationSavingInDB(lBean.getLoginUserName(),lBean.getFirstName(),lBean.getLastName(),lBean.getPhoneNumber(),lBean.getCompanyName(),industryName,lBean.getUserType(),lBean.getMediaType());
    if(res == 1){
        String mediaMemberReqType = uiDAO.mediaMemberRequestTypeTakeFromDB(lBean.getLoginUserName());
        session.put("MediaMemberRequestType", mediaMemberReqType);
    ret = "goToUserLandingHome";
    } else if(res == 111){
    ret = "input";
    }
    return ret;
}

public String changePassword() {
   String ret = "success";
  Map session = ActionContext.getContext().getSession();
  String userName = (String)session.get("userName");
  int res = uiDAO.passwordChange(userName, lBean.getPassword(), lBean.getNewPassword());
  if(res==1) {
  addActionMessage("Your new Password has been saved.");
  }
  else {
  lBean.setPassError("invalpass");
  addActionMessage("Please enter a valid Current Password.");
  }
   return ret;
}

public String forgotPassword()  {    
    String ret = "success";
    String userName = uiDAO.forgotPassEmailVarify(lBean.getUserName());
    if (userName != null) {
    Map session = ActionContext.getContext().getSession();
    session.put("forgotPassUserID", lBean.getUserName());

    String alphaNumerics = "ab1cde2fgh3ijk4mnp5qrs6tuv7wxy8zAB9CDEFGHIJKLMNPQRST0UVWXYZ";
    String securityPin = "";
    for (int i = 0; i < 8; i++) {
    securityPin += alphaNumerics.charAt((int) (Math.random() * alphaNumerics.length()));
    }
    uiDAO.securityPinSaving(lBean.getUserName(), securityPin);    
    String fromAdd = "info@quickklix.com";
    String subject = "QuickKlix Security Pin";
    String userId = lBean.getUserName();
    String secPin = securityPin;
    String type = "text/html";
    int sindex = (lBean.getUserName()).indexOf("@");
    String fname = (lBean.getUserName()).substring(0, sindex);

    String body = "<body> <div style='margin-left: 30px;margin-top:10px;background: #f1f1f1;min-height: 250px;width: 700px;box-shadow: 3px 3px 0px #7e7e7e;height: auto;'> "
                + "<div style='background: #666666;height: 10px;width:701px;margin-top:-3px;margin-left: 0px;'>"
                + "<br><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='white' size='5' style='position: absolute;font-family:Cambria;'><b> Quickklix <font color='yellow'>-</font> Security Pin</b></font></p> "
                + "</div> "

                + "<div style='margin-top: 20px; width: 600px; height: auto;font: 1.0em/1.25em sans-serif;text-align: justify;'> "
                + "<br><br><font size='3'>"
                + "Dear "
                + "<b style=' color:  #00a9f1'>"
                + fname + "</b> ," + "<br><br><br>"

                + "<b>User ID:</b> " + userId + " <br/><br/> "
                + "<b>Security Pin:</b> " + secPin + " <br/> <br/><br/> <br/> "
                + "</font><br><br> "
                + "</div></div></body> ";

    try {
    emailer.sendEmail(userId, subject, body, type,fromAdd);
    }
    catch (Exception ex) { }
    ret = "success";
    }
    
    else {
    addActionError("E-mail not found!");
    ret = "input";
    }


    return ret;
}

public String PasswordChangeWithSecPin() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String userName = (String)session.get("forgotPassUserID");    
    int result = uiDAO.passwordChangewithSecurityPin(userName,lBean.getPassword(),lBean.getSecurityPin());
    if (result == 1) {
    ret = "goToLoginPage";
    } else {
    addActionError("Please enter correct Security Pin!");
    ret = "input";
    } 
    return ret;
}

public String userLogout() throws Exception {
    Map session = ActionContext.getContext().getSession();
    session.remove("userName");
    session.put("userName", null);
    session.clear();
    return SUCCESS;
}

public String editPrimaryContactInformation() {
  String ret = "success";
  Map session = ActionContext.getContext().getSession();
  String res = uiDAO.updatePrimaryContactInformation(lBean.getLoginUserName(),lBean.getFirstName(),lBean.getLastName(),lBean.getPhoneNumber(),lBean.getCompanyName());
  return ret;
}

public String contactUsEmailSending() throws Exception {
    Map session = ActionContext.getContext().getSession();
    String userId ="info@quickklix.com";

    String body = "<body> <div style='margin-left: 68px;margin-top:10px;background: #f1f1f1;min-height: 260px;width: 650px;box-shadow: 3px 3px 0px #7e7e7e;height: auto;'> "
                + "<div style='background: #666666;height: 30px;width:651px;margin-top:-3px;'>"
                + "<p style='margin-left: 20px; margin-top: 3px; text-align: justify; color: white;position: absolute;font: bold 1.8em/1em Cambria;'> <font color='white'>User <font color='yellow'>-</font> Contact Information</font></p> "
                + "</div> "
                + "<div style='margin-left: 20px; margin-top: 20px; width: 600px; height: auto;font: 1.0em/1.26em sans-serif;text-align: justify;color:black;'><br/> "

                + "<b>Name:</b> " + lBean.getContactName() + " <br/><br/> "
                + "<b>Email:</b> " + "<a href=mailto:" + lBean.getContactEmail() + "> " + lBean.getContactEmail() + " </a> <br/> <br/> "
                + "<b>Comments:</b> " + lBean.getContactComment() + " <br/><br/> "
                + "</div></div></body> ";
    String type = "text/html";
    String subject = lBean.getContactSubject();
    String fromAdd = "info@quickklix.com";
    emailer.sendEmail(userId, subject, body, type,fromAdd);

    session.put("invitation111", "emailsent");
    return "contactUSPage";
}

public String userLandingHomeData() throws Exception { 
    String ret = "success";
    Map session = ActionContext.getContext().getSession();    
    int cpCount = uiDAO.campaignCountTakeFromDB(lBean.getLoginUserName());
    int tmCount = uiDAO.targetMarketCountTakeFromDB(lBean.getLoginUserName());
    int mpCount = uiDAO.mediaPlanCountTakeFromDB(lBean.getLoginUserName());
    session.put("CpCountInSession", cpCount);
    session.put("TmCountInSession", tmCount);
    session.put("MpCountInSession", mpCount);    
    lBean.setTmCount(tmCount);    
    lBean.setMediaPlanCount(mpCount);
    ret = "goToUserLandingHome";    
    return ret;
}







}
