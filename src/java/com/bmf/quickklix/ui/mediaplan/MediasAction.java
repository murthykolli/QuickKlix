/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.mediaplan;

import com.bmf.quickklix.core.dao.MediasDAO;
import com.bmf.quickklix.ui.util.EmailSending;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class MediasAction extends ActionSupport implements ModelDriven {
    Logger log = Logger.getLogger(MediasAction.class);
    MediasBean mdBean = new MediasBean();
    MediasDAO mdDAO = new MediasDAO();

public Object getModel() {
    return mdBean;
}

    @Override
public String execute(){    
    return "success";
}

//All Medias Methods

public String allMediasRedirection(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    if(mediasCount > 0){    
    ret = "goToAllMedias";
    } else{
    ret = "goToNPRedirection";
    }
    return ret;
}

public String allMediasDataSelection(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String[] combValue = mdBean.getCombinationalName().split(",&,");
    String mediaSepName = "OuterMedia";
    session.put("MediaSeparationInSession", mediaSepName);
    session.put("MediaName", combValue[1]);
    
    if(combValue[1].equals("News papers")){
    mdBean.setNewspaperName(combValue[0]);
    ret ="goToNpContactInfo";    
    }
    else if(combValue[1].equals("Magazines")){
    mdBean.setCategoryBasedMagazine(combValue[0]);
    ret ="goToMgContactInfo";    
    }
    else if(combValue[1].equals("Television")){
    mdBean.setCombinationalName(combValue[0]);
    ret ="goToTvContactInfo";    
    }
    else if(combValue[1].equals("Radio")){
    mdBean.setCombinationalName(combValue[0]);
    ret ="goToRadioContactInfo";    
    }
    else if(combValue[1].equals("Internet_USA")){
    mdBean.setCombinationalName(combValue[0]);
    ret ="goToIntUsaContactInfo";
    }
    else if(combValue[1].equals("Internet_WW")){
    mdBean.setCombinationalName(combValue[0]);
    ret ="goToIntWwContactInfo";
    }
    else if(combValue[1].equals("Mobile Apps")){
    mdBean.setCombinationalName(combValue[0]);
    ret ="goToMaContactInfo";    
    }
    return ret;
}

public String allMediaDeletion(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String[] combValue = mdBean.getCombinationalName().split(",&,");
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    mdDAO.mediaDetailsDataDeletionInSavingTable(mdBean.getUserName(), mdBean.getMediaPlanName(), combValue[1]);
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    if(mediasCount > 0){    
    ret = "allMediaDeletion";
    } else{
    ret = "goToNPRedirection";
    }
    return ret;
}

//Newspapers Methods

public String npCityBySate(){
    Map session = ActionContext.getContext().getSession();
    session.put("npStatesInSession",mdBean.getNpSelectedStates());
    Map stateCityMap = mdDAO.npcityNamesByState(mdBean.getNpSelectedStates());
    session.put("State_City_Map",stateCityMap);
    mdBean.setNpCount(stateCityMap.size());
    return "success";
}

public String backMove(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setTelevisionName((String) session.get("TV_Name_In_Session"));
    mdBean.setMobileAppsCategory((String)session.get("MobileAppsInSession"));
    return "backmove";
}

public String mobAppBackMove(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    mdBean.setMobileAppsCategory((String)session.get("MobileAppsInSession"));
    String appCategory = (String)session.get("MobileCategoryTypeInSession"); 
    if(appCategory.equals("Alphabetical")){    
    ret = "alphabetBack";
    }
    else if(appCategory.equals("Operating System")){
    ret = "aoppSysBack";
    }
    return ret;
}
public String npNamesByCity(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setNpSelectedStates((String)session.get("npStatesInSession"));
    Map top100NpMap = mdDAO.top100NewspaperByCity(mdBean.getNpSelectedStates());
    session.put("Top100_NP_Map",top100NpMap);

    Map newspaperMap = mdDAO.newspaperByCity(mdBean.getNpSelectedCity());
    session.put("NP_City_Map",newspaperMap);
    int count = top100NpMap.size()+newspaperMap.size();
    mdBean.setNpCount(count);
    return "success";
}

public String newspapersSaving(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mpStartDate = (String)session.get("MpStartDateInSession");
    String mpEndDate = (String)session.get("MPEndDateInSession");

    String mediaName = "News papers";
    session.put("MediaName", mediaName);
    mdDAO.newsPapersDataSaving(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,mdBean.getCombinationalName(),mpStartDate,mpEndDate);
    List mediaIdsList = mdDAO.mediasNamesAndIdsTakeMediaDataSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName);
    int mediaDataCount = mediaIdsList.size();
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    if(mediaDataCount > 0){    
    HashSet<String> mediaIdsSet = new HashSet<String>(mediaIdsList);
    List mediaIdList = new ArrayList<String>(mediaIdsSet);
    String npIdsString = mediaIdList.toString();
    npIdsString = npIdsString.replace("[", "");
    npIdsString = npIdsString.replace("]", "");
    List mediaDataList = mdDAO.newsPaperNamesAndIdsTakeFromDB(npIdsString);
    String npNamesString = mediaDataList.get(0).toString();    
    npNamesString = npNamesString.replace("[", "");
    npNamesString = npNamesString.replace("]", "");
    int count = (Integer)session.get("NpMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,npNamesString,npIdsString,count);
    }
    return "success";
}

public String newspaperModification() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String mediaSepName = (String)session.get("MediaSeparationInSession");
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mediaName = (String)session.get("MediaName");
    List mediaDataList = mdDAO.newsPaperNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String npNamesString = mediaDataList.get(0).toString();
    npNamesString = npNamesString.replace("[", "");
    npNamesString = npNamesString.replace("]", "");
    int count = (Integer)session.get("NpMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(), mdBean.getMediaPlanName(), mediaName, npNamesString, mdBean.getCombinationalName(),count);
    if(mediaSepName.equals("InnerMedia")){
    ret ="goToNpModification";
    } else if(mediaSepName.equals("OuterMedia")){
    ret ="goToAllMediaModification";
    }
    return ret;
}

public String mediaDeletion(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mediaName = (String)session.get("MediaName");
    mdDAO.mediaDetailsDataDeletionInSavingTable(mdBean.getUserName(), mdBean.getMediaPlanName(), mediaName);
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    return "mediadeletion";
}

//Magazines Methods

public String magazinesSelection() {
    Map session = ActionContext.getContext().getSession();
    Map mgNamesMap = mdDAO.selectMagazinesFromDB(mdBean.getMgchoices());
    session.put("CAT_Magazines_MAP",mgNamesMap);
    return "success";
}

public String moveBack(){
    return "moveback";
}

public String mgDataSaving(){
    Map session = ActionContext.getContext().getSession();
    String mediaPlanName = (String) session.get("MediaPlanNameInSession");
    String mpStartDate = (String)session.get("MpStartDateInSession");
    String mpEndDate = (String)session.get("MPEndDateInSession");
    String mediaName = "Magazines";
    session.put("MediaName", mediaName);
    
    mdDAO.mgDataSavingInToDB(mdBean.getUserName(),mediaPlanName, mediaName,mdBean.getCombinationalName(),mpStartDate,mpEndDate);
    List mediaIdsList = mdDAO.mediasNamesAndIdsTakeMediaDataSavingTable(mdBean.getUserName(),mediaPlanName,mediaName);
    int mediaDataCount = mediaIdsList.size();
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mediaPlanName);
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    if(mediaDataCount > 0){    
    HashSet<String> mediaIdsSet = new HashSet<String>(mediaIdsList);
    List mediaIdList = new ArrayList<String>(mediaIdsSet);
    String mgIdsString = mediaIdList.toString();
    mgIdsString = mgIdsString.replace("[", "");
    mgIdsString = mgIdsString.replace("]", "");
    List mediaDataList = mdDAO.magazinesNamesAndIdsTakeFromDB(mgIdsString);
    String mgNamesString = mediaDataList.get(0).toString();
    mgNamesString = mgNamesString.replace("[", "");
    mgNamesString = mgNamesString.replace("]", "");
    int count = (Integer)session.get("mgMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mediaPlanName,mediaName,mgNamesString,mgIdsString,count);
    }
    return "success";
}

public String magazinesModification() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mediaName = (String)session.get("MediaName");
    String mediaSepName = (String)session.get("MediaSeparationInSession");
    List mediaDataList = mdDAO.magazinesNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String npNamesString = mediaDataList.get(0).toString();
    npNamesString = npNamesString.replace("[", "");
    npNamesString = npNamesString.replace("]", "");
    int count = (Integer)session.get("mgMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(), mdBean.getMediaPlanName(), mediaName, npNamesString, mdBean.getCombinationalName(),count);
    if(mediaSepName.equals("InnerMedia")){
    ret ="goToMgModification";
    } else if(mediaSepName.equals("OuterMedia")){
    ret ="goToAllMediaModification";
    }
    return ret;
}

public String mediaModification(){
    Map session = ActionContext.getContext().getSession();    
    String mediaSepName = "InnerMedia";
    session.put("MediaSeparationInSession", mediaSepName);
    return "success";
}

public String innerAndOuterMediaBack(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String mediaSepName = (String)session.get("MediaSeparationInSession");
    if(mediaSepName.equals("InnerMedia")){
    ret ="goToInnerBack";
    } else if(mediaSepName.equals("OuterMedia")){
    ret ="goToOuterBack";
    }
    return ret;
}

//Radio Methods

public String radioRedirection(){
   Map session = ActionContext.getContext().getSession();
   session.put("MediaName","Radio");
   return "success";
}

public String radioCityBySate(){
    Map session = ActionContext.getContext().getSession();
    session.put("radioStatesInSession",mdBean.getRadioSelectedStates());
    Map stateCityMap=mdDAO.radioCityNamesByState(mdBean.getRadioSelectedStates());
    session.put("Radio_City_Map",stateCityMap);
    return "success";
}

public String radioNamesByCity(){
    Map session = ActionContext.getContext().getSession();
    Map radioNamesMap = mdDAO.radioNamesByCity(mdBean.getRadioSelectedCity());
    session.put("Radio_Names_Map",radioNamesMap);
    return "success";
}

public String radioFormatsInfo(){
    Map session = ActionContext.getContext().getSession();
    List formatList = mdDAO.radioFormatsInfoFromDB();
    session.put("RadioFormatListInSession", formatList);
    return "success";
}

public String radioFormatStates(){
    Map session = ActionContext.getContext().getSession();
    session.put("RadioFormatInSession", mdBean.getRadioFormat());
    Map stateMap = mdDAO.stateNamesForRadioFormat(mdBean.getRadioFormat());
    session.put("Radio_Format_State_Map", stateMap);
    return "success";
}

public String radioFormatCityNames(){
    Map session = ActionContext.getContext().getSession();
    String radioFormat=(String)session.get("RadioFormatInSession");
    session.put("radioFormatStatesInSession", mdBean.getRadioSelectedStates());
    Map cityMap = mdDAO.cityNamesForRadioFormatByState(radioFormat,mdBean.getRadioSelectedStates());
    session.put("Radio_Format_City_Map",cityMap);
    return "success";
}

public String radioNamesForRadioFormat(){
    Map session = ActionContext.getContext().getSession();
    String radioFormat=(String)session.get("RadioFormatInSession");
    Map radioNamesMap = mdDAO.radioNamesForRadioFormatByCity(radioFormat,mdBean.getRadioSelectedCity());
    session.put("Radio_Format_Names_Map",radioNamesMap);
    return "success";
}

public String radioSaving(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mpStartDate = (String)session.get("MpStartDateInSession");
    String mpEndDate = (String)session.get("MPEndDateInSession");
    String mediaName =(String)session.get("MediaName");

    mdDAO.radioDataSaving(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,mdBean.getCombinationalName(),mpStartDate,mpEndDate);
    List mediaIdsList = mdDAO.mediasNamesAndIdsTakeMediaDataSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName);
    int mediaDataCount = mediaIdsList.size();
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    if(mediaDataCount > 0){
    HashSet<String> mediaIdsSet = new HashSet<String>(mediaIdsList);
    List mediaIdList = new ArrayList<String>(mediaIdsSet);
    String radioIdsString = mediaIdList.toString();
    radioIdsString = radioIdsString.replace("[", "");
    radioIdsString = radioIdsString.replace("]", "");
    List mediaDataList = mdDAO.radioNamesAndIdsTakeFromDB(radioIdsString);
    String radioNamesString = mediaDataList.get(0).toString();
    radioNamesString = radioNamesString.replace("[", "");
    radioNamesString = radioNamesString.replace("]", "");
    int count = (Integer)session.get("rdMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,radioNamesString,radioIdsString,count);
    }
    return "success";
}

public String radioModification() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    String mediaSepName = (String)session.get("MediaSeparationInSession");
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mediaName=(String)session.get("MediaName");
    List mediaDataList = mdDAO.radioNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String radioNamesString = mediaDataList.get(0).toString();
    radioNamesString = radioNamesString.replace("[", "");
    radioNamesString = radioNamesString.replace("]", "");
    int count = (Integer)session.get("rdMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(), mdBean.getMediaPlanName(), mediaName, radioNamesString, mdBean.getCombinationalName(),count);
    if(mediaSepName.equals("InnerMedia")){
    ret ="goToRadioModification";
    } else if(mediaSepName.equals("OuterMedia")){
    ret ="goToAllMediaModification";
    }
    return ret;
}

//TV Action methods

public String tvCityByStateSelection(){
    Map session = ActionContext.getContext().getSession();
    session.put("tvStatesInSession",mdBean.getTvSelectedStates());
    Map tvStateByCityMap = mdDAO.tvCityNamesByState(mdBean.getTvSelectedStates());
    session.put("TV_State_City_Map",tvStateByCityMap);
    mdBean.setNpCount(tvStateByCityMap.size());
    return "success";
 }

public String tvNamesByCity(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setTvSelectedStates((String)session.get("tvStatesInSession"));
    Map tvMap = mdDAO.tvNamesByCity(mdBean.getTvSelectedCity());
    session.put("TV_City_Map",tvMap);
    return "success";
}

public String televisionSaving(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mpStartDate = (String)session.get("MpStartDateInSession");
    String mpEndDate = (String)session.get("MPEndDateInSession");

    String mediaName = "Television";
    session.put("MediaName", mediaName);
    mdDAO.televisionDataSaving(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,mdBean.getCombinationalName(),mpStartDate,mpEndDate);
    List mediaIdsList = mdDAO.mediasNamesAndIdsTakeMediaDataSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName);
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    int mediaDataCount = mediaIdsList.size();
    if(mediaDataCount > 0){
    HashSet<String> mediaIdsSet = new HashSet<String>(mediaIdsList);
    List mediaIdList = new ArrayList<String>(mediaIdsSet);
    String tvIdsString = mediaIdList.toString();
    tvIdsString = tvIdsString.replace("[", "");
    tvIdsString = tvIdsString.replace("]", "");
    List mediaDataList = mdDAO.televisionNamesAndIdsTakeFromDB(tvIdsString);
    String tvNamesString = mediaDataList.get(0).toString();
    tvNamesString = tvNamesString.replace("[", "");
    tvNamesString = tvNamesString.replace("]", "");
    int count = (Integer)session.get("TvMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,tvNamesString,tvIdsString,count);
    }
    return "success";
}

public String televisionDataModification(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mediaSepName = (String)session.get("MediaSeparationInSession");
    String mediaName = "Television";
    session.put("MediaName", mediaName);
    List mediaDataList = mdDAO.televisionNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String tvNamesString = mediaDataList.get(0).toString();
    tvNamesString = tvNamesString.replace("[", "");
    tvNamesString = tvNamesString.replace("]", "");
    int count = (Integer)session.get("TvMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,tvNamesString,mdBean.getCombinationalName(),count);
    if(mediaSepName.equals("InnerMedia")){
    ret ="goToTvModification";
    } else if(mediaSepName.equals("OuterMedia")){
    ret ="goToAllMediaModification";
    }
    return ret;
}

public String tvNetworkandItsCount(){
    Map session = ActionContext.getContext().getSession();
    ArrayList tvNetAndCount =  mdDAO.tvSelectByNetworkAndItsCount();
    session.put("TVNetworkAndCountInSession", tvNetAndCount);
    return "success";
}

public String tvNetworkSelection(){
    Map session = ActionContext.getContext().getSession();
    session.put("TV_Name_In_Session", mdBean.getTelevisionName());
    return "success";
}

public String tvNetworkByStateSelection(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setTelevisionName((String) session.get("TV_Name_In_Session"));
    session.put("tvNetworkStatesInSession",mdBean.getTvSelectByStatesInNetwork());
    HashMap<String,ArrayList> tvStateByCityMap = mdDAO.stateByCityNamesForTvNetwork(mdBean.getTvSelectByStatesInNetwork(),mdBean.getTelevisionName());
    session.put("TV_State_City_Map", tvStateByCityMap);
    return "success";
}

public String tvNetworkNamesByCity(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setTelevisionName((String) session.get("TV_Name_In_Session"));
    Map tvMap=mdDAO.tvNetworkNamesByCity(mdBean.getTvNetworkSelectByCity(),mdBean.getTelevisionName());
    session.put("TV_City_Map",tvMap);
    return "success";
}

//Internet Methods

public String internetWorldWideRedirection(){
    Map session = ActionContext.getContext().getSession();
    session.put("MediaName","Internet_WW");
    return "success";
}

public String internetUSARedirection(){
    Map session = ActionContext.getContext().getSession();
    session.put("MediaName","Internet_USA");
    return "success";
}

public String internetCategoryAndCountInfo(){
    Map session = ActionContext.getContext().getSession();
    List categoryList = mdDAO.internetCategoryInfoFromDB();
    session.put("InternetCategoryListInSession", categoryList);
    return "success";
}

public String websiteNamesByCategory(){
    Map session = ActionContext.getContext().getSession();
    Map websitesMap=mdDAO.websiteNamesByInternetCategory(mdBean.getInternetCategory());
    session.put("Internet_WebsiteNames_Map",websitesMap);
    return "success";
}

public String internetUSSaving(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mpStartDate = (String)session.get("MpStartDateInSession");
    String mpEndDate = (String)session.get("MPEndDateInSession");
    String mediaName =(String)session.get("MediaName");

    List mediaInfoList = mdDAO.internetUSNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String siteNameString = mediaInfoList.get(0).toString();
    siteNameString = siteNameString.replace("[", "");
    siteNameString = siteNameString.replace("]", "");
    int count = (Integer)session.get("InternetMediasCount");
    mdDAO.internetDataSaving(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,siteNameString,mdBean.getCombinationalName(),mpStartDate,mpEndDate,count);

    List mediaIdsList = mdDAO.mediasNamesAndIdsTakeMediaDataSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName);
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    int mediaDataCount = mediaIdsList.size();
    if(mediaDataCount > 0){
    HashSet<String> mediaIdsSet = new HashSet<String>(mediaIdsList);
    List mediaIdList = new ArrayList<String>(mediaIdsSet);
    String websiteIdsString = mediaIdList.toString();
    websiteIdsString = websiteIdsString.replace("[", "");
    websiteIdsString = websiteIdsString.replace("]", "");
    List mediaDataList = mdDAO.internetUSNamesAndIdsTakeFromDB(websiteIdsString);
    String websiteNamesString = mediaDataList.get(0).toString();
    websiteNamesString = websiteNamesString.replace("[", "");
    websiteNamesString = websiteNamesString.replace("]", "");
    int usaCount = (Integer)session.get("InternetMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,websiteNamesString,websiteIdsString,usaCount);
    }
    return "success";
}

public String internetWorldWideSaving(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mpStartDate = (String)session.get("MpStartDateInSession");
    String mpEndDate = (String)session.get("MPEndDateInSession");
    String mediaName =(String)session.get("MediaName");

    List mediaInfoList = mdDAO.internetWorldWideNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String siteNameString = mediaInfoList.get(0).toString();
    siteNameString = siteNameString.replace("[", "");
    siteNameString = siteNameString.replace("]", "");
    int count = (Integer)session.get("InternetMediasCount");
    mdDAO.internetDataSaving(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,siteNameString,mdBean.getCombinationalName(),mpStartDate,mpEndDate,count);

    List mediaIdsList = mdDAO.mediasNamesAndIdsTakeMediaDataSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName);
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    int mediaDataCount = mediaIdsList.size();
    if(mediaDataCount > 0){
    HashSet<String> mediaIdsSet = new HashSet<String>(mediaIdsList);
    List mediaIdList = new ArrayList<String>(mediaIdsSet);
    String websiteIdsString = mediaIdList.toString();
    websiteIdsString = websiteIdsString.replace("[", "");
    websiteIdsString = websiteIdsString.replace("]", "");
    List mediaDataList = mdDAO.internetWorldWideNamesAndIdsTakeFromDB(websiteIdsString);
    String websiteNamesString = mediaDataList.get(0).toString();
    websiteNamesString = websiteNamesString.replace("[", "");
    websiteNamesString = websiteNamesString.replace("]", "");
    int wwCount = (Integer)session.get("InternetMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,websiteNamesString,websiteIdsString,wwCount);
    }
    return "success";
}

public String internetUSModification() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mediaSepName = (String)session.get("MediaSeparationInSession");
    String mediaName=(String)session.get("MediaName");
    List mediaDataList = mdDAO.internetUSNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String websiteNamesString = mediaDataList.get(0).toString();
    websiteNamesString = websiteNamesString.replace("[", "");
    websiteNamesString = websiteNamesString.replace("]", "");
    int count = (Integer)session.get("InternetMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(), mdBean.getMediaPlanName(), mediaName, websiteNamesString, mdBean.getCombinationalName(),count);
    if(mediaSepName.equals("InnerMedia")){
    ret ="goToIntUsaModification";
    } else if(mediaSepName.equals("OuterMedia")){
    ret ="goToAllMediaModification";
    }
    return ret;
}

public String internetWorldWideModification() {
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mediaSepName = (String)session.get("MediaSeparationInSession");
    String mediaName=(String)session.get("MediaName");
    List mediaDataList = mdDAO.internetWorldWideNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String websiteNamesString = mediaDataList.get(0).toString();
    websiteNamesString = websiteNamesString.replace("[", "");
    websiteNamesString = websiteNamesString.replace("]", "");
    int count = (Integer)session.get("InternetMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(), mdBean.getMediaPlanName(), mediaName, websiteNamesString, mdBean.getCombinationalName(),count);
    if(mediaSepName.equals("InnerMedia")){
    ret ="goToIntWwModification";
    } else if(mediaSepName.equals("OuterMedia")){
    ret ="goToAllMediaModification";
    }
    return ret;
}

//Mobile Apps Action methods

public String mobileAppsCategoryAndItsCount(){
    Map session = ActionContext.getContext().getSession();
    ArrayList mAppAndCount =  mdDAO.mobileAppsAndItsCount();
    session.put("MobileAppAndItsCountInSession", mAppAndCount);
    return "success";
}

public String mobileAppsSelectedCategory(){
    Map session = ActionContext.getContext().getSession();
    session.put("MobileAppsInSession", mdBean.getMobileAppsCategory());
    session.put("MobileCategoryTypeInSession", "Alphabetical");
    Map tvMap=mdDAO.selectedByMobileAppsCategory( mdBean.getMobileAppsCategory());
    session.put("Mobile_Category_In_Session", tvMap);
    return "success";
}

public String mobileAppsPageredirection(){
    String ret="success";
    Map session = ActionContext.getContext().getSession();
    mdBean.setMobileAppsCategory((String)session.get("MobileAppsInSession"));
    session.put("MobileCategoryTypeInSession", mdBean.getAppCategoryType());
    if(mdBean.getAppCategoryType().equals("Alphabetical")){
    HashMap<String,ArrayList> appsMap=mdDAO.selectedByMobileAppsCategory(mdBean.getMobileAppsCategory());
    session.put("Mobile_Category_In_Session", appsMap);
    ret="alphabetical";
    }
    else if(mdBean.getAppCategoryType().equals("Operating System")){
    HashMap<String,ArrayList> osAppsmap=mdDAO.selectedByMobileAppsOSCategory(mdBean.getMobileAppsCategory());
    session.put("Mobile_Category_OS_Session", osAppsmap);
    ret="operating";
    }
    return ret;
    }

public String mobileAppsSaving(){
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mpStartDate = (String)session.get("MpStartDateInSession");
    String mpEndDate = (String)session.get("MPEndDateInSession");
    String mediaName = "Mobile Apps";
    session.put("MediaName", mediaName);
    mdDAO.mobileAppsDataSaving(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,mdBean.getCombinationalName(),mpStartDate,mpEndDate);
    List mediaIdsList = mdDAO.mediasNamesAndIdsTakeMediaDataSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName);
    List allMediasCount = mdDAO.allMediasDataTakeFromDBToJsp(mdBean.getUserName(),mdBean.getMediaPlanName());
    int mediasCount = allMediasCount.size();
    session.put("AllMediaCount", mediasCount);
    int mediaDataCount = mediaIdsList.size();
    if(mediaDataCount > 0){
    HashSet<String> mediaIdsSet = new HashSet<String>(mediaIdsList);
    List mediaIdList = new ArrayList<String>(mediaIdsSet);
    String maIdsString = mediaIdList.toString();
    maIdsString = maIdsString.replace("[", "");
    maIdsString = maIdsString.replace("]", "");
    List mediaDataList = mdDAO.mobileAppsNamesAndIdsTakeFromDB(maIdsString);
    String maNamesString = mediaDataList.get(0).toString();
    maNamesString = maNamesString.replace("[", "");
    maNamesString = maNamesString.replace("]", "");
    int count = (Integer)session.get("MAppMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,maNamesString,maIdsString,count);
    }
    return "success";
}

public String  mobileAppsManagement(){
    Map session = ActionContext.getContext().getSession();
    String mediaSepName = "InnerMedia";
    session.put("MediaSeparationInSession", mediaSepName);
    mdBean.setAppCategoryType((String)session.get("MobileCategoryTypeInSession"));
    return "success";
}

public String mobileAppsModification(){
    String ret = "success";
    Map session = ActionContext.getContext().getSession();
    mdBean.setMediaPlanName((String)session.get("MediaPlanNameInSession"));
    String mediaSepName = (String)session.get("MediaSeparationInSession");
    String mediaName = "Mobile Apps";
    session.put("MediaName", mediaName);
    List mediaDataList = mdDAO.mobileAppsNamesAndIdsTakeFromDB(mdBean.getCombinationalName());
    String maNamesString = mediaDataList.get(0).toString();
    maNamesString = maNamesString.replace("[", "");
    maNamesString = maNamesString.replace("]", "");
    int count = (Integer)session.get("MAppMediasCount");
    mdDAO.mediaDetailsDataUpdateInSavingTable(mdBean.getUserName(),mdBean.getMediaPlanName(),mediaName,maNamesString,mdBean.getCombinationalName(),count);
    if(mediaSepName.equals("InnerMedia")){
    ret ="goToMaModification";
    } else if(mediaSepName.equals("OuterMedia")){
    ret ="goToAllMediaModification";
    }
    return ret;
}






}
