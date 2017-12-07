package com.example.huzhou.entity;

/**
 * Created by Raytine on 2017/9/4.
 */
public class SsjcMapInfo {
    /* vo.set("factoryNumber",info.getaCode());//acode
            vo.set("companyName", info.getaEname());//公司名
            vo.set("electricity", String.valueOf(currElectric));//点表信息
            vo.set("water", String.valueOf(readings));//水表信息
            vo.set("energyState","正常");*/
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

    public float getElectricity() {
        return electricity;
    }

    public void setElectricity(float electricity) {
        this.electricity = electricity;
    }

    public Double getWater() {
        return water;
    }

    public void setWater(Double water) {
        this.water = water;
    }

    public String getEnergyState() {
        return energyState;
    }

    public void setEnergyState(String energyState) {
        this.energyState = energyState;
    }
}
