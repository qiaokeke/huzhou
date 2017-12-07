package com.example.huzhou.service;

import com.example.huzhou.entity.BasePowerInfo;
import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.entity.PowerTotalInfo;
import com.example.huzhou.entity.WaterInfo;
import org.apache.ibatis.annotations.Param;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;

import java.util.List;

/**
 * Created by Raytine on 2017/8/27.
 */
public interface PowerInfoService {
    List<PowerTotalInfo> getTop5TotalPowerInfo();

    List<WaterInfo> getWaterPerHour(String category,String aCode);
    List<PowerInfo> selectTimeCalendar(int code,String time);
    List<PowerInfo> selectTimeConsumption(int code,String time);
    List<PowerInfo> getValleyData(int code,String time);

    List<PowerInfo> getConsumption(String category,int code,String time);
    List<PowerInfo> getElectricInfo(String category,int code,String time);
    List<PowerInfo> getElectricState(String category,int code,String time);
    List<PowerInfo> getElectricCompare(String category,int code,String time);
    List<PowerInfo> getElectricIndex(String category,int code,String time);
    List<PowerInfo> getWarningConsumption( String category, int pCode, String time);
    List<PowerInfo> getEletricSsjc( int pCode); //实时监测
    Double getCurrElectric(int pCode);//地图上显示
    List<PowerInfo> getCurrElectricForAll( );//地图上显示 全部

    List<PowerInfo> getElecByMonth(@Param("pCode") int pCode); //能耗目标的电能，按月份查找

    List<BasePowerInfo>   getConsumptionByToday(); //管理页面的今日能耗列表
}
