/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.mediaplan;

import com.bmf.quickklix.core.dao.MediaPlanDAO;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class MediaPlanBean {
    Logger log = Logger.getLogger(MediaPlanBean.class);
    MediaPlanDAO mpDAO = new MediaPlanDAO();

    private String userName; private String userFirstName; private String mediaMemberRequestType;
    private String mpClientName; private String mpCampaignName; private String mpTargetMarketName; private String mediaPlanName; private String mpMissionObjective; private String cpStartDate; private String cpEndDate; private String cpBudget;
    private String cpOrgBudget; private String mpOrgBudget;
    private String mpStartDate; private String mpEndDate; private String mpBudget; private String overBudget; private String createdDate; private String updatedDate; private String mpFormsCount;
    private List mediaPlanDetailsTakeFromDBToManagement; private List mpClientList;
    private int mediaPlanFormsCount;

    private String clientAddress1; private String clientAddress2; private String cityName; private String stateName; private String countryName; private String zipCode; private String contactPerson; private String contactPhoneNo; private String contactEmail; private String clientNameAlreadyExist;
    private ArrayList stateNamesList; private ArrayList countryNamesList;
    private String missionObjective; private String campaignProducts; private String existedCampaignProducts; private String campaignStartDate; private String campaignEndDate; private String campaignBudget; private String campaignNameAlreadyExist;

    private String combinationalName; private String mpTargetmarketName; private String mediaplanNameAlreadyExist;

    public String getUserName() {
        Map session = ActionContext.getContext().getSession();
        userName = (String)session.get("userName");
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserFirstName() {
        userFirstName = mpDAO.userFirstNameTakeFromDB(getUserName());
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getMediaMemberRequestType() {
        Map session = ActionContext.getContext().getSession();
        mediaMemberRequestType = (String)session.get("MediaMemberRequestType");
        return mediaMemberRequestType;
    }

    public void setMediaMemberRequestType(String mediaMemberRequestType) {
        this.mediaMemberRequestType = mediaMemberRequestType;
    }

    public String getCpBudget() {
        return cpBudget;
    }

    public void setCpBudget(String cpBudget) {
        this.cpBudget = cpBudget;
    }

    public String getCpEndDate() {
        return cpEndDate;
    }

    public void setCpEndDate(String cpEndDate) {
        this.cpEndDate = cpEndDate;
    }

    public String getCpStartDate() {
        return cpStartDate;
    }

    public void setCpStartDate(String cpStartDate) {
        this.cpStartDate = cpStartDate;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getMediaPlanName() {
        return mediaPlanName;
    }

    public void setMediaPlanName(String mediaPlanName) {
        this.mediaPlanName = mediaPlanName;
    }

    public String getMpBudget() {
        return mpBudget;
    }

    public void setMpBudget(String mpBudget) {
        this.mpBudget = mpBudget;
    }

    public String getMpCampaignName() {
        return mpCampaignName;
    }

    public void setMpCampaignName(String mpCampaignName) {
        this.mpCampaignName = mpCampaignName;
    }

    public String getMpClientName() {
        return mpClientName;
    }

    public void setMpClientName(String mpClientName) {
        this.mpClientName = mpClientName;
    }

    public String getMpEndDate() {
        return mpEndDate;
    }

    public void setMpEndDate(String mpEndDate) {
        this.mpEndDate = mpEndDate;
    }

    public String getMpMissionObjective() {
        return mpMissionObjective;
    }

    public void setMpMissionObjective(String mpMissionObjective) {
        this.mpMissionObjective = mpMissionObjective;
    }

    
    public String getMpStartDate() {
        return mpStartDate;
    }

    public void setMpStartDate(String mpStartDate) {
        this.mpStartDate = mpStartDate;
    }

    public String getMpTargetMarketName() {
        return mpTargetMarketName;
    }

    public void setMpTargetMarketName(String mpTargetMarketName) {
        this.mpTargetMarketName = mpTargetMarketName;
    }

    public String getOverBudget() {
        return overBudget;
    }

    public void setOverBudget(String overBudget) {
        this.overBudget = overBudget;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getMpFormsCount() {
        return mpFormsCount;
    }

    public void setMpFormsCount(String mpFormsCount) {
        this.mpFormsCount = mpFormsCount;
    }

    public String getCombinationalName() {
        return combinationalName;
    }

    public void setCombinationalName(String combinationalName) {
        this.combinationalName = combinationalName;
    }

    public int getMediaPlanFormsCount() {
        return mediaPlanFormsCount;
    }

    public void setMediaPlanFormsCount(int mediaPlanFormsCount) {
        this.mediaPlanFormsCount = mediaPlanFormsCount;
    }

    public List getMediaPlanDetailsTakeFromDBToManagement() {
        mediaPlanDetailsTakeFromDBToManagement = (ArrayList)mpDAO.mediaPlanDetailsTakeFromDB(getUserName()); setMediaPlanFormsCount(mediaPlanDetailsTakeFromDBToManagement.size());
        return mediaPlanDetailsTakeFromDBToManagement;
    }

    public void setMediaPlanDetailsTakeFromDBToManagement(List mediaPlanDetailsTakeFromDBToManagement) {
        this.mediaPlanDetailsTakeFromDBToManagement = mediaPlanDetailsTakeFromDBToManagement;
    }

    public String getMpTargetmarketName() {
        return mpTargetmarketName;
    }

    public void setMpTargetmarketName(String mpTargetmarketName) {
        this.mpTargetmarketName = mpTargetmarketName;
    }

    public List getMpClientList() {
        mpClientList = mpDAO.clientNamesListFromDB(getUserName());
        return mpClientList;
    }

    public void setMpClientList(List mpClientList) {
        this.mpClientList = mpClientList;
    }

    public String getCampaignBudget() {
        return campaignBudget;
    }

    public void setCampaignBudget(String campaignBudget) {
        this.campaignBudget = campaignBudget;
    }

    public String getCampaignEndDate() {
        return campaignEndDate;
    }

    public void setCampaignEndDate(String campaignEndDate) {
        this.campaignEndDate = campaignEndDate;
    }

    public String getCampaignProducts() {
        return campaignProducts;
    }

    public void setCampaignProducts(String campaignProducts) {
        this.campaignProducts = campaignProducts;
    }

    public String getCampaignStartDate() {
        return campaignStartDate;
    }

    public void setCampaignStartDate(String campaignStartDate) {
        this.campaignStartDate = campaignStartDate;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getClientAddress1() {
        return clientAddress1;
    }

    public void setClientAddress1(String clientAddress1) {
        this.clientAddress1 = clientAddress1;
    }

    public String getClientAddress2() {
        return clientAddress2;
    }

    public void setClientAddress2(String clientAddress2) {
        this.clientAddress2 = clientAddress2;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getContactPhoneNo() {
        return contactPhoneNo;
    }

    public void setContactPhoneNo(String contactPhoneNo) {
        this.contactPhoneNo = contactPhoneNo;
    }

    public String getCountryName() {
        countryName = "USA";
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getMissionObjective() {
        return missionObjective;
    }

    public void setMissionObjective(String missionObjective) {
        this.missionObjective = missionObjective;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCampaignNameAlreadyExist() {
        return campaignNameAlreadyExist;
    }

    public void setCampaignNameAlreadyExist(String campaignNameAlreadyExist) {
        this.campaignNameAlreadyExist = campaignNameAlreadyExist;
    }

    public String getClientNameAlreadyExist() {
        return clientNameAlreadyExist;
    }

    public void setClientNameAlreadyExist(String clientNameAlreadyExist) {
        this.clientNameAlreadyExist = clientNameAlreadyExist;
    }

    public String getExistedCampaignProducts() {
        return existedCampaignProducts;
    }

    public void setExistedCampaignProducts(String existedCampaignProducts) {
        this.existedCampaignProducts = existedCampaignProducts;
    }

    public ArrayList getStateNamesList() {
        stateNamesList = (ArrayList)mpDAO.statesListTakeFromDB();
        return stateNamesList;
    }

    public void setStateNamesList(ArrayList stateNamesList) {
        this.stateNamesList = stateNamesList;
    }

    public ArrayList getCountryNamesList() {
        countryNamesList = (ArrayList)mpDAO.countryNamesListTakeFromDB();
        return countryNamesList;
    }

    public void setCountryNamesList(ArrayList countryNamesList) {
        this.countryNamesList = countryNamesList;
    }

    public String getMediaplanNameAlreadyExist() {
        return mediaplanNameAlreadyExist;
    }

    public void setMediaplanNameAlreadyExist(String mediaplanNameAlreadyExist) {
        this.mediaplanNameAlreadyExist = mediaplanNameAlreadyExist;
    }

    public String getCpOrgBudget() {
        return cpOrgBudget;
    }

    public void setCpOrgBudget(String cpOrgBudget) {
        this.cpOrgBudget = cpOrgBudget;
    }

    public String getMpOrgBudget() {
        return mpOrgBudget;
    }

    public void setMpOrgBudget(String mpOrgBudget) {
        this.mpOrgBudget = mpOrgBudget;
    }
    




}
