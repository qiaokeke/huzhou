package com.example.huzhou.entity;

import com.example.huzhou.util.BeiLvUtil;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2017-12-11 9:41
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public class PowerListInfo {
    int id;
    float dianLiu;
    float dianYa;
    String aCode;
    String eName;
    float zdn;
    float multiple;
    float yggl;
    float glys;
    float gdn;
    float fdn;
    float jdn;
    float pdn;
    float zgl;
    String time;

    public PowerListInfo() {
    }

    public PowerListInfo(int id, float dianLiu, float dianYa, String aCode, String eName, float zdn, float multiple, float yggl, float glys, float gdn, float fdn, float jdn, float pdn, float zgl, String time) {
        this.id = id;
        this.dianLiu = dianLiu;
        this.dianYa = dianYa;
        this.aCode = aCode;
        this.eName = eName;
        this.zdn = zdn;
        this.multiple = multiple;
        this.yggl = yggl;
        this.glys = glys;
        this.gdn = gdn;
        this.fdn = fdn;
        this.jdn = jdn;
        this.pdn = pdn;
        this.zgl = zgl;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getDianLiu() {
        return dianLiu;
    }

    public void setDianLiu(float dianLiu) {
        this.dianLiu = dianLiu;
    }

    public float getDianYa() {
        return dianYa;
    }

    public void setDianYa(float dianYa) {
        this.dianYa = dianYa;
    }

    public String getaCode() {
        if(aCode==null) aCode="";
        return aCode;
    }

    public void setaCode(String aCode) {
        this.aCode = aCode;
    }

    public String geteName() {
        if(eName==null) eName = "";

        return getaCode()+":"+eName;
    }
    public void seteName(String eName) {
        this.eName = eName;
    }

    public float getZdn() {
        return zdn*getMultiple();
    }

    public void setZdn(float zdn) {
        this.zdn = zdn;
    }

    public float getMultiple() {
        return BeiLvUtil.BEILVTABLE[id];
    }

    public void setMultiple(float multiple) {
        this.multiple = 1;
    }

    public float getYggl() {
        return yggl;
    }

    public void setYggl(float yggl) {
        this.yggl = yggl;
    }

    public float getGlys() {
        return glys;
    }

    public void setGlys(float glys) {
        this.glys = glys;
    }

    public float getGdn() {
        return gdn;
    }

    public void setGdn(float gdn) {
        this.gdn = gdn;
    }

    public float getFdn() {
        return fdn;
    }

    public void setFdn(float fdn) {
        this.fdn = fdn;
    }

    public float getJdn() {
        return jdn;
    }

    public void setJdn(float jdn) {
        this.jdn = jdn;
    }

    public float getPdn() {
        return pdn;
    }

    public void setPdn(float pdn) {
        this.pdn = pdn;
    }

    public float getZgl() {
        return zgl;
    }

    public void setZgl(float zgl) {
        this.zgl = zgl;
    }

    public String getTime() {
        if(time==null)
            return "设备离线";
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "PowerListInfo{" +
                "id=" + id +
                ", dianLiu=" + dianLiu +
                ", dianYa=" + dianYa +
                ", aCode='" + aCode + '\'' +
                ", eName='" + eName + '\'' +
                ", zdn=" + zdn +
                ", multiple=" + multiple +
                ", yggl=" + yggl +
                ", glys=" + glys +
                ", gdn=" + gdn +
                ", fdn=" + fdn +
                ", jdn=" + jdn +
                ", pdn=" + pdn +
                ", zgl=" + zgl +
                ", time='" + time + '\'' +
                '}';
    }
}
