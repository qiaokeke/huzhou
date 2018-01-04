package com.example.huzhou.controller.api;

import com.example.huzhou.entity.power.PowerZXYGDNView;
import com.example.huzhou.service.power.PowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-04 14:11
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */

@RestController
@RequestMapping("/huzhou/api/power")
public class PowerController {

    @Autowired
    PowerService powerService;

    @RequestMapping("/tswkHoursZXYGDNViews")
    public List<PowerZXYGDNView> getTswkHoursZXYGDNViewsByACode(@RequestParam("aCode") String aCode){
        return powerService.selectTswkHoursZXYGDNViewsByACode(aCode);
    }

}
