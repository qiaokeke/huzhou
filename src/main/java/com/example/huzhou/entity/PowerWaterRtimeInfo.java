package com.example.huzhou.entity;

import com.example.huzhou.util.BeiLvUtil;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2017-12-21 16:20
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public class PowerWaterRtimeInfo {

    int pCode;
    String eName;
    float consumption;
    String time;
    float water;

    public PowerWaterRtimeInfo() {
    }

    public PowerWaterRtimeInfo(int pCode, String eName, float consumption, String time, float water) {
        this.pCode = pCode;
        this.eName = eName;
        this.consumption = consumption;
        this.time = time;
        this.water = water;
    }

    public int getpCode() {
        return pCode;
    }

    public void setpCode(int pCode) {
        this.pCode = pCode;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public float getConsumption() {

        return consumption;
    }

    public void setConsumption(float consumption) {
        this.consumption = consumption;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public float getWater() {
        return water;
    }

    public void setWater(float water) {
        this.water = water;
    }

    @Override
    public String toString() {
        return "PowerWaterRtimeInfo{" +
                "pCode=" + pCode +
                ", eName='" + eName + '\'' +
                ", consumption=" + consumption +
                ", time='" + time + '\'' +
                ", water=" + water +
                '}';
    }
}
