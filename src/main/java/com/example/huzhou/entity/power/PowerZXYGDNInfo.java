package com.example.huzhou.entity.power;

import com.example.huzhou.util.BeiLvUtil;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-03 22:03
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public class PowerZXYGDNInfo {

    String pCode;
    float pZXYGDN;
    String pTime;

    public PowerZXYGDNInfo() {
    }

    public PowerZXYGDNInfo(String pCode, float pZXYGDN, String pTime) {
        this.pCode = pCode;
        this.pZXYGDN = pZXYGDN;
        this.pTime = pTime;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public float getpZXYGDN() {
        return pZXYGDN* BeiLvUtil.BEILVTABLE[Integer.parseInt(pCode)];
    }

    public void setpZXYGDN(float pZXYGDN) {
        this.pZXYGDN = pZXYGDN;
    }

    public String getpTime() {
        return pTime;
    }

    public void setpTime(String pTime) {
        this.pTime = pTime;
    }

    @Override
    public String toString() {
        return "PowerZXYGDNInfo{" +
                "pCode='" + pCode + '\'' +
                ", pZXYGDN='" + pZXYGDN + '\'' +
                ", pTime='" + pTime + '\'' +
                '}';
    }
}
