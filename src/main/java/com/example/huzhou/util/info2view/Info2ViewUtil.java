package com.example.huzhou.util.info2view;

import com.example.huzhou.entity.power.PowerZXYGDNInfo;
import com.example.huzhou.entity.power.PowerZXYGDNView;

import java.util.Collections;
import java.util.Comparator;
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

    public static  void delectMaxPowerZXYGDNView(List<PowerZXYGDNView> views){
        PowerZXYGDNView view = Collections.max(views,new PowerZXYGDNViewComparator());

        if(view.getpZXYGDN()<50)
            return;

        //暂时先删除这个

        for(int i=0;i<views.size();i++){
            if(views.get(i).getpZXYGDN()==view.getpZXYGDN()){
                views.remove(i);
                return;
            }
        }
    }



}
class PowerZXYGDNViewComparator implements Comparator{

    @Override
    public int compare(Object o1, Object o2) {
        PowerZXYGDNView view1 = (PowerZXYGDNView) o1;
        PowerZXYGDNView view2 = (PowerZXYGDNView) o2;

        float v1 = view1.getpZXYGDN();
        float v2 = view2.getpZXYGDN();

        if(v1>v2)
            return 1;

        if (v1<v2)
            return -1;
        return 0;
    }
}