package com.example.huzhou.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.entity.PowerInfoDH;
import com.example.huzhou.entity.WaterInfo;
import com.example.huzhou.service.PowerInfoService;
import com.example.huzhou.service.PowerInfoServiceDH;
import com.example.huzhou.service.UserOwnerService;
import com.example.huzhou.service.UserService;
import com.example.huzhou.util.BeiLvUtil;
import com.example.huzhou.util.ConstantUtil;
import com.example.huzhou.util.JsonUtil;
import com.example.huzhou.util.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Raytine on 2017/8/27.
 */
@Controller
@RequestMapping("/ssjc")
public class PowerInfoDetectController {
    @Autowired
    PowerInfoService powerInfoService;
    @Autowired
    UserService userService;
    @Autowired
    UserOwnerService userOwnerService;

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping("/water")//要根据公司的名称来判断
    public String getWaterPerHour(@RequestParam(value = "category", defaultValue = "厨具业") String category,
                                  @RequestParam(value = "aCode", defaultValue = "A21") String aCode) {
        List<Map<String, String>> list = new ArrayList<>();
        List pList = userOwnerService.selectPcodeByAcode(aCode);
        boolean flag = true;
        List<PowerInfo> eletricSsjc = null;
        List<WaterInfo> waterSsjc = powerInfoService.getWaterPerHour(category, aCode);

        if (waterSsjc != null && waterSsjc.size() != 0) {
            if (waterSsjc.size() == 1) {
                Map<String, String> map = new HashMap<>();
                map.put("time", waterSsjc.get(0).getTime());
                map.put("water", waterSsjc.get(0).getReadings());
                list.add(map);
            }
            int i = 0;
            while (i < waterSsjc.size() - 2) {
                Double readings = Double.parseDouble(waterSsjc.get(i).getReadings());
                Map<String, String> map = new HashMap<>();
                map.put("time", waterSsjc.get(i).getTime());
                while (waterSsjc.get(i).getTime().equals(waterSsjc.get(i + 1).getTime())) {
                    readings += Double.parseDouble(waterSsjc.get(i + 1).getReadings());
                    i++;
                }
                map.put("water", ConstantUtil.DECIMAL_FORMAT.format(readings));
                i++;
                list.add(map);
            }
            for (int j = 1; j < list.size(); j++) {
                double result = Double.parseDouble(list.get(j).get("water")) - Double.parseDouble(list.get(j - 1).get("water"));
                if(result<=0){
                    result =0;
                }
                list.get(j - 1).put("time", list.get(j).get("time"));
                list.get(j - 1).put("water", String.valueOf(ConstantUtil.DECIMAL_FORMAT.format(result)));
            }
            try{
                list.remove(list.size() -1); //
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }

        for (Object object : pList) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((int) object == ConstantUtil.PCODE_LIST[j]) {
                    // 去原来的数据库里查询数据库
                    eletricSsjc = powerInfoService.getEletricSsjc((int) pList.get(0));
                    for (int k = 1; k < eletricSsjc.size(); k++) {
                        Map<String, String> mapELetric = new HashMap<>();
                        mapELetric.put("time", eletricSsjc.get(k).getpTime()); //应该是i+1
                        float e = eletricSsjc.get(k).getpBYKwhZ() - eletricSsjc.get(k - 1).getpBYKwhZ();
                        //System.out.println(e);
                        if(e<=0){
                            e=0;
                        }
                       // logger.info("k Pcode:"+eletricSsjc.get(k).getpCode());
                        float value = e*BeiLvUtil.BEILVTABLE[(int) pList.get(0)];
                        if (value>100.0)
                            value=0;
                        mapELetric.put("electric", String.valueOf(value));
                        list.add(mapELetric);
                    }
                    flag = false;
                    break;
                }
            }

        }
        return JSON.toJSONString(list);
    }

    /**
     * 获取当前月的能耗数据，参数公司名
     * 现在先给电表编号
     */
    @ResponseBody
    @RequestMapping("/timeCalendar")
    public String getTimeCalendar(@RequestParam(value = "aCode", defaultValue = "A21") String aCode,
                                  @RequestParam(value = "time", defaultValue = "2017/10/05") String time) {
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        boolean flag = true;
        List<PowerInfo> infoList = null;
        Map<String, String> map;
        List<Map<String, String>> list = new ArrayList<>();
        //System.out.println("comcode:"+comCode.get(0));
        for (Object object : comCode) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((int) object == ConstantUtil.PCODE_LIST[j]) {
                    // 去原来的数据库里查询数据库
                    infoList = powerInfoService.selectTimeCalendar((Integer) object, time);
                    for (int i = 1; i < infoList.size(); i++) {
                        System.out.println(infoList.get(i));
                        map = new HashMap<>();
                        map.put("time", infoList.get(i).getpTime());
                        float value = infoList.get(i).getpBYKwhZ() - infoList.get(i - 1).getpBYKwhZ();
                        if(value<0) value=0;
                        map.put("timeConsumption", String.valueOf(ConstantUtil.DECIMAL_FORMAT.format(value)));
                        list.add(map);
                    }
                    flag = false;
                    break;
                }
            }

        }
        return JSONObject.toJSONString(list);
    }

    /**
     * 根据公司名称和日历的时间去获取能耗数据
     * 能耗日历的时间，不能写死
     * 点击能耗日历的分时能耗 ,, 实时数据
     */
    @ResponseBody
    @RequestMapping("/timeConsumption")
    public String getTimeConsumption(@RequestParam(value = "aCode", defaultValue = "A21") String aCode,
                                     @RequestParam(value = "calendar", defaultValue = "2017-10-9") String calendar) {
        List<Map<String, String>> list = new ArrayList<>();
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        boolean flag = true;
        for (Object object : comCode) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((int) object == ConstantUtil.PCODE_LIST[j]) {
                    // 去原来的数据库里查询数据库
                    List<PowerInfo> infoList = powerInfoService.selectTimeConsumption((Integer) object, calendar);
                    for (int i = 1; i < infoList.size(); i++) {
                        Map<String, String> map = new HashMap<>();
                        map.put("time", infoList.get(i).getpTime());
                        float value = infoList.get(i).getpBYKwhZ() - infoList.get(i - 1).getpBYKwhZ();
                        if(value<0) value=0;
                        map.put("timeConsumption", String.valueOf(ConstantUtil.DECIMAL_FORMAT.format(value)));
                        list.add(map);
                    }
                    flag = false;
                    break;
                }
            }
        }

        return JSON.toJSONString(list);
    }

    /**
     * 根据公司名获取峰谷能耗，给出当前月的默认值
     * 获取用户选取的时间，--把日历的时间改成动态获取，根据当前的时间来赋值
     *
     * @param aCode 厂房编号
     *              comName 公司名
     * @param time  选择日历的时间
     * @return
     */
    @ResponseBody
    @RequestMapping("/gufengCalendar")
    public String getValleyData(@RequestParam(value = "aCode", defaultValue = "A21") String aCode,
                                @RequestParam(value = "time", defaultValue = "2017/10/5") String time) {
        List<Map<String, String>> list = new ArrayList<>();
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        for (Object object : comCode) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((Integer) object == ConstantUtil.PCODE_LIST[j]) {
                    List<PowerInfo> infoList = powerInfoService.getValleyData((Integer) object, time);
                    for (int i = 1; i < infoList.size(); i++) {
                        Map<String, String> map = new HashMap<>();
                        map.put("time", infoList.get(i).getpTime());
                        float tipValue =infoList.get(i).getpBYKwhJ() - infoList.get(i - 1).getpBYKwhJ();
                        if(tipValue<0)tipValue=0;
                        float peakValue = infoList.get(i).getpBYKwhF() - infoList.get(i - 1).getpBYKwhF();
                        if(peakValue<0)peakValue=0;
                        float valleyValue = infoList.get(i).getpBYKwhG() - infoList.get(i - 1).getpBYKwhG();
                        if(valleyValue<0)valleyValue=0;
                        map.put("tip", String.valueOf(ConstantUtil.DECIMAL_FORMAT.format(tipValue))); //尖
                        map.put("peak", String.valueOf(ConstantUtil.DECIMAL_FORMAT.format(peakValue))); //峰
                        map.put("valley", String.valueOf(ConstantUtil.DECIMAL_FORMAT.format(valleyValue))); //谷
                        list.add(map);
                    }
                    return JSON.toJSONString(list);
                }
            }


        }
        return JSON.toJSONString(list);
    }

    /**
     * 根据公司名称获取，当前周的能耗数据  -----周能耗是指什么能耗，水电，一周的能耗，每天的能耗，难道是每天水电能耗之和？
     *
     * @param aCode 厂房编号
     *              comName公司名
     * @return
     */
    @ResponseBody
    @RequestMapping("/weekConsumption")
    public String getWeekConsumption(@RequestParam(value = "aCode", defaultValue = "B10") String aCode) {
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        return "";
    }

    /**
     * 获取该公司的能耗目标，电，水，企业分类     ------这个貌似还没有
     * <p>
     * 将今年所有月份的能耗都取出来了，正常情况下，是有数据的，
     * 正常情况一：刚刚开业，只有当前月数据，
     * 正常情况二：list中的最后一个数据，是当前月的数据，可以作为占比来用
     * 不正常情况：数据间断读取，停工？
     * 情况：表中只有一个数据，是当前月份的数据，不是当前月份的数据
     *
     * @param aCode 公司编号
     * @return
     */
    @ResponseBody
    @RequestMapping("/target")
    public String getTarget(@RequestParam(value = "aCode", defaultValue = "A21") String aCode) {
        Map<String, String> map = new HashMap<>();
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        boolean flag = true;
        double sum = 0;
        List<PowerInfo> eleInfos = null;
        List<WaterInfo> waterInfos = userOwnerService.getWaterByMonth(aCode);
        for (Object object : comCode) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((int) object == ConstantUtil.PCODE_LIST[j]) {
                    eleInfos = powerInfoService.getElecByMonth((Integer) object);
                    if (eleInfos.size() > 0) { //!= null
                        if (eleInfos.size() == 1 && Utils.isThisTime(eleInfos.get(0).getpTime(), "yyyy-MM")) {//判断是不是9月
                            map.put("eleTarget", "未知");
                            map.put("elePercent", "只有当前月份的数据"); //本月当前电能占比,如果是9月，说明没有历史数据，只有当前月份，给什么提示呢？
                        } else if (eleInfos.size() == 1 && !Utils.isThisTime(eleInfos.get(0).getpTime(), "yyyy-MM")) {
                            sum = eleInfos.get(0).getpBYKwhZ();
                            map.put("eleTarget", String.valueOf(sum));
                            map.put("elePercent", "没有本月数据");
                        } else {
                            for (int i = 0; i < eleInfos.size() - 1; i++) {
                                sum += eleInfos.get(i).getpBYKwhZ();
                            }
                            sum = sum / (eleInfos.size() - 1); //本月的能耗目标
                            map.put("eleTarget", String.valueOf(sum));
                            if (!Utils.isThisTime(eleInfos.get(eleInfos.size() - 1).getpTime(), "yyyy-MM")) {
                                map.put("elePercent", "未能读取到本月数据");
                            }
                            map.put("elePercent", String.valueOf(eleInfos.get(eleInfos.size() - 1).getpBYKwhZ() / sum)); //本月当前电能占比
                        }
                    }
                    flag = false;
                    break;
                }
            }
        }
//


        return JSONObject.toJSONString(map);
    }

    /**
     * 获取当前月份的用水量，用电量
     *
     * @param comName 公司名
     * @return
     */
    @ResponseBody
    @RequestMapping("/leftVal")
    public String getLeftVal(@RequestParam(value = "comName", defaultValue = "1") String comName) {
        return "";
    }

}
