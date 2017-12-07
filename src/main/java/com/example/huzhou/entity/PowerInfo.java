package com.example.huzhou.entity;

/**
 * Created by Raytine on 2017/8/20.
 * 实体类
 */
public class PowerInfo {
    private int pId;
    private int pCode;
    private String pTime;//time类型的处理
    private float pBYKwhZ;   // 总有功电能
    private float pBYKwhJ;  //  尖
    private float pBYKwhF;  // 峰
    private float pBYKwhG;  // 谷

    private float pLydn;


    public float getpBYKwhZ() {
        return pBYKwhZ;
    }

    public void setpBYKwhZ(float pBYKwhZ) {
        this.pBYKwhZ = pBYKwhZ;
    }

    public float getpBYKwhJ() {
        return pBYKwhJ;
    }

    public void setpBYKwhJ(float pBYKwhJ) {
        this.pBYKwhJ = pBYKwhJ;
    }

    public float getpBYKwhF() {
        return pBYKwhF;
    }

    public void setpBYKwhF(float pBYKwhF) {
        this.pBYKwhF = pBYKwhF;
    }

    public float getpBYKwhG() {
        return pBYKwhG;
    }

    public void setpBYKwhG(float pBYKwhG) {
        this.pBYKwhG = pBYKwhG;
    }

    public float getpLydn(){
        return pLydn;
    }
    public void setpLydn(float lydn){
        this.pLydn = lydn;
    }
    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getpCode() {
        return pCode;
    }

    public void setpCode(int pCode) {
        this.pCode = pCode;
    }


    public String getpTime() {
        return pTime;
    }

    public void setpTime(String pTime) {
        this.pTime = pTime;
    }

    @Override
    public String toString() {
        return "id:'"+pId+"',pBYKwhZ:'"+pBYKwhZ+
                "',pCode':"+pCode
                +",pTime:"+pTime+",pBYKwhJ:"+pBYKwhJ+"'";
    }
}
