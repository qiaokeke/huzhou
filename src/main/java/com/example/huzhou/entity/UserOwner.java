package com.example.huzhou.entity;

/**
 * Created by Raytine on 2017/8/25.
 * 一个实体类对应多张表。？
 * 用户-----厂房表
 */

public class UserOwner {
    private int id;
    private Integer userId;
    private String aCode;
    private String aEname;
    private String oType;

    public String getaEname(){
        return aEname;
    }
    public void setaEname(String name){
        this.aEname = name;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getaCode() {
        return aCode;
    }

    public void setaCode(String aCode) {
        this.aCode = aCode;
    }

    public void setoType(String oType) {
        this.oType = oType;
    }

    public String getoType() {
        return oType;
    }
}
