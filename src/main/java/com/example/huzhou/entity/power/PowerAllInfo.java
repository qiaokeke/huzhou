package com.example.huzhou.entity.power;

import com.example.huzhou.util.BeiLvUtil;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-09 14:55
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public class PowerAllInfo {

    int id;
    float AdianLiu;
    float BdianLiu;
    float CdianLiu;
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
    String time;

    public PowerAllInfo() {
    }

    public PowerAllInfo(int id, float adianLiu, float bdianLiu, float cdianLiu, float dianYa, String aCode, String eName, float zdn, float multiple, float yggl, float glys, float gdn, float fdn, float jdn, float pdn, String time) {
        this.id = id;
        AdianLiu = adianLiu;
        BdianLiu = bdianLiu;
        CdianLiu = cdianLiu;
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
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getAdianLiu() {
        return AdianLiu;
    }

    public void setAdianLiu(float adianLiu) {
        AdianLiu = adianLiu;
    }

    public float getBdianLiu() {
        return BdianLiu;
    }

    public void setBdianLiu(float bdianLiu) {
        BdianLiu = bdianLiu;
    }

    public float getCdianLiu() {
        return CdianLiu;
    }

    public void setCdianLiu(float cdianLiu) {
        CdianLiu = cdianLiu;
    }

    public float getDianYa() {
        return dianYa;
    }

    public void setDianYa(float dianYa) {
        this.dianYa = dianYa;
    }

    public String getaCode() {
        return aCode;
    }

    public void setaCode(String aCode) {
        this.aCode = aCode;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public float getZdn() {
        return zdn*BeiLvUtil.BEILVTABLE[id];
    }

    public void setZdn(float zdn) {
        this.zdn = zdn;
    }

    public float getMultiple() {
        return BeiLvUtil.BEILVTABLE[id];
    }

    public void setMultiple(float multiple) {
        this.multiple = multiple;
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "PowerAllInfo{" +
                "id=" + id +
                ", AdianLiu=" + AdianLiu +
                ", BdianLiu=" + BdianLiu +
                ", CdianLiu=" + CdianLiu +
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
                ", time='" + time + '\'' +
                '}';
    }
}
