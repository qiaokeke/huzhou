package com.example.huzhou.entity;

/**
 * Created by Raytine on 2017/9/11.
 */
public class PowerInfoDH {
    private String meterId;
    private String readTime;
    private Double valueDn;  // 电能


    public String getReadTime() {
        return readTime;
    }

    public void setReadTime(String readTime) {
        this.readTime = readTime;
    }

    public Double getValueDn() {
        return valueDn;
    }

    public void setValueDn(Double valueDn) {
        this.valueDn = valueDn;
    }

    public void setMeterId(String meterId) {
        this.meterId = meterId;
    }

    public String getMeterId() {
        return meterId;
    }
}
