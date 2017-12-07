SELECT * FROM admin;
#取电表的数据，正向有功电能
SELECT id FROM meter_item WHERE
  meter_type_id = (SELECT id FROM meter_type WHERE text = '多功能电表')
  AND meter_item_name = '正向有功电能';

# 根据acode --- pcode = meter_address --- id
# id 拼接 meter_item id 查找user_datahour

SELECT id FROM user_info WHERE meter_address = 25;
###########################实时数据############################
SELECT read_value valueDn,read_time readTime FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
AND date_format (read_time,'%Y-%m-%d') = date_format (now(),'%Y-%m-%d')
UNION
SELECT read_value,read_time FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
  AND read_time = (SELECT max(read_time) FROM user_datahour_201709 WHERE
  PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1)
ORDER BY readTime;
#######################分是能耗
SELECT read_value valueDn,read_time readTime FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
  AND date_format (read_time,'%Y-%m-%d') = date_format ('2017/09/10','%Y-%m-%d')
UNION
SELECT read_value,read_time FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
   AND read_time = (SELECT max(read_time) FROM user_datahour_201709 WHERE
  PERIOD_DIFF( date_format('2017/09/10' , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1)
ORDER BY readTime;
#####################能耗日历
#####################尖
#####################峰
#####################谷
SELECT read_value valueDn,read_time readTime from user_datahour_201709 WHERE read_time IN
   (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = '1055098e0bd9-8420-46b4-af15-dc825a854bc4'
      AND DATE_FORMAT(read_time,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m') GROUP BY day(read_time))
  AND meter_item_data_id  = '1055098e0bd9-8420-46b4-af15-dc825a854bc4'
UNION
SELECT read_value,read_time readTime FROM user_datahour_201709 WHERE read_time IN
      (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = '1055098e0bd9-8420-46b4-af15-dc825a854bc4'
      AND meter_item_data_id  = '1055098e0bd9-8420-46b4-af15-dc825a854bc4'
  AND PERIOD_DIFF( date_format( now() , '%Y%m' ) , date_format( read_time, '%Y%m' ) ) =1)
ORDER BY readTime;

###################能耗目标
SELECT read_value valueDn,read_time readTime FROM user_datahour_201709  WHERE read_time IN (
   SELECT max(read_time) FROM user_datahour_201709 WHERE  meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
    and DATE_FORMAT(read_time,'%Y') = DATE_FORMAT(now(),'%Y') GROUP BY MONTH(read_time))
  AND meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4';

###################能耗,state
SELECT read_value valueDn,read_time readTime from user_datahour_201709 WHERE read_time IN
  (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
    AND YEARWEEK(DATE_FORMAT(read_time,'%Y-%m-%d')) = YEARWEEK(now()) GROUP BY day(read_time))
    AND meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
UNION
SELECT read_value,read_time FROM user_datahour_201709 WHERE read_time IN
   (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
     AND YEARWEEK(DATE_FORMAT(read_time,'%Y-%m-%d')) = YEARWEEK(now())-1)
  AND meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
ORDER BY readTime;

################info
SELECT read_value valueDn,read_time readTime FROM user_datahour_201709 WHERE read_time IN (
 SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
    AND DATE_FORMAT(read_time,'%Y') = DATE_FORMAT(now(),'%Y')
GROUP BY month(read_time))
AND  meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4';

##############对比
SELECT read_value valueDn,read_time readTime FROM user_datahour_201709  WHERE read_time IN (
  SELECT max(read_time) FROM user_datahour_201709 WHERE  meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
      and DATE_FORMAT(read_time,'%Y') = DATE_FORMAT(now(),'%Y') GROUP BY MONTH(read_time))
   AND meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
  order BY readTime DESC
LIMIT 0,2;

#############实时能耗，拿出所有公司的电能,根据 id 和 code 拼接相等的就去出来？今天的

SELECT sum(read_value) valueDn,read_time readTime,meter_item_data_id FROM user_datahour_201709
  WHERE meter_item_data_id LIKE '1053%' AND read_time IN (
    SELECT max(read_time) FROM user_datahour_201709 WHERE date_format (read_time,'%Y-%m-%d') = date_format (now(),'%Y-%m-%d')
    AND meter_item_data_id LIKE '1053%')
GROUP BY meter_item_data_id
UNION
SELECT read_value valueDn,read_time readTime,meter_item_data_id FROM user_datahour_201709
WHERE meter_item_data_id LIKE '1053%' AND read_time IN (
  SELECT max(read_time) FROM user_datahour_201709 WHERE
    PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1
                                                        AND meter_item_data_id LIKE '1053%')
GROUP BY meter_item_data_id ;

SELECT read_value valueDn,read_time readTime,meter_item_data_id FROM user_datahour_201709
  WHERE meter_item_data_id LIKE  concat(1053,'%')  AND read_time IN (
    SELECT max(read_time) FROM user_datahour_201709 WHERE date_format (read_time,'%Y-%m-%d') = date_format (now(),'%Y-%m-%d')
    AND meter_item_data_id LIKE concat(1053,'%'))
GROUP BY meter_item_data_id
UNION
SELECT read_value valueDn,read_time readTime,meter_item_data_id FROM user_datahour_201709
WHERE meter_item_data_id LIKE concat(1053,'%') AND read_time IN (
  SELECT max(read_time) FROM user_datahour_201709 WHERE
    PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1
                                                        AND meter_item_data_id LIKE concat(1053,'%'))
GROUP BY meter_item_data_id ;


SELECT read_value valueDn,read_time readTime from user_datahour_201709 WHERE read_time IN
   (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
      AND DATE_FORMAT(read_time,'%Y%m%d')=DATE_FORMAT(now(),'%Y%m%d') )
  AND meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
UNION
SELECT read_value,read_time FROM user_datahour_201709 WHERE read_time IN
      (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
  AND PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1)
        AND meter_item_data_id  = '1053098e0bd9-8420-46b4-af15-dc825a854bc4'
ORDER BY readTime;

SELECT read_value valueDn,read_time readTime from user_datahour_201709 WHERE read_time IN
   (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id  LIKE '1053%'
      AND DATE_FORMAT(read_time,'%Y%m%d')=DATE_FORMAT(now(),'%Y%m%d') )
  AND meter_item_data_id   LIKE '1053%'
UNION
SELECT read_value,read_time FROM user_datahour_201709 WHERE read_time IN
      (SELECT max(read_time) FROM user_datahour_201709 WHERE meter_item_data_id   LIKE '1053%'
  AND PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1)
        AND meter_item_data_id   LIKE '1053%'
ORDER BY readTime;
###############
SELECT read_value valueDn,read_time readTime,meter_item_data_id meterId FROM user_datahour_201709
                       WHERE meter_item_data_id LIKE  concat(1053,'%')  AND read_time IN (
        SELECT max(read_time) FROM user_datahour_201709 WHERE date_format (read_time,'%Y-%m-%d') = date_format (now(),'%Y-%m-%d')
        AND meter_item_data_id LIKE concat(1053,'%'))
    GROUP BY meter_item_data_id
    UNION
    SELECT read_value valueDn,read_time readTime,meter_item_data_id FROM user_datahour_201709
    WHERE meter_item_data_id LIKE concat(1053,'%') AND read_time IN (
      SELECT max(read_time) FROM user_datahour_201709 WHERE
        PERIOD_DIFF( date_format( now() , '%Y%m%d' ) , date_format( read_time, '%Y%m%d' ) ) =1
                                                            AND meter_item_data_id LIKE concat(1053,'%'))
    GROUP BY meter_item_data_id ;


