package com.example.huzhou;

import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.entity.PowerListInfo;
import com.example.huzhou.entity.PowerTotalInfo;
import com.example.huzhou.entity.WaterInfo;
import com.example.huzhou.mapper.test1.PowerInfoDao;
import com.example.huzhou.mapper.test1.UserOwnerDao;
import com.example.huzhou.util.BeiLvUtil;
import com.example.huzhou.util.Utils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HuzhouApplicationTests {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Test
	public void contextLoads() {
/*		RestTemplate template = new RestTemplate();
//		http://123.157.244.62:6200/tc_pay/read_val.action?addr=161107136
		String adr = "161107136";
		String result = template.postForObject("http://123.157.244.62:6200/tc_pay/read_val.action?addr={adr}", null, String.class, adr);
		System.out.println(result+"_________________");*/
//		template.getForObject("http://123.157.244.62:6200/tc_pay/read_val.action?addr={adr}", java.lang.String,"161107136");
		/*timer = new java.util.Timer(true);// true表明定义为守护线程
		TaskJob task= new TaskJob(arg0.getServletContext());
		timer.schedule(task,  60*60 * 1000, 60*60 * 1000);// 定时器调度语句，其中TaskJob是自定义需要被调度的执行任务//初始化时就（一个小时启动一次）*/
	}

	@Autowired
	PowerInfoDao powerInfoDao;


	public void testWaterPerHourDao(){
		List<WaterInfo> waterInfoList = powerInfoDao.selectWaterDataPerHour("1","b10");
		logger.info(String.valueOf(waterInfoList.size()));
		for(WaterInfo waterInfo:waterInfoList){
			logger.info(waterInfo.toString());
		}

	}

	@Test
	public void testTop5(){
		List<PowerTotalInfo> powerTotalInfoList = powerInfoDao.selectTop5TotalPower();
		logger.info(String.valueOf(powerTotalInfoList.size()));
		for(PowerTotalInfo powerTotalInfo:powerTotalInfoList){
			logger.info(powerTotalInfo.toString());
		}
	}

	@Autowired
	UserOwnerDao userOwnerDao;
	@Test
	public void testtodayList(){
		List<PowerListInfo> powerListInfoList = userOwnerDao.selectPowerListInfo();
		logger.info(String.valueOf(powerListInfoList.size()));
		for(PowerListInfo powerListInfo:powerListInfoList){
			logger.info(powerListInfo.toString());
		}
	}


	@Value("#{'${beilv}'.split(',')}")
	public List<Integer> beilv;




}
