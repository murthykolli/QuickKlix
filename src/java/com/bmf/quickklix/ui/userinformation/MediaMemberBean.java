/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.userinformation;

import com.bmf.quickklix.core.dao.MediaMemberDAO;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author Murthy
 */
public class MediaMemberBean {
    Logger log = Logger.getLogger(MediaMemberBean.class);
    MediaMemberDAO mmDAO = new MediaMemberDAO();

    private String userName; private String userFirstName; private String loginUserFirstName; private String tvStationName; private String tvStationWebsite; private String tvStationCity; private String tvStationState;
    private String tvStationContactName; private String tvStationContactNumber; private String tvStationEmail; private String tvStationReach;
    private String tvStationDemographics; private String tvStationAdSlot; private String tvStationAdTypes; private String mediaMemberRequestType;

    private String radStationName; private String radioStationFrequency; private String radioStationFormat; private String radioStationSalesConName;
    private String raioStationContactNo; private String radioStationContactEmail; private String radioStationDemographics; private String radioStationBroadcast;
    private String radioStationPurchasingAd; private String radioStationAdSlot; private String radioStationAdTypes; private String radioStationDaypart;
    private String radioOtherDaypart; private String radioMorningDrive; private String radioAveRate1; private String radioPerSecond1; private String radioMidday;
    private String radioAveRate2; private String radioPerSecond2; private String radioAfternoonDrive; private String radioAveRate3; private String radioPerSecond3;
    private String radioEvenings; private String radioAveRate4; private String radioPerSecond4; private String radioOvernight; private String radioAveRate5;
    private String radioPerSecond5; private String radioWeekend; private String radioAveRate6; private String radioPerSecond6;

    private String nameOfNewsPaper; private String newsPaperWebsite; private String newsPaperCity; private String newsPaperState; private String newsPaperAdSalesContactName;
    private String newsPaperContactNumber; private String newsPaperContactEmail; private String reachOfNewsPaper; private String newsPaperDemographics; private String newsPaperAdvSlots;
    private String newsPaperTypeofAds; private String newsPaperAdPrices;
    private ArrayList stateNamesList;

    private String  magzineName; private String  magzineWebsite; private String  magzineCity; private String magzineState; private String  magzineContactName; private String magzineContactNo;
    private String  magzineContactEmail; private String magzineReach; private String  magzineDemographics; private String magzineAdSlot; private String  magzineAdType; private String magzineAdPrice;

    private String othMediaName;private String othMediaWebsite;private String othMediaCity;private String othMediaState;private String othMediaContactName;
private String othMediaContactNumber; private String othMediaEmail; private String othMediaReach;private String othMediaDemographics;private String othMediaAdSlots;

    public String getUserName() {
        Map session = ActionContext.getContext().getSession();
        userName = (String)session.get("userName");
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserFirstName() {
        userFirstName = mmDAO.userFirstNameTakeFromDB(getUserName());
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getLoginUserFirstName() {
        loginUserFirstName = mmDAO.userFirstNameTakeFromDB(getUserName());
        return loginUserFirstName;
    }

    public void setLoginUserFirstName(String loginUserFirstName) {
        this.loginUserFirstName = loginUserFirstName;
    }

    public String getRadStationName() {
        return radStationName;
    }

    public void setRadStationName(String radStationName) {
        this.radStationName = radStationName;
    }

    public String getRadioAfternoonDrive() {
        return radioAfternoonDrive;
    }

    public void setRadioAfternoonDrive(String radioAfternoonDrive) {
        this.radioAfternoonDrive = radioAfternoonDrive;
    }

    public String getRadioAveRate1() {
        return radioAveRate1;
    }

    public void setRadioAveRate1(String radioAveRate1) {
        this.radioAveRate1 = radioAveRate1;
    }

    public String getRadioAveRate2() {
        return radioAveRate2;
    }

    public void setRadioAveRate2(String radioAveRate2) {
        this.radioAveRate2 = radioAveRate2;
    }

    public String getRadioAveRate3() {
        return radioAveRate3;
    }

    public void setRadioAveRate3(String radioAveRate3) {
        this.radioAveRate3 = radioAveRate3;
    }

    public String getRadioAveRate4() {
        return radioAveRate4;
    }

    public void setRadioAveRate4(String radioAveRate4) {
        this.radioAveRate4 = radioAveRate4;
    }

    public String getRadioAveRate5() {
        return radioAveRate5;
    }

    public void setRadioAveRate5(String radioAveRate5) {
        this.radioAveRate5 = radioAveRate5;
    }

    public String getRadioAveRate6() {
        return radioAveRate6;
    }

    public void setRadioAveRate6(String radioAveRate6) {
        this.radioAveRate6 = radioAveRate6;
    }

    public String getRadioEvenings() {
        return radioEvenings;
    }

    public void setRadioEvenings(String radioEvenings) {
        this.radioEvenings = radioEvenings;
    }

    public String getRadioMidday() {
        return radioMidday;
    }

    public void setRadioMidday(String radioMidday) {
        this.radioMidday = radioMidday;
    }

    public String getRadioMorningDrive() {
        return radioMorningDrive;
    }

    public void setRadioMorningDrive(String radioMorningDrive) {
        this.radioMorningDrive = radioMorningDrive;
    }

    public String getRadioOtherDaypart() {
        return radioOtherDaypart;
    }

    public void setRadioOtherDaypart(String radioOtherDaypart) {
        this.radioOtherDaypart = radioOtherDaypart;
    }

    public String getRadioOvernight() {
        return radioOvernight;
    }

    public void setRadioOvernight(String radioOvernight) {
        this.radioOvernight = radioOvernight;
    }

    public String getRadioPerSecond1() {
        return radioPerSecond1;
    }

    public void setRadioPerSecond1(String radioPerSecond1) {
        this.radioPerSecond1 = radioPerSecond1;
    }

    public String getRadioPerSecond2() {
        return radioPerSecond2;
    }

    public void setRadioPerSecond2(String radioPerSecond2) {
        this.radioPerSecond2 = radioPerSecond2;
    }

    public String getRadioPerSecond3() {
        return radioPerSecond3;
    }

    public void setRadioPerSecond3(String radioPerSecond3) {
        this.radioPerSecond3 = radioPerSecond3;
    }

    public String getRadioPerSecond4() {
        return radioPerSecond4;
    }

    public void setRadioPerSecond4(String radioPerSecond4) {
        this.radioPerSecond4 = radioPerSecond4;
    }

    public String getRadioPerSecond5() {
        return radioPerSecond5;
    }

    public void setRadioPerSecond5(String radioPerSecond5) {
        this.radioPerSecond5 = radioPerSecond5;
    }

    public String getRadioPerSecond6() {
        return radioPerSecond6;
    }

    public void setRadioPerSecond6(String radioPerSecond6) {
        this.radioPerSecond6 = radioPerSecond6;
    }

    public String getRadioStationAdSlot() {
        return radioStationAdSlot;
    }

    public void setRadioStationAdSlot(String radioStationAdSlot) {
        this.radioStationAdSlot = radioStationAdSlot;
    }

    public String getRadioStationAdTypes() {
        return radioStationAdTypes;
    }

    public void setRadioStationAdTypes(String radioStationAdTypes) {
        this.radioStationAdTypes = radioStationAdTypes;
    }

    public String getRadioStationBroadcast() {
        return radioStationBroadcast;
    }

    public void setRadioStationBroadcast(String radioStationBroadcast) {
        this.radioStationBroadcast = radioStationBroadcast;
    }

    public String getRadioStationContactEmail() {
        return radioStationContactEmail;
    }

    public void setRadioStationContactEmail(String radioStationContactEmail) {
        this.radioStationContactEmail = radioStationContactEmail;
    }

    public String getRadioStationDaypart() {
        return radioStationDaypart;
    }

    public void setRadioStationDaypart(String radioStationDaypart) {
        this.radioStationDaypart = radioStationDaypart;
    }

    public String getRadioStationDemographics() {
        return radioStationDemographics;
    }

    public void setRadioStationDemographics(String radioStationDemographics) {
        this.radioStationDemographics = radioStationDemographics;
    }

    public String getRadioStationFormat() {
        return radioStationFormat;
    }

    public void setRadioStationFormat(String radioStationFormat) {
        this.radioStationFormat = radioStationFormat;
    }

    public String getRadioStationFrequency() {
        return radioStationFrequency;
    }

    public void setRadioStationFrequency(String radioStationFrequency) {
        this.radioStationFrequency = radioStationFrequency;
    }

    public String getRadioStationPurchasingAd() {
        return radioStationPurchasingAd;
    }

    public void setRadioStationPurchasingAd(String radioStationPurchasingAd) {
        this.radioStationPurchasingAd = radioStationPurchasingAd;
    }

    public String getRadioStationSalesConName() {
        return radioStationSalesConName;
    }

    public void setRadioStationSalesConName(String radioStationSalesConName) {
        this.radioStationSalesConName = radioStationSalesConName;
    }

    public String getRadioWeekend() {
        return radioWeekend;
    }

    public void setRadioWeekend(String radioWeekend) {
        this.radioWeekend = radioWeekend;
    }

    public String getRaioStationContactNo() {
        return raioStationContactNo;
    }

    public void setRaioStationContactNo(String raioStationContactNo) {
        this.raioStationContactNo = raioStationContactNo;
    }

    public String getTvStationAdSlot() {
        return tvStationAdSlot;
    }

    public void setTvStationAdSlot(String tvStationAdSlot) {
        this.tvStationAdSlot = tvStationAdSlot;
    }

    public String getTvStationAdTypes() {
        return tvStationAdTypes;
    }

    public void setTvStationAdTypes(String tvStationAdTypes) {
        this.tvStationAdTypes = tvStationAdTypes;
    }

    public String getTvStationCity() {
        return tvStationCity;
    }

    public void setTvStationCity(String tvStationCity) {
        this.tvStationCity = tvStationCity;
    }

    public String getTvStationContactName() {
        return tvStationContactName;
    }

    public void setTvStationContactName(String tvStationContactName) {
        this.tvStationContactName = tvStationContactName;
    }

    public String getTvStationContactNumber() {
        return tvStationContactNumber;
    }

    public void setTvStationContactNumber(String tvStationContactNumber) {
        this.tvStationContactNumber = tvStationContactNumber;
    }

    public String getTvStationDemographics() {
        return tvStationDemographics;
    }

    public void setTvStationDemographics(String tvStationDemographics) {
        this.tvStationDemographics = tvStationDemographics;
    }

    public String getTvStationEmail() {
        return tvStationEmail;
    }

    public void setTvStationEmail(String tvStationEmail) {
        this.tvStationEmail = tvStationEmail;
    }

    public String getTvStationName() {
        return tvStationName;
    }

    public void setTvStationName(String tvStationName) {
        this.tvStationName = tvStationName;
    }

    public String getTvStationReach() {
        return tvStationReach;
    }

    public void setTvStationReach(String tvStationReach) {
        this.tvStationReach = tvStationReach;
    }

    public String getTvStationState() {
        return tvStationState;
    }

    public void setTvStationState(String tvStationState) {
        this.tvStationState = tvStationState;
    }

    public String getTvStationWebsite() {
        return tvStationWebsite;
    }

    public void setTvStationWebsite(String tvStationWebsite) {
        this.tvStationWebsite = tvStationWebsite;
    }

    public String getNameOfNewsPaper() {
        return nameOfNewsPaper;
    }

    public void setNameOfNewsPaper(String nameOfNewsPaper) {
        this.nameOfNewsPaper = nameOfNewsPaper;
    }

    public String getNewsPaperAdPrices() {
        return newsPaperAdPrices;
    }

    public void setNewsPaperAdPrices(String newsPaperAdPrices) {
        this.newsPaperAdPrices = newsPaperAdPrices;
    }

    public String getNewsPaperAdSalesContactName() {
        return newsPaperAdSalesContactName;
    }

    public void setNewsPaperAdSalesContactName(String newsPaperAdSalesContactName) {
        this.newsPaperAdSalesContactName = newsPaperAdSalesContactName;
    }

    public String getNewsPaperAdvSlots() {
        return newsPaperAdvSlots;
    }

    public void setNewsPaperAdvSlots(String newsPaperAdvSlots) {
        this.newsPaperAdvSlots = newsPaperAdvSlots;
    }

    public String getNewsPaperCity() {
        return newsPaperCity;
    }

    public void setNewsPaperCity(String newsPaperCity) {
        this.newsPaperCity = newsPaperCity;
    }

    public String getNewsPaperContactEmail() {
        return newsPaperContactEmail;
    }

    public void setNewsPaperContactEmail(String newsPaperContactEmail) {
        this.newsPaperContactEmail = newsPaperContactEmail;
    }

    public String getNewsPaperContactNumber() {
        return newsPaperContactNumber;
    }

    public void setNewsPaperContactNumber(String newsPaperContactNumber) {
        this.newsPaperContactNumber = newsPaperContactNumber;
    }

    public String getNewsPaperDemographics() {
        return newsPaperDemographics;
    }

    public void setNewsPaperDemographics(String newsPaperDemographics) {
        this.newsPaperDemographics = newsPaperDemographics;
    }

    public String getNewsPaperState() {
        return newsPaperState;
    }

    public void setNewsPaperState(String newsPaperState) {
        this.newsPaperState = newsPaperState;
    }

    public String getNewsPaperTypeofAds() {
        return newsPaperTypeofAds;
    }

    public void setNewsPaperTypeofAds(String newsPaperTypeofAds) {
        this.newsPaperTypeofAds = newsPaperTypeofAds;
    }

    public String getNewsPaperWebsite() {
        return newsPaperWebsite;
    }

    public void setNewsPaperWebsite(String newsPaperWebsite) {
        this.newsPaperWebsite = newsPaperWebsite;
    }

    public String getReachOfNewsPaper() {
        return reachOfNewsPaper;
    }

    public void setReachOfNewsPaper(String reachOfNewsPaper) {
        this.reachOfNewsPaper = reachOfNewsPaper;
    }

    public ArrayList getStateNamesList() {
        stateNamesList = (ArrayList)mmDAO.statesListTakeFromDB();
        return stateNamesList;
    }

    public void setStateNamesList(ArrayList stateNamesList) {
        this.stateNamesList = stateNamesList;
    }

    public String getMagzineAdPrice() {
        return magzineAdPrice;
    }

    public void setMagzineAdPrice(String magzineAdPrice) {
        this.magzineAdPrice = magzineAdPrice;
    }

    public String getMagzineAdSlot() {
        return magzineAdSlot;
    }

    public void setMagzineAdSlot(String magzineAdSlot) {
        this.magzineAdSlot = magzineAdSlot;
    }

    public String getMagzineAdType() {
        return magzineAdType;
    }

    public void setMagzineAdType(String magzineAdType) {
        this.magzineAdType = magzineAdType;
    }

    public String getMagzineCity() {
        return magzineCity;
    }

    public void setMagzineCity(String magzineCity) {
        this.magzineCity = magzineCity;
    }

    public String getMagzineContactEmail() {
        return magzineContactEmail;
    }

    public void setMagzineContactEmail(String magzineContactEmail) {
        this.magzineContactEmail = magzineContactEmail;
    }

    public String getMagzineContactName() {
        return magzineContactName;
    }

    public void setMagzineContactName(String magzineContactName) {
        this.magzineContactName = magzineContactName;
    }

    public String getMagzineContactNo() {
        return magzineContactNo;
    }

    public void setMagzineContactNo(String magzineContactNo) {
        this.magzineContactNo = magzineContactNo;
    }

    public String getMagzineDemographics() {
        return magzineDemographics;
    }

    public void setMagzineDemographics(String magzineDemographics) {
        this.magzineDemographics = magzineDemographics;
    }

    public String getMagzineName() {
        return magzineName;
    }

    public void setMagzineName(String magzineName) {
        this.magzineName = magzineName;
    }

    public String getMagzineReach() {
        return magzineReach;
    }

    public void setMagzineReach(String magzineReach) {
        this.magzineReach = magzineReach;
    }

    public String getMagzineState() {
        return magzineState;
    }

    public void setMagzineState(String magzineState) {
        this.magzineState = magzineState;
    }

    public String getMagzineWebsite() {
        return magzineWebsite;
    }

    public void setMagzineWebsite(String magzineWebsite) {
        this.magzineWebsite = magzineWebsite;
    }

    public String getOthMediaAdSlots() {
        return othMediaAdSlots;
    }

    public void setOthMediaAdSlots(String othMediaAdSlots) {
        this.othMediaAdSlots = othMediaAdSlots;
    }

    public String getOthMediaCity() {
        return othMediaCity;
    }

    public void setOthMediaCity(String othMediaCity) {
        this.othMediaCity = othMediaCity;
    }

    public String getOthMediaContactName() {
        return othMediaContactName;
    }

    public void setOthMediaContactName(String othMediaContactName) {
        this.othMediaContactName = othMediaContactName;
    }

    public String getOthMediaContactNumber() {
        return othMediaContactNumber;
    }

    public void setOthMediaContactNumber(String othMediaContactNumber) {
        this.othMediaContactNumber = othMediaContactNumber;
    }

    public String getOthMediaDemographics() {
        return othMediaDemographics;
    }

    public void setOthMediaDemographics(String othMediaDemographics) {
        this.othMediaDemographics = othMediaDemographics;
    }

    public String getOthMediaEmail() {
        return othMediaEmail;
    }

    public void setOthMediaEmail(String othMediaEmail) {
        this.othMediaEmail = othMediaEmail;
    }

    public String getOthMediaName() {
        return othMediaName;
    }

    public void setOthMediaName(String othMediaName) {
        this.othMediaName = othMediaName;
    }

    public String getOthMediaReach() {
        return othMediaReach;
    }

    public void setOthMediaReach(String othMediaReach) {
        this.othMediaReach = othMediaReach;
    }

    public String getOthMediaState() {
        return othMediaState;
    }

    public void setOthMediaState(String othMediaState) {
        this.othMediaState = othMediaState;
    }

    public String getOthMediaWebsite() {
        return othMediaWebsite;
    }

    public void setOthMediaWebsite(String othMediaWebsite) {
        this.othMediaWebsite = othMediaWebsite;
    }

    public String getMediaMemberRequestType() {
        Map session = ActionContext.getContext().getSession();
        mediaMemberRequestType = (String)session.get("MediaMemberRequestType");
        return mediaMemberRequestType;
    }

    public void setMediaMemberRequestType(String mediaMemberRequestType) {
        this.mediaMemberRequestType = mediaMemberRequestType;
    }



}
