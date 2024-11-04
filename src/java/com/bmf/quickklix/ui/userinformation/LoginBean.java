/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.userinformation;

import com.opensymphony.xwork2.ActionContext;

import com.bmf.quickklix.core.dao.UserInformationDAO;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author Murthy
 */
public class LoginBean {
    Logger log = Logger.getLogger(LoginBean.class);
    UserInformationDAO uiDAO = new UserInformationDAO();

    private String userName; private String password; private String conformPassword; private String newPassword; private String mediaTypeselection; private String passError; private String securityPin;
    private String loginUserName; private String loginUserFirstName; private String mediaMemberRequestType; private String loginFirstName; private String userType;
    private int userId;

    private String firstName; private String lastName; private String phoneNumber; private String companyName; private String industryName; private String otherIndustryName;
    private String mediaMemberType; private String mediaType; private String radioStationName; private String televisionStationName; private String newspaperName; private String magazineName; private String otherMediaName;
    private ArrayList industryList; private String primaryContactsList;

    private String contactName;private String contactEmail;private String contactReenterEmail;private String contactSubject;private String contactComment;
    private int campaignCount; private int tmCount;private int mediaPlanCount;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getConformPassword() {
        return conformPassword;
    }

    public void setConformPassword(String conformPassword) {
        this.conformPassword = conformPassword;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public ArrayList getIndustryList() {
        industryList = (ArrayList)uiDAO.industryListTakeFromDB();
        return industryList;
    }

    public void setIndustryList(ArrayList industryList) {
        this.industryList = industryList;
    }

    public String getIndustryName() {
        return industryName;
    }

    public void setIndustryName(String industryName) {
        this.industryName = industryName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMagazineName() {
        return magazineName;
    }

    public void setMagazineName(String magazineName) {
        this.magazineName = magazineName;
    }

    public String getMediaMemberType() {
        return mediaMemberType;
    }

    public void setMediaMemberType(String mediaMemberType) {
        this.mediaMemberType = mediaMemberType;
    }

    public String getNewspaperName() {
        return newspaperName;
    }

    public void setNewspaperName(String newspaperName) {
        this.newspaperName = newspaperName;
    }

    public String getOtherIndustryName() {
        return otherIndustryName;
    }

    public void setOtherIndustryName(String otherIndustryName) {
        this.otherIndustryName = otherIndustryName;
    }

    public String getOtherMediaName() {
        return otherMediaName;
    }

    public void setOtherMediaName(String otherMediaName) {
        this.otherMediaName = otherMediaName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRadioStationName() {
        return radioStationName;
    }

    public void setRadioStationName(String radioStationName) {
        this.radioStationName = radioStationName;
    }

    public String getTelevisionStationName() {
        return televisionStationName;
    }

    public void setTelevisionStationName(String televisionStationName) {
        this.televisionStationName = televisionStationName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {        
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMediaType() {
        return mediaType;
    }

    public void setMediaType(String mediaType) {
        this.mediaType = mediaType;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getMediaTypeselection() {
        return mediaTypeselection;
    }

    public void setMediaTypeselection(String mediaTypeselection) {
        this.mediaTypeselection = mediaTypeselection;
    }

    public String getPassError() {
        return passError;
    }

    public void setPassError(String passError) {
        this.passError = passError;
    }

    public String getPrimaryContactsList() {
       Map session = ActionContext.getContext().getSession();
       LoginBean lBean = uiDAO.primaryContactsListTakeFromDB(getLoginUserName());
       setFirstName(lBean.getFirstName());setLastName(lBean.getLastName());setPhoneNumber(lBean.getPhoneNumber());setCompanyName(lBean.getCompanyName());
       return primaryContactsList;
    }


    public void setPrimaryContactsList(String primaryContactsList) {
        this.primaryContactsList = primaryContactsList;
    }

    public String getSecurityPin() {
        return securityPin;
    }

    public void setSecurityPin(String securityPin) {
        this.securityPin = securityPin;
    }

    public String getLoginUserName() {
        Map session = ActionContext.getContext().getSession();
        loginUserName = (String)session.get("userName");
        return loginUserName;
    }

    public void setLoginUserName(String loginUserName) {
        this.loginUserName = loginUserName;
    }

    public String getLoginUserFirstName() {
        loginUserFirstName = uiDAO.userFirstNameTakeFromDB(getLoginUserName());
        return loginUserFirstName;
    }

    public void setLoginUserFirstName(String loginUserFirstName) {
        this.loginUserFirstName = loginUserFirstName;
    }

    public String getMediaMemberRequestType() {
        Map session = ActionContext.getContext().getSession();
        mediaMemberRequestType = (String)session.get("MediaMemberRequestType");
        return mediaMemberRequestType;
    }

    public void setMediaMemberRequestType(String mediaMemberRequestType) {
        this.mediaMemberRequestType = mediaMemberRequestType;
    }

    public String getLoginFirstName() {
        int sindex = (getLoginUserName()).indexOf("@");
        loginFirstName = (getLoginUserName()).substring(0, sindex);
        return loginFirstName;
    }

    public void setLoginFirstName(String loginFirstName) {
        this.loginFirstName = loginFirstName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getContactComment() {
        return contactComment;
    }

    public void setContactComment(String contactComment) {
        this.contactComment = contactComment;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactReenterEmail() {
        return contactReenterEmail;
    }

    public void setContactReenterEmail(String contactReenterEmail) {
        this.contactReenterEmail = contactReenterEmail;
    }

    public String getContactSubject() {
        return contactSubject;
    }

    public void setContactSubject(String contactSubject) {
        this.contactSubject = contactSubject;
    }

    public int getCampaignCount() {
        Map session = ActionContext.getContext().getSession();
        campaignCount = (Integer)session.get("CpCountInSession");
        return campaignCount;
    }

    public void setCampaignCount(int campaignCount) {
        this.campaignCount = campaignCount;
    }

    public int getMediaPlanCount() {
        Map session = ActionContext.getContext().getSession();
        mediaPlanCount = (Integer)session.get("MpCountInSession");
        return mediaPlanCount;
    }

    public void setMediaPlanCount(int mediaPlanCount) {
        this.mediaPlanCount = mediaPlanCount;
    }

    public int getTmCount() {
        Map session = ActionContext.getContext().getSession();
        tmCount = (Integer)session.get("TmCountInSession");
        return tmCount;
    }

    public void setTmCount(int tmCount) {
        this.tmCount = tmCount;
    }









}
