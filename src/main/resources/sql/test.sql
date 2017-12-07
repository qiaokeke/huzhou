SELECT DISTINCT W_TIME time,W_READINGS readings FROM tbl_water_info WHERE W_TIME IN (
  SELECT max(W_TIME) From tbl_water_info where DATE (W_TIME) = DATE (now())
        And  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
    GROUP BY hour(W_TIME))
       And  W_ADDRESS   IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
 UNION SELECT DISTINCT W_TIME time,W_READINGS readings FROM tbl_water_info WHERE W_TIME IN (
   SELECT max(W_TIME) From tbl_water_info where DATE (W_TIME) = DATE (now()) -1
           And  W_ADDRESS IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10'))
   And  W_ADDRESS   IN (SELECT w_addr FROM t_water_area WHERE a_code = 'B10')
 ORDER BY time;

SELECT  P_BY_KwhZ pBYKwhZ,P_BY_KwhJ pBYKwhJ,P_BY_KwhF pBYKwhF, P_BY_KwhG pBYKwhG,P_TIME pTime from tbl_power_info_v2 WHERE  P_TIME IN(
      SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(now()) AND P_CODE = 23 GROUP BY day(P_TIME))
 UNION
 (SELECT P_BY_KwhZ , P_BY_KwhJ ,P_BY_KwhF, P_BY_KwhG,P_TIME from tbl_power_info_v2 WHERE  P_TIME IN (
   SELECT max(P_TIME) FROM tbl_power_info_v2 WHERE YEARWEEK(DATE_FORMAT(P_TIME,'%Y-%m-%d')) = YEARWEEK(now())-1 AND P_CODE = 23))
 ORDER BY pTime