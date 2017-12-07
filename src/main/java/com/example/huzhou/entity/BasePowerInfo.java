package com.example.huzhou.entity;

/**
 * Created by Raytine on 2017/9/9.
 */
public class BasePowerInfo {

    private float pADianya;
    private float pADianliu;
    private float pBYKwhP;  // 谷
    private float pAYggl;  // 有功功率
    private float pHXYggl;  // 总功率
    private float pAGlys; // 功率因数
    private float pBy2d; // 平

    private PowerInfo powerInfo;

    public float getpBYKwhP() {
        return pBYKwhP;
    }

    public void setpBYKwhP(float pBYKwhP) {
        this.pBYKwhP = pBYKwhP;
    }

    public float getpAYggl() {
        return pAYggl;
    }

    public void setpAYggl(float pAYggl) {
        this.pAYggl = pAYggl;
    }

    public float getpHXYggl() {
        return pHXYggl;
    }

    public void setpHXYggl(float pHXYggl) {
        this.pHXYggl = pHXYggl;
    }

    public float getpAGlys() {
        return pAGlys;
    }

    public void setpAGlys(float pAGlys) {
        this.pAGlys = pAGlys;
    }

    public float getpADianya() {
        return pADianya;
    }

    public void setpADianya(float pADianya) {
        this.pADianya = pADianya;
    }

    public float getpADianliu() {
        return pADianliu;
    }

    public void setpADianliu(float pADianliu) {
        this.pADianliu = pADianliu;
    }

    public float getpBy2d() {
        return pBy2d;
    }

    public void setpBy2d(float pBy2d) {
        this.pBy2d = pBy2d;
    }

    public void setPowerInfo(PowerInfo powerInfo) {
        this.powerInfo = powerInfo;
    }

    public PowerInfo getPowerInfo() {
        return powerInfo;
    }
    /* @Override
        public String toString() {
            return "id:'"+pId+"',pADianliu:'"+pADianliu+
                    "',pADianya':"+pADianya
                    +",pTime:"+pTime+",pBydn:"+pBydn+"'";
        }*/
}
