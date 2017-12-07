package com.example.huzhou.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.service.PowerInfoService;
import com.example.huzhou.service.UserOwnerService;
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
 * Created by Raytine on 2017/8/29.
 */
@Controller
public class WarningController {
    @Autowired
    PowerInfoService powerInfoService;
    @Autowired
    UserOwnerService userOwnerService;
    //能耗预警  ---应该取出所有月份的数值 TODO 没有用相减，就两个月的，减了就没有了
    @ResponseBody
    @RequestMapping("/warning")
    public String electricInfo(@RequestParam(value = "category" ,defaultValue = "科技") String category,
                               @RequestParam(value = "aCode" ,defaultValue = "B10") String aCode,
                               @RequestParam(value="time",defaultValue = "2017/9/5") String time){
        List<Map<String, String>> list = new ArrayList<>();
        List comCode = userOwnerService.selectPcodeByAcode(aCode);
        List<PowerInfo> powerInfos = powerInfoService.getWarningConsumption(category, (Integer) comCode.get(0),time);
        for (PowerInfo info: powerInfos ) {
            Map<String ,String > map = new HashMap<>();
            map.put("time",info.getpTime());
            map.put("electricValue", String.valueOf(info.getpBYKwhZ()));
            list.add(map);
        }
        return JSONObject.toJSONString(list);
    }
}
