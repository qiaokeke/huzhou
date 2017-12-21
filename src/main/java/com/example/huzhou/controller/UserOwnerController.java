package com.example.huzhou.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.huzhou.entity.*;
import com.example.huzhou.mapper.test1.UserDao;
import com.example.huzhou.mapper.test1.UserOwnerDao;
import com.example.huzhou.service.PowerInfoService;
import com.example.huzhou.service.PowerInfoServiceDH;
import com.example.huzhou.service.UserOwnerService;
import com.example.huzhou.util.BeiLvUtil;
import com.example.huzhou.util.ConstantUtil;
import com.example.huzhou.util.Utils;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * Created by Raytine on 2017/9/2.
 */
@RequestMapping("/company")
@Controller
public class UserOwnerController {
    @Autowired
    UserOwnerService userOwnerService;
    @Autowired
    UserDao userDao;
    @Autowired
    PowerInfoService powerInfoService;

    @Autowired
    UserOwnerDao userOwnerDao;
    @RequestMapping("/todayList")
    @ResponseBody
    public  List<PowerListInfo> getTodayList(){
        return  userOwnerDao.selectPowerListInfo();
    }

    @RequestMapping("/getTop5Company")
    @ResponseBody
    public List<PowerTotalInfo> getTop5Compay(){
        return powerInfoService.getTop5TotalPowerInfo();
    }

    /**
     * 实时监测请求路径，渲染到ssjc的map地图上
     *
     * @return
     */
    @RequestMapping("/info")
    @ResponseBody
    public String getEInfo() {
        Subject curUser = SecurityUtils.getSubject();
        String userName = (String) curUser.getPrincipal();
        User user = userDao.getByUserName(userName);
        int id = 1;
        if (!curUser.hasRole("admin")) {
            id = user.getUserId();
        }
        List<Map<String, String>> list = new ArrayList<>();
        List<UserOwner> eTypeList = userOwnerService.getAllType();
        List<UserOwner> ownerList = userOwnerService.selectCompanyNameById(id);
        for (UserOwner info : ownerList) {
            Map<String, String> map = new HashMap<>();
            for (UserOwner typeList : eTypeList) {
                if (info.getaEname().equals(typeList.getaEname())) {
                    if (typeList.getoType() == null) {
                        map.put("type", "无");
                    }
                    map.put("type", typeList.getoType());
                    break;
                }
            }
            map.put("code", info.getaCode());
            map.put("name", info.getaEname());
            list.add(map);
        }
        return JSONObject.toJSONString(list);
    }
    @RequestMapping("/mapInfo")
    @ResponseBody
    public List<Object> getSsjcMapInfo(){
        List<Object> list = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        List<SsjcMapInfo> ssjcMapInfoList = userOwnerService.selectMapInfo();
        for (SsjcMapInfo ssjcMapInfo:ssjcMapInfoList){
            map.put(ssjcMapInfo.getFactoryNumber(),ssjcMapInfo);
        }
        list.add(map);
        return list;
    }

    //拿到地图上的acode，去获取相应的水表电表，TODO
    public String getMapInfo() {
        Subject curUser = SecurityUtils.getSubject();
        String userName = (String) curUser.getPrincipal();
        User user = userDao.getByUserName(userName);
        int id = 1;
        if (!curUser.hasRole("admin")) {
//            id = user.getId();
            id = user.getUserId();
        }
        Map<String, Object> voMap = new HashMap<>();
        String result = "";
//        Double currElectric = 0.0;
        float currElectric = 0.0f;
        Double readings = 0.0;
        List<PowerInfo> elecList = powerInfoService.getCurrElectricForAll();

        // 用水量，用电量，能耗状态
        List<UserOwner> eNameList = userOwnerService.selectCompanyNameById(id);
        for (UserOwner info : eNameList) {
            //获取这个页面上的Code
            String aCode = info.getaCode();
            List pCodeList = userOwnerService.selectPcodeByAcode(aCode);
            //过滤掉没有pCode的楼号信息
            if (pCodeList.size() > 0) {
                //确实是有的acode代表公司，有pCode电表编号，但是像食堂，或者信息不详细的就没有电表
                System.out.println(pCodeList.size() + "----长度----" + aCode);
//                currElectric = powerInfoService.getCurrElectric((Integer) pCodeList.get(0));
                for (PowerInfo powerInfo : elecList) {
                    if (powerInfo.getpCode() == (Integer) pCodeList.get(0)) {
                        currElectric = powerInfo.getpBYKwhZ();
                        break;
                    }
                }
                List<WaterInfo> waterList = userOwnerService.getCurrWater(aCode);//需要什么参数，需改、、
                if (waterList.size() == 1) {
                    readings = Double.parseDouble(waterList.get(0).getReadings());
                }
                if (waterList.size() >= 2) {
                    for (int i = 0; i < waterList.size() - 1; i++) {
                        if (waterList.get(i).getTime().equals(waterList.get(i + 1).getTime())) {
                            readings += Double.parseDouble(waterList.get(i).getReadings()) + Double.parseDouble(waterList.get(i).getReadings());
                        }
                    }
                }

                SsjcMapInfo sm = new SsjcMapInfo();
                sm.setCompanyName(info.getaEname());//acode
                sm.setElectricity(currElectric);
                sm.setEnergyState("正常");
                sm.setFactoryNumber(info.getaCode());
                sm.setWater(Double.valueOf(ConstantUtil.DECIMAL_FORMAT.format(readings)));
                voMap.put(info.getaCode(), sm);
            }
        }

//        [{"B10":{"companyName":"湖州舒乐网络科技有限公司","electricity":0,"energyState":"正常","factoryNumber":"B10","water":50.2}}]
        System.out.println("+++++" + JSONArray.fromObject(voMap).toString());
//        {"B10":{"companyName":"湖州舒乐网络科技有限公司","electricity":0,"energyState":"正常","factoryNumber":"B10","water":50.2}}
        System.out.println("----" + JSONSerializer.toJSON(voMap));

        return JSONArray.fromObject(voMap).toString();
    }

    //标准煤
    @RequestMapping("/getCoal")
    @ResponseBody
    public String getCoalByYear() {
        double comSum;
        Map<String, String> map = new HashMap<>();
        Double coalNum = userOwnerService.getCoalByYear();

        String result = ConstantUtil.DECIMAL_FORMAT.format(ConstantUtil.CURRENT_COAL_NUM * coalNum);
        map.put("coal", result);
        return JSONObject.toJSONString(map);
    }

    //企业实时能耗数据，取出来前5个，就是排名，数据库里排序了
    @RequestMapping("/getEConsumption")
    @ResponseBody
    public String getSsjcConsumption() {
        List<PowerInfo> infoList = userOwnerService.getSsjcConsumption();

        for (int i = 0; i < infoList.size(); i++) {
            for (int j = i + 1; j < infoList.size(); j++)
                if (infoList.get(i).getpCode() == infoList.get(j).getpCode()) {
                    infoList.get(i).setpBYKwhZ(infoList.get(i).getpBYKwhZ() - infoList.get(j).getpBYKwhZ());
                    infoList.remove(j);
                    break;
                }
        }
        List<Map<String, String>> list = new ArrayList<>();
        Double readings = 0.0;
        for (PowerInfo info : infoList) {
            if(userOwnerService.getEnameByPCode(info.getpCode())==null){
                continue;
            }
            Map<String, String> map = new HashMap<>();
            map.put("time", info.getpTime());
            map.put("eName", userOwnerService.getEnameByPCode(info.getpCode()));
            map.put("consumption", String.valueOf(ConstantUtil.DECIMAL_FORMAT.format(info.getpBYKwhZ()* BeiLvUtil.BEILVTABLE[info.getpCode()])));//换算标准煤
            readings = getWaterValue(info.getpCode());
            map.put("water", String.valueOf(readings));
            list.add(map);
        }
        // 拿到id


//        Collections.sort(list, new Utils.MapComparatorAsc().compare());
        Collections.sort(list, new MapComparatorAsc());
        return JSONObject.toJSONString(list);
    }

    // 管理页面上的能耗列表
    @ResponseBody
    public String getConsumptionByToday() {
        List<BasePowerInfo> infos = powerInfoService.getConsumptionByToday();
        List<Map<String, String>> list = new ArrayList<>();
        for (BasePowerInfo info : infos) {
            Map<String, String> map = new HashMap<>();
            String name = userOwnerService.getEnameByPCode(info.getPowerInfo().getpCode());
            if(name==null)
                continue;
            map.put("eName", name);
            map.put("dianLiu", ConstantUtil.DECIMAL_FORMAT.format(info.getpADianliu()));
            map.put("dianYa", ConstantUtil.DECIMAL_FORMAT.format(info.getpADianya()));
            map.put("yggl", ConstantUtil.DECIMAL_FORMAT.format(info.getpAYggl()));
            map.put("zgl", ConstantUtil.DECIMAL_FORMAT.format(info.getpHXYggl())); //总功率
            map.put("glys", ConstantUtil.DECIMAL_FORMAT.format(info.getpAGlys())); //功率因数
            map.put("pdn", ConstantUtil.DECIMAL_FORMAT.format(info.getpBYKwhP())); //总功率因数 ---平电能
            map.put("zdn", ConstantUtil.DECIMAL_FORMAT.format(info.getPowerInfo().getpBYKwhZ())); //总电能
            map.put("jdn", ConstantUtil.DECIMAL_FORMAT.format(info.getPowerInfo().getpBYKwhJ())); //尖电能
            map.put("fdn", ConstantUtil.DECIMAL_FORMAT.format(info.getPowerInfo().getpBYKwhF())); //峰电能
            map.put("gdn", ConstantUtil.DECIMAL_FORMAT.format(info.getPowerInfo().getpBYKwhG())); //谷电能
            map.put("time", info.getPowerInfo().getpTime());
            map.put("multiple", "1"); //倍率
            list.add(map);
        }

        return JSONObject.toJSONString(list);
    }

    private Double getWaterValue(int pCode) {
        Double readings = 0.0;
        String aCode = userOwnerService.getAcodeByPcode(pCode);
        List<WaterInfo> waterList = userOwnerService.getCurrWater(aCode);//需要什么参数，需改、、
        if (waterList.size() == 1) {
            readings = Double.parseDouble(waterList.get(0).getReadings());
        }
        if (waterList.size() >= 2) {
            for (int i = 0; i < waterList.size() - 1; i++) {
                if (waterList.get(i).getTime().equals(waterList.get(i + 1).getTime())) {
                    readings += Double.parseDouble(waterList.get(i).getReadings()) + Double.parseDouble(waterList.get(i).getReadings());
                }
            }
        }
        return readings;
    }


     class MapComparatorAsc implements Comparator {

         @Override
         public int compare(Object o1, Object o2) {
             Map<String,String> m1 = (Map<String, String>) o1;
             Map<String,String> m2 = (Map<String, String>) o2;

             float v1 = Float.parseFloat(m1.get("consumption"));
             float v2 = Float.parseFloat(m2.get("consumption"));

             if(v1>v2)
                 return -1;
             if (v1<v2)
                 return 1;

             return 0;
         }
     }
}
