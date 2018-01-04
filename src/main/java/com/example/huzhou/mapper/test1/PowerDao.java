package com.example.huzhou.mapper.test1;

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

}
