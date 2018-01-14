package com.example.huzhou;

import com.example.huzhou.entity.power.PowerAllInfo;
import com.example.huzhou.entity.power.PowerZXYGDNInfo;
import com.example.huzhou.entity.power.PowerZXYGDNView;
import com.example.huzhou.mapper.test1.PowerDao;
import com.example.huzhou.service.power.PowerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-03 22:17
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TestPowerDao {

    @Autowired
    PowerDao powerDao;

    @Test
    public void testSelectPowerZXYGDNInfosByACodeAndTime(){
        List<PowerZXYGDNInfo> powerZXYGDNInfos = powerDao.selectPowerZXYGDNInfosByACodeAndTime("A21","2017-12-30","2018-01-04");
        for (PowerZXYGDNInfo powerZXYGDNInfo:powerZXYGDNInfos){
            System.out.println(powerZXYGDNInfo);
        }
    }

    @Test
    public void  testSelectPowerAllInfos(){
        List<PowerAllInfo> powerAllInfos = powerDao.selectPowerAllInfos();
        for (PowerAllInfo info:powerAllInfos){
            System.out.println(info);
        }
    }


    @Autowired
    PowerService powerService;
    @Test
    public void testselectTDayHoursZXYGDNViewsByACode(){
        List<PowerZXYGDNView> views = powerService.selectTDayHoursZXYGDNViewsByACode("A15");
        System.out.println(views);

    }
}
