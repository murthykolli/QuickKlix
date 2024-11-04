/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.targetmarket;

import com.bmf.quickklix.core.dao.TargetMarketStatesDAO;
import com.bmf.quickklix.ui.util.EmailSending;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class TargetMarketStatesAction extends ActionSupport implements ModelDriven {
    Logger log = Logger.getLogger(TargetMarketStatesAction.class);
    TargetMarketStatesBean tmsBean = new TargetMarketStatesBean();
    TargetMarketStatesDAO tmsDAO = new TargetMarketStatesDAO();

public Object getModel() {
    return tmsBean;
}

    @Override
public String execute(){
    return "success";
}

public String tmMapCreation(){
    Map session = ActionContext.getContext().getSession();
    session.put("DimenCookieValueInSession", null);
    session.put("DimenCookieValueInSession", null);
    session.put("DimentionCookieListInSession", "No Category Selected");
    session.put("ClAndCPNamesInSession", "TargetMarketRed");
    return "success";
}

public String mpTmMapCreation(){
    Map session = ActionContext.getContext().getSession();
    session.put("ClAndCPNamesInSession", "MediaPlanTMRed");    
    return "success";
}

public String tmRedirection(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    ret = "goToTmHome";
    return ret;
}

public String tmStatesRedirection(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    List tmList = (ArrayList)tmsDAO.targerMarketDetailsTakeFromDB(tmsBean.getUserName());
    int tmCount = tmList.size();

    if(tmCount > 0){
    ret = "goToTmStateSaving";
    }else{
    ret = "goToTmStateCreation";
    }
    return ret;
}

public String moveToBack(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession(); 
    session.put("DimenCookieValueInSession", null);    
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    tmsBean.setTmBackMoveToDim("BackMove");
    if(dimRedirection.equals("NewTM")){
    ret = "moveBackToNew";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "moveBackToModify";    
    }
    return ret;
}

public String tmNoTotalValueBack(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession(); 
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "moveBackToNew";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "moveBackToModify";    
    }
    return ret;
}

public String tmStatesDataToDimension(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();    
    session.put("TMStateNamesInSession",tmsBean.getTmSelectedStates());
    int stateCount = tmsBean.getTmSelectedStates().length();
    session.put("StatesCountInSession", stateCount);    
    List stateIdsList = tmsDAO.stateIdsTakeFromDBUsingName(tmsBean.getTmSelectedStates());       
    String stateIdsString = stateIdsList.toString();
    stateIdsString = stateIdsString.replace("[", "");
    stateIdsString = stateIdsString.replace("]", "");
    session.put("TMStateIdsInSession",stateIdsString);
    
    List selStAndCountList = tmsDAO.tmSelectedStatesListAndCountTakeFromDB(tmsBean.getTmSelectedStates());
    String selStAndCountString = selStAndCountList.toString();
    selStAndCountString = selStAndCountString.replace("[", "");
    selStAndCountString = selStAndCountString.replace("]", "");
    selStAndCountString = selStAndCountString.replaceAll(", ", "; ");
    session.put("SelStatesAndCountInSession",selStAndCountString);
    tmsBean.setNewTmDimention("NewTmDimentionCreation");
    session.put("TmDimentionRedirection", "NewTM");
    ret = "goToDimension";
    return ret;
}

//TM Dimensions Actions Methods 

public String tmAbilityToSpeakEnglishCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Ability_To_Speak_English_Map",pumaCodesAndCount);    
    ret = "goToTmSpeakEnglishCreation";
    return ret;
}

public String abilityDimensionSaving(){
    String ret = "success"; 
    Map session = ActionContext.getContext().getSession();    
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession")); 
    String pumaIdsString = tmsBean.getSelectedAbilityCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString); 
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmAgeCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Age_Map",pumaCodesAndCount);
    ret = "goToTmAgeCreation";
    return ret;
}

public String ageDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedAgeCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);    
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmAncestryCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Ancestry_Map",pumaCodesAndCount);
    ret = "goToTmAncestryCreation";
    return ret;
}

public String ancestryDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedAncestryCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);     
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmCitizenshipCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Citizenship_Map",pumaCodesAndCount);
    ret = "goToTmCitizenshipCreation";
    return ret;
}

public String citizenshipDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedCitizenshipCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);       
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmClassOfWorkerCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("ClassOfWorker_Map",pumaCodesAndCount);
    ret = "goToTmClassOfWorkerCreation";
    return ret;
}

public String classOfWorkerDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedClassOfWorkerCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);       
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmEducationCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Education_Map",pumaCodesAndCount);
    ret = "goToTmEducationCreation";
    return ret;
}

public String educationDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedEducationCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);   
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmGenderCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Gender_Map",pumaCodesAndCount);
    ret = "goToTmGenderCreation";
    return ret;
}

public String genderDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedGenderCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);   
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmIncomeCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Income_Map",pumaCodesAndCount);
    ret = "goToTmIncomeCreation";
    return ret;
}

public String incomeDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedIncomeCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);    
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmIndustryCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Industry_Map",pumaCodesAndCount);
    ret = "goToTmIndustryCreation";
    return ret;
}

public String industryDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedIndustryCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);   
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmLanguageSpokenAtHomeCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Language_Map",pumaCodesAndCount);
    ret = "goToTmLanguageCreation";
    return ret;
}

public String languageDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedLanguageCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);    
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmMaritalStatusCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("MaritalStatus_Map",pumaCodesAndCount);
    ret = "goToTmMaritalStatusCreation";
    return ret;
}

public String maritalStatusDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedMaritalStatusCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);   
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmMeansOfTransportationCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Transportation_Map",pumaCodesAndCount);
    ret = "goToTransportationCreation";
    return ret;
}

public String transportationDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedTransportationCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);    
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmMigrationStatusCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("MigrationStatus_Map",pumaCodesAndCount);
    ret = "goToTmMigrationStatusCreation";
    return ret;
}

public String migrationDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedMigrationStatusCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);    
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmOccupationCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Occupation_Map",pumaCodesAndCount);
    ret = "goToTmOccupationCreation";
    return ret;
}

public String occupationDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedOccupationCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);    
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

public String tmRaceCreation(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    Map pumaCodesAndCount = (Map)session.get("DimenAndCountInSession");
    session.put("Race_Map",pumaCodesAndCount);
    ret = "goToTmRaceCreation";
    return ret;
}

public String raceDimensionSaving(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    tmsBean.setDimensionName((String)session.get("DimensionNameInSession"));
    
    String pumaIdsString = tmsBean.getSelectedRaceCategories();
    pumaIdsString = "&"+pumaIdsString;
    pumaIdsString = pumaIdsString.replace(", ", "&");
    tmsBean.setSelectedTMCategories(pumaIdsString);    
    
    String dimRedirection = (String)session.get("TmDimentionRedirection");
    if(dimRedirection.equals("NewTM")){
    ret = "goToTmDimensionSaving";
    }
    else if(dimRedirection.equals("ModifyTM")){
    ret = "goToTmDimensionModification";    
    }
    return ret;
}

//Target Market saving methods

public String targetMarketCreation(){    
    Map session = ActionContext.getContext().getSession();
    String ret = "success";     
    session.put("TMPeoplrsCountInSession", tmsBean.getTotalTMPeoplrsCount());
    session.put("ReportsTMDataInSession", tmsBean.getReportsTMData());    
    log.info("YYYYYYYYYY "+tmsBean.getReportsTMData());
    
    String dimenCookieValu = (String)session.get("DimenCookieValueInSession");  
    if(dimenCookieValu != null){
    dimenCookieValu = dimenCookieValu.replace("{", "");
    dimenCookieValu = dimenCookieValu.replace("}", "");
    String[] dimCookieValue = dimenCookieValu.split("],");
    String cookieTotalVal = null;
    ArrayList<String> cookieVal = new ArrayList<String>();
    for(int i=0;i<dimCookieValue.length;i++){
        String[] dimCookieValueString = dimCookieValue[i].split(":");
     cookieTotalVal = dimCookieValueString[0];
     cookieTotalVal = cookieTotalVal.replace("\"", "");     
     cookieVal.add(cookieTotalVal);
    }   
    String dimentionList = cookieVal.toString();
    dimentionList = dimentionList.replace("[", "");
    dimentionList = dimentionList.replace("]", "");  
    session.put("DimentionCookieListInSession", dimentionList);
    }
    String tmredName = (String)session.get("ClAndCPNamesInSession");
    if(tmredName.equals("TargetMarketRed")){
    ret = "goToTmCreation";
    } else if(tmredName.equals("MediaPlanTMRed")){
    String mpClName = (String)session.get("mpClientNameInSession");
    String mpCpName = (String)session.get("mpCampaignNameInSession");
    tmsBean.setTmsClientName(mpClName);
    tmsBean.setTmsCampaignName(mpCpName);
    ret = "goToTmCreation";
    }
    return ret;
}

public String targetMarketSaving(){    
    Map session = ActionContext.getContext().getSession();
    String ret = "success"; 
    String dimenCookieList = null;
    String dimenCookieValue = (String)session.get("DimenCookieValueInSession");
    String dimenCookieListString = (String)session.get("DimentionCookieListInSession");
    String cookieData = (String)session.get("CookieDataInSession");
    String reportsTMData = (String)session.get("ReportsTMDataInSession");
    log.info("IIIIIIIII "+reportsTMData);
    
    String stateNames = (String)session.get("TMStateNamesInSession");
    String tmPeoplrsCoun = (String)session.get("TMPeoplrsCountInSession");
    if(dimenCookieListString != null){
    dimenCookieList = dimenCookieListString;    
    }else{
    dimenCookieList = "No Category Selected";
    }
    int res = tmsDAO.targetMarketDetailsSavingInToDB(tmsBean.getUserName(),tmsBean.getTmsClientName(),tmsBean.getTmsCampaignName(),tmsBean.getTmsName(),stateNames,tmPeoplrsCoun,dimenCookieValue,dimenCookieList,cookieData,reportsTMData);
    if(res == 1){
    session.put("DimenCookieValueInSession", null);
    session.put("DimentionCookieListInSession", "No Category Selected");    
    
    String tmredName = (String)session.get("ClAndCPNamesInSession");
    if(tmredName.equals("TargetMarketRed")){
    ret = "goToTmSaving";
    } else if(tmredName.equals("MediaPlanTMRed")){
    session.put("mpClientNameInSession", tmsBean.getTmsClientName());
    session.put("mpCampaignNameInSession", tmsBean.getTmsCampaignName());
    session.put("mpTMNameInSession", tmsBean.getTmsName());
    ret = "goToMpCreation";
    }    
    }
    else if(res == 111){
    tmsBean.setTmsNameAlreadyExist("AlreadyExisted");
    ret = "input";
    }    
    return ret;
}

public String tmDimentionModification(){    
    Map session = ActionContext.getContext().getSession();
    String ret = "success";     
    String combNames[] = tmsBean.getCombinationalName().split(",&, ");
    int tmId = Integer.parseInt(combNames[6]);
    String dimentionCookieValue = tmsDAO.tmDimentionCookieValueTakeFromDB(tmsBean.getUserName(),tmId);
    String cookieData = tmsDAO.tmCookieDataTakeFromDB(tmsBean.getUserName(),tmId);
    if(dimentionCookieValue != null) {
    tmsBean.setDimentionCookieValue(dimentionCookieValue);
    } else{
    tmsBean.setDimentionCookieValue("No Category Selected");    
    }
    tmsBean.setCookieData(cookieData);
    session.put("DimenCookieValueInSession", dimentionCookieValue);    
    
    session.put("tmClientNameInSession", combNames[0]);
    session.put("tmCampaignNameInSession", combNames[1]);
    session.put("tmTMNameInSession", combNames[2]);
    session.put("DimensionNameInSession", combNames[3]);
    session.put("TMStateNamesInSession", combNames[4]);
    session.put("TMIdInSession", combNames[6]);    
    
    List stateIdsList = tmsDAO.stateIdsTakeFromDBUsingName(combNames[4]);       
    String stateIdsString = stateIdsList.toString();
    stateIdsString = stateIdsString.replace("[", "");
    stateIdsString = stateIdsString.replace("]", "");
    session.put("TMStateIdsInSession",stateIdsString);
    
    List selStAndCountList = tmsDAO.tmSelectedStatesListAndCountTakeFromDB(combNames[4]);
    String selStAndCountString = selStAndCountList.toString();
    selStAndCountString = selStAndCountString.replace("[", "");
    selStAndCountString = selStAndCountString.replace("]", "");
    selStAndCountString = selStAndCountString.replaceAll(", ", "; ");
    session.put("SelStatesAndCountInSession",selStAndCountString);
    tmsBean.setNewTmDimention("NewTmDimentionCreation");
    session.put("TmDimentionRedirection", "ModifyTM");
    
    ret = "goToTmModification";
    return ret;
}

public String tmClientDetailsSaving(){
    Map session = ActionContext.getContext().getSession();    
    String ret="success";
    session.put("tmClientNameInSession", tmsBean.getTmsClientName());
    int res = tmsDAO.tmClientDetailsSavingToDB(tmsBean.getUserName(),tmsBean.getTmsClientName(),tmsBean.getClientAddress1(),tmsBean.getClientAddress2(),tmsBean.getCityName(),tmsBean.getStateName(),tmsBean.getCountryName(),tmsBean.getZipCode(),tmsBean.getContactPerson(),tmsBean.getContactPhoneNo(),tmsBean.getContactEmail());
    if(res == 1){    
    ret = "goToTmCreation";    
    } else if(res == 111){
      tmsBean.setClientNameAlreadyExist("AlreadyExist");
      ret = "input";
    }
    return ret;
}

public String tmCampRedirection(){
    Map session = ActionContext.getContext().getSession();
    String tmClientName = (String)session.get("tmClientNameInSession");
    if(tmClientName != null){
    tmsBean.setTmsClientName(tmClientName);
    }
    return "success";
}

public String tmCampaignDataSaving(){
    String ret = "success";    
    Map session = ActionContext.getContext().getSession();
    int res = tmsDAO.tmCampaignFormSaving(tmsBean.getUserName(),tmsBean.getTmsClientName(),tmsBean.getTmsCampaignName(),tmsBean.getMissionObjective(),tmsBean.getExistedCampaignProducts(),tmsBean.getCampaignStartDate(),tmsBean.getCampaignEndDate(),tmsBean.getCampaignBudget());
    if(res == 1){    
    ret = "goToTmCreation";
    } else if(res == 111){
        tmsBean.setCampaignNameAlreadyExist("AlreadyExisted");
        ret = "input";
    }
    return ret;
}

public String targetMarketModification(){    
    Map session = ActionContext.getContext().getSession();
    String ret = "success";     
    session.put("TMPeoplrsCountInSession", tmsBean.getTotalTMPeoplrsCount());  
    session.put("ReportsTMDataInSession", tmsBean.getReportsTMData());    
    log.info("TM MODDDDDDDDD "+tmsBean.getReportsTMData());
    
    String dimenCookieValu = (String)session.get("DimenCookieValueInSession");    
    if(dimenCookieValu != null){
    dimenCookieValu = dimenCookieValu.replace("{", "");
    dimenCookieValu = dimenCookieValu.replace("}", "");
    String[] dimCookieValue = dimenCookieValu.split("],");
    String cookieTotalVal = null;
    ArrayList<String> cookieVal = new ArrayList<String>();
    for(int i=0;i<dimCookieValue.length;i++){
        String[] dimCookieValueString = dimCookieValue[i].split(":");
     cookieTotalVal = dimCookieValueString[0];
     cookieTotalVal = cookieTotalVal.replace("\"", "");     
     cookieVal.add(cookieTotalVal);
    }   
    String dimentionList = cookieVal.toString();
    dimentionList = dimentionList.replace("[", "");
    dimentionList = dimentionList.replace("]", "");  
    session.put("DimentionCookieListInSession", dimentionList);
    }
    
    String tmClName = (String)session.get("tmClientNameInSession");
    String tmCpName = (String)session.get("tmCampaignNameInSession");
    String tmName = (String)session.get("tmTMNameInSession");
    tmsBean.setTmsClientName(tmClName);
    tmsBean.setTmsCampaignName(tmCpName);
    tmsBean.setTmsName(tmName);
    ret = "goToTmModification";
    return ret;
}

public String targetMarketUpdation(){    
    Map session = ActionContext.getContext().getSession();
    String ret = "success"; 
    String dimenCookieList = null;
    String dimenCookieValue = (String)session.get("DimenCookieValueInSession");
    String dimenCookieListString = (String)session.get("DimentionCookieListInSession");
    String cookieData = (String)session.get("CookieDataInSession");
    String reportsTMData = (String)session.get("ReportsTMDataInSession");
    log.info("UPpppppppppp IIIIIIIII "+reportsTMData);
    
    String stateNames = (String)session.get("TMStateNamesInSession");
    String tmPeoplrsCoun = (String)session.get("TMPeoplrsCountInSession");
    String tmOldName = (String)session.get("tmTMNameInSession");
    int count = dimenCookieListString.length();
    if(dimenCookieListString != null && count > 0){
    dimenCookieList = dimenCookieListString;    
    }else{
    dimenCookieList = "No Category Selected";
    }
    int res = tmsDAO.targetMarketDetailsUpdatingInToDB(tmsBean.getUserName(),tmsBean.getTmsClientName(),tmsBean.getTmsCampaignName(),tmsBean.getTmsName(),stateNames,tmPeoplrsCoun,dimenCookieValue,dimenCookieList,cookieData,tmOldName,reportsTMData);
    if(res == 1){
    session.put("DimenCookieValueInSession", null);
    session.put("DimentionCookieListInSession", "No Category Selected");
    ret = "goToTmUpdating";
    }
    else if(res == 111){
    tmsBean.setTmsNameAlreadyExist("AlreadyExisted");
    ret = "input";
    } 
    
    return ret;
}

public String deleteTargetMarket(){    
    Map session = ActionContext.getContext().getSession();
    String ret = "success"; 
    String combNames[] = tmsBean.getCombinationalName().split(",&, ");
    int tmId = Integer.parseInt(combNames[6]);
    String mpName = tmsDAO.mpNameTakeFromDB(tmsBean.getUserName(),tmId);
    if(mpName != null){
    tmsBean.setTmsNameAlreadyExist("MPExisted");
    }else{
    tmsDAO.deleteTargetMarketsInDB(tmsBean.getUserName(),tmId); 
    }
    List tmList = (ArrayList)tmsDAO.targerMarketDetailsTakeFromDB(tmsBean.getUserName());
    int tmCount = tmList.size();

    if(tmCount > 0){
    ret = "goToTmStateSaving";
    }else{
    ret = "goToTmStateCreation";
    }    
    return ret;
}

public String newTargetMarketCreation(){    
    String ret = "success"; 
    Map session = ActionContext.getContext().getSession();
    session.put("DimenCookieValueInSession", null);
    session.put("DimenCookieValueInSession", null);
    session.put("DimentionCookieListInSession", "No Category Selected");
    session.put("ClAndCPNamesInSession", "TargetMarketRed");
    ret = "goToTmStateCreation";   
    return ret;
}


}