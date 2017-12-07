# 一段时间内的数据   http://blog.csdn.net/zhaitonghui/article/details/53080992
SELECT P_TIME,P_A_WGGL FROM tbl_power_info
WHERE P_TIME BETWEEN '2017-08-25 ' AND '2017-08-26 ';
# 查询本月的数据
select * from tbl_power_info where DATE_FORMAT(P_TIME,'%Y-%m')=DATE_FORMAT(NOW(),'%Y-%m');
# 查询本周的数据，上周的数据，到周六
select * from tbl_power_info where YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(NOW())-1;
# 查询往前7天的数据  select * from 数据表  where  DATE_SUB(CURDATE(), INTERVAL 7 DAY) <=  你要判断的时间字段名
select * from tbl_power_info  where  DATE_SUB(CURDATE(), INTERVAL 7 DAY) <=  P_TIME;


# 取出来这个小时的第一个数值，
select P_TIME as "时间" ,P_A_WGGL as "什么" FROM tbl_power_info
GROUP BY (SELECT hour(P_TIME));
# 取出来这个小时的平均数值，但是好像失败了，哈哈哈
select P_TIME as "时间" ,avg(P_A_WGGL) as "什么" FROM tbl_power_info
GROUP BY (SELECT hour(P_TIME));

SELECT P_TIME,sum(P_SYDN) FROM tbl_power_info
GROUP BY day(P_TIME);

# 查询哪一天的时间段中的能耗
SELECT hour(P_TIME) pTime,sum(P_SYDN) FROM tbl_power_info WHERE P_CODE = 44 AND DATE_FORMAT(P_TIME,'%Y-%m-%d')=DATE_FORMAT('2017-8-26','%Y-%m-%d')
GROUP BY hour(P_TIME);

select DAYOFMONTH('1998-02-03');

# 查询几几年，几几月的 DATE_FORMAT(时间字段名,'%Y-%m')=DATE_FORMAT(NOW(),'%Y-%m')
SELECT day(P_TIME) as pTime,P_BY1D,P_BY2D,P_BY4D FROM tbl_power_info WHERE P_CODE = 44 AND DATE_FORMAT(P_TIME,'%Y-%m')=DATE_FORMAT('2017/8/26','%Y-%m')
GROUP BY day(P_TIME);
#################################分时能耗日历######################左边  每天最后一个时间的电能耗
#----------写成了，计算每天的了，传进去time，就可以计算time那天的能耗
SELECT P_TIME pTime,P_BYDN pBydn FROM tbl_power_info WHERE  P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info  WHERE  DATE (P_TIME) = DATE (now()) and P_CODE = 25 GROUP BY hour(P_TIME))
UNION
SELECT P_TIME pTime,P_BYDN pBydn FROM tbl_power_info WHERE P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info  WHERE  DATE (P_TIME) = DATE (now())-1 and P_CODE = 25)
ORDER BY pTime;

#--------根据月份传参数，没有考虑年份在内，能耗日历
SELECT P_TIME pTime,P_BYDN pBydn FROM tbl_power_info WHERE  P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info  WHERE  month (P_TIME) = month (now()) and P_CODE = 25 GROUP BY day(P_TIME))
UNION
SELECT P_TIME pTime,P_BYDN pBydn FROM tbl_power_info WHERE P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info  WHERE  month (P_TIME) = month (now())-1 and P_CODE = 25)
ORDER BY pTime;

##################r##峰谷能耗日历##################AND P_CODE = 27########  第一天的额好像没有处理，每个月第一天
SELECT b.P_BY1D-a.P_BY1D P_BY1D, b.P_BY2D-a.P_BY2D P_BY2D,b.P_BY4D-a.P_BY4D P_BY4D,a.P_TIME FROM (SELECT max(P_BY1D) as P_BY1D ,max(P_BY2D)  as P_BY2D , max(P_BY4D) as P_BY4D  ,P_TIME  ,P_CODE from tbl_power_info
          WHERE month(P_TIME)=month('2017/8/26')   GROUP BY day(P_TIME)) a,
  (SELECT max(P_BY1D) as P_BY1D ,max(P_BY2D)  as P_BY2D , max(P_BY4D) as P_BY4D  ,P_TIME, P_CODE from tbl_power_info WHERE month(P_TIME) = month('2017/8/26') GROUP BY day(P_TIME)) b
WHERE day(a.P_TIME) = day(b.P_TIME)-1;

SELECT P_BY1D pBy1d,P_BY2D pBy2d, P_BY4D pBy4d,P_TIME pTime from tbl_power_info WHERE  P_TIME IN(
  SELECT max(P_TIME) FROM tbl_power_info WHERE  month(P_TIME) = month(now()) AND P_CODE = 18 GROUP BY day(P_TIME))
  UNION
  (SELECT P_BY1D ,P_BY2D, P_BY4D,P_TIME from tbl_power_info WHERE  P_TIME IN (
   SELECT max(P_TIME) FROM tbl_power_info WHERE  month(P_TIME) = month(now())-1 AND P_CODE = 25))
ORDER BY pTime;
##############################企业能耗统计，也用的尖，峰，谷，总能耗 的数据#########能耗状态和趋势里面要用的一周能耗数据################
SELECT P_BYDN pBydn,P_BY1D pBy1d,P_BY2D pBy2d, P_BY4D pBy4d,P_TIME ,weekday(P_TIME)+1 pTime from tbl_power_info WHERE  P_TIME IN(
  SELECT max(P_TIME) FROM tbl_power_info WHERE   YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(NOW()) AND P_CODE = 23 GROUP BY day(P_TIME))
UNION
(SELECT P_BYDN,P_BY1D ,P_BY2D, P_BY4D,P_TIME,weekday(P_TIME)+1 from tbl_power_info WHERE  P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info WHERE   YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(NOW())-1 AND P_CODE = 23))
ORDER BY pTime;

###############################企业用电状态及趋势
SELECT P_BYDN pBydn,P_TIME ,weekday(P_TIME)+1 pTime from tbl_power_info WHERE  P_TIME IN(
  SELECT max(P_TIME) FROM tbl_power_info WHERE   YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(NOW()) AND P_CODE = 23 GROUP BY day(P_TIME))
UNION
(SELECT P_BYDN,P_TIME,weekday(P_TIME)+1 from tbl_power_info WHERE  P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info WHERE   YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(NOW())-1 AND P_CODE = 23))
ORDER BY pTime;

SELECT P_TIME,DATE_FORMAT(P_TIME,'%Y-%m-%d')=DATE_FORMAT('2017/8/26','%Y-%m-%d') FROM tbl_power_info;
# 上一周的
select * from tbl_power_info where YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(NOW())-1
GROUP BY day(P_TIME);
SELECT P_CODE ,P_TIME FROM  tbl_power_info WHERE DATE_FORMAT(P_TIME,'%Y-%m-%d')=DATE_FORMAT('2017/8/26','%Y-%m-%d');



# ##########################企业用电量统计 按照月份统计#################
# 找到那天中最大的P_BYDN
SELECT P_TIME,max(P_BYDN) FROM tbl_power_info
GROUP BY day(P_TIME);
# 找到那天中最大的P_TIME
SELECT max(P_TIME),P_BYDN FROM tbl_power_info
GROUP BY day(P_TIME);

# 找到那天中最大的P_TIME----数据不正常，，一号厂房的数据
SELECT max(P_TIME) as pTime ,max(P_BYDN) as pBydn FROM tbl_power_info WHERE P_CODE = 1
GROUP BY month(P_TIME);

# #######################用电状态和趋势########################
#获取这周的数据  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(NOW())  这周的数据， subdate(SUBDATE('2017/8/29', 7)  29号前面7天，subdate(SUBDATE('2017/8/29', 7),date_format(SUBDATE('2017/8/29', 7),'%w')-6)上周的周六
select max(P_SYDN),P_TIME from tbl_power_info where YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(NOW())
GROUP BY day(P_TIME);

select b.P_SYDN - a.P_SYDN as c ,a.P_TIME from
  (select max(P_SYDN) P_SYDN,P_TIME,P_CODE from tbl_power_info where  day(P_TIME) = day(subdate(SUBDATE('2017/8/29', 7),date_format(SUBDATE('2017/8/29', 7),'%w')-6))
    OR  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK('2017/8/29') GROUP BY day(P_TIME))  a,
  (select max(P_SYDN) P_SYDN,P_TIME,P_CODE from tbl_power_info where YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK('2017/8/29') GROUP BY day(P_TIME)) b
WHERE day(a.P_TIME) = day(b.P_TIME)-1 AND a.P_CODE = 1;

SELECT P_SYDN,P_TIME FROM tbl_power_info;
SELECT SUBDATE('2017/8/29', 7),P_TIME FROM tbl_power_info;
SELECT subdate(SUBDATE('2017/8/29', 7),date_format(SUBDATE('2017/8/29', 7),'%w')-6)  ;#SUBDATE('2017/8/29', 7) 距离日期7天

/*SELECT max(P_TIME),max(P_SYDN) FROM tbl_power_info
    where day(subdate('2017-8-26',date_format('2017-8-26','%w')-5)) = day(P_TIME);

SELECT max(P_TIME),max(P_SYDN) FROM tbl_power_info
    where day(subdate('2017-8-26',date_format('2017-8-26','%w')-6)) = day(P_TIME);

SELECT max(P_TIME),max(P_SYDN) FROM tbl_power_info
    where day(subdate('2017-8-26',date_format('2017-8-26','%w')-7)) = day(P_TIME);
*/
# 获取日期所在周的周一
SELECT  DATE_SUB('2017/8/29',INTERVAL WEEKDAY('2017/8/29') DAY);
# 获取日期所在周的周日
SELECT  DATE_ADD('2017/8/29',INTERVAL WEEKDAY('2017/8/29') DAY);
# 获取日期所在周前一周的周日
SELECT DATE_SUB('2017/8/29', INTERVAL WEEKDAY('2017/8/29')+1 DAY);

#########################用电量同比增长####################### 本月和上一个月的比值,,,实体类中加了一个字段
  SELECT P_BYDN pBydn,P_TIME pTime from tbl_power_info WHERE  P_TIME IN
         (SELECT max(P_TIME) FROM tbl_power_info WHERE P_CODE = 18 AND DATE_FORMAT(P_TIME,'%Y-%m')=DATE_FORMAT('2017/9/26','%Y-%m'))
     UNION
  SELECT P_BYDN as pLydn,P_TIME FROM tbl_power_info WHERE P_TIME IN
          (SELECT max(P_TIME) FROM tbl_power_info WHERE P_CODE =18 AND PERIOD_DIFF( date_format( '2017/9/26' , '%Y%m' ) , date_format( P_TIME, '%Y%m' ) ) =1)
ORDER BY pTime;


########################企业能耗统计##########################一周的尖峰谷的统计
SELECT b.P_BY1D-a.P_BY1D P_BY1D, b.P_BY2D-a.P_BY2D P_BY2D,b.P_BY4D-a.P_BY4D P_BY4D,b.P_BYDN-a.P_BYDN P_BYDN,weekday(b.P_TIME)+1 AS P_TIME FROM
  (SELECT max(P_BY1D) as P_BY1D ,max(P_BY2D)  as P_BY2D , max(P_BY4D) as P_BY4D ,max(P_BYDN) as P_BYDN  ,P_TIME  ,P_CODE from tbl_power_info
    WHERE day(P_TIME) = day(subdate(SUBDATE('2017/8/29', 7),date_format(SUBDATE('2017/8/29', 7),'%w')-6))
          OR  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK('2017/8/29') GROUP BY day(P_TIME)) a,
  (SELECT max(P_BY1D) as P_BY1D ,max(P_BY2D)  as P_BY2D , max(P_BY4D) as P_BY4D , max(P_BYDN) as P_BYDN ,P_TIME, P_CODE from tbl_power_info
    WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK('2017/8/29') GROUP BY day(P_TIME)) b
WHERE day(a.P_TIME) = day(b.P_TIME)-1 ;

SELECT weekday('2017/8/26');

SELECT P_TIME,P_BYDN,P_CODE FROM tbl_power_info;
######################查询用户角色############################
SELECT rolename FROM t_role WHERE id IN (
SELECT role_id FROM t_user_role WHERE user_id = 1) IN  (SELECT id FROM t_user WHERE username='jack');

######################能耗预警############################只能查到用户使用的电能，查不到用户的购买
# SELECT P_SYDN,max(P_TIME) FROM tbl_power_info WHERE month(P_TIME) = month('2017/8/29') AND P_CODE = 1;  这个是错误的，只是计算出来最大的时间，并没有和P_SYDN结合起来
SELECT P_BYDN pBydn,P_TIME pTime FROM tbl_power_info WHERE P_TIME IN (
SELECT max(P_TIME) FROM tbl_power_info WHERE P_CODE =23 AND DATE_FORMAT(P_TIME,'%Y') = DATE_FORMAT('2017/09/05','%Y')
GROUP BY month(P_TIME));

SELECT W_READINGS,W_TIME FROM tbl_water_info;
SELECT w_addr FROM t_water_area WHERE a_code =(
  SELECT a_code FROM t_user,t_user_per WHERE t_user.user_id = t_user_per.user_id);

############################接受水表数据##################
# 厂房编号 a_code   w_addr 水表地址
SELECT distinct W_TIME,W_READINGS  FROM tbl_water_info
WHERE  W_ADDRESS = (SELECT w_addr FROM t_water_area WHERE a_code =(
SELECT a_code FROM t_user,t_user_per WHERE t_user.user_id = 2 AND 2 = t_user_per.user_id ))
AND W_TIME IN (SELECT max(W_TIME) FROM tbl_water_info WHERE DATE(W_TIME) = DATE (now()) GROUP BY hour(W_TIME));

SELECT DISTINCT W_TIME time,W_READINGS readings FROM tbl_water_info WHERE W_TIME IN (
   SELECT max(W_TIME) From tbl_water_info where DATE (W_TIME) = DATE (now()) -2
       And  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
   GROUP BY hour(W_TIME))
      And  W_ADDRESS   IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
UNION SELECT DISTINCT W_TIME time,W_READINGS readings FROM tbl_water_info WHERE W_TIME IN (
  SELECT max(W_TIME) From tbl_water_info where DATE (W_TIME) = DATE (now()) -3
          And  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10'))
  And  W_ADDRESS   IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
ORDER BY time;

#----------------------------------------------------没写好，呜呜
SELECT  W_TIME time,W_ADDRESS address, W_READINGS readings FROM tbl_water_info where W_TIME IN (
SELECT  MAX(W_TIME) FROM tbl_water_info WHERE DATE (W_TIME) = DATE(now()) -2 GROUP BY hour(W_TIME)
             AND W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10'))
  AND W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
GROUP BY hour(W_TIME) ;

#————————————————————————————————上面

SELECT distinct W_TIME time,W_READINGS readings  FROM tbl_water_info
      WHERE  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
        AND W_TIME IN (SELECT  max(W_TIME) FROM tbl_water_info WHERE DATE(W_TIME) = DATE (now()) GROUP BY hour(W_TIME));






SELECT DISTINCT W_TIME time,W_READINGS readings,W_ADDRESS FROM tbl_water_info
    WHERE  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
            AND W_TIME IN (SELECT  max(W_TIME) FROM tbl_water_info WHERE DATE(W_TIME) = DATE (now()) GROUP BY hour(W_TIME));

# ##########################电能耗数据 ----没取到昨天最后的数据，max
/*SELECT P_BYDN,P_TIME FROM tbl_power_info WHERE P_TIME IN (
  SELECT max(P_TIME) From tbl_power_info where DATE (P_TIME) = DATE (now()) OR max(DATE (P_TIME) = DATE (now())-1)
 And P_CODE = 23
GROUP BY hour(P_TIME))
ORDER BY P_TIME;*/
SELECT P_BYDN pBydn,P_TIME pTime FROM tbl_power_info WHERE P_TIME IN (
  SELECT max(P_TIME) From tbl_power_info where DATE (P_TIME) = DATE (now()) And P_CODE = (
    SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = 'B10') GROUP BY hour(P_TIME))
UNION SELECT P_BYDN pBydn,P_TIME pTime FROM tbl_power_info WHERE P_TIME IN (
  SELECT max(P_TIME) From tbl_power_info where DATE (P_TIME) = DATE (now()) -1 And P_CODE = (
    SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = 'B10'
  )) ORDER BY pTime;

SELECT P_TIME,P_CODE FROM tbl_power_info WHERE DATE (P_TIME) = DATE (now())-1 AND P_CODE = 23;

############################获取用户对应的厂房信息#################  AH_HARDWARE_ID----对应什么，硬件地址？
SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = (
SELECT a_code FROM t_user_per,t_user WHERE t_user.user_id = t_user_per.user_id);
SELECT A_CODE,A_ENAME FROM tbl_area WHERE A_CODE = (
  SELECT a_code FROM t_user_per,t_user WHERE t_user.user_id = t_user_per.user_id);

#########################厂房编号找电能######################### AH_HARDWARE_ID 对应 pCode
SELECT P_SYDN ,P_CODE,P_TIME FROM tbl_power_info WHERE P_CODE = (
  SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = 'B10' )
GROUP BY hour(P_TIME);

#########################厂房编号找水表####################
SELECT w_addr,a_code FROM t_water_area WHERE a_code = 'B10';



#########################用水量，用电量，当前状态##########
SELECT P_BYDN,P_TIME,P_CODE FROM tbl_power_info WHERE P_TIME IN (
  SELECT MAX(P_TIME) FROM tbl_power_info WHERE DATE (P_TIME) = DATE(now()) AND P_CODE = 43) ;
SELECT  W_TIME time,W_ADDRESS address, W_READINGS readings FROM tbl_water_info where W_TIME = (
SELECT  MAX(W_TIME) FROM tbl_water_info WHERE DATE (W_TIME) = DATE(now()) )
    AND W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B8')
GROUP BY W_ADDRESS;
SELECT W_TIME FROM tbl_water_info WHERE DATE (W_TIME) = DATE (now());

SELECT distinct W_TIME time,W_READINGS readings  FROM tbl_water_info
            WHERE  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
           AND W_TIME IN (SELECT  max(W_TIME) FROM tbl_water_info WHERE DATE(W_TIME) = DATE (now()) GROUP BY hour(W_TIME));

##################################管理页面 今日能耗列表
SELECT * FROM tbl_power_info WHERE P_TIME = (
  SELECT  MAX(P_TIME) FROM tbl_power_info WHERE DATE (P_TIME) = DATE(now())
);

###############################查找能耗列表实时数据
SELECT P_SYDN,P_CODE,P_TIME FROM tbl_power_info WHERE P_TIME IN (
  SELECT max(P_TIME)  FROM tbl_power_info WHERE DATE (P_TIME) = DATE (now()) -1
  GROUP BY P_CODE);

select P_CODE,max(P_BYDN) from tbl_power_info where P_TIME
between '2017-08-25 00:00:00' and '2017-08-25 23:59:59' group by P_CODE;

select P_CODE,P_BYDN,P_TIME from tbl_power_info where P_TIME IN (
    SELECT max(P_TIME) From tbl_power_info where DATE (P_TIME) = DATE (now())-2
GROUP BY P_CODE ORDER BY P_BYDN)
UNION select P_CODE,P_BYDN,P_TIME from tbl_power_info where P_TIME IN (
  SELECT max(P_TIME) From tbl_power_info where DATE (P_TIME) = DATE (now())-1
  GROUP BY P_CODE)
ORDER BY P_TIME DESC ;

#############################pCode获取Acode----Ename
SELECT A_ENAME FROM tbl_area WHERE A_CODE = (
  SELECT AH_AREA_ID FROM tbl_area_hardware WHERE AH_HARDWARE_ID = 22
);


#############################能耗目标
#找出所有月份的能耗，平均值，作为当前预计值。参数pcode
SELECT P_BYDN ,P_TIME FROM tbl_power_info  WHERE P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info #--上个月的数据
    WHERE P_CODE = 26 and DATE_FORMAT(P_TIME,'%Y-%m') = DATE_FORMAT(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
  GROUP BY MONTH(P_TIME));

SELECT P_BYDN pBydn,P_TIME pTime FROM tbl_power_info  WHERE P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info
    WHERE P_CODE = 26 and DATE_FORMAT(P_TIME,'%Y') = DATE_FORMAT(now(),'%Y')
  GROUP BY MONTH(P_TIME));

SELECT DISTINCT W_TIME time, W_READINGS readings,W_ADDRESS FROM tbl_water_info WHERE W_TIME IN (
    SELECT max(W_TIME) FROM tbl_water_info WHERE
      DATE_FORMAT(W_TIME,'%Y') = DATE_FORMAT(now(),'%Y') GROUP BY MONTH(W_TIME))
   AND  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10');

SELECT P_A_DIANYA,P_A_DIANLIU,P_A_YGGL,P_HXYGGL,P_A_GLYS,
  P_BY_KwhZ,P_BY_KwhJ,P_BY_KwhF,P_BY_KwhP,P_BY_KwhG FROM tbl_power_info_v2 WHERE P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE DATE_FORMAT(P_TIME,'%Y-%m-%d') = DATE_FORMAT(now(),'%Y-%m-%d')
  GROUP BY P_CODE);

SELECT P_BYDN pBydn,P_CODE pCode FROM tbl_power_info WHERE P_TIME IN (
  SELECT MAX(P_TIME) FROM tbl_power_info WHERE DATE (P_TIME) = DATE(now()) -3
              GROUP BY P_CODE
);
SELECT P_A_DIANYA pADianya,P_A_DIANLIU pADianliu,P_A_YGGL pAYggl,P_HXYGGL pHXYggl,P_A_GLYS pAGlys,
       P_BY_KwhZ pBYKwhZ,P_BY_KwhJ pBYKwhJ,P_BY_KwhF pBYKwhF,P_BY_KwhP pBYKwhP ,P_BY_KwhG pBYKwhG FROM tbl_power_info_v2 WHERE P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE DATE_FORMAT(P_TIME,'%Y-%m-%d') = DATE_FORMAT('2017/9/9','%Y-%m-%d')
  GROUP BY P_CODE);

select P_CODE pCode,P_BY_KwhZ pBYKwhZ,P_TIME pTime from tbl_power_info_v2 where P_TIME IN (
    SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now())-2
            GROUP BY P_CODE ORDER BY P_BY_KwhZ)
            UNION select P_CODE,P_BYDN,P_TIME from tbl_power_info where P_TIME IN (
              SELECT max(P_TIME) From tbl_power_info where DATE (P_TIME) = DATE (now())-1
              GROUP BY P_CODE)
            ORDER BY pTime DESC;

SELECT sum(P_BY_KwhZ) FROM tbl_power_info_v2 WHERE P_TIME IN (

  SELECT max(P_TIME)  FROM tbl_power_info_v2 WHERE DATE (P_TIME) = DATE (now()) -1
   GROUP BY P_CODE);

SELECT P_BY_KwhZ pBYKwhZ,P_CODE pCode FROM tbl_power_info_v2 WHERE P_TIME IN (
SELECT MAX(P_TIME) FROM tbl_power_info_v2 WHERE DATE (P_TIME) = DATE(now()) -1
GROUP BY P_CODE);

SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime FROM tbl_power_info_v2 WHERE P_TIME IN (

    SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now()) -1  And P_CODE = (
      SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = 'B10') GROUP BY hour(P_TIME))
  UNION SELECT P_BY_KwhZ ,P_TIME  FROM tbl_power_info_v2 WHERE P_TIME IN (
    SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now()) -2 And P_CODE = (
      SELECT AH_HARDWARE_ID FROM tbl_area_hardware WHERE AH_AREA_ID = 'B10'
    )) ORDER BY pTime;


SELECT P_TIME pTime,P_BY_KwhZ pBYKwhZ FROM tbl_power_info_v2 WHERE  P_TIME IN (

  SELECT max(P_TIME) FROM tbl_power_info_v2  WHERE  month (P_TIME) = month (now()) and P_CODE = 23 GROUP BY day(P_TIME))
 UNION
 SELECT P_TIME ,P_BY_KwhZ FROM tbl_power_info_v2 WHERE P_TIME IN (
   SELECT max(P_TIME) FROM tbl_power_info_v2  WHERE  month (P_TIME) = month (now())-1 and P_CODE = 23)
 ORDER BY pTime;

SELECT P_TIME pTime,P_BY_KwhZ pBYKwhZ FROM tbl_power_info_v2 WHERE  P_TIME IN (

   SELECT max(P_TIME) FROM tbl_power_info_v2  WHERE  DATE (P_TIME) = DATE ('2017/09/09') and P_CODE = 23 GROUP BY hour(P_TIME))
  UNION
  SELECT P_TIME ,P_BY_KwhZ  FROM tbl_power_info_v2 WHERE P_TIME IN (
    SELECT max(P_TIME) FROM tbl_power_info_v2  WHERE  DATE (P_TIME) = DATE ('2017/09/09')-1 and P_CODE = 23)
  ORDER BY pTime;

SELECT P_BY_KwhJ pBYKwhJ,P_BY_KwhF pBYKwhF, P_BY_KwhG pBYKwhG,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN(

  SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE  month(P_TIME) = month('2017/09/09') AND P_CODE = 23 GROUP BY day(P_TIME))
   UNION
   (SELECT P_BY_KwhJ ,P_BY_KwhF, P_BY_KwhG,P_TIME from tbl_power_info_v2 WHERE  P_TIME IN (
    SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE  month(P_TIME) = month('2017/09/09')-1 AND P_CODE = 23))
 ORDER BY pTime;

SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime FROM tbl_power_info_v2  WHERE P_TIME IN (
  SELECT max(P_TIME) FROM tbl_power_info_v2
     WHERE P_CODE = #{pCode} and DATE_FORMAT(P_TIME,'%Y') = DATE_FORMAT(now(),'%Y')
   GROUP BY MONTH(P_TIME));


SELECT  P_BY_KwhZ pBYKwhZ,P_BY_KwhJ pBYKwhJ,P_BY_KwhF pBYKwhF, P_BY_KwhG pBYKwhG,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN(
               SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK('2017/09/09') AND P_CODE = 23 GROUP BY day(P_TIME))
            UNION
            (SELECT P_BY_KwhZ , P_BY_KwhJ ,P_BY_KwhF, P_BY_KwhG,P_TIME from tbl_power_info_v2 WHERE  P_TIME IN (
              SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK('2017/09/09')-1 AND P_CODE = 23))
            ORDER BY pTime;

SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime FROM tbl_power_info_v2 WHERE P_TIME IN (
       SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE P_CODE =23 AND DATE_FORMAT(P_TIME,'%Y') = DATE_FORMAT('2017/09/09','%Y')
      GROUP BY month(P_TIME));

SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN(
      SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK('2017/09/09') AND P_CODE = #{pCode} GROUP BY day(P_TIME))
    UNION
    (SELECT P_BY_KwhZ,P_TIME from tbl_power_info_v2 WHERE  P_TIME IN (
      SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE  YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK('2017/09/09')-1 AND P_CODE = #{pCode}))
    ORDER BY pTime;

SELECT P_BY_KwhZ pBYKwhZ,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN
           (SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE P_CODE = 23 AND DATE_FORMAT(P_TIME,'%Y-%m')=DATE_FORMAT('2017/09/09','%Y-%m'))
       UNION
    SELECT P_BY_KwhZ as pLydn,P_TIME FROM tbl_power_info_v2 WHERE P_TIME IN
            (SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE P_CODE = 23 AND PERIOD_DIFF( date_format( '2017/09/09' , '%Y%m' ) , date_format( P_TIME, '%Y%m' ) ) =1)
  ORDER BY pTime;


SELECT DISTINCT W_TIME time, W_READINGS readings,W_ADDRESS FROM tbl_water_info WHERE W_TIME IN (
     SELECT max(W_TIME) FROM tbl_water_info WHERE
     DATE_FORMAT(W_TIME,'%Y') = DATE_FORMAT(now(),'%Y') GROUP BY MONTH(W_TIME))
  AND  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'A21');

select P_CODE pCode,P_BY_KwhZ pBYKwhZ,P_TIME pTime from tbl_power_info_v2 where P_TIME IN (
   SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now())
         GROUP BY P_CODE ORDER BY P_BY_KwhZ)
         UNION select P_CODE,P_BY_KwhZ,P_TIME from tbl_power_info_v2 where P_TIME IN (
           SELECT max(P_TIME) From tbl_power_info_v2 where DATE (P_TIME) = DATE (now())-1
           GROUP BY P_CODE)
         ORDER BY pTime DESC

