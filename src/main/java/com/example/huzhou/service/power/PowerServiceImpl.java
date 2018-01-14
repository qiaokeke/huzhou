package com.example.huzhou.service.power;

import com.example.huzhou.entity.power.PowerZXYGDNInfo;
import com.example.huzhou.entity.power.PowerZXYGDNView;
import com.example.huzhou.mapper.test1.PowerDao;
import com.example.huzhou.util.TimeUtil;
import com.example.huzhou.util.info2view.Info2ViewUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-04 12:39
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */

@Service
public class PowerServiceImpl implements PowerService {

    @Autowired
    PowerDao powerDao;

    @Override
    public List<PowerZXYGDNView> selectTswkHoursZXYGDNViewsByACode(String aCode) {
        List<PowerZXYGDNInfo> infos = powerDao.selectPowerZXYGDNInfosByACodeAndTime(aCode, TimeUtil.getTswkDate().get(1),TimeUtil.getTswkDate().get(2));
        System.out.println(infos);

        //合并到views
        List<PowerZXYGDNView> views = new ArrayList<>();

        Info2ViewUtil.powerZXYGDNInfos2Views(infos,views);
        System.out.println(views);

        Info2ViewUtil.subPowerZXYGDNViews(views);

        //删除最大的异常值

        Info2ViewUtil.delectMaxPowerZXYGDNView(views);
        Info2ViewUtil.delectMaxPowerZXYGDNView(views);
        return views;
    }

    @Override
    public List<PowerZXYGDNView> selectTDayHoursZXYGDNViewsByACode(String aCode) {
        List<PowerZXYGDNInfo> infos = powerDao.selectPowerZXYGDNInfosByACodeAndTime(aCode, TimeUtil.getTDayDate().get(1),TimeUtil.getTDayDate().get(2));

        //合并到views
        List<PowerZXYGDNView> views = new ArrayList<>();

        Info2ViewUtil.powerZXYGDNInfos2Views(infos,views);

        Info2ViewUtil.subPowerZXYGDNViews(views);

        //删除最大的异常值

        Info2ViewUtil.delectMaxPowerZXYGDNView(views);
        Info2ViewUtil.delectMaxPowerZXYGDNView(views);
        return views;
    }


}
