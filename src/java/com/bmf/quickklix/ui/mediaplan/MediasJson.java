/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.ui.mediaplan;

import com.bmf.quickklix.core.dao.MediasDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.StrutsStatics;
import java.util.*;
import org.apache.log4j.Logger;

/**
 *
 * @author murthyk
 */

public class MediasJson {
    Logger log=Logger.getLogger(MediasJson.class);
     MediasDAO mdDAO = new MediasDAO();
     String jsonRequest;
     String jsonResponse;

public String getJsonRequest() {
     return jsonRequest;
}

public void setJsonRequest(String jsonRequest) {
     this.jsonRequest = jsonRequest;
}

public String getJsonResponse() {
     return jsonResponse;
}

public void setJsonResponse(String jsonResponse) {
     this.jsonResponse = jsonResponse;
}

public String toJSON(List list) {
         StringBuffer strBuf = new StringBuffer();
         strBuf.append("{");
         boolean isFirstCat = true;
         for(int i =0;i<list.size(); i++){
         String Value=list.get(i).toString();

             if(isFirstCat)
             {
                 isFirstCat = false;
             } else
             {
                 strBuf.append(",");
             }
             boolean isFirst = true;
             strBuf.append("\'").append(Value).append("\'");
              }

         strBuf.append("}");
         return strBuf.toString();
     }

}
