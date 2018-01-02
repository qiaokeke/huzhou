package com.example.huzhou.service;

import com.example.huzhou.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Raytine on 2017/9/3.
 */
public interface UserOwnerService {

    List<PowerWaterRtimeInfo> selectRealTimeInfos();

    List<SsjcMapInfo> selectMapInfo();
    List selectPcodeByAcode( String aCode);
    String getAcodeByPcode(int pCode);
    String selectAcodeByUserId(int userid);
    List<UserOwner> selectCompanyNameById(int id);

    /**
     * 电能标准煤换算，能耗大屏
     * @return
     */
    Double getCoalByYear();

    /**
     * 获取实时能耗，企业，能耗大屏幕
     * @return
     */
    List<PowerInfo> getSsjcConsumption();
    //获取公司名
    String getEnameByPCode(int pCode);

    List<WaterInfo> getCurrWater(String aCode);//当前地图上的水能耗
    List<WaterInfo> getWaterByMonth(@Param("aCode") String aCode); //本月能耗目标，用水量

    List<UserOwner> getAllType();
}
