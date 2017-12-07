package com.example.huzhou.util;

import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.Map;

/**
 * Created by Raytine on 2017/9/7.
 */
public class Utils {
    public static boolean isThisTime(String time,String pattern){
        String re = time.substring(0,time.lastIndexOf("-"));
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String now = sdf.format(new Date());//当前时间
        return re.equals(now);
    }
    public static class MapComparatorAsc implements Comparator<Map<String, String>> {
        @Override
        public int compare(Map<String, String> m1, Map<String, String> m2) {
            Integer v1 = Integer.valueOf(m1.get("consumption"));
            Integer v2 = Integer.valueOf(m2.get("consumption"));
            if(v1 != null){
                return v1.compareTo(v2);
            }
            return 0;
        }
    }
    public static class MapComparatorDesc implements Comparator<Map<String, String>> {
        @Override
        public int compare(Map<String, String> m1, Map<String, String> m2) {
            Integer v1 = Integer.valueOf(m1.get("consumption"));
            Integer v2 = Integer.valueOf(m2.get("consumption"));
            if (v2 != null) {
                return v2.compareTo(v1);
            }
            return 0;
        }
    }
    public static void main(String[] args) {
        String str = "2017-09-09 05:41:60";
        System.out.println(isThisTime(str,"yyyy-MM"));
        System.out.println( str.split(" ")[0]);
    }
}
