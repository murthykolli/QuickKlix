/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao.util;

import java.util.*;

import com.bmf.quickklix.ui.targetmarket.TargetMarketStatesBean;
import java.io.IOException;
import net.spy.memcached.MemcachedClient;
import java.util.StringTokenizer;
import java.util.zip.CRC32;
import java.util.zip.Checksum;
import org.apache.log4j.Logger;
/**
 *
 * @author Murthy K
 */
public class TMUtil {
    static Logger log = Logger.getLogger(TMUtil.class);
    
public static String generateSQL(String state, String groupBy, Map<String, String[]> dmMap) {
    if(dmMap.containsKey(groupBy)){
    dmMap.remove(groupBy);
    }
    boolean first = true;
    StringBuilder strBuf = new StringBuilder();
    boolean hasMore = dmMap.size() > 0;
    int catCount = dmMap.size();
    int stateCount = state.length();
    
    if(catCount == 0 && stateCount == 191){
    strBuf.append("SELECT s.\"Puma_Code\",")
    .append("o.\"count\",s.\"Attribute_Name\" from \"TM\".\"Puma_Attribute_Codes\" s ")
    .append("LEFT OUTER JOIN (");
    strBuf.append("SELECT \"Puma_Code\",sum(\"Count\") AS \"count\" FROM \"TM\".\"Aggregate_All_States")
    .append("\" ");
    strBuf.append("WHERE \"Dimension_Name\" IN (").append("'").append(groupBy).append("')");

    strBuf.append(" GROUP BY \"Puma_Code\" ").append(") o ON ")
    .append("s.\"Puma_Code\" = o.\"Puma_Code\" ")
    .append("WHERE s.\"Dimension_Name\" = ").append("\'").append(groupBy).append("\' and o.\"count\" notnull ")
    .append("order by s.\"Puma_Code\"");
    } 

    else if(catCount == 0 && stateCount > 0){
    strBuf.append("SELECT s.\"Puma_Code\",")
    .append("o.\"count\",s.\"Attribute_Name\" from \"TM\".\"Puma_Attribute_Codes\" s ")
    .append("LEFT OUTER JOIN (");

    strBuf.append("SELECT \"Puma_Code\",sum(\"Count\") AS \"count\" FROM \"TM\".\"Aggregate")
    .append("\" ");
    strBuf.append("WHERE \"Dimension_Name\" IN (").append("'").append(groupBy).append("') and \"Puma_State_Code\" IN (").append(state).append(")");

    strBuf.append(" GROUP BY \"Puma_Code\" ").append(") o ON ")
    .append("s.\"Puma_Code\" = o.\"Puma_Code\" ")
    .append("WHERE s.\"Dimension_Name\" = ").append("\'").append(groupBy).append("\' and o.\"count\" notnull ")
    .append("order by s.\"Puma_Code\" ");
    }

    else{
    strBuf.append("SELECT s.\"Puma_Code\",")
    .append("o.\"count\",s.\"Attribute_Name\" from \"TM\".\"Puma_Attribute_Codes\" s ")
    .append("LEFT OUTER JOIN (");

    strBuf.append("SELECT \"")
    .append(groupBy)
    .append("\", COUNT(\"Unique_No\") AS \"count\" FROM \"TM\".\"Puma_Data")
    .append("\" ");

    if(hasMore) {
    strBuf.append("WHERE \"State\" IN (").append(state).append(")");
    for (Map.Entry<String,String[]> entry : dmMap.entrySet()) {
    String key = entry.getKey();
    String[] value = entry.getValue();
    if(value.length > 0) {
    strBuf.append(" AND (");
    boolean firstVal = true;
    for (String colValue : value) {
    if(colValue != null && !colValue.isEmpty() && !colValue.equals("null")) {
    if(!firstVal) {
    strBuf.append(" OR ");
    } else {
    firstVal = false;
    }
    strBuf.append("(\"").append(key).append("\"=").append(colValue).append(")");
    } }
    strBuf.append(" ) ");
    }
    first = false;
    } }
    else{
    strBuf.append("WHERE \"State\" IN (").append(state).append(")");
    }
    
    strBuf.append(" GROUP BY ").append("\"").append(groupBy).append("\") o ON ")
    .append("s.\"Puma_Code\" = o.").append("\"").append(groupBy).append("\" ")
    .append("WHERE s.\"Dimension_Name\" = ").append("\'").append(groupBy).append("\' and o.\"count\" notnull ")
    .append("order by s.\"Puma_Code\" ");
    }
//    log.info("Mouse over V alues SSSSSSSSSSSSSSSSSSSSSSSSSSS   "+strBuf.toString());
    return strBuf.toString();
}

public static String generateGroupBySQL(String state, String groupBy, Map<String, String[]> dmMap) { 
    String[] groupVals = dmMap.get(groupBy);
    StringBuilder strBuf = new StringBuilder();
    int stateCount = state.length();
    
    if(stateCount == 191) {
    strBuf.append("SELECT sum(\"Count\") FROM \"TM\".\"Aggregate_All_States")
    .append("\" ");
    strBuf.append(" WHERE \"Dimension_Name\" IN (").append("'").append(groupBy).append("')");
    if(groupVals != null && groupVals.length > 0) {
    strBuf.append(" AND  (");
    boolean firstVal = true;
    for (String colValue : groupVals) {
    if(colValue != null && !colValue.isEmpty() && !colValue.equals("null")) {
    if(!firstVal) {
    strBuf.append(" OR ");
    } else {
    firstVal = false;
    }
    strBuf.append("(\"Puma_Code").append("\"=").append(colValue).append(")");
    } } }
    strBuf.append(");");
    }

    else{
    strBuf.append("SELECT sum(\"Count\") FROM \"TM\".\"Aggregate")
    .append("\" ");
    strBuf.append(" WHERE \"Dimension_Name\" IN (").append("'").append(groupBy).append("') and \"Puma_State_Code\" IN (").append(state).append(")");
    if(groupVals != null && groupVals.length > 0) {
    strBuf.append(" AND  (");
    boolean firstVal = true;
    for (String colValue : groupVals) {
    if(colValue != null && !colValue.isEmpty() && !colValue.equals("null")) {
    if(!firstVal) {
    strBuf.append(" OR ");
    } else {
    firstVal = false;
    }
    strBuf.append("(\"Puma_Code").append("\"=").append(colValue).append(")");
    } } }
    strBuf.append(");");
    }
//              log.info("Table TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTtt  "+strBuf.toString());
    return strBuf.toString();
}

public static String generateGroupByAllSQL(String state, String groupBy, Map<String, String[]> dmMap) {
    boolean first = true;
    StringBuilder strBuf = new StringBuilder();
    boolean hasMore = dmMap.size() > 0;
    int catCount = dmMap.size();
    int stateCount = state.length();
    
    if(catCount == 1 && stateCount == 191){
    strBuf.append("SELECT \"Puma_Code\",\"Count\" FROM \"TM\".\"Aggregate_All_States")
    .append("\" ");
    strBuf.append(" WHERE \"Dimension_Name\" IN (").append("'").append(groupBy).append("')");
    for (Map.Entry<String,String[]> entry : dmMap.entrySet()) {
    String key = entry.getKey();
    String[] value = entry.getValue();

    if(value.length > 0) {
    strBuf.append(" AND (");
    boolean firstVal = true;
    for (String colValue : value) {
    if(colValue != null && !colValue.isEmpty() && !colValue.equals("null")) {
    if(!firstVal) {
    strBuf.append(" OR ");
    } else {
    firstVal = false;
    }
    strBuf.append("(\"Puma_Code").append("\"=").append(colValue).append(")");
    } }
    if(!first)
    strBuf.append(" ) ");
    }
    first = false;
    }
    strBuf.append(" ) ");
    }

    else if(catCount == 1 && stateCount > 0){
    strBuf.append("SELECT \"Puma_Code\",sum(\"Count\") AS \"count\" FROM \"TM\".\"Aggregate")
    .append("\"");
    strBuf.append(" WHERE \"Dimension_Name\" IN (").append("'").append(groupBy).append("') and \"Puma_State_Code\" IN (").append(state).append(")");
    for (Map.Entry<String,String[]> entry : dmMap.entrySet()) {
    String key = entry.getKey();
    String[] value = entry.getValue();

    if(value.length > 0) {
    strBuf.append(" AND (");
    boolean firstVal = true;
    for (String colValue : value) {
    if(colValue != null && !colValue.isEmpty() && !colValue.equals("null")) {
    if(!firstVal) {
    strBuf.append(" OR ");
    } else {
    firstVal = false;
    }
    strBuf.append("(\"Puma_Code").append("\"=").append(colValue).append(")");
    } }
    if(!first)
    strBuf.append(" )");
    }
    first = false;
    }
    strBuf.append(" )");
    strBuf.append(" GROUP BY \"Puma_Code\"");
    strBuf.append(" order by \"Puma_Code\"");
    }

    else{
    strBuf.append("SELECT \"")
    .append(groupBy)
    .append("\", COUNT(\"Unique_No\") AS \"count\" FROM \"TM\".\"Puma_Data")
    .append("\"");
    if(hasMore) {
    strBuf.append(" WHERE \"State\" IN (").append(state).append(")");
    for (Map.Entry<String,String[]> entry : dmMap.entrySet()) {
    String key = entry.getKey();
    String[] value = entry.getValue();

    if(value.length > 0) {
    strBuf.append(" AND (");
    boolean firstVal = true;
    for (String colValue : value) {
    if(colValue != null && !colValue.isEmpty() && !colValue.equals("null")) {
    if(!firstVal) {
    strBuf.append(" OR ");
    } else {
    firstVal = false;
    }
    strBuf.append("(\"").append(key).append("\"=").append(colValue).append(")");
    } }
    strBuf.append(" )");
    }
    first = false;
    }
    } else{
    strBuf.append(" WHERE \"State\" IN (").append(state).append(")");
    }
    strBuf.append(" AND ").append("\"").append(groupBy).append("\"  is not null");
    strBuf.append(" GROUP BY ").append("\"").append(groupBy).append("\"")
    .append(" order by ").append("\"").append(groupBy).append("\"");
    }
//    log.info("Combination Values KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKkkk  "+strBuf.toString());
    return strBuf.toString();
}
    
public static Map<String, String> lookupCacheJSON(String stateCodes, String type, Map<String, String[]> map, int isLast,int grp) throws IOException {
    Map<String, String> ret = new HashMap<String, String>();
    String key = TMUtil.getCacheKey(stateCodes,type,map, isLast);
    try {           
    MemcachedClient c = MemcacheClient.getInstance();
    Object retObject = c.get(key);
    ret = (retObject != null) ? (Map<String, String>)retObject : null;
    } catch (Exception ex){
    }
    return ret;
}

public static void addToCacheJSON(String stateCodes, String type, Map<String, String[]> dataMap, Map<String, String> results, int isLast) {
    String key = TMUtil.getCacheKey(stateCodes, type, dataMap, isLast);
    try {
    MemcachedClient c = MemcacheClient.getInstance();
    c.set(key, 3600, results);
    } catch (Exception ex) {
    }
}

public static String getCacheKey(String state, String groupBy, Map<String, String[]> map, int isLast) {
    state = state.replaceAll(", ", ",");
    StringBuilder strBuf = new StringBuilder();
    boolean firstVal = true;
    strBuf.append(isLast);
    strBuf.append("~").append(state).append("~~").append(groupBy);
    for (Map.Entry<String,String[]> entry : map.entrySet()) {
    firstVal = true;
    strBuf.append('|');
    String key = entry.getKey();
    String[] value = entry.getValue();
    strBuf.append(key);
    strBuf.append(':');
    for (String colValue : value) {
    if(firstVal) {
    firstVal = false;
    } else {
    strBuf.append(',');
    }
    strBuf.append(colValue);
    } }
    String key = strBuf.toString();
    byte bytes[] = key.getBytes();
    Checksum checksum = new CRC32();
    checksum.update(bytes,0,bytes.length);
    key = String.valueOf(checksum.getValue());
    return key;
}

public  Map<Integer,String> SortHashMap(Map<Integer,String> map){
    ValueComparator bvc =  new ValueComparator(map);
    Map<Integer,String> sorted_map = new TreeMap<Integer,String>(bvc);
    System.out.println("unsorted map");
    for (Integer key : map.keySet()) {
    System.out.println("key/value: " + key + "/"+map.get(key));
    }
    sorted_map.putAll(map);
    System.out.println("results");
    for (Integer key : sorted_map.keySet()) {
    System.out.println("key/value: " + key + "/"+sorted_map.get(key));
    }
    return sorted_map;
}

class ValueComparator implements Comparator {
    Map base;
  
public ValueComparator(Map base) {
    this.base = base;
}

public int compare(Object a, Object b) {
    if((Integer)base.get(a) < (Integer)base.get(b)) {
    return 1;
    } else if((Integer)base.get(a) == (Integer)base.get(b)) {
    return 0;
    } else {
    return -1;
    }
    }
}



}