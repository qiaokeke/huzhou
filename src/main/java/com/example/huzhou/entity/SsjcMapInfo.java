package com.example.huzhou.entity;

import com.example.huzhou.util.BeiLvUtil;

/**
 * Created by Raytine on 2017/9/4.
 */
public class SsjcMapInfo {
    /* vo.set("factoryNumber",info.getaCode());//acode
            vo.set("companyName", info.getaEname());//公司名
            vo.set("electricity", String.valueOf(currElectric));//点表信息
            vo.set("water", String.valueOf(readings));//水表信息
            vo.set("energyState","正常");*/
    private int pCode;
    private String factoryNumber;
    private String companyName;
    private float electricity;
    private Double water;
    private String energyState;

    public String getFactoryNumber() {
        return factoryNumber;
    }

    public void setFactoryNumber(String factoryNumber) {
        this.factoryNumber = factoryNumber;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public int getpCode() {
        return pCode;
    }

    public void setpCode(int pCode) {
        this.pCode = pCode;
    }

    public float getElectricity() {
        return electricity* BeiLvUtil.BEILVTABLE[pCode];
    }

    public void setElectricity(float electricity) {
        this.electricity = electricity;
    }

    public Double getWater() {
        if(water==null)
            return 0.0;
        return water;
    }

    public void setWater(Double water) {
        this.water = water;
    }

    public String getEnergyState() {

        return "正常";
    }

    public void setEnergyState(String energyState) {
        this.energyState = energyState;
    }
}
