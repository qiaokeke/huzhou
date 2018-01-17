package com.example.huzhou.task;

import com.example.huzhou.service.UserOwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-17 14:30
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
@Component
public class ScheduledTasks {



    @Autowired
    UserOwnerService userOwnerService;

    @Scheduled(fixedRate = 60*60*1000)
    public void getStaticRealtimePowerWaterInfos(){

        ScheduledInfos.powerWaterRtimeInfos = userOwnerService.selectRealTimeInfos();
        System.out.println(ScheduledInfos.powerWaterRtimeInfos);
    }

    @Scheduled(fixedRate = 60*60*1000)
    public void getSsjcMapInfoList(){
        ScheduledInfos.ssjcMapInfoList = userOwnerService.selectMapInfo();
        System.out.println(ScheduledInfos.ssjcMapInfoList);
    }
}
