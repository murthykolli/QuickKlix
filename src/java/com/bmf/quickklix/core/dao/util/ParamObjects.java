/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bmf.quickklix.core.dao.util;

/**
 *
 * @author narayanak
 */
import java.sql.ResultSet;

import java.sql.Blob;
import java.sql.Timestamp;
import java.math.BigDecimal;



/**
 * the ParamObjects class is specially used for DAO general function
 * in order to make dao function handle any no of parameters
 * and to return any type of value
 *
 */
public class ParamObjects {

    public String   DTYPE = null;

    public String STRING= null;
    public Integer INTEGER = null;
    java.sql.Date SQLDATE=null;
    public Double DOUBLE = null;
    public Float FLOAT = null;
    public Long LONG = null;
    public Blob BLOB = null;
    public Timestamp TIMESTAMP = null;
    public Boolean BOOLEAN = null;
    public Byte BYTE = null;
    public ResultSet RESULTSET = null;
    public BigDecimal BIGDECIMAL = null;

    //for holding attribute values returned
    // by queries
    public ParamObjects() {
    }
    //this constructor specially holds
    //return type datatype

    public ParamObjects(String dtype) {
        this.DTYPE = dtype;
    }
    //all remaing constructors
    //initialises different datatype values

    public ParamObjects(String dtype, String str) {
        this.DTYPE = dtype;
        this.STRING = str;
    }

    public ParamObjects(String dtype, Integer intVal) {
        this.DTYPE = dtype;
        this.INTEGER = intVal;
    }

    public ParamObjects(String dtype, java.sql.Date sqldate) {
        this.DTYPE = dtype;
        this.SQLDATE = sqldate;
    }

    public ParamObjects(String dtype, Double dblVal) {
        this.DTYPE = dtype;
        this.DOUBLE = dblVal;
    }

    public ParamObjects(String dtype, Float fltVal) {
        this.DTYPE = dtype;
        this.FLOAT = fltVal;
    }

    public ParamObjects(String dtype, Long lngVal) {
        this.DTYPE = dtype;
        this.LONG = lngVal;
    }

    public ParamObjects(String dtype, Blob blbVal) {
        this.DTYPE = dtype;
        this.BLOB = blbVal;
    }

    public ParamObjects(String dtype, Timestamp tmstmpVal) {
        this.DTYPE = dtype;
        this.TIMESTAMP = tmstmpVal;
    }

    public ParamObjects(String dtype, Boolean blnVal) {
        this.DTYPE = dtype;
        this.BOOLEAN = blnVal;
    }

    public ParamObjects(String dtype, Byte byteVal) {
        this.DTYPE = dtype;
        this.BYTE = byteVal;
    }

    public ParamObjects(String dtype, ResultSet resSet) {
        this.DTYPE = dtype;
        this.RESULTSET = resSet;
    }

    public ParamObjects(String dtype, BigDecimal bigDec) {
        this.DTYPE = dtype;
        this.BIGDECIMAL = bigDec;
    }
}
