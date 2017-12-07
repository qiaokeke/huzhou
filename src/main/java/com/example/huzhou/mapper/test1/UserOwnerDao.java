package com.example.huzhou.mapper.test1;

import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.entity.UserOwner;
import com.example.huzhou.entity.WaterInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by Raytine on 2017/9/2.
 */
public interface UserOwnerDao {

    List<UserOwner> selectCompanyNameById(int userid);
//    @Select("SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = #{code}")
    List selectPcodeByAcode(@Param("code") String code); //根据acode查找电表编号
    @Select("SELECT AH_AREA_ID FROM tbl_area_hardware WHERE AH_HARDWARE_ID = #{pCode}")
    String selectAcodeByPcode(@Param("pCode") int pCode);
    @Select("SELECT a_code FROM t_user_per WHERE user_id = #{userid} ")
    String selectAcodeByUserId(@Param("userid") int userid);

    /**
     * 换算标煤，取出来今天所有厂房的电能，相加
     * @return
     */
    @Select("SELECT sum(P_BY_KwhZ) FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "  SELECT max(P_TIME)  FROM tbl_power_info_v2 WHERE DATE (P_TIME) = DATE (now())\n" +
            "  GROUP BY P_CODE)")
    Double selectCoalByYear();

    @Select("select P_CODE pCode,P_BY_KwhZ pBYKwhZ,P_TIME pTime from tbl_power_info_v2 where P_TIME IN (\n" +
            "   SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now())\n" +
            "         GROUP BY P_CODE ORDER BY P_BY_KwhZ)\n" +
            "         UNION select P_CODE,P_BY_KwhZ,P_TIME from tbl_power_info_v2 where P_TIME IN (\n" +
            "           SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now())-1\n" +
            "           GROUP BY P_CODE)\n" +
            "         ORDER BY pTime DESC")
    List<PowerInfo> selectSsjcConsumption();

    @Select("SELECT A_ENAME FROM tbl_area WHERE A_CODE = (\n" +
            "  SELECT AH_AREA_ID FROM tbl_area_hardware WHERE AH_HARDWARE_ID = #{pCode})")
    String selectEnameByPCode(@Param("pCode") int pCode);

    /* @Select("SELECT  W_TIME time,W_ADDRESS address, W_READINGS readings FROM tbl_water_info where W_TIME = (\n" +
            "SELECT  MAX(W_TIME) FROM tbl_water_info WHERE DATE (W_TIME) = DATE(now()) )\n" +
            "    AND W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = #{aCode})\n" +
            "GROUP BY W_ADDRESS")*/
    List<WaterInfo> selectCurrWater(@Param("aCode") String aCode);

    List<WaterInfo> selectCurrWater();


    @Select("SELECT DISTINCT W_TIME time, W_READINGS readings,W_ADDRESS FROM tbl_water_info WHERE W_TIME IN (\n" +
            "    SELECT max(W_TIME) FROM tbl_water_info WHERE \n" +
            "      DATE_FORMAT(W_TIME,'%Y') = DATE_FORMAT(now(),'%Y') GROUP BY MONTH(W_TIME)) \n" +
            "   AND  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = #{aCode})")
    List<WaterInfo> selectWaterByMonth(@Param("aCode") String aCode);

    //查找行业类别
    @Select("SELECT O_NAME aEname,O_TYPE oType FROM  tbl_owner_info")
    List<UserOwner> selectAllType();
}