/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.reports;

import com.bmf.quickklix.ui.util.EmailSending;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */
public class ReportsAction extends ActionSupport implements ModelDriven {
    Logger log = Logger.getLogger(ReportsAction.class);
    ReportsBean rpBean = new ReportsBean();

public Object getModel() {
    return rpBean;
    }

    @Override
public String execute(){
        return "success";
    }

}