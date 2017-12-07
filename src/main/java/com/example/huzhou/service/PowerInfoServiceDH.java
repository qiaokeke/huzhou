package com.example.huzhou.service;

import com.example.huzhou.entity.PowerInfoDH;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Raytine on 2017/9/11.
 */
public interface PowerInfoServiceDH {
    /**
     * @param pCode 厂房编号，要判断厂房编号
     * @return 查询拼接的id
     */
    String getItemID(int pCode);

    /**
     * @param itemID 传递拼接的id
     * @return 返回当前厂房的今天的数据
     */
    List<PowerInfoDH> getSsValueById(String itemID);

    List<PowerInfoDH> getTimeCalendar( String itemID, String time);

    List<PowerInfoDH> getTimeConsumption(String itemID, String time);

    List<PowerInfoDH> getJFGConsumption(String itemID, String time);

    List<PowerInfoDH> getTargetValue(String itemID);

    List<PowerInfoDH> getZJFGConsumption(String itemID, String time);

    List<PowerInfoDH> getElecInfo(String itemID, String time);

    List<PowerInfoDH> getCompareInfo(String itemID, String time);

    List<PowerInfoDH> getAllEConsumption();

    Double getCoalByYear();

    List<PowerInfoDH> getTodayList(String itemID);

    List<PowerInfoDH> getTodayListAll(String itemID); //like出相同前缀
}
