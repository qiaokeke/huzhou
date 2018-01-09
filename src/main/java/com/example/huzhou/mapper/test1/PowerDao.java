package com.example.huzhou.mapper.test1;

import com.example.huzhou.entity.power.PowerAllInfo;
import com.example.huzhou.entity.power.PowerZXYGDNInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-03 22:12
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */

@Mapper
public interface PowerDao {

    @Select({"SELECT\n" +
            "P_CODE AS pCode,\n" +
            "P_ZXYGDN AS pZXYGDN,\n" +
            "DATE_FORMAT(tbl_power_info_v2.P_TIME,\"%Y-%m-%d %H:00:00\") pTime\n" +
            "\n" +
            "FROM tbl_power_info_v2\n" +
            "WHERE\n" +
            "tbl_power_info_v2.P_ID\n" +
            "in\n" +
            "(\n" +
            "SELECT\n" +
            "MAX(tbl_power_info_v2.P_ID)\n" +
            "FROM\n" +
            "tbl_power_info_v2\n" +
            "INNER JOIN\n" +
            "tbl_area_hardware\n" +
            "ON\n" +
            "tbl_area_hardware.AH_AREA_ID=#{arg0}\n" +
            "AND\n" +
            "tbl_area_hardware.AH_HARDWARE_ID = tbl_power_info_v2.P_CODE\n" +
            "WHERE\n" +
            "tbl_power_info_v2.P_TIME BETWEEN #{arg1} AND #{arg2}\n" +
            "GROUP BY\n" +
            "DAY(tbl_power_info_v2.P_TIME),\n" +
            "Hour(tbl_power_info_v2.P_TIME),\n" +
            "tbl_power_info_v2.P_CODE\n" +
            ")"})
    List<PowerZXYGDNInfo> selectPowerZXYGDNInfosByACodeAndTime(String aCode,String sTime,String eTime);

    @Select({"SELECT\n" +
            "\tAH_HARDWARE_ID AS id,\n" +
            "\ttbl_area.A_ENAME AS eName,\n" +
            "\ttbl_area.A_CODE as aCode,\n" +
            "\ttbl_power_info_v2.P_TIME AS time,\n" +
            "\ttbl_power_info_v2.P_A_DIANYA AS dianYa,\n" +
            "\ttbl_power_info_v2.P_A_DIANLIU AS AdianLiu,\n" +
            "\ttbl_power_info_v2.P_B_DIANLIU AS BdianLiu,\n" +
            "\ttbl_power_info_v2.P_C_DIANLIU AS CdianLiu,\n" +
            "\ttbl_power_info_v2.P_ZXYGDN AS zdn,\n" +
            "\ttbl_power_info_v2.P_HXYGGL AS yggl,\n" +
            "\ttbl_power_info_v2.P_HXGLYS AS glys,\n" +
            "\ttbl_power_info_v2.P_BY_KwhG AS gdn,\n" +
            "\ttbl_power_info_v2.P_BY_KwhF AS fdn,\n" +
            "\ttbl_power_info_v2.P_BY_KwhJ AS jdn,\n" +
            "\ttbl_power_info_v2.P_BY_KwhP AS pdn\n" +
            "FROM\n" +
            "\ttbl_area_hardware\n" +
            "LEFT JOIN tbl_area ON tbl_area.A_CODE = tbl_area_hardware.AH_AREA_ID\n" +
            "LEFT JOIN tbl_power_info_v2 ON tbl_power_info_v2.P_CODE = tbl_area_hardware.AH_HARDWARE_ID\n" +
            "AND tbl_power_info_v2.P_TIME IN (\n" +
            "\tSELECT\n" +
            "\t\tMAX(tbl_power_info_v2.P_TIME)\n" +
            "\tFROM\n" +
            "\t\ttbl_power_info_v2\n" +
            "\tGROUP BY\n" +
            "\t\ttbl_power_info_v2.P_CODE\n" +
            ")\n" +
            "GROUP BY\n" +
            "\tid\n" +
            "ORDER BY\n" +
            "\tid"})
    List<PowerAllInfo> selectPowerAllInfos();
}
