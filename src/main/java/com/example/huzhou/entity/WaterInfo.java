package com.example.huzhou.entity;

/**
 * Created by Raytine on 2017/9/1.
 */
public class WaterInfo {
    private int id;
    private String address;
    private String readings;
    private String time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReadings() {
        return readings;
    }

    public void setReadings(String readings) {
        this.readings = readings;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "WaterInfo{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", readings='" + readings + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
