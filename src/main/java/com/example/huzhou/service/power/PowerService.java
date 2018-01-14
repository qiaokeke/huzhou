package com.example.huzhou.service.power;

import com.example.huzhou.entity.power.PowerZXYGDNView;

import java.util.List;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-03 23:00
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public interface PowerService {

    List<PowerZXYGDNView> selectTswkHoursZXYGDNViewsByACode(String aCode);

    List<PowerZXYGDNView> selectTDayHoursZXYGDNViewsByACode(String aCode);
}
