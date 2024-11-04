/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.campaignplan;
import com.bmf.quickklix.core.dao.CampaignPlanDAO;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class CampaignPlanBean {
    Logger log = Logger.getLogger(CampaignPlanBean.class);
    CampaignPlanDAO cpDAO = new CampaignPlanDAO();
    
    private String userName; private String clientName; private String clientAddress1; private String clientAddress2; private String cityName; private String stateName; private String countryName; private String zipCode; private String contactPerson; private String contactPhoneNo; private String contactEmail;
    private String existedCampaignProducts; private String clientNameAlreadyExist; private String campaignNameAlreadyExist; private String combinationalName; private String userFirstName;  private String mediaMemberRequestType;
    private ArrayList stateNamesList; private ArrayList countryNamesList; private ArrayList clientDetailsTakeFromDBToJspCreation; private ArrayList clientDetailsTakeFromDBToJspModification; private ArrayList clientDetailsTakeFromDBToManagement;
    private int clientFormsCount; private int clientId; private int clientCount; private List campaignClientList;
    
    private String campaignClientName; private String campaignName; private String missionObjective; private String campaignProducts; private String campaignStartDate; private String campaignEndDate; private String campaignBudget;
    private String senderName; private String senderEmail; private String createdDate; private String modifiedDate;
    private ArrayList campaignProductsList; private ArrayList campaignDetailsTakeFromDBToJspCreation; private ArrayList campaignDetailsTakeFromDBToJspModification; private ArrayList campaignDetailsTakeFromDBToManagement;
    private int campaignFormsCount; private int campaignId; private int campaignCount;
    private String mpStartDate; private String mpEndDate; private String mpBudget; private String capaignExisted; private String tmExisted;

    public String getUserName() {
        Map session = ActionContext.getContext().getSession();
        userName = (String)session.get("userName");
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getCampaignBudget() {
        return campaignBudget;
    }

    public void setCampaignBudget(String campaignBudget) {
        this.campaignBudget = campaignBudget;
    }

    public String getCampaignClientName() {
        return campaignClientName;
    }

    public void setCampaignClientName(String campaignClientName) {
        this.campaignClientName = campaignClientName;
    }

    public ArrayList getCampaignDetailsTakeFromDBToJspCreation() {
        return campaignDetailsTakeFromDBToJspCreation;
    }

    public void setCampaignDetailsTakeFromDBToJspCreation(ArrayList campaignDetailsTakeFromDBToJspCreation) {
        this.campaignDetailsTakeFromDBToJspCreation = campaignDetailsTakeFromDBToJspCreation;
    }

    public ArrayList getCampaignDetailsTakeFromDBToJspModification() {
        return campaignDetailsTakeFromDBToJspModification;
    }

    public void setCampaignDetailsTakeFromDBToJspModification(ArrayList campaignDetailsTakeFromDBToJspModification) {
        this.campaignDetailsTakeFromDBToJspModification = campaignDetailsTakeFromDBToJspModification;
    }

    public ArrayList getCampaignDetailsTakeFromDBToManagement() {
        campaignDetailsTakeFromDBToManagement = (ArrayList)cpDAO.campaignDetailsTakeFromDB(getUserName()); setCampaignFormsCount(campaignDetailsTakeFromDBToManagement.size());
        return campaignDetailsTakeFromDBToManagement;
    }

    public void setCampaignDetailsTakeFromDBToManagement(ArrayList campaignDetailsTakeFromDBToManagement) {
        this.campaignDetailsTakeFromDBToManagement = campaignDetailsTakeFromDBToManagement;
    }

    public String getCampaignEndDate() {
        return campaignEndDate;
    }

    public void setCampaignEndDate(String campaignEndDate) {
        this.campaignEndDate = campaignEndDate;
    }

    public int getCampaignFormsCount() {
        return campaignFormsCount;
    }

    public void setCampaignFormsCount(int campaignFormsCount) {
        this.campaignFormsCount = campaignFormsCount;
    }

    public String getCampaignName() {
        return campaignName;
    }

    public void setCampaignName(String campaignName) {
        this.campaignName = campaignName;
    }

    public String getCampaignProducts() {
        return campaignProducts;
    }

    public void setCampaignProducts(String campaignProducts) {
        this.campaignProducts = campaignProducts;
    }

    public ArrayList getCampaignProductsList() {
        return campaignProductsList;
    }

    public void setCampaignProductsList(ArrayList campaignProductsList) {
        this.campaignProductsList = campaignProductsList;
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

    public ArrayList getClientDetailsTakeFromDBToJspCreation() {
        return clientDetailsTakeFromDBToJspCreation;
    }

    public void setClientDetailsTakeFromDBToJspCreation(ArrayList clientDetailsTakeFromDBToJspCreation) {
        this.clientDetailsTakeFromDBToJspCreation = clientDetailsTakeFromDBToJspCreation;
    }

    public ArrayList getClientDetailsTakeFromDBToJspModification() {
        return clientDetailsTakeFromDBToJspModification;
    }

    public void setClientDetailsTakeFromDBToJspModification(ArrayList clientDetailsTakeFromDBToJspModification) {
        this.clientDetailsTakeFromDBToJspModification = clientDetailsTakeFromDBToJspModification;
    }

    public ArrayList getClientDetailsTakeFromDBToManagement() {
        clientDetailsTakeFromDBToManagement = (ArrayList)cpDAO.clientDetailsTakeFromDB(getUserName()); setClientFormsCount(clientDetailsTakeFromDBToManagement.size());
        return clientDetailsTakeFromDBToManagement;
    }

    public void setClientDetailsTakeFromDBToManagement(ArrayList clientDetailsTakeFromDBToManagement) {
        this.clientDetailsTakeFromDBToManagement = clientDetailsTakeFromDBToManagement;
    }

    public int getClientFormsCount() {
        return clientFormsCount;
    }

    public void setClientFormsCount(int clientFormsCount) {
        this.clientFormsCount = clientFormsCount;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
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

    public ArrayList getCountryNamesList() {
        countryNamesList = (ArrayList)cpDAO.countryNamesListTakeFromDB();
        return countryNamesList;
    }

    public void setCountryNamesList(ArrayList countryNamesList) {
        this.countryNamesList = countryNamesList;
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

    public ArrayList getStateNamesList() {
        stateNamesList = (ArrayList)cpDAO.statesListTakeFromDB();
        return stateNamesList;
    }

    public void setStateNamesList(ArrayList stateNamesList) {
        this.stateNamesList = stateNamesList;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public int getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(int campaignId) {
        this.campaignId = campaignId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public String getSenderEmail() {
        return senderEmail;
    }

    public void setSenderEmail(String senderEmail) {
        this.senderEmail = senderEmail;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public int getCampaignCount() {
        Map session = ActionContext.getContext().getSession();
        campaignCount = (Integer) session.get("CampaignCount");
        return campaignCount;
    }

    public void setCampaignCount(int campaignCount) {
        this.campaignCount = campaignCount;
    }

    public int getClientCount() {
        Map session = ActionContext.getContext().getSession();
        clientCount = (Integer) session.get("ClientCount");
        return clientCount;
    }

    public void setClientCount(int clientCount) {
        this.clientCount = clientCount;
    }

    public List getCampaignClientList() {
        campaignClientList = cpDAO.clientNamesListFromDB(getUserName());
        return campaignClientList;
    }

    public void setCampaignClientList(List campaignClientList) {
        this.campaignClientList = campaignClientList;
    }

    public String getExistedCampaignProducts() {
        return existedCampaignProducts;
    }

    public void setExistedCampaignProducts(String existedCampaignProducts) {
        this.existedCampaignProducts = existedCampaignProducts;
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

    public String getCombinationalName() {
        return combinationalName;
    }

    public void setCombinationalName(String combinationalName) {
        this.combinationalName = combinationalName;
    }

    public String getUserFirstName() {
        userFirstName = cpDAO.userFirstNameTakeFromDB(getUserName());
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

    public String getMpStartDate() {
        return mpStartDate;
    }

    public void setMpStartDate(String mpStartDate) {
        this.mpStartDate = mpStartDate;
    }

    public String getMpEndDate() {
        return mpEndDate;
    }

    public void setMpEndDate(String mpEndDate) {
        this.mpEndDate = mpEndDate;
    }

    public String getMpBudget() {
        return mpBudget;
    }

    public void setMpBudget(String mpBudget) {
        this.mpBudget = mpBudget;
    }

    public String getCapaignExisted() {
        return capaignExisted;
    }

    public void setCapaignExisted(String capaignExisted) {
        this.capaignExisted = capaignExisted;
    }

    public String getTmExisted() {
        return tmExisted;
    }

    public void setTmExisted(String tmExisted) {
        this.tmExisted = tmExisted;
    }
    

    




    
    
    



}
