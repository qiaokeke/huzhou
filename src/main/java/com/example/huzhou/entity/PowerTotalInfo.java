package com.example.huzhou.entity;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2017-12-07 19:28
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public class PowerTotalInfo {
    String companyName;
    float pZXYGDN;

    public PowerTotalInfo() {
    }

    public PowerTotalInfo(int id, String companyName, float pZCYGDN) {
        this.companyName = companyName;
        this.pZXYGDN = pZCYGDN;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public float getpZXYGDN() {
        return pZXYGDN;
    }

    public void setpZXYGDN(float pZCYGDN) {
        this.pZXYGDN = pZCYGDN;
    }

    @Override
    public String toString() {
        return "PowerTotalInfo{" +
                ", companyName='" + companyName + '\'' +
                ", pZXYGDN=" + pZXYGDN +
                '}';
    }
}
