package com.example.huzhou.mapper.test1;

import com.example.huzhou.entity.BasePowerInfo;
import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.entity.PowerTotalInfo;
import com.example.huzhou.entity.WaterInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;


/**
 * Created by Raytine on 2017/8/27.
 * za
 */
@Mapper
public interface PowerInfoDao {

    /**
     * 查询能耗榜单
     * @param
     * @param
     * @return
     */

    @Select({"SELECT\n" +
            "tbl_power_info_v2.P_CODE as pCode,"+
            "tbl_area.A_ENAME as companyName,\n" +
            "MAX(tbl_power_info_v2.P_ZXYGDN) as pZXYGDN\n" +
            "FROM\n" +
            "tbl_power_info_v2,\n" +
            "tbl_area_hardware,\n" +
            "tbl_area\n" +
            "WHERE\n" +
            "tbl_power_info_v2.P_CODE = tbl_area_hardware.AH_HARDWARE_ID\n" +
            "AND\n" +
            "tbl_area_hardware.AH_AREA_ID = tbl_area.A_CODE\n" +
            "\n" +
            "GROUP BY\n" +
            "companyName\n" +
            "\n" +
            "ORDER BY  pZXYGDN DESC\n"
            })
    List<PowerTotalInfo> selectTop5TotalPower();


   /*@Select("SELECT DISTINCT W_TIME time,W_READINGS readings FROM tbl_water_info WHERE W_TIME IN (\n" +
           "   SELECT max(W_TIME) From tbl_water_info where DATE (W_TIME) = DATE (now()) -2\n" +
           "       And  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = #{aCode})\n" +
           "   GROUP BY hour(W_TIME))\n" +
           "      And  W_ADDRESS   IN (SELECT w_addr FROM t_water_area WHERE a_code = #{aCode})")*/
   @Select("SELECT DISTINCT W_TIME time,W_READINGS readings FROM tbl_water_info WHERE W_TIME IN (\n" +
           "   SELECT max(W_TIME) From tbl_water_info where DATE (W_TIME) = DATE (now()) \n" +
           "       And  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = #{aCode})\n" +
           "   GROUP BY hour(W_TIME))\n" +
           "      And  W_ADDRESS   IN (SELECT w_addr FROM t_water_area WHERE a_code = #{aCode})\n" +
           "UNION SELECT DISTINCT W_TIME time,W_READINGS readings FROM tbl_water_info WHERE W_TIME IN (\n" +
           "  SELECT max(W_TIME) From tbl_water_info where DATE (W_TIME) = DATE (now()) -1\n" +
           "          And  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = #{aCode}))\n" +
           "  And  W_ADDRESS   IN (SELECT w_addr FROM t_water_area WHERE a_code = #{aCode})\n" +
           "ORDER BY time")
    List<WaterInfo> selectWaterDataPerHour(@Param("category")String category ,@Param("aCode") String aCode);
    //使用sum，avg等函数操作以后的字段与实体类中的不相符，所以操作的时候对不上，
   /* @Select("SELECT P_TIME pTime,P_BYDN pBydn FROM tbl_power_info WHERE  P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info  WHERE  month (P_TIME) = month (now()) and P_CODE = #{pCode} GROUP BY day(P_TIME))\n" +
            "UNION\n" +
            "SELECT P_TIME pTime,P_BYDN pBydn FROM tbl_power_info WHERE P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info  WHERE  month (P_TIME) = month (now())-1 and P_CODE = #{pCode})\n" +
            "ORDER BY pTime")*/
   @Select("SELECT P_TIME pTime,P_BY_KwhZ pBYKwhZ FROM tbl_power_info_v2 WHERE  P_TIME IN (\n" +
           "\n" +
           "  SELECT max(P_TIME) FROM tbl_power_info_v2  WHERE  month (P_TIME) = month (now()) and P_CODE = #{pCode} GROUP BY day(P_TIME))\n" +
           " UNION\n" +
           " SELECT P_TIME ,P_BY_KwhZ FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
           "   SELECT max(P_TIME) FROM tbl_power_info_v2  WHERE  month (P_TIME) = month (now())-1 and P_CODE = #{pCode})\n" +
           " ORDER BY pTime")
    List<PowerInfo> selectTimeCalendar( @Param("pCode") int pCode,@Param("time") String time); //这个参数被where中的条件使用，要对上号，对不上号就报错

   /* @Select("SELECT P_TIME pTime,P_BYDN pBydn FROM tbl_power_info WHERE  P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info  WHERE  DATE (P_TIME) = DATE (#{time}) and P_CODE = #{pCode} GROUP BY hour(P_TIME))\n" +
            "UNION\n" +
            "SELECT P_TIME pTime,P_BYDN pBydn FROM tbl_power_info WHERE P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info  WHERE  DATE (P_TIME) = DATE (#{time})-1 and P_CODE = #{pCode})\n" +
            "ORDER BY pTime")*/
   @Select("SELECT P_TIME pTime,P_BY_KwhZ pBYKwhZ FROM tbl_power_info_v2 WHERE  P_TIME IN (\n" +
           "\n" +
           "   SELECT max(P_TIME) FROM tbl_power_info_v2  WHERE  DATE (P_TIME) = DATE (#{time}) and P_CODE = #{pCode} GROUP BY hour(P_TIME))\n" +
           "  UNION\n" +
           "  SELECT P_TIME ,P_BY_KwhZ  FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
           "    SELECT max(P_TIME) FROM tbl_power_info_v2  WHERE  DATE (P_TIME) = DATE (#{time})-1 and P_CODE = #{pCode})\n" +
           "  ORDER BY pTime")
    List<PowerInfo> selectTimeConsumption(@Param("pCode") int pCode,@Param("time") String time);

//TODO
    /*@Select("SELECT P_BY1D pBy1d,P_BY2D pBy2d, P_BY4D pBy4d,P_TIME pTime from tbl_power_info WHERE  P_TIME IN(\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info WHERE  month(P_TIME) = month(#{time}) AND P_CODE = #{pCode} GROUP BY day(P_TIME))\n" +
            "  UNION\n" +
            "  (SELECT P_BY1D ,P_BY2D, P_BY4D,P_TIME from tbl_power_info WHERE  P_TIME IN (\n" +
            "   SELECT max(P_TIME) FROM tbl_power_info WHERE  month(P_TIME) = month(#{time})-1 AND P_CODE = #{pCode}))\n" +
            "ORDER BY pTime;")*/
    @Select("SELECT P_BY_KwhJ pBYKwhJ,P_BY_KwhF pBYKwhF, P_BY_KwhG pBYKwhG,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN(\n" +
            "\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE  month(P_TIME) = month(#{time}) AND P_CODE = #{pCode} GROUP BY day(P_TIME))\n" +
            "   UNION\n" +
            "   (SELECT P_BY_KwhJ ,P_BY_KwhF, P_BY_KwhG,P_TIME from tbl_power_info_v2 WHERE  P_TIME IN (\n" +
            "    SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE  month(P_TIME) = month(#{time})-1 AND P_CODE = #{pCode}))\n" +
            " ORDER BY pTime")
    List<PowerInfo> selectValleyData(@Param("pCode") int pCode,@Param("time") String time);

//   TODO
    /*@Select("SELECT P_BYDN pBydn,P_BY1D pBy1d,P_BY2D pBy2d, P_BY4D pBy4d,P_TIME pTime from tbl_power_info WHERE  P_TIME IN(\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(#{time}) AND P_CODE = #{pCode} GROUP BY day(P_TIME))\n" +
            "UNION\n" +
            "(SELECT P_BYDN , P_BY1D ,P_BY2D, P_BY4D,P_TIME from tbl_power_info WHERE  P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(#{time})-1 AND P_CODE = #{pCode}))\n" +
            "ORDER BY pTime;")*/
    @Select("SELECT  P_BY_KwhZ pBYKwhZ,P_BY_KwhJ pBYKwhJ,P_BY_KwhF pBYKwhF, P_BY_KwhG pBYKwhG,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN(\n" +
            "               SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(#{time}) AND P_CODE = #{pCode} GROUP BY day(P_TIME))\n" +
            "            UNION\n" +
            "            (SELECT P_BY_KwhZ , P_BY_KwhJ ,P_BY_KwhF, P_BY_KwhG,P_TIME from tbl_power_info_v2 WHERE  P_TIME IN (\n" +
            "              SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(#{time})-1 AND P_CODE = #{pCode}))\n" +
            "            ORDER BY pTime")
    List<PowerInfo>  selectConsumption(@Param("category") String category,@Param("pCode") int pCode,@Param("time") String time);

    //TODO 查询用电量，并没有给出购买情况
//    @Select("SELECT max(P_TIME) as pTime ,max(P_BYDN) as pBydn FROM tbl_power_info WHERE P_CODE = #{pCode}\n" +
//            "GROUP BY month(#{time})")
    @Select("SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE P_CODE =#{pCode} AND DATE_FORMAT(P_TIME,'%Y') = DATE_FORMAT(#{time},'%Y')\n" +
            "GROUP BY month(P_TIME))")
    List<PowerInfo>  selectElectricInfo(@Param("category") String category,@Param("pCode") int pCode,@Param("time") String time);

    //Pcode没有更改 TODO
   /* @Select("SELECT P_BYDN pBydn,P_TIME pTime from tbl_power_info WHERE  P_TIME IN\n" +
            "         (SELECT max(P_TIME) FROM tbl_power_info WHERE P_CODE = #{pCode} AND DATE_FORMAT(P_TIME,'%Y-%m')=DATE_FORMAT(#{time},'%Y-%m'))\n" +
            "     UNION\n" +
            "  SELECT P_BYDN as pLydn,P_TIME FROM tbl_power_info WHERE P_TIME IN\n" +
            "          (SELECT max(P_TIME) FROM tbl_power_info WHERE P_CODE =#{pCode} AND PERIOD_DIFF( date_format( #{time} , '%Y%m' ) , date_format( P_TIME, '%Y%m' ) ) =1)\n" +
            "ORDER BY pTime;")*/
   @Select("SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN\n" +
           "           (SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE P_CODE = #{pCode} AND DATE_FORMAT(P_TIME,'%Y-%m')=DATE_FORMAT(#{time},'%Y-%m') )\n" +
           "       UNION\n" +
           "    SELECT P_BY_KwhZ as pLydn,P_TIME FROM tbl_power_info_v2 WHERE P_TIME IN\n" +
           "            (SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE P_CODE = #{pCode} AND PERIOD_DIFF( date_format( #{time} , '%Y%m' ) , date_format( P_TIME, '%Y%m' ) ) =1)\n" +
           "  ORDER BY pTime;")
    List<PowerInfo>  selectElectricCompare(@Param("category") String category,@Param("pCode") int pCode,@Param("time") String time);

   /* @Select("SELECT P_BYDN pBydn,P_TIME pTime from tbl_power_info WHERE  P_TIME IN(\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info WHERE  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(#{time}) AND P_CODE = #{pCode} GROUP BY day(P_TIME))\n" +
            "UNION\n" +
            "(SELECT P_BYDN,P_TIME from tbl_power_info WHERE  P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info WHERE  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(#{time})-1 AND P_CODE = #{pCode}))\n" +
            "ORDER BY pTime")*/
   @Select("SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN(\n" +
           "      SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(#{time}) AND P_CODE = #{pCode} GROUP BY day(P_TIME))\n" +
           "    UNION\n" +
           "    (SELECT P_BY_KwhZ,P_TIME from tbl_power_info_v2 WHERE  P_TIME IN (\n" +
           "      SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(#{time})-1 AND P_CODE = #{pCode}))\n" +
           "    ORDER BY pTime")
    List<PowerInfo>  selectElectricState(@Param("category") String category,@Param("pCode") int pCode,@Param("time") String time);

    List<PowerInfo>  selectElectricIndex(@Param("category") String category,@Param("pCode") int pCode,@Param("time") String time);

    //TODO 查询用电量，并没有给出购买情况
    //能耗预警
    @Select("SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE P_CODE =#{pCode} AND DATE_FORMAT(P_TIME,'%Y') = DATE_FORMAT(#{time},'%Y')\n" +
            "GROUP BY month(P_TIME))")
    List<PowerInfo> selectWarningConsumption(@Param("category") String category,@Param("pCode") int pCode,@Param("time") String time);

 /*   @Select("SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "\n" +
            "    SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now()) -1  And P_CODE = (\n" +
            "      SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = #{aCode}) GROUP BY hour(P_TIME))\n" +
            "  UNION SELECT P_BY_KwhZ ,P_TIME  FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "    SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now()) -2 And P_CODE = (\n" +
            "      SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = #{aCode}\n" +
            "    )) ORDER BY pTime")*/
    @Select("SELECT P_ZXYGDN pBYKwhZ,P_TIME pTime FROM tbl_power_info_v2 WHERE  P_TIME IN (\n" +
            "     SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now()) AND P_CODE = #{pCode} GROUP BY hour(P_TIME))\n and P_CODE = #{pCode}" +
            "   UNION SELECT P_ZXYGDN pBYKwhZ,P_TIME  FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "     SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now()) -1 AND P_CODE = #{pCode}) and P_CODE = #{pCode} ORDER BY pTime" )
    List<PowerInfo> selectEletricSsjc(@Param("pCode") int pCode);
  /*  @Select("SELECT P_BYDN pBydn FROM tbl_power_info WHERE P_TIME IN (\n" +
            "  SELECT MAX(P_TIME) FROM tbl_power_info WHERE DATE (P_TIME) = DATE(now()) AND P_CODE = #{pCode})")*/
    Double selectCurrElectric(@Param("pCode") int pCode);
    //计算出全体电能
    /*@Select("SELECT P_BY_KwhZ pBYKwhZ,P_CODE pCode FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "  SELECT MAX(P_TIME) FROM tbl_power_info_v2 WHERE DATE (P_TIME) = DATE(now()) -3\n" +
            "              GROUP BY P_CODE\n" +
            ")")*/
    @Select("SELECT P_BY_KwhZ pBYKwhZ,P_CODE pCode FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "  SELECT MAX(P_TIME) FROM tbl_power_info_v2 WHERE DATE (P_TIME) = DATE(now()) -1\n" +
            "              GROUP BY P_CODE)")
    List<PowerInfo> selectCurrElectricForAll( );


    /*@Select("SELECT P_BYDN pBydn,P_TIME pTime FROM tbl_power_info  WHERE P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info\n" +
            "    WHERE P_CODE = #{pCode} and DATE_FORMAT(P_TIME,'%Y') = DATE_FORMAT(now(),'%Y')\n" +
            "  GROUP BY MONTH(P_TIME))")*/
    @Select("SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime FROM tbl_power_info_v2  WHERE P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info_v2\n" +
            "     WHERE P_CODE = #{pCode} and DATE_FORMAT(P_TIME,'%Y') = DATE_FORMAT(now(),'%Y')\n" +
            "   GROUP BY MONTH(P_TIME))")
    List<PowerInfo> selectElecByMonth(@Param("pCode") int pCode);

   /* @Select("SELECT P_A_DIANYA pADianya,P_A_DIANLIU pADianliu,P_A_YGGL pAYggl,P_HXYGGL pHXYggl,P_A_GLYS pAGlys,\n" +
            "  P_BY_KwhZ pBYKwhZ,P_BY_KwhJ pBYKwhJ,P_BY_KwhF pBYKwhF,P_BY_KwhP pBYKwhP ,P_BY_KwhG pBYKwhG FROM tbl_power_info_v2 WHERE P_TIME IN (\n" +
            "  SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE DATE_FORMAT(P_TIME,'%Y-%m-%d') = DATE_FORMAT('2017/9/9','%Y-%m-%d')\n" +
            "  GROUP BY P_CODE)")*/
    List<BasePowerInfo> getConsumptionByToday();
}
