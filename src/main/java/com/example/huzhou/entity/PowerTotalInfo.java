package com.example.huzhou.entity;

import com.example.huzhou.util.BeiLvUtil;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2017-12-07 19:28
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public class PowerTotalInfo {
    int pCode;
    String companyName;
    float pZXYGDN;


    public PowerTotalInfo() {
    }

    public PowerTotalInfo(int id, String companyName, float pZCYGDN) {
        this.companyName = companyName;
        this.pZXYGDN = pZCYGDN;
    }


    public void setpCode(int pCode) {
        this.pCode = pCode;
    }



    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public float getpZXYGDN() {
        return pZXYGDN* BeiLvUtil.BEILVTABLE[pCode];
    }

    public void setpZXYGDN(float pZCYGDN) {
        this.pZXYGDN = pZCYGDN;
    }

    @Override
    public String toString() {
        return "PowerTotalInfo{" +
                "pCode=" + pCode +
                ", companyName='" + companyName + '\'' +
                ", pZXYGDN=" + getpZXYGDN() +
                '}';
    }
}
