package com.example.huzhou.entity.power;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-04 12:36
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public class PowerZXYGDNView {

    float pZXYGDN;
    String time;

    public PowerZXYGDNView() {
    }

    public PowerZXYGDNView(float pZXYGDN, String time) {
        this.pZXYGDN = pZXYGDN;
        this.time = time;
    }

    public float getpZXYGDN() {
        return pZXYGDN;
    }

    public void setpZXYGDN(float pZXYGDN) {
        this.pZXYGDN = pZXYGDN;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "PowerZXYGDNView{" +
                "pZXYGDN=" + pZXYGDN +
                ", time='" + time + '\'' +
                '}';
    }
}
