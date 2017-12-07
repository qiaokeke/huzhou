package com.example.huzhou.service.impl;

import com.example.huzhou.entity.PowerInfoDH;
import com.example.huzhou.mapper.test2.PowerInfoDaoDH;
import com.example.huzhou.service.PowerInfoServiceDH;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Raytine on 2017/9/11.
 */
@Service
public class PowerInfoServiceDHImpl implements PowerInfoServiceDH{
    @Autowired
    PowerInfoDaoDH powerInfoDaoDH;
    @Override
    public String getItemID(int pCode) {
        return powerInfoDaoDH.selectItemID(pCode);
    }

    @Override
    public List<PowerInfoDH> getSsValueById(String itemID) {
        return powerInfoDaoDH.selectSsValueById(itemID);
    }

    @Override
    public List<PowerInfoDH> getTimeCalendar(String itemID, String time) {
        return powerInfoDaoDH.selectTimeCalendar(itemID, time);
    }

    @Override
    public List<PowerInfoDH> getTimeConsumption(String itemID, String time) {
        return powerInfoDaoDH.selectTimeConsumption(itemID, time);
    }

    @Override
    public List<PowerInfoDH> getJFGConsumption(String itemID, String time) {
        return powerInfoDaoDH.selectJFGConsumption(itemID, time);
    }

    @Override
    public List<PowerInfoDH> getTargetValue(String itemID) {
        return powerInfoDaoDH.selectTargetValue(itemID);
    }

    @Override
    public List<PowerInfoDH> getZJFGConsumption(String itemID, String time) {
        return powerInfoDaoDH.selectZJFGConsumption(itemID, time);
    }

    @Override
    public List<PowerInfoDH> getElecInfo(String itemID, String time) {
        return powerInfoDaoDH.selectElecInfo(itemID, time);
    }

    @Override
    public List<PowerInfoDH> getCompareInfo(String itemID, String time) {
        return powerInfoDaoDH.selectCompareInfo(itemID,time);
    }

    @Override
    public List<PowerInfoDH> getAllEConsumption() {
        return powerInfoDaoDH.selectAllEConsumption();
    }

    @Override
    public Double getCoalByYear() {
        return powerInfoDaoDH.selectCoalByYear();
    }

    @Override
    public List<PowerInfoDH> getTodayList(String itemID) {
        return powerInfoDaoDH.selectTodayList(itemID);
    }

    @Override
    public List<PowerInfoDH> getTodayListAll(String itemID) {
        return powerInfoDaoDH.selectTodayListAll(itemID);
    }
}
