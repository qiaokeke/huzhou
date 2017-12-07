package com.example.huzhou.util;

import java.text.DecimalFormat;

/**
 *  常量
 */
public class ConstantUtil {
    //隐藏构造器
    private ConstantUtil() {
    }

    /***************session start**********************/
    public final static String CURRENT_LOGIN_USER = "current_login_user";
    public final static double CURRENT_COAL_NUM = 0.404;
    public final static int[] PCODE_LIST = {1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
    public final static int[] DH_PCODE_LIST = {
    };
    public final static String ELEC_ID = "1053"; // 有功电能
    public final static String ELEC_J = "1054";  // 尖
    public final static String ELEC_F = "1055";  // 峰
    public final static String ELEC_G = "1056";  // 谷
    public final static String DIANYA = "1058";  // 电压
    public final static String DIANLIU = "1064";  // 电流
    public final static String YGGL = "1067";  // 有功功率
    public final static String ZGL = "1067";  // 总功率
    public final static String ZGLYS = "1059";  // 平 --- 代替总功率因数

    public final static DecimalFormat DECIMAL_FORMAT = new DecimalFormat("#0.00");
}
