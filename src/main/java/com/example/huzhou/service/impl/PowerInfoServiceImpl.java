package com.example.huzhou.service.impl;

import com.example.huzhou.entity.BasePowerInfo;
import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.entity.PowerTotalInfo;
import com.example.huzhou.entity.WaterInfo;
import com.example.huzhou.mapper.test1.PowerInfoDao;
import com.example.huzhou.service.PowerInfoService;
import com.example.huzhou.util.BeiLvUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;



 class ComparaPowerTotalInfo implements Comparator{

    @Override
    public int compare(Object o1, Object o2) {
        PowerTotalInfo powerTotalInfo1 = (PowerTotalInfo) o1;
        PowerTotalInfo powerTotalInfo2 = (PowerTotalInfo) o2;
        if (powerTotalInfo1.getpZXYGDN()>powerTotalInfo2.getpZXYGDN())
            return 1;
        return 0;
    }
}

/**
 * Created by Raytine on 2017/8/27.
 */
@Service
public class PowerInfoServiceImpl implements PowerInfoService {
    @Autowired
    PowerInfoDao infoDao;


    @Override
    public List<PowerTotalInfo> getTop5TotalPowerInfo() {
        List<PowerTotalInfo> powerTotalInfoList =  infoDao.selectTop5TotalPower();
        ComparaPowerTotalInfo comparaPowerTotalInfo = new ComparaPowerTotalInfo();
        Collections.sort(powerTotalInfoList,comparaPowerTotalInfo);
        return powerTotalInfoList.subList(0,5);
    }

    @Override
    public List<WaterInfo> getWaterPerHour(String category,String aCode) {
        return infoDao.selectWaterDataPerHour(category,aCode);
    }

    @Override
    public List<PowerInfo> selectTimeCalendar(int code,  String time) {
        return infoDao.selectTimeCalendar(code,time);
    }

    @Override
    public List<PowerInfo> selectTimeConsumption(int code, String time) {
        return infoDao.selectTimeConsumption(code,time);
    }

    @Override
    public List<PowerInfo> getValleyData(int code, String time) {
        return infoDao.selectValleyData(code,time);
    }

    @Override
    public List<PowerInfo> getConsumption(String category, int code, String time) {
        return infoDao.selectConsumption(category, code, time);
    }

    @Override
    public List<PowerInfo> getElectricInfo(String category, int code, String time) {
        return infoDao.selectElectricInfo(category,code,time);
    }

    @Override
    public List<PowerInfo> getElectricState(String category, int code, String time) {
        return infoDao.selectElectricState(category, code, time);
    }

    @Override
    public List<PowerInfo> getElectricCompare(String category, int code, String time) {
        return infoDao.selectElectricCompare(category, code, time);
    }

    @Override
    public List<PowerInfo> getElectricIndex(String category, int code, String time) {
        return infoDao.selectElectricIndex(category, code, time);
    }

    @Override
    public List<PowerInfo> getWarningConsumption(String category, int pCode, String time) {
        return infoDao.selectWarningConsumption(category, pCode, time);
    }

    @Override
    public List<PowerInfo> getEletricSsjc(int pCode) {
        List<PowerInfo> list = infoDao.selectEletricSsjc(pCode);
        //float base = list.get(0).getpBYKwhZ();
        return list;
    }

    @Override
    public Double getCurrElectric(int pCode) {
        return infoDao.selectCurrElectric(pCode);
    }

    @Override
    public List<PowerInfo> getCurrElectricForAll() {
        return infoDao.selectCurrElectricForAll();
    }


    @Override
    public List<PowerInfo> getElecByMonth(int pCode) {
        return infoDao.selectElecByMonth(pCode);
    }

    @Override
    public List<BasePowerInfo> getConsumptionByToday() {
        return infoDao.getConsumptionByToday();
    }

}
