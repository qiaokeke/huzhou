package com.example.huzhou.mapper.test2;

import com.example.huzhou.entity.PowerInfoDH;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by Raytine on 2017/9/11.
 */
@Mapper
public interface PowerInfoDaoDH {
    @Select("SELECT id FROM user_info WHERE meter_address = #{pCode}")
    String selectItemID(@Param("pCode") int pCode);

    @Select("SELECT read_value valueDn ,read_time readTime FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "AND date_format (read_time,'%Y-%m-%d') = date_format (now(),'%Y-%m-%d')\n" +
            "UNION\n" +
            "SELECT read_value,read_time FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "  AND read_time = (SELECT max(read_time) FROM user_datahour_201709 WHERE\n" +
            "  PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1)\n" +
            "ORDER BY readTime")
    List<PowerInfoDH> selectSsValueById(@Param("itemID") String itemID);

    /**
     *
     * @param itemID 编号
     * @param time 默认本月时间
     * @return
     */
    @Select("SELECT read_value valueDn,read_time readTime from user_datahour_201709 WHERE read_time IN\n" +
            "   (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "      AND DATE_FORMAT(read_time,'%Y-%m')=DATE_FORMAT(#{time},'%Y-%m') GROUP BY day(read_time))\n" +
            "  AND meter_item_data_id  = #{itemID}\n" +
            "UNION\n" +
            "SELECT read_value,read_time FROM user_datahour_201709 WHERE read_time IN\n" +
            "      (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "      AND meter_item_data_id  = #{itemID}\n" +
            "  AND PERIOD_DIFF( date_format( #{time} , '%Y%m' ) , date_format( read_time, '%Y%m' ) ) =1)\n" +
            "ORDER BY readTime;")
    List<PowerInfoDH> selectTimeCalendar(@Param("itemID") String itemID,@Param("time") String time);
    /**
     *
     * @param itemID 编号
     * @param time 哪天的日期，可以和实时数据合并，优化
     * @return
     */
    @Select("SELECT read_value valueDn,read_time readTime FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "  AND date_format (read_time,'%Y-%m-%d') = date_format (#{time},'%Y-%m-%d')\n" +
            "UNION\n" +
            "SELECT read_value,read_time FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "   AND read_time = (SELECT max(read_time) FROM user_datahour_201709 WHERE\n" +
            "  PERIOD_DIFF( date_format(#{time} , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1)\n" +
            "ORDER BY readTime")
    List<PowerInfoDH> selectTimeConsumption(@Param("itemID") String itemID,@Param("time") String time);

    @Select("SELECT read_value valueDn,read_time readTime from user_datahour_201709 WHERE read_time IN\n" +
            "   (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "      AND DATE_FORMAT(read_time,'%Y-%m')=DATE_FORMAT(#{time},'%Y-%m') GROUP BY day(read_time))\n" +
            "  AND meter_item_data_id  = #{itemID}\n" +
            "UNION\n" +
            "SELECT read_value,read_time FROM user_datahour_201709 WHERE read_time IN\n" +
            "      (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "          AND PERIOD_DIFF( date_format( #{time} , '%Y%m' ) , date_format( read_time, '%Y%m' ) ) =1)\n" +
            "    AND meter_item_data_id  = #{itemID}\n" +
            "ORDER BY readTime")
    List<PowerInfoDH> selectJFGConsumption(@Param("itemID") String itemID,@Param("time") String time);

    /**
     *
     * @param itemID 编号
     * @return 所有月的能耗，可以简化
     */
    @Select("SELECT read_value valueDn,read_time readTime FROM user_datahour_201709  WHERE read_time IN (\n" +
            "   SELECT max(read_time) FROM user_datahour_201709 WHERE  meter_item_data_id  = #{itemID}\n" +
            "    and DATE_FORMAT(read_time,'%Y') = DATE_FORMAT(now(),'%Y') GROUP BY MONTH(read_time))\n" +
            "  AND meter_item_data_id  = #{itemID}")
    List<PowerInfoDH> selectTargetValue(@Param("itemID") String itemID);

    @Select("SELECT read_value valueDn,read_time readTime from user_datahour_201709 WHERE read_time IN\n" +
            "  (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "    AND YEARWEEK(DATE_FORMAT(read_time,'%Y-%m-%d')) = YEARWEEK(#{time}) GROUP BY day(read_time))\n" +
            "    AND meter_item_data_id  = #{itemID}\n" +
            "UNION\n" +
            "SELECT read_value,read_time FROM user_datahour_201709 WHERE read_time IN\n" +
            "   (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "     AND YEARWEEK(DATE_FORMAT(read_time,'%Y-%m-%d')) = YEARWEEK(#{time})-1)\n" +
            "  AND meter_item_data_id  = #{itemID}\n" +
            "ORDER BY readTime")
    List<PowerInfoDH> selectZJFGConsumption(@Param("itemID") String itemID,@Param("time") String time);

    @Select("SELECT read_value valueDn,read_time readTime FROM user_datahour_201709 WHERE read_time IN (\n" +
            " SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "    AND DATE_FORMAT(read_time,'%Y') = DATE_FORMAT(#{time},'%Y')\n" +
            "GROUP BY month(read_time))\n" +
            "AND  meter_item_data_id  = #{itemID}")
    List<PowerInfoDH> selectElecInfo(@Param("itemID") String itemID,@Param("time") String time);

    @Select("SELECT read_value valueDn,read_time readTime FROM user_datahour_201709  WHERE read_time IN (\n" +
            "  SELECT max(read_time) FROM user_datahour_201709 WHERE  meter_item_data_id  = #{itemID}\n" +
            "      and DATE_FORMAT(read_time,'%Y') = DATE_FORMAT(#{time},'%Y') GROUP BY MONTH(read_time))\n" +
            "   AND meter_item_data_id  = #{itemID}\n" +
            "  order BY readTime DESC \n" +
            "LIMIT 0,2;")
    List<PowerInfoDH> selectCompareInfo(@Param("itemID") String itemID,@Param("time") String time);

    @Select("SELECT read_value valueDn,read_time readTime,meter_item_data_id meterId FROM user_datahour_201709\n" +
            "  WHERE meter_item_data_id LIKE '1053%' AND read_time IN (\n" +
            "    SELECT max(read_time) FROM user_datahour_201709 WHERE date_format (read_time,'%Y-%m-%d') = date_format (now(),'%Y-%m-%d')\n" +
            "    AND meter_item_data_id LIKE '1053%')\n" +
            "GROUP BY meter_item_data_id\n" +
            "UNION\n" +
            "SELECT read_value valueDn,read_time readTime,meter_item_data_id meterId FROM user_datahour_201709\n" +
            "WHERE meter_item_data_id LIKE '1053%' AND read_time IN (\n" +
            "  SELECT max(read_time) FROM user_datahour_201709 WHERE\n" +
            "    PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1\n" +
            "    AND meter_item_data_id LIKE '1053%')\n" +
            "GROUP BY meter_item_data_id ;")
    List<PowerInfoDH> selectAllEConsumption();

    @Select("SELECT sum(read_value) valueDn FROM user_datahour_201709\n" +
            "  WHERE meter_item_data_id LIKE '1053%' AND read_time IN (\n" +
            "    SELECT max(read_time) FROM user_datahour_201709 WHERE date_format (read_time,'%Y-%m-%d') = date_format (now(),'%Y-%m-%d')\n" +
            "    AND meter_item_data_id LIKE '1053%')")
    Double selectCoalByYear();

    @Select("SELECT read_value valueDn,read_time readTime from user_datahour_201709 WHERE read_time IN\n" +
            "   (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "      AND DATE_FORMAT(read_time,'%Y%m%d')=DATE_FORMAT(now(),'%Y%m%d') )\n" +
            "  AND meter_item_data_id  = #{itemID}\n" +
            "UNION\n" +
            "SELECT read_value,read_time FROM user_datahour_201709 WHERE read_time IN\n" +
            "      (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = #{itemID}\n" +
            "  AND PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1)\n" +
            "        AND meter_item_data_id  = #{itemID}\n" +
            "ORDER BY readTime")
    List<PowerInfoDH> selectTodayList(@Param("itemID") String itemID);

    @Select("SELECT read_value valueDn,read_time readTime,meter_item_data_id meterId FROM user_datahour_201709\n" +
            "  WHERE meter_item_data_id LIKE  concat(#{itemID},'%')  AND read_time IN (\n" +
            "    SELECT max(read_time) FROM user_datahour_201709 WHERE date_format (read_time,'%Y-%m-%d') = date_format (now(),'%Y-%m-%d')\n" +
            "    AND meter_item_data_id LIKE concat(#{itemID},'%'))\n" +
            "GROUP BY meter_item_data_id\n" +
            "UNION\n" +
            "SELECT read_value valueDn,read_time readTime,meter_item_data_id FROM user_datahour_201709\n" +
            "WHERE meter_item_data_id LIKE concat(#{itemID},'%') AND read_time IN (\n" +
            "  SELECT max(read_time) FROM user_datahour_201709 WHERE\n" +
            "    PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1\n" +
            "                                                        AND meter_item_data_id LIKE concat(#{itemID},'%'))\n" +
            "GROUP BY meter_item_data_id ")
    List<PowerInfoDH> selectTodayListAll(@Param("itemID") String itemID);


}
