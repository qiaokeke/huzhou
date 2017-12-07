package com.example.huzhou.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.entity.PowerInfoDH;
import com.example.huzhou.service.PowerInfoService;
import com.example.huzhou.service.PowerInfoServiceDH;
import com.example.huzhou.service.UserOwnerService;
import com.example.huzhou.util.ConstantUtil;
import com.example.huzhou.util.Utils;
import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Created by Raytine on 2017/8/27.
 */
@Controller
@RequestMapping("/analysis")
public class PowerInfoAnalysisController {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    PowerInfoService powerInfoService;
    @Autowired
    UserOwnerService userOwnerService;

    /**
     * 按周统计，还是咋来着？？？ 所有的访问路径  localhost:8080/analysis/......
     * @param aCode                      比如  localhost:8080/analysis/nenghao
     * @param time
     * @return  对应大数据分析页面
     */
    @ResponseBody
    @RequestMapping("/nenghao")//要根据公司的名称来判断
    public String getConsumption(@RequestParam(value = "category" ,defaultValue = "公司行业") String category,
                                    @RequestParam(value = "aCode" ,defaultValue = "A21") String aCode,
                                    @RequestParam(value="time",defaultValue = "2017/9/12") String time){
        logger.info(aCode+"   "+time);
        List<Map<String, String>> list = new ArrayList<>();
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        logger.info(String.valueOf(comCode.size()));
        boolean flag = true;
        for (Object object : comCode) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((int) object == ConstantUtil.PCODE_LIST[j]) {
                    List<PowerInfo> infoList = powerInfoService.getConsumption(category, (Integer) object,time);
                    for (int i =1;i < infoList.size();i++) {
                        Map<String ,String > map = new HashMap<>();
                        map.put("time",infoList.get(i).getpTime());//从周天开始
                        map.put("total", String.valueOf(infoList.get(i).getpBYKwhZ()-infoList.get(i-1).getpBYKwhZ())); //总能耗
                        map.put("tip", String.valueOf(infoList.get(i).getpBYKwhJ() - infoList.get(i - 1).getpBYKwhJ())); //尖
                        map.put("peak", String.valueOf(infoList.get(i).getpBYKwhF() - infoList.get(i - 1).getpBYKwhF())); //峰
                        map.put("valley", String.valueOf(infoList.get(i).getpBYKwhG() - infoList.get(i - 1).getpBYKwhG())); //谷
                        list.add(map);
                    }
                    flag = false;
                    break;
                }
            }
        }

        return JSON.toJSONString(list);
    }

    //企业用电量统计----按照月份统计  TODO 没有用相减，就两个月的，减了就没有了
    @ResponseBody
    @RequestMapping("/info")//要根据公司的名称来判断
    public String electricInfo(@RequestParam(value = "category" ,defaultValue = "科技") String category,
                                @RequestParam(value = "aCode" ,defaultValue = "A21") String aCode,
                                  @RequestParam(value="time",defaultValue = "2017/9/9") String time){
        List<Map<String, String>> list = new ArrayList<>();
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        boolean flag = true;
        for (Object object : comCode) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((Integer) object == ConstantUtil.PCODE_LIST[j]) {
                    List<PowerInfo> infoList = powerInfoService.getElectricInfo(category, (Integer) object,time);
                    for (PowerInfo info: infoList) {
                        Map<String ,String > map = new HashMap<>();
                        map.put("time",info.getpTime());
                        map.put("electricValue", String.valueOf(info.getpBYKwhZ()));
                        list.add(map);
                    }
                    flag = false;
                    break;
                }
            }

        }
        return JSON.toJSONString(list);
    }
//    用电状态和趋势
    @ResponseBody
    @RequestMapping("/state")//要根据公司的名称来判断
    public String electricState(@RequestParam(value = "category" ,defaultValue = "公司行业") String category,
                               @RequestParam(value = "aCode" ,defaultValue = "A21") String aCode,
                               @RequestParam(value="time",defaultValue = "2017/9/12") String time){
        List<Map<String, String>> list = new ArrayList<>();
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        boolean flag = true;
        for (Object object : comCode) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((int) object == ConstantUtil.PCODE_LIST[j]) {
                    List<PowerInfo> infoList = powerInfoService.getElectricState(category, (Integer) object,time);
                    for (int i =1;i < infoList.size();i++) {
                        System.out.println(infoList.get(i));
                        Map<String ,String > map = new HashMap<>();
                        map.put("time",infoList.get(i).getpTime()); //从周天开始的数据
                        float e =infoList.get(i).getpBYKwhZ()-infoList.get(i-1).getpBYKwhZ();
                        if(e<0)
                            e=0;
                        map.put("electricWeekCon", String.valueOf(e));
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
     *   用电同比增长,取出来的是本月的电能，和上个月的电能，没有进行比较，没办法取出上个月的数据，所以传递的code有问题
     * @param category 公司类比
     * @param aCode 公司名称
     * @param time  时间，页面上的日历传回来的是一个默认的数值，页面上日历显示的也是一个默认的值
     * @return  json                  有个问题，就是页面上显示的是本月和上个月结算的电费，但是目前来看，本月并不能结算掉，所以页面要修改 --TODO
     */
    @ResponseBody
    @RequestMapping("/compare")//要根据公司的名称来判断
    public String electricCompare(@RequestParam(value = "category" ,defaultValue = "公司行业") String category,
                                @RequestParam(value = "aCode" ,defaultValue = "B10") String aCode,
                                @RequestParam(value="time",defaultValue = "2017/9/9") String time){
        List<Map<String, String>> list = new ArrayList<>();
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        boolean flag = true;
        for (Object object : comCode) {
            for (int j = 0; j < ConstantUtil.PCODE_LIST.length; j++) {
                if ((int) object == ConstantUtil.PCODE_LIST[j]) {
                    List<PowerInfo> infoList = powerInfoService.getElectricCompare(category, (Integer) object,time);
                    for (PowerInfo info: infoList) {
                        Map<String ,String > map = new HashMap<>();   //返回两组数据，一组是本月的，一组是上个月的
                        map.put("time",info.getpTime());
                        map.put("monthCon", String.valueOf(info.getpBYKwhZ()));
                        map.put("lastCon", String.valueOf(info.getpLydn()));
                        list.add(map);
                    }
                    flag = false;
                    break;
                }
            }

        }
        return JSONObject.toJSONString(list);
    }

    //能耗指标分析
    @ResponseBody
    @RequestMapping("/eleIndex")//要根据公司的名称来判断
    public String electricIndex(@RequestParam(value = "category" ,defaultValue = "公司行业") String category,
                                  @RequestParam(value = "aCode" ,defaultValue = "B10") String aCode,
                                  @RequestParam(value="time",defaultValue = "2017/8/26") String time){
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        List<PowerInfo> infoList = powerInfoService.getElectricIndex(category, (Integer) comCode.get(0),time);
        return "";
    }

}
