package com.example.huzhou.util.info2view;

import com.example.huzhou.entity.power.PowerZXYGDNInfo;
import com.example.huzhou.entity.power.PowerZXYGDNView;

import java.util.List;

/**
 * @Author: qiao
 * @Description:
 * @Date: Created in 2018-01-04 12:47
 * @Modified By:
 * @Email: qiaokekeshu@163.com
 */
public class Info2ViewUtil {


    public static void powerZXYGDNInfos2Views(List<PowerZXYGDNInfo> infos, List<PowerZXYGDNView> views){
        for (PowerZXYGDNInfo info:infos){

            boolean isAdd = false;
            for(PowerZXYGDNView view:views){
                if (view.getTime().equals(info.getpTime())){
                    view.setpZXYGDN(view.getpZXYGDN()+info.getpZXYGDN());
                    isAdd = true;
                }
            }

            if(isAdd) continue;

            PowerZXYGDNView view = new PowerZXYGDNView();
            view.setTime(info.getpTime());
            view.setpZXYGDN(info.getpZXYGDN());
            views.add(view);
        }
    }

    public static void subPowerZXYGDNViews(List<PowerZXYGDNView> views){
        if (views.size()==0)
            return;

        for(int i =views.size()-1;i>0;i--){
            float subValue = views.get(i).getpZXYGDN()-views.get(i-1).getpZXYGDN();

            if(views.get(i-1).getpZXYGDN()==0){
                subValue =0;
            }
            if(subValue<0)
                subValue=0;

            views.get(i).setpZXYGDN(subValue);

        }
        views.remove(0);


    }


}
