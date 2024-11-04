/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.targetmarket;

import com.bmf.quickklix.core.dao.TargetMarketStatesDAO;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class TargetMarketStatesBean {
    Logger log = Logger.getLogger(TargetMarketStatesBean.class);
    TargetMarketStatesDAO tmsDAO = new TargetMarketStatesDAO();

    private String userName; private String userFirstName; private String mediaMemberRequestType;

    private String tmsClientName; private String tmsCampaignName; private String tmsName; private String geoName; private String targetedPeople; private String createdDate; private String updatedDate; private String reportsTMData;
    private String combinationalName; private String tmSelectedStates; private String selStatesAndCount;  private String allStatesCount; private String tmTotalPumaCount;  private String dimensionName;
    private String selectedTMCategories; private String selectedTMDimention; private String selectedAbilityCategories; private String selectedAgeCategories; private String totalDimCatCount;
    private String selectedAncestryCategories; private String selectedCitizenshipCategories; private String selectedClassOfWorkerCategories; private String selectedEducationCategories; private String selectedGenderCategories;
    private String selectedIncomeCategories; private String selectedIndustryCategories; private String selectedLanguageCategories; private String selectedMaritalStatusCategories; private String selectedTransportationCategories;
    private String selectedMigrationStatusCategories; private String selectedOccupationCategories; private String selectedRaceCategories; private String dimentionSessionName; private String dimentionCookieValue; private String cookieData;
    private String tmDimenJsonVal; private String newTmDimention; private String totalTMPeoplrsCount; private String tmBackMoveToDim;
    private int tmFormsCount; private int tmId;
    private List tmsDetailsTakeFromDBToManagement; private List tmMapCount;
    
    private String clientAddress1; private String clientAddress2; private String cityName; private String stateName; private String countryName; private String zipCode; private String contactPerson; private String contactPhoneNo; private String contactEmail; private String clientNameAlreadyExist;
    private List tmClientList; private ArrayList stateNamesList; private ArrayList countryNamesList;
    private String missionObjective; private String campaignProducts; private String existedCampaignProducts; private String campaignStartDate; private String campaignEndDate; private String campaignBudget; private String campaignNameAlreadyExist;
    private String tmsNameAlreadyExist;



    public String getUserName() {
        Map session = ActionContext.getContext().getSession();
        userName = (String)session.get("userName");
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserFirstName() {
        userFirstName = tmsDAO.userFirstNameTakeFromDB(getUserName());
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

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getGeoName() {
        return geoName;
    }

    public void setGeoName(String geoName) {
        this.geoName = geoName;
    }

    public String getTargetedPeople() {
        return targetedPeople;
    }

    public void setTargetedPeople(String targetedPeople) {
        this.targetedPeople = targetedPeople;
    }

    public String getTmsCampaignName() {
        return tmsCampaignName;
    }

    public void setTmsCampaignName(String tmsCampaignName) {
        this.tmsCampaignName = tmsCampaignName;
    }

    public String getTmsClientName() {
        return tmsClientName;
    }

    public void setTmsClientName(String tmsClientName) {
        this.tmsClientName = tmsClientName;
    }

    public String getTmsName() {
        return tmsName;
    }

    public void setTmsName(String tmsName) {
        this.tmsName = tmsName;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getCombinationalName() {
        return combinationalName;
    }

    public void setCombinationalName(String combinationalName) {
        this.combinationalName = combinationalName;
    }

    public int getTmFormsCount() {
        return tmFormsCount;
    }

    public void setTmFormsCount(int tmFormsCount) {
        this.tmFormsCount = tmFormsCount;
    }

    public List getTmsDetailsTakeFromDBToManagement() {
        tmsDetailsTakeFromDBToManagement = (ArrayList)tmsDAO.targerMarketDetailsTakeFromDB(getUserName()); setTmFormsCount(tmsDetailsTakeFromDBToManagement.size());
        return tmsDetailsTakeFromDBToManagement;
    }

    public void setTmsDetailsTakeFromDBToManagement(List tmsDetailsTakeFromDBToManagement) {
        this.tmsDetailsTakeFromDBToManagement = tmsDetailsTakeFromDBToManagement;
    }

    public List getTmMapCount() {
        tmMapCount = tmsDAO.mouseOverValuesForTMStatesMap();   
        return tmMapCount;
    }

    public void setTmMapCount(List tmMapCount) {
        this.tmMapCount = tmMapCount;
    }

    public String getTmSelectedStates() {
        return tmSelectedStates;
    }

    public void setTmSelectedStates(String tmSelectedStates) {
        this.tmSelectedStates = tmSelectedStates;
    }

    public String getTmTotalPumaCount() {
        Map session = ActionContext.getContext().getSession();
        tmTotalPumaCount = (String)session.get("TotalPumaCountInSession"); 
        return tmTotalPumaCount;
    }

    public void setTmTotalPumaCount(String tmTotalPumaCount) {
        this.tmTotalPumaCount = tmTotalPumaCount;
    }

    public String getSelStatesAndCount() {
        Map session = ActionContext.getContext().getSession();
        selStatesAndCount = (String)session.get("SelStatesAndCountInSession");
        return selStatesAndCount;
    }

    public void setSelStatesAndCount(String selStatesAndCount) {
        this.selStatesAndCount = selStatesAndCount;
    }

    public String getAllStatesCount() {
        Map session = ActionContext.getContext().getSession();
        allStatesCount = (String)session.get("AllStatesCount");
        return allStatesCount;
    }

    public void setAllStatesCount(String allStatesCount) {
        this.allStatesCount = allStatesCount;
    }

    public String getSelectedAbilityCategories() {
        return selectedAbilityCategories;
    }

    public void setSelectedAbilityCategories(String selectedAbilityCategories) {
        this.selectedAbilityCategories = selectedAbilityCategories;
    }

    public String getSelectedAgeCategories() {
        return selectedAgeCategories;
    }

    public void setSelectedAgeCategories(String selectedAgeCategories) {
        this.selectedAgeCategories = selectedAgeCategories;
    }

    public String getSelectedAncestryCategories() {
        return selectedAncestryCategories;
    }

    public void setSelectedAncestryCategories(String selectedAncestryCategories) {
        this.selectedAncestryCategories = selectedAncestryCategories;
    }

    public String getSelectedCitizenshipCategories() {
        return selectedCitizenshipCategories;
    }

    public void setSelectedCitizenshipCategories(String selectedCitizenshipCategories) {
        this.selectedCitizenshipCategories = selectedCitizenshipCategories;
    }

    public String getSelectedClassOfWorkerCategories() {
        return selectedClassOfWorkerCategories;
    }

    public void setSelectedClassOfWorkerCategories(String selectedClassOfWorkerCategories) {
        this.selectedClassOfWorkerCategories = selectedClassOfWorkerCategories;
    }

    public String getSelectedEducationCategories() {
        return selectedEducationCategories;
    }

    public void setSelectedEducationCategories(String selectedEducationCategories) {
        this.selectedEducationCategories = selectedEducationCategories;
    }

    public String getSelectedGenderCategories() {
        return selectedGenderCategories;
    }

    public void setSelectedGenderCategories(String selectedGenderCategories) {
        this.selectedGenderCategories = selectedGenderCategories;
    }

    public String getSelectedIncomeCategories() {
        return selectedIncomeCategories;
    }

    public void setSelectedIncomeCategories(String selectedIncomeCategories) {
        this.selectedIncomeCategories = selectedIncomeCategories;
    }

    public String getSelectedIndustryCategories() {
        return selectedIndustryCategories;
    }

    public void setSelectedIndustryCategories(String selectedIndustryCategories) {
        this.selectedIndustryCategories = selectedIndustryCategories;
    }

    public String getSelectedLanguageCategories() {
        return selectedLanguageCategories;
    }

    public void setSelectedLanguageCategories(String selectedLanguageCategories) {
        this.selectedLanguageCategories = selectedLanguageCategories;
    }

    public String getSelectedMaritalStatusCategories() {
        return selectedMaritalStatusCategories;
    }

    public void setSelectedMaritalStatusCategories(String selectedMaritalStatusCategories) {
        this.selectedMaritalStatusCategories = selectedMaritalStatusCategories;
    }

    public String getSelectedTransportationCategories() {
        return selectedTransportationCategories;
    }

    public void setSelectedTransportationCategories(String selectedTransportationCategories) {
        this.selectedTransportationCategories = selectedTransportationCategories;
    }

    public String getSelectedMigrationStatusCategories() {
        return selectedMigrationStatusCategories;
    }

    public void setSelectedMigrationStatusCategories(String selectedMigrationStatusCategories) {
        this.selectedMigrationStatusCategories = selectedMigrationStatusCategories;
    }

    public String getSelectedOccupationCategories() {
        return selectedOccupationCategories;
    }

    public void setSelectedOccupationCategories(String selectedOccupationCategories) {
        this.selectedOccupationCategories = selectedOccupationCategories;
    }

    public String getSelectedRaceCategories() {
        return selectedRaceCategories;
    }

    public void setSelectedRaceCategories(String selectedRaceCategories) {
        this.selectedRaceCategories = selectedRaceCategories;
    }
    

    public String getDimensionName() {
        return dimensionName;
    }

    public void setDimensionName(String dimensionName) {
        this.dimensionName = dimensionName;
    }

    public String getTotalDimCatCount() {
        return totalDimCatCount;
    }

    public void setTotalDimCatCount(String totalDimCatCount) {
        this.totalDimCatCount = totalDimCatCount;
    }

    public String getTmDimenJsonVal() {
        return tmDimenJsonVal;
    }

    public void setTmDimenJsonVal(String tmDimenJsonVal) {
        this.tmDimenJsonVal = tmDimenJsonVal;
    }

    public String getDimentionSessionName() {        
        return dimentionSessionName;
    }

    public void setDimentionSessionName(String dimentionSessionName) {
        this.dimentionSessionName = dimentionSessionName;
    }

    public String getSelectedTMCategories() {
        return selectedTMCategories;
    }

    public void setSelectedTMCategories(String selectedTMCategories) {
        this.selectedTMCategories = selectedTMCategories;
    }

    public String getSelectedTMDimention() {
        return selectedTMDimention;
    }

    public void setSelectedTMDimention(String selectedTMDimention) {
        this.selectedTMDimention = selectedTMDimention;
    }

    public String getNewTmDimention() {
        return newTmDimention;
    }

    public void setNewTmDimention(String newTmDimention) {
        this.newTmDimention = newTmDimention;
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

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getCountryName() {
        countryName = "USA";
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
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

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getClientNameAlreadyExist() {
        return clientNameAlreadyExist;
    }

    public void setClientNameAlreadyExist(String clientNameAlreadyExist) {
        this.clientNameAlreadyExist = clientNameAlreadyExist;
    }

    public ArrayList getStateNamesList() {
        stateNamesList = (ArrayList)tmsDAO.statesListTakeFromDB();
        return stateNamesList;
    }

    public void setStateNamesList(ArrayList stateNamesList) {
        this.stateNamesList = stateNamesList;
    }

    public ArrayList getCountryNamesList() {
        countryNamesList = (ArrayList)tmsDAO.countryNamesListTakeFromDB();
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

    public String getCampaignProducts() {
        return campaignProducts;
    }

    public void setCampaignProducts(String campaignProducts) {
        this.campaignProducts = campaignProducts;
    }

    public String getExistedCampaignProducts() {
        return existedCampaignProducts;
    }

    public void setExistedCampaignProducts(String existedCampaignProducts) {
        this.existedCampaignProducts = existedCampaignProducts;
    }

    public String getCampaignStartDate() {
        return campaignStartDate;
    }

    public void setCampaignStartDate(String campaignStartDate) {
        this.campaignStartDate = campaignStartDate;
    }

    public String getCampaignEndDate() {
        return campaignEndDate;
    }

    public void setCampaignEndDate(String campaignEndDate) {
        this.campaignEndDate = campaignEndDate;
    }

    public String getCampaignBudget() {
        return campaignBudget;
    }

    public void setCampaignBudget(String campaignBudget) {
        this.campaignBudget = campaignBudget;
    }

    public String getCampaignNameAlreadyExist() {
        return campaignNameAlreadyExist;
    }

    public void setCampaignNameAlreadyExist(String campaignNameAlreadyExist) {
        this.campaignNameAlreadyExist = campaignNameAlreadyExist;
    }

    public String getTmsNameAlreadyExist() {
        return tmsNameAlreadyExist;
    }

    public void setTmsNameAlreadyExist(String tmsNameAlreadyExist) {
        this.tmsNameAlreadyExist = tmsNameAlreadyExist;
    }

    public List getTmClientList() {
        tmClientList = tmsDAO.clientNamesListFromDB(getUserName());
        return tmClientList;
    }

    public void setTmClientList(List tmClientList) {
        this.tmClientList = tmClientList;
    }

    public String getTotalTMPeoplrsCount() {
        return totalTMPeoplrsCount;
    }

    public void setTotalTMPeoplrsCount(String totalTMPeoplrsCount) {
        this.totalTMPeoplrsCount = totalTMPeoplrsCount;
    }

    public String getDimentionCookieValue() {
        return dimentionCookieValue;
    }

    public void setDimentionCookieValue(String dimentionCookieValue) {
        this.dimentionCookieValue = dimentionCookieValue;
    }

    public int getTmId() {
        return tmId;
    }

    public void setTmId(int tmId) {
        this.tmId = tmId;
    }

    public String getCookieData() {
        return cookieData;
    }

    public void setCookieData(String cookieData) {
        this.cookieData = cookieData;
    }

    public String getTmBackMoveToDim() {
        return tmBackMoveToDim;
    }

    public void setTmBackMoveToDim(String tmBackMoveToDim) {
        this.tmBackMoveToDim = tmBackMoveToDim;
    }

    public String getReportsTMData() {
        return reportsTMData;
    }

    public void setReportsTMData(String reportsTMData) {
        this.reportsTMData = reportsTMData;
    }
    
    
    

    
    
    



}
