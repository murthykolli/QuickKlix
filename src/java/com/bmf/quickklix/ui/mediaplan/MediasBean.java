/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.mediaplan;

import com.bmf.quickklix.core.dao.MediasDAO;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class MediasBean {
    Logger log = Logger.getLogger(MediasBean.class);
    MediasDAO mdDAO = new MediasDAO();

    private String userName; private String userFirstName; private String mediaMemberRequestType; private String allMediaIds;
    private int allMediaRedirection;
    private int mediasCount;
    private ArrayList allMediasListTakeFromDB;

//Newspapers Bean variables

    private String npSelectedStates; private String npSelectedCity; private String newspaperName; private String npCirculation; private String npCity; private String npState;
    private String npWebsite; private String mediaType; private String npPhoneNumber; private String npFaxNumber; private String npEmail; private String npContactPerson; private String npAdsNewspaper;
    private String mediaPlanName; private String mediaPlanStartDate; private String mediaPlanEndDate; private String createdDate; private String updatedDate; private String npMediaIds; private String combinationalName;
    private int npCount;private int npAdvertisecount; private int mediaNamesCount; private int mediaTypeId;
    private ArrayList npMapCount; private ArrayList npListTakeFromDB; private ArrayList newspapersModifyContactInfo; private ArrayList newspapersContactInfo; private ArrayList newspapersTop100ContactInfo;

//Magazines Bean variables

    private String mgchoices; private String categoryBasedMagazine; private String magazineName; private String circulationMg; private String mgContactNo; private String mgFax; private String mgFrequency;
    private String mgEditor; private String mgEmail;private String mgCategory; private String mgWebsite; private String selectedCategory; private String mgStartDate; private String mgEndDate; private String mgMediaIds;
    private List mgManageMedia; private List selectedMagazineContactInfo; private List top100MagazineContactInfo;
    private int mgCount; private int magazineId; private int magazineCount;

//Radio Bean Variables

    private String radioSelectedStates; private String radioSelectedCity; private String radioStationName; private String radioBand; private String radioCity;
    private String radioState; private String radioContactPerson; private String radioRank; private String radioFormat; private String radioDisplayFormat;
    private String radioPhoneNumber; private String radioFaxNumber; private String radioWebsite; private String radioEmail; private int radioCount;
    private ArrayList radioMapCount; private ArrayList radioContactInfo; private ArrayList radioListTakeFromDB;

//TV Bean Variables

    private List tvMapCount; private List netWorkMapCount; private String tvSelectedStates; private String tvSelectedCity; private String televisionName; private List tvContactInfo;
    private String tvChannelName; private String tvCity; private String tvState; private String tvContactPerson; private String tvPhoneNumber; private String tvRank; private String tvNetwork;
    private String tvFaxNumber; private String tvEmail; private List tvDataListTakeFromDB; private int tvCount;
    private String tvSelectByStatesInNetwork; private String tvNetworkSelectByCity; private String MediaId;

//Internet Bean Variables

    private String websiteName; private String internetCategory; private String internetRank; private String internetReach; private String internetVisitors;
    private String internetPageViews; private String internetPhoneNo; private String internetFaxNo; private String internetWebsite; private String internetEmail; private int internetCount;
    private ArrayList internetUSByRankContactInfo; private ArrayList internetUSContactInfo; private ArrayList internetSitesListTakeFromDB; private ArrayList worldWideInternetContactInfo; private ArrayList worldWideInternetModifyContactInfo;

// Mobile Apps Bean

    private String mobileAppsCategory;private String categoryType;private String appCategoryType;
    private String mobileAppsName;private String operatingSystemName;private String typeOfMobileApp;private String mobileAppsVersion;private String mobileAppsDeveloper;
    private String mobileAppsDownload;private String mobileAppsEmail;private String mobileAppsPhoneNo;private String mobileAppsFaxNo;;private String mobileAppsId;private String mAppchoices;
    private List mobileAppsContactInfoList;private List mobileAppDataListTakeFromDB;

    public String getUserName() {
        Map session = ActionContext.getContext().getSession();
        userName = (String)session.get("userName");
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserFirstName() {
        userFirstName = mdDAO.userFirstNameTakeFromDB(getUserName());
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

//Newspapers setter and getter methods

    public ArrayList getNpMapCount() {
        npMapCount = (ArrayList)mdDAO.mouseOverValuesForNP();
        return npMapCount;
    }

    public void setNpMapCount(ArrayList npMapCount) {
        this.npMapCount = npMapCount;
    }

    public String getNpSelectedStates() {
        return npSelectedStates;
    }

    public void setNpSelectedStates(String npSelectedStates) {
        this.npSelectedStates = npSelectedStates;
    }

    public String getNpSelectedCity() {
        return npSelectedCity;
    }

    public void setNpSelectedCity(String npSelectedCity) {
        this.npSelectedCity = npSelectedCity;
    }

    public String getNewspaperName() {
        return newspaperName;
    }

    public void setNewspaperName(String newspaperName) {
        this.newspaperName = newspaperName;
    }

    public int getNpCount() {
        return npCount;
    }

    public void setNpCount(int npCount) {
        this.npCount = npCount;
    }

    public int getNpAdvertisecount() {
        return npAdvertisecount;
    }

    public void setNpAdvertisecount(int npAdvertisecount) {
        this.npAdvertisecount = npAdvertisecount;
    }

    public String getNpCirculation() {
        return npCirculation;
    }

    public void setNpCirculation(String npCirculation) {
        this.npCirculation = npCirculation;
    }

    public String getNpCity() {
        return npCity;
    }

    public void setNpCity(String npCity) {
        this.npCity = npCity;
    }

    public String getNpState() {
        return npState;
    }

    public void setNpState(String npState) {
        this.npState = npState;
    }

    public String getNpWebsite() {
        return npWebsite;
    }

    public void setNpWebsite(String npWebsite) {
        this.npWebsite = npWebsite;
    }

    public String getNpPhoneNumber() {
        return npPhoneNumber;
    }

    public void setNpPhoneNumber(String npPhoneNumber) {
        this.npPhoneNumber = npPhoneNumber;
    }

    public String getNpFaxNumber() {
        return npFaxNumber;
    }

    public void setNpFaxNumber(String npFaxNumber) {
        this.npFaxNumber = npFaxNumber;
    }

    public String getNpEmail() {
        return npEmail;
    }

    public void setNpEmail(String npEmail) {
        this.npEmail = npEmail;
    }

    public String getNpContactPerson() {
        return npContactPerson;
    }

    public void setNpContactPerson(String npContactPerson) {
        this.npContactPerson = npContactPerson;
    }

    public String getNpAdsNewspaper() {
        return npAdsNewspaper;
    }

    public void setNpAdsNewspaper(String npAdsNewspaper) {
        this.npAdsNewspaper = npAdsNewspaper;
    }

    public ArrayList getNewspapersContactInfo() {        
        newspapersContactInfo = mdDAO.newspaperContactInfo(getNewspaperName());
        setNpCount(newspapersContactInfo.size());
        return newspapersContactInfo;
    }

    public void setNewspapersContactInfo(ArrayList newspapersContactInfo) {
        this.newspapersContactInfo = newspapersContactInfo;
    }

    public String getMediaPlanName() {
        return mediaPlanName;
    }

    public void setMediaPlanName(String mediaPlanName) {
        this.mediaPlanName = mediaPlanName;
    }

    public int getMediaTypeId() {
        return mediaTypeId;
    }

    public void setMediaTypeId(int mediaTypeId) {
        this.mediaTypeId = mediaTypeId;
    }

    public String getMediaPlanStartDate() {
        return mediaPlanStartDate;
    }

    public void setMediaPlanStartDate(String mediaPlanStartDate) {
        this.mediaPlanStartDate = mediaPlanStartDate;
    }

    public String getMediaPlanEndDate() {
        return mediaPlanEndDate;
    }

    public void setMediaPlanEndDate(String mediaPlanEndDate) {
        this.mediaPlanEndDate = mediaPlanEndDate;
    }

    public ArrayList getNpListTakeFromDB() {
        Map session = ActionContext.getContext().getSession();
        String mpName = (String)session.get("MediaPlanNameInSession");
        npListTakeFromDB = (ArrayList)mdDAO.newsPapersDataTakeFromDBToJsp(getUserName(),mpName);        
        setMediaNamesCount((Integer)session.get("NpMediasCount"));
        return npListTakeFromDB;
    }

    public void setNpListTakeFromDB(ArrayList npListTakeFromDB) {
        this.npListTakeFromDB = npListTakeFromDB;
    }

    public ArrayList getAllMediasListTakeFromDB() {
        Map session = ActionContext.getContext().getSession();
        String mpName = (String)session.get("MediaPlanNameInSession");
        allMediasListTakeFromDB = (ArrayList)mdDAO.allMediasDataTakeFromDBToJsp(getUserName(),mpName);
        setMediaNamesCount(allMediasListTakeFromDB.size());
        return allMediasListTakeFromDB;
    }

    public void setAllMediasListTakeFromDB(ArrayList allMediasListTakeFromDB) {
        this.allMediasListTakeFromDB = allMediasListTakeFromDB;
    }



    public int getMediaNamesCount() {
        return mediaNamesCount;
    }

    public void setMediaNamesCount(int mediaNamesCount) {
        this.mediaNamesCount = mediaNamesCount;
    }

//    public ArrayList getNewspapersModifyContactInfo() {
//        String[] mpAndNpNames=getNewspaperName().split(",&,");
//        newspapersModifyContactInfo=mdDAO.modifyNewspaperContactInfo(getUserName(),mpAndNpNames[0], mpAndNpNames[1]);
//        setNpCount(newspapersModifyContactInfo.size());
//        return newspapersModifyContactInfo;
//    }
//
//    public void setNewspapersModifyContactInfo(ArrayList newspapersModifyContactInfo) {
//        this.newspapersModifyContactInfo = newspapersModifyContactInfo;
//    }

    public ArrayList getNewspapersTop100ContactInfo() {
        newspapersTop100ContactInfo=mdDAO.newspaperTop100ContactInfo();
        setNpCount(newspapersTop100ContactInfo.size());
        return newspapersTop100ContactInfo;
    }

    public void setNewspapersTop100ContactInfo(ArrayList newspapersTop100ContactInfo) {
        this.newspapersTop100ContactInfo = newspapersTop100ContactInfo;
    }

    public String getMediaType() {
        return mediaType;
    }

    public void setMediaType(String mediaType) {
        this.mediaType = mediaType;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getNpMediaIds() {
        return npMediaIds;
    }

    public void setNpMediaIds(String npMediaIds) {
        this.npMediaIds = npMediaIds;
    }

    public String getCombinationalName() {
        return combinationalName;
    }

    public void setCombinationalName(String combinationalName) {
        this.combinationalName = combinationalName;
    }

//Magazines Setter and Getter methods

    public int getMgCount() {
        return mgCount;
    }

    public void setMgCount(int mgCount) {
        this.mgCount = mgCount;
    }

    public String getMgStartDate() {
        return mgStartDate;
    }

    public void setMgStartDate(String mgStartDate) {
        this.mgStartDate = mgStartDate;
    }

    public String getMgEndDate() {
        return mgEndDate;
    }

    public void setMgEndDate(String mgEndDate) {
        this.mgEndDate = mgEndDate;
    }

    public List getMgManageMedia() {
      Map session = ActionContext.getContext().getSession();
      String mPlanName = (String) session.get("MediaPlanNameInSession");
      mgManageMedia = mdDAO.magazinesDataTakeFromDBToJsp(getUserName(),mPlanName);
      setMgCount((Integer)session.get("mgMediasCount"));
      return mgManageMedia;
    }

    public void setMgManageMedia(List mgManageMedia) {
        this.mgManageMedia = mgManageMedia;
    }

    public String getSelectedCategory() {
        return selectedCategory;
    }

    public void setSelectedCategory(String selectedCategory) {
        this.selectedCategory = selectedCategory;
    }

    public String getMgWebsite() {
        return mgWebsite;
    }

    public void setMgWebsite(String mgWebsite) {
        this.mgWebsite = mgWebsite;
    }

    public String getMgCategory() {
        return mgCategory;
    }

    public void setMgCategory(String mgCategory) {
        this.mgCategory = mgCategory;
    }

    public String getMgEmail() {
        return mgEmail;
    }

    public void setMgEmail(String mgEmail) {
        this.mgEmail = mgEmail;
    }

    public String getMgEditor() {
        return mgEditor;
    }

    public void setMgEditor(String mgEditor) {
        this.mgEditor = mgEditor;
    }

    public String getMgFrequency() {
        return mgFrequency;
    }

    public void setMgFrequency(String mgFrequency) {
        this.mgFrequency = mgFrequency;
    }

    public String getMgFax() {
        return mgFax;
    }

    public void setMgFax(String mgFax) {
        this.mgFax = mgFax;
    }

    public String getMgContactNo() {
        return mgContactNo;
    }

    public void setMgContactNo(String mgContactNo) {
        this.mgContactNo = mgContactNo;
    }

    public String getCirculationMg() {
        return circulationMg;
    }

    public void setCirculationMg(String circulationMg) {
        this.circulationMg = circulationMg;
    }

    public String getMagazineName() {
        return magazineName;
    }

    public void setMagazineName(String magazineName) {
        this.magazineName = magazineName;
    }

    public int getMagazineId() {
        return magazineId;
    }

    public void setMagazineId(int magazineId) {
        this.magazineId = magazineId;
    }

    public int getMagazineCount() {
        return magazineCount;
    }

    public void setMagazineCount(int magazineCount) {
        this.magazineCount = magazineCount;
    }

    public String getMgchoices() {
        return mgchoices;
    }

    public void setMgchoices(String mgchoices) {
        this.mgchoices = mgchoices;
    }


    public String getCategoryBasedMagazine() {
        return categoryBasedMagazine;
    }

    public void setCategoryBasedMagazine(String categoryBasedMagazine) {
        this.categoryBasedMagazine = categoryBasedMagazine;
    }

    public List getSelectedMagazineContactInfo() {
    Map session = ActionContext.getContext().getSession();
    selectedMagazineContactInfo = (ArrayList) mdDAO.magazinesContactInfoTakeFromDBToJsp(getCategoryBasedMagazine());
    setMagazineCount(selectedMagazineContactInfo.size());
    return selectedMagazineContactInfo;
    }

    public List getTop100MagazineContactInfo() {
    top100MagazineContactInfo=(ArrayList) mdDAO.magazinesTop100ContactInfo();
    setMagazineCount(top100MagazineContactInfo.size());
    return top100MagazineContactInfo;
    }

    public void setTop100MagazineContactInfo(List top100MagazineContactInfo) {
        this.top100MagazineContactInfo = top100MagazineContactInfo;
    }

    public String getMgMediaIds() {
        return mgMediaIds;
    }

    public void setMgMediaIds(String mgMediaIds) {
        this.mgMediaIds = mgMediaIds;
    }

    public int getMediasCount() {
        return mediasCount;
    }

    public void setMediasCount(int mediasCount) {
        this.mediasCount = mediasCount;
    }

    public String getAllMediaIds() {
        return allMediaIds;
    }

    public void setAllMediaIds(String allMediaIds) {
        this.allMediaIds = allMediaIds;
    }

    public int getAllMediaRedirection() {
        Map session = ActionContext.getContext().getSession();
        allMediaRedirection = (Integer)session.get("AllMediaCount");
        return allMediaRedirection;
    }

    public void setAllMediaRedirection(int allMediaRedirection) {
        this.allMediaRedirection = allMediaRedirection;
    }

//Radio getter and setter methods

    public ArrayList getRadioMapCount() {
        radioMapCount = (ArrayList)mdDAO.mouseOverValuesForRadio();
        return radioMapCount;
    }

    public void setRadioMapCount(ArrayList radioMapCount) {
        this.radioMapCount = radioMapCount;
    }

    public String getRadioSelectedStates() {
        return radioSelectedStates;
    }

    public void setRadioSelectedStates(String radioSelectedStates) {
        this.radioSelectedStates = radioSelectedStates;
    }

    public String getRadioSelectedCity() {
        return radioSelectedCity;
    }

    public void setRadioSelectedCity(String radioSelectedCity) {
        this.radioSelectedCity = radioSelectedCity;
    }

    public String getRadioStationName() {
        return radioStationName;
    }

    public void setRadioStationName(String radioStationName) {
        this.radioStationName = radioStationName;
    }

    public String getRadioBand() {
        return radioBand;
    }

    public void setRadioBand(String radioBand) {
        this.radioBand = radioBand;
    }

    public String getRadioCity() {
        return radioCity;
    }

    public void setRadioCity(String radioCity) {
        this.radioCity = radioCity;
    }

    public String getRadioState() {
        return radioState;
    }

    public void setRadioState(String radioState) {
        this.radioState = radioState;
    }

    public String getRadioContactPerson() {
        return radioContactPerson;
    }

    public void setRadioContactPerson(String radioContactPerson) {
        this.radioContactPerson = radioContactPerson;
    }

    public String getRadioRank() {
        return radioRank;
    }

    public void setRadioRank(String radioRank) {
        this.radioRank = radioRank;
    }


    public String getRadioPhoneNumber() {
        return radioPhoneNumber;
    }

    public void setRadioPhoneNumber(String radioPhoneNumber) {
        this.radioPhoneNumber = radioPhoneNumber;
    }

    public String getRadioFaxNumber() {
        return radioFaxNumber;
    }

    public void setRadioFaxNumber(String radioFaxNumber) {
        this.radioFaxNumber = radioFaxNumber;
    }

    public String getRadioWebsite() {
        return radioWebsite;
    }

    public void setRadioWebsite(String radioWebsite) {
        this.radioWebsite = radioWebsite;
    }

    public String getRadioEmail() {
        return radioEmail;
    }

    public void setRadioEmail(String radioEmail) {
        this.radioEmail = radioEmail;
    }

    public String getRadioFormat() {
        return radioFormat;
    }

    public void setRadioFormat(String radioFormat) {
        this.radioFormat = radioFormat;
    }

    public String getRadioDisplayFormat() {
        Map session=ActionContext.getContext().getSession();
        radioDisplayFormat=(String)session.get("RadioFormatInSession");
        return radioDisplayFormat;
    }

    public void setRadioDisplayFormat(String radioDisplayFormat) {
        this.radioDisplayFormat = radioDisplayFormat;
    }

    public int getRadioCount() {
        return radioCount;
    }

    public void setRadioCount(int radioCount) {
        this.radioCount = radioCount;
    }

    public ArrayList getRadioContactInfo() {
        radioContactInfo=mdDAO.radioContactInfo(getCombinationalName());
        setRadioCount(radioContactInfo.size());
        return radioContactInfo;
    }

    public void setRadioContactInfo(ArrayList radioContactInfo) {
        this.radioContactInfo = radioContactInfo;
    }

    public ArrayList getRadioListTakeFromDB() {
        Map session = ActionContext.getContext().getSession();
        String mediaPlanName = (String)session.get("MediaPlanNameInSession");
        radioListTakeFromDB = (ArrayList)mdDAO.newsPapersDataTakeFromDBToJsp(getUserName(),mediaPlanName);
        setMediaNamesCount((Integer)session.get("rdMediasCount"));
        return radioListTakeFromDB;
    }

    public void setRadioListTakeFromDB(ArrayList radioListTakeFromDB) {
        this.radioListTakeFromDB = radioListTakeFromDB;
    }

//TV Setter and Getter methods

    public String getTvSelectedCity() {
    return tvSelectedCity;
    }
    public void setTvSelectedCity(String tvSelectedCity) {
        this.tvSelectedCity = tvSelectedCity;
    }
    public List getTvMapCount() {
         tvMapCount = (ArrayList)mdDAO.mouseOverValuesForTV();
        return tvMapCount;
    }

    public void setTvMapCount(List tvMapCount) {
        this.tvMapCount = tvMapCount;
    }

    public List getNetWorkMapCount() {
        netWorkMapCount = (ArrayList)mdDAO.mouseOverValuesForNetWork(getTelevisionName());
        return netWorkMapCount;
    }

    public void setNetWorkMapCount(List netWorkMapCount) {
        this.netWorkMapCount = netWorkMapCount;
    }
    
    

    public String getTvSelectedStates() {
        return tvSelectedStates;
    }

    public void setTvSelectedStates(String tvSelectedStates) {
        this.tvSelectedStates = tvSelectedStates;
    }

    public String getTelevisionName() {
        return televisionName;
    }

    public void setTelevisionName(String televisionName) {
        this.televisionName = televisionName;
    }
   public List getTvContactInfo() {
        tvContactInfo=mdDAO.televisionContactInfo(getCombinationalName());
        setMediaNamesCount(tvContactInfo.size());
        return tvContactInfo;
    }

    public void setTvContactInfo(List tvContactInfo) {
        this.tvContactInfo = tvContactInfo;
    }

    public String getTvChannelName() {
        return tvChannelName;
    }

    public void setTvChannelName(String tvChannelName) {
        this.tvChannelName = tvChannelName;
    }

    public String getTvCity() {
        return tvCity;
    }

    public void setTvCity(String tvCity) {
        this.tvCity = tvCity;
    }

    public String getTvState() {
        return tvState;
    }

    public void setTvState(String tvState) {
        this.tvState = tvState;
    }

    public String getTvContactPerson() {
        return tvContactPerson;
    }

    public void setTvContactPerson(String tvContactPerson) {
        this.tvContactPerson = tvContactPerson;
    }

    public String getTvPhoneNumber() {
        return tvPhoneNumber;
    }

    public void setTvPhoneNumber(String tvPhoneNumber) {
        this.tvPhoneNumber = tvPhoneNumber;
    }

    public String getTvRank() {
        return tvRank;
    }

    public void setTvRank(String tvRank) {
        this.tvRank = tvRank;
    }

    public String getTvNetwork() {
        return tvNetwork;
    }

    public void setTvNetwork(String tvNetwork) {
        this.tvNetwork = tvNetwork;
    }    
    

    public String getTvFaxNumber() {
        return tvFaxNumber;
    }

    public void setTvFaxNumber(String tvFaxNumber) {
        this.tvFaxNumber = tvFaxNumber;
    }

    public String getTvEmail() {
        return tvEmail;
    }

    public void setTvEmail(String tvEmail) {
        this.tvEmail = tvEmail;
    }

    public int getTvCount() {
        return tvCount;
    }

    public void setTvCount(int tvCount) {
        this.tvCount = tvCount;
    }
    public List getTvDataListTakeFromDB() {
      Map session = ActionContext.getContext().getSession();
      String mediaPlanName=(String)session.get("MediaPlanNameInSession");
      tvDataListTakeFromDB=(ArrayList)mdDAO.newsPapersDataTakeFromDBToJsp(getUserName(),mediaPlanName);
      setMediaNamesCount((Integer)session.get("TvMediasCount"));
      return tvDataListTakeFromDB;
    }

    public void setTvDataListTakeFromDB(List tvDataListTakeFromDB) {
        this.tvDataListTakeFromDB = tvDataListTakeFromDB;
    }

    public String getTvSelectByStatesInNetwork() {
        return tvSelectByStatesInNetwork;
    }

    public void setTvSelectByStatesInNetwork(String tvSelectByStatesInNetwork) {
        this.tvSelectByStatesInNetwork = tvSelectByStatesInNetwork;
    }

    public String getTvNetworkSelectByCity() {
        return tvNetworkSelectByCity;
    }

    public void setTvNetworkSelectByCity(String tvNetworkSelectByCity) {
        this.tvNetworkSelectByCity = tvNetworkSelectByCity;
    }

    public String getMediaId() {
        return MediaId;
    }

    public void setMediaId(String MediaId) {
        this.MediaId = MediaId;
    }

//Internet getter and setter methods

    public String getWebsiteName() {
        return websiteName;
    }

    public void setWebsiteName(String websiteName) {
        this.websiteName = websiteName;
    }

    public String getInternetCategory() {
        return internetCategory;
    }

    public void setInternetCategory(String internetCategory) {
        this.internetCategory = internetCategory;
    }

    public String getInternetRank() {
        return internetRank;
    }

    public void setInternetRank(String internetRank) {
        this.internetRank = internetRank;
    }

    public String getInternetReach() {
        return internetReach;
    }

    public void setInternetReach(String internetReach) {
        this.internetReach = internetReach;
    }

    public String getInternetVisitors() {
        return internetVisitors;
    }

    public void setInternetVisitors(String internetVisitors) {
        this.internetVisitors = internetVisitors;
    }

    public String getInternetPageViews() {
        return internetPageViews;
    }

    public void setInternetPageViews(String internetPageViews) {
        this.internetPageViews = internetPageViews;
    }

    public String getInternetPhoneNo() {
        return internetPhoneNo;
    }

    public void setInternetPhoneNo(String internetPhoneNo) {
        this.internetPhoneNo = internetPhoneNo;
    }

    public String getInternetFaxNo() {
        return internetFaxNo;
    }

    public void setInternetFaxNo(String internetFaxNo) {
        this.internetFaxNo = internetFaxNo;
    }

    public String getInternetWebsite() {
        return internetWebsite;
    }

    public void setInternetWebsite(String internetWebsite) {
        this.internetWebsite = internetWebsite;
    }

    public String getInternetEmail() {
        return internetEmail;
    }

    public void setInternetEmail(String internetEmail) {
        this.internetEmail = internetEmail;
    }

    public int getInternetCount() {
        return internetCount;
    }

    public void setInternetCount(int internetCount) {
        this.internetCount = internetCount;
    }

    public ArrayList getInternetUSByRankContactInfo() {
        internetUSByRankContactInfo = (ArrayList)mdDAO.USTopInternetSitesByRankContactInfo();
        setInternetCount(internetUSByRankContactInfo.size());
        return internetUSByRankContactInfo;
    }

    public void setInternetUSByRankContactInfo(ArrayList internetUSByRankContactInfo) {
        this.internetUSByRankContactInfo = internetUSByRankContactInfo;
    }

    public ArrayList getInternetUSContactInfo() {
        internetUSContactInfo=(ArrayList)mdDAO.USInternetSitesContactInfo(getCombinationalName());
        setInternetCount(internetUSContactInfo.size());
        return internetUSContactInfo;
    }

    public void setInternetUSContactInfo(ArrayList internetUSContactInfo) {
        this.internetUSContactInfo = internetUSContactInfo;
    }

    public ArrayList getInternetSitesListTakeFromDB() {
        Map session = ActionContext.getContext().getSession();
        setMediaPlanName((String)session.get("MediaPlanNameInSession"));
        internetSitesListTakeFromDB = (ArrayList)mdDAO.newsPapersDataTakeFromDBToJsp(getUserName(), getMediaPlanName());
        setMediaNamesCount((Integer)session.get("InternetMediasCount"));
        return internetSitesListTakeFromDB;
    }

    public void setInternetSitesListTakeFromDB(ArrayList internetSitesListTakeFromDB) {
        this.internetSitesListTakeFromDB = internetSitesListTakeFromDB;
    }

    public ArrayList getWorldWideInternetContactInfo() {
        worldWideInternetContactInfo=(ArrayList)mdDAO.internetSitesWorldWideContactInfo();
        setInternetCount(worldWideInternetContactInfo.size());
        return worldWideInternetContactInfo;
    }

    public void setWorldWideInternetContactInfo(ArrayList worldWideInternetContactInfo) {
        this.worldWideInternetContactInfo = worldWideInternetContactInfo;
    }

    public ArrayList getWorldWideInternetModifyContactInfo() {
        worldWideInternetModifyContactInfo = (ArrayList)mdDAO.internetWorldWideModifyContactInfo(getCombinationalName());
        setInternetCount(worldWideInternetModifyContactInfo.size());
        return worldWideInternetModifyContactInfo;
    }

    public void setWorldWideInternetModifyContactInfo(ArrayList worldWideInternetModifyContactInfo) {
        this.worldWideInternetModifyContactInfo = worldWideInternetModifyContactInfo;
    }

//Mobile Apps Setter and Getter methods

    public String getMobileAppsCategory() {
        return mobileAppsCategory;
    }
    public void setMobileAppsCategory(String mobileAppsCategory) {
        this.mobileAppsCategory = mobileAppsCategory;
    }
    public String getCategoryType() {
        return categoryType;
    }
    public void setCategoryType(String categoryType) {
        this.categoryType = categoryType;
    }
    public String getAppCategoryType() {
        return appCategoryType;
    }
    public void setAppCategoryType(String appCategoryType) {
        this.appCategoryType = appCategoryType;
    }
    public String getMobileAppsName() {
        return mobileAppsName;
    }
    public void setMobileAppsName(String mobileAppsName) {
        this.mobileAppsName = mobileAppsName;
    }
    public List getMobileAppsContactInfoList() {
        mobileAppsContactInfoList = mdDAO.mobileAppsContactInfoTakeFromDB(getCombinationalName());
        setMediaNamesCount(mobileAppsContactInfoList.size());
        return mobileAppsContactInfoList;
    }
    public void setMobileAppsContactInfoList(List mobileAppsContactInfoList) {
        this.mobileAppsContactInfoList = mobileAppsContactInfoList;
    }
    public String getOperatingSystemName() {
        return operatingSystemName;
    }
    public void setOperatingSystemName(String operatingSystemName) {
        this.operatingSystemName = operatingSystemName;
    }
    public String getTypeOfMobileApp() {
        return typeOfMobileApp;
    }
    public void setTypeOfMobileApp(String typeOfMobileApp) {
        this.typeOfMobileApp = typeOfMobileApp;
    }
    public String getMobileAppsVersion() {
        return mobileAppsVersion;
    }
    public void setMobileAppsVersion(String mobileAppsVersion) {
        this.mobileAppsVersion = mobileAppsVersion;
    }
    public String getMobileAppsDeveloper() {
        return mobileAppsDeveloper;
    }
    public void setMobileAppsDeveloper(String mobileAppsDeveloper) {
        this.mobileAppsDeveloper = mobileAppsDeveloper;
    }
    public String getMobileAppsDownload() {
        return mobileAppsDownload;
    }
    public void setMobileAppsDownload(String mobileAppsDownload) {
        this.mobileAppsDownload = mobileAppsDownload;
    }
    public String getMobileAppsEmail() {
        return mobileAppsEmail;
    }
    public void setMobileAppsEmail(String mobileAppsEmail) {
        this.mobileAppsEmail = mobileAppsEmail;
    }
    public String getMobileAppsPhoneNo() {
        return mobileAppsPhoneNo;
    }
    public void setMobileAppsPhoneNo(String mobileAppsPhoneNo) {
        this.mobileAppsPhoneNo = mobileAppsPhoneNo;
    }
    public String getMobileAppsFaxNo() {
        return mobileAppsFaxNo;
    }
    public void setMobileAppsFaxNo(String mobileAppsFaxNo) {
        this.mobileAppsFaxNo = mobileAppsFaxNo;
    }
    public String getMobileAppsId() {
        return mobileAppsId;
    }
    public void setMobileAppsId(String mobileAppsId) {
        this.mobileAppsId = mobileAppsId;
    }
    public List getMobileAppDataListTakeFromDB() {
     Map session = ActionContext.getContext().getSession();
     String mPlanName = (String)session.get("MediaPlanNameInSession");
     mobileAppDataListTakeFromDB = (ArrayList)mdDAO.newsPapersDataTakeFromDBToJsp(getUserName(),mPlanName);
     setMediaNamesCount((Integer)session.get("MAppMediasCount"));
     return mobileAppDataListTakeFromDB;
    }
    public void setMobileAppDataListTakeFromDB(List mobileAppDataListTakeFromDB) {
        this.mobileAppDataListTakeFromDB = mobileAppDataListTakeFromDB;
    }
    public String getmAppchoices() {
        return mAppchoices;
    }
    public void setmAppchoices(String mAppchoices) {
        this.mAppchoices = mAppchoices;
    }



}
