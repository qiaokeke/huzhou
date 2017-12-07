package com.example.huzhou.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Raytine on 2017/8/29.
 */
@Controller
public class MapperController {
    @RequestMapping(value = {"/huzhou/main"})
    public String index(){
        return "huzhou/main";
    }

   /* @RequestMapping(value = "/huzhou/navigation")
    public String navigate(){
        return "huzhou/navigation";
    }*/

    @RequestMapping(value = "/huzhou/indexDnhgl")
    public String rootIndexDnhgl(){
        Subject currentUser = SecurityUtils.getSubject();
        if(currentUser.hasRole("admin")){
            return "/huzhou/root_index_dnhgl";
        }else{
            return "/huzhou/user_index_dnhgl";
        }
    }
    /* @RequestMapping(value = "/huzhou/userIndexDnhgl")
    public String userIndexDnhgl(){
        return "huzhou/user_index_dnhgl";
    }*/
    @RequestMapping(value = "/huzhou/yqfw")
    public String rootService(){
        return "huzhou/root_index_yqfw";
    }
   /* @RequestMapping(value = "/huzhou/userYqfw")
    public String userService(){
        return "huzhou/user_index_yqfw";
    }*/

    @RequestMapping(value = "/huzhou/rootSsjc")
    public String rootDetection(){
        return "huzhou/root_index_ssjc";
    }

    @RequestMapping(value = "/huzhou/userSsjc")
    public String userDetection(){
        return "huzhou/user_index_ssjc";
    }

    @RequestMapping(value = "/huzhou/rootSsjcMap")
    public String rootMap(){
        return "huzhou/root_ssjc_map";
    }
    @RequestMapping(value = "/huzhou/ssjcMap")
    public String userMap(){
        return "huzhou/user_ssjc_map";
    }
    @RequestMapping(value = "/huzhou/rootDb")
    public String rootAnalysis(){
        return "huzhou/root_index_db";
    }
    @RequestMapping(value = "/huzhou/userDb")
    public String userAnalysis(){
        return "huzhou/user_index_db";
    }
    @RequestMapping(value = "/huzhou/rootWarning")
    public String rootWarning(){
        return "huzhou/root_eletricWarnning";
    }
    @RequestMapping(value = "/huzhou/userWarning")
    public String userWarning(){
        return "huzhou/user_eletricWarnning";
    }

    @RequestMapping(value = "/huzhou/rootScreen")
    public String rootScreen(){
        return "huzhou/root_huzhou_screen";
    }
    @RequestMapping(value = "/huzhou/rootManager")
    public String rootManager(){
        return "huzhou/root_manager";
    }
    @RequestMapping(value = "/huzhou/rootSingleData")
    public String rootSingle(){
        return "huzhou/root_single_data";
    }

    @RequestMapping(value = "/huzhou/userExamination")
    public String userExamination(){
        return "huzhou/user_examination";
    }

    @RequestMapping(value = "/huzhou/note")
    public String note(){
        return "huzhou/note";
    }

    @RequestMapping(value = "/huzhou/report")
    public String report(){
        return "huzhou/report";
    }


}
