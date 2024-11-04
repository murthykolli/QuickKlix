/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.userinformation;

import com.bmf.quickklix.core.dao.MediaMemberDAO;
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
public class MediaMemberAction extends ActionSupport implements ModelDriven {
    Logger log = Logger.getLogger(MediaMemberAction.class);
    MediaMemberBean mmBean = new MediaMemberBean();
    MediaMemberDAO mmDAO = new MediaMemberDAO();
    EmailSending emailer = new EmailSending();

public Object getModel() {
    return mmBean;
}

    @Override
public String execute(){
    return "success";
}

public String tvStationRequestFormRedirection(){
    MediaMemberBean mMebBean = mmDAO.tvStationRequestFormInfoFromDB(mmBean.getUserName()); 
    mmBean.setTvStationName(mMebBean.getTvStationName());
    mmBean.setTvStationWebsite(mMebBean.getTvStationWebsite());
    mmBean.setTvStationCity(mMebBean.getTvStationCity());
    mmBean.setTvStationState(mMebBean.getTvStationState());
    mmBean.setTvStationContactName(mMebBean.getTvStationContactName());
    mmBean.setTvStationContactNumber(mMebBean.getTvStationContactNumber());
    mmBean.setTvStationEmail(mMebBean.getTvStationEmail());
    mmBean.setTvStationReach(mMebBean.getTvStationReach());
    mmBean.setTvStationDemographics(mMebBean.getTvStationDemographics());
    mmBean.setTvStationAdSlot(mMebBean.getTvStationAdSlot());
    mmBean.setTvStationAdTypes(mMebBean.getTvStationAdTypes());    
    return "success";    
}

public String tvStationRequestFormSavingAndUpdating(){
    int tvStationSaving = mmDAO.tvStationRequestFormSavingAndUpdatingInToDB(mmBean.getUserName(),mmBean.getTvStationName(),mmBean.getTvStationWebsite(),mmBean.getTvStationCity(),
    mmBean.getTvStationState(),mmBean.getTvStationContactName(),mmBean.getTvStationContactNumber(),mmBean.getTvStationEmail(),mmBean.getTvStationReach(),
    mmBean.getTvStationDemographics(),mmBean.getTvStationAdSlot(),mmBean.getTvStationAdTypes());
    return "tvRequestFormSaving";
}

public String radioStationRequestFormRedirection(){
    MediaMemberBean mMebBean = mmDAO.radioStationRequestFormInfoFromDB(mmBean.getUserName());    
    mmBean.setRadStationName(mMebBean.getRadStationName());
    mmBean.setRadioStationFrequency(mMebBean.getRadioStationFrequency());
    mmBean.setRadioStationFormat(mMebBean.getRadioStationFormat());
    mmBean.setRadioStationSalesConName(mMebBean.getRadioStationSalesConName());
    mmBean.setRaioStationContactNo(mMebBean.getRaioStationContactNo());
    mmBean.setRadioStationContactEmail(mMebBean.getRadioStationContactEmail());
    mmBean.setRadioStationDemographics(mMebBean.getRadioStationDemographics());
    mmBean.setRadioStationBroadcast(mMebBean.getRadioStationBroadcast());
    mmBean.setRadioStationPurchasingAd(mMebBean.getRadioStationPurchasingAd());
    mmBean.setRadioStationAdSlot(mMebBean.getRadioStationAdSlot());
    mmBean.setRadioStationAdTypes(mMebBean.getRadioStationAdTypes());
    mmBean.setRadioStationDaypart(mMebBean.getRadioStationDaypart());
    mmBean.setRadioOtherDaypart(mMebBean.getRadioOtherDaypart());
    mmBean.setRadioMorningDrive(mMebBean.getRadioMorningDrive());
    mmBean.setRadioAveRate1(mMebBean.getRadioAveRate1());
    mmBean.setRadioPerSecond1(mMebBean.getRadioPerSecond1());
    mmBean.setRadioMidday(mMebBean.getRadioMidday());
    mmBean.setRadioAveRate2(mMebBean.getRadioAveRate2());
    mmBean.setRadioPerSecond2(mMebBean.getRadioPerSecond2());
    mmBean.setRadioAfternoonDrive(mMebBean.getRadioAfternoonDrive());
    mmBean.setRadioAveRate3(mMebBean.getRadioAveRate3());
    mmBean.setRadioPerSecond3(mMebBean.getRadioPerSecond3());
    mmBean.setRadioEvenings(mMebBean.getRadioEvenings());
    mmBean.setRadioAveRate4(mMebBean.getRadioAveRate4());
    mmBean.setRadioPerSecond4(mMebBean.getRadioPerSecond4());
    mmBean.setRadioOvernight(mMebBean.getRadioOvernight());
    mmBean.setRadioAveRate5(mMebBean.getRadioAveRate5());
    mmBean.setRadioPerSecond5(mMebBean.getRadioPerSecond5());
    mmBean.setRadioWeekend(mMebBean.getRadioWeekend());
    mmBean.setRadioAveRate6(mMebBean.getRadioAveRate6());
    mmBean.setRadioPerSecond6(mMebBean.getRadioPerSecond6());
    return "success";
}

public String radioStationRequestFormSavingAndUpdating(){
    int radioStationSaving = mmDAO.radioStationRequestFormSavingAndUpdatingInToDB(mmBean.getUserName(),mmBean.getRadStationName(),mmBean.getRadioStationFrequency(),mmBean.getRadioStationFormat(),
    mmBean.getRadioStationSalesConName(),mmBean.getRaioStationContactNo(),mmBean.getRadioStationContactEmail(),mmBean.getRadioStationDemographics(),
    mmBean.getRadioStationBroadcast(),mmBean.getRadioStationPurchasingAd(),mmBean.getRadioStationAdSlot(), mmBean.getRadioStationAdTypes(),
    mmBean.getRadioStationDaypart(),mmBean.getRadioOtherDaypart(),mmBean.getRadioMorningDrive(), mmBean.getRadioAveRate1(),mmBean.getRadioPerSecond1(),
    mmBean.getRadioMidday(), mmBean.getRadioAveRate2(), mmBean.getRadioPerSecond2(), mmBean.getRadioAfternoonDrive(), mmBean.getRadioAveRate3(),
    mmBean.getRadioPerSecond3(),mmBean.getRadioEvenings(),mmBean.getRadioAveRate4(),mmBean.getRadioPerSecond4(),mmBean.getRadioOvernight(),
    mmBean.getRadioAveRate5(),mmBean.getRadioPerSecond5(),mmBean.getRadioWeekend(),mmBean.getRadioAveRate6(),mmBean.getRadioPerSecond6());
    return "radioRequestFormSaving";
}

public String newspaperRequestFormRedirection(){
    MediaMemberBean mMebBean = mmDAO.newsPaperRequestFormInfoFromDB(mmBean.getUserName());
    mmBean.setNameOfNewsPaper(mMebBean.getNameOfNewsPaper());
    mmBean.setNewsPaperWebsite(mMebBean.getNewsPaperWebsite());
    mmBean.setNewsPaperCity(mMebBean.getNewsPaperCity());
    mmBean.setNewsPaperState(mMebBean.getNewsPaperState());
    mmBean.setNewsPaperAdSalesContactName(mMebBean.getNewsPaperAdSalesContactName());
    mmBean.setNewsPaperContactNumber(mMebBean.getNewsPaperContactNumber());
    mmBean.setNewsPaperContactEmail(mMebBean.getNewsPaperContactEmail());
    mmBean.setReachOfNewsPaper(mMebBean.getReachOfNewsPaper());
    mmBean.setNewsPaperDemographics(mMebBean.getNewsPaperDemographics());
    mmBean.setNewsPaperAdvSlots(mMebBean.getNewsPaperAdvSlots());
    mmBean.setNewsPaperTypeofAds(mMebBean.getNewsPaperTypeofAds());
    mmBean.setNewsPaperAdPrices(mMebBean.getNewsPaperAdPrices());
    return "success";
}

public String newspaperRequestFormSavingAndUpdating(){
    mmDAO.newsPaperRequestFormSavingAndUpdatingInToDB(mmBean.getUserName(),mmBean.getNameOfNewsPaper(),mmBean.getNewsPaperWebsite(),mmBean.getNewsPaperCity(),mmBean.getNewsPaperState(),mmBean.getNewsPaperAdSalesContactName(),mmBean.getNewsPaperContactNumber(),mmBean.getNewsPaperContactEmail(),mmBean.getReachOfNewsPaper(),mmBean.getNewsPaperDemographics(),mmBean.getNewsPaperAdvSlots(),mmBean.getNewsPaperTypeofAds(),mmBean.getNewsPaperAdPrices());
    return "newspaperRequestFormSaving";
}

public String magazineRequestFormRedirection(){
    MediaMemberBean mMebBean = mmDAO.magazineRequestFormInfoFromDB(mmBean.getUserName());
    mmBean.setMagzineName(mMebBean.getMagzineName());
    mmBean.setMagzineWebsite(mMebBean.getMagzineWebsite());
    mmBean.setMagzineCity(mMebBean.getMagzineCity());
    mmBean.setMagzineState(mMebBean.getMagzineState());
    mmBean.setMagzineContactName(mMebBean.getMagzineContactName());
    mmBean.setMagzineContactNo(mMebBean.getMagzineContactNo());
    mmBean.setMagzineContactEmail(mMebBean.getMagzineContactEmail());
    mmBean.setMagzineReach(mMebBean.getMagzineReach());
    mmBean.setMagzineDemographics(mMebBean.getMagzineDemographics());
    mmBean.setMagzineAdSlot(mMebBean.getMagzineAdSlot());
    mmBean.setMagzineAdType(mMebBean.getMagzineAdType());
    mmBean.setMagzineAdPrice(mMebBean.getMagzineAdPrice());

    return "success";
}

public String magazineRequestFormSavingAndUpdating(){
    mmDAO.magazineRequestFormSavingAndUpdatingInToDB(mmBean.getUserName(),mmBean.getMagzineName(),mmBean.getMagzineWebsite(),mmBean.getMagzineCity(),mmBean.getMagzineState(),mmBean.getMagzineContactName(),mmBean.getMagzineContactNo(),mmBean.getMagzineContactEmail(),mmBean.getMagzineReach(),mmBean.getMagzineDemographics(),mmBean.getMagzineAdSlot(),mmBean.getMagzineAdType(),mmBean.getMagzineAdPrice());
    return "magazineRequestFormSaving";
}

public String otherMediaRequestFormRedirection(){
    MediaMemberBean mMebBean = mmDAO.otherMediaRequestFormInfoFromDB(mmBean.getUserName());
    mmBean.setOthMediaName(mMebBean.getOthMediaName());
    mmBean.setOthMediaWebsite(mMebBean.getOthMediaWebsite());
    mmBean.setOthMediaCity(mMebBean.getOthMediaCity());
    mmBean.setOthMediaState(mMebBean.getOthMediaState());
    mmBean.setOthMediaContactName(mMebBean.getOthMediaContactName());
    mmBean.setOthMediaContactNumber(mMebBean.getOthMediaContactNumber());
    mmBean.setOthMediaEmail(mMebBean.getOthMediaEmail());
    mmBean.setOthMediaReach(mMebBean.getOthMediaReach());
    mmBean.setOthMediaDemographics(mMebBean.getOthMediaDemographics());
    mmBean.setOthMediaAdSlots(mMebBean.getOthMediaAdSlots());
    return "success";
}

public String otherMediaRequestFormSavingAndUpdating(){
    mmDAO.othMediaRequestFormSavingAndUpdatingInToDB(mmBean.getUserName(),mmBean.getOthMediaName(),mmBean.getOthMediaWebsite(),mmBean.getOthMediaCity(),mmBean.getOthMediaState(),mmBean.getOthMediaContactName(),mmBean.getOthMediaContactNumber(),mmBean.getOthMediaEmail(),mmBean.getOthMediaReach(),mmBean.getOthMediaDemographics(),mmBean.getOthMediaAdSlots());
    return "otherMediaRequestFormSaving";
}


}