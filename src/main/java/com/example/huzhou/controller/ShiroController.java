package com.example.huzhou.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.huzhou.entity.User;
import com.example.huzhou.entity.UserOwner;
import com.example.huzhou.entity.WaterInfo;
import com.example.huzhou.mapper.test1.PowerInfoDao;
import com.example.huzhou.mapper.test1.UserDao;
import com.example.huzhou.mapper.test1.UserOwnerDao;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Created by Raytine on 2017/8/25.
 */
@Controller
public class ShiroController {

    private static final Logger logger = LoggerFactory.getLogger(ShiroController.class);

    @Autowired
    private UserDao userDao;
    @Autowired
    private UserOwnerDao userOwnerDao;
    @Autowired
    private PowerInfoDao infoDao;
    @RequestMapping(value = "/map")
    public String indexMap(){
        return "/huzhou/main_map";
    }

    @RequestMapping(value={"/login","/huzhou/login"},method= RequestMethod.GET)
    public String loginForm(Model model){
        return "/huzhou/login";
    }

    @RequestMapping(value={"/login","/huzhou/login"},method=RequestMethod.POST)
    public String login(@Valid User user, HttpServletRequest request, Model model,RedirectAttributes redirectAttributes){
        if(StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())){
            request.setAttribute("msg", "用户名或密码不能为空！");
            return "/huzhou/login";
        }

        String username = user.getUsername();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
        //获取当前的Subject
        Subject currentUser = SecurityUtils.getSubject();
        //验证是否登录成功
        try {
            currentUser.login(token);
//            redirectAttributes.addFlashAttribute("username",currentUser.getPrincipal());
            request.getSession(true).setAttribute("username",currentUser.getPrincipal());
            logger.info("用户[" + username + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");
           /* if(currentUser.hasRole("admin")){
                return "redirect:/huzhou/rootIndexDnhgl";
            }else{
                return "redirect:/huzhou/userIndexDnhgl";
            }*/
            return "redirect:/huzhou/indexDnhgl";
        }catch(UnknownAccountException uae){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,未知账户");
            request.setAttribute("msg", "未知账户");
        }catch(IncorrectCredentialsException ice){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,错误的凭证");
            request.setAttribute("msg", "密码不正确");
        }catch(LockedAccountException lae){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,账户已锁定");
            request.setAttribute("msg", "账户已锁定");
        }catch(ExcessiveAttemptsException eae){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,错误次数过多");
            request.setAttribute("msg", "用户名或密码错误次数过多");
        }catch (AuthenticationException e){
            request.setAttribute("msg","用户名或密码不正确");
            token.clear();
            return "huzhou/login";
        }
        return "huzhou/login";
    }

    @RequestMapping(value={"/huzhou/logout","/logout"},method=RequestMethod.GET)
    public String logout(RedirectAttributes redirectAttributes ){
        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息
        SecurityUtils.getSubject().logout();
        redirectAttributes.addFlashAttribute("msg", "您已安全退出");
        return "redirect:/login";
    }

    @RequestMapping("/403")
    public String unauthorizedRole(){
        logger.info("------没有权限-------");
        return "403";
    }

    @RequestMapping("test")
    @ResponseBody
    public String testMybatis(){
        List<User> list = userDao.getList();

        User user = new User();
        user.setId(5);
        user.setUsername("jerry");
        user.setPassword("123456");
//        return JSON.toJSONString(list);
//    return userDao.insert(user);
//    return userDao.deleteByPrimaryKey(5);
//        return JSONObject.toJSONString(userOwnerDao.selectCompanyNameById(2));
//       return JSONObject.toJSONString(infoDao.selectCurrElectric(23));
//

        return userDao.getByUserName("tom").toString();
    }

    public static void main(String[] args) {

     /*  Runnable runnable = new Runnable() {
            public void run() {
                RestTemplate template = new RestTemplate();
//		http://123.157.244.62:6200/tc_pay/read_val.action?addr=161107136
                String adr = "161107136";
                String result = template.postForObject("http://123.157.244.62:6200/tc_pay/read_val.action?addr={adr}", null, String.class, adr);
                String[] strList = result.split(",");
                sb.append("time:"  + strList[0]+",");
                sb.append("water:"  + strList[1]+"<br>");
                Map<String,String> map = new HashMap<>();
                map.put("time",strList[0]);
                map.put("water",strList[1]);
                list.add(map);
            }
        };
        ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
        // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间
        service.scheduleAtFixedRate(runnable, 1, 60*60, TimeUnit.SECONDS);
        System.out.println(JSON.toJSONString(list)+"=====");
//        return JSON.toJSONString(list);
        return sb.toString();*/

    }
}
