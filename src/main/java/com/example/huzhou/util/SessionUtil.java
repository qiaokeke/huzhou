package com.example.huzhou.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * <p>@description: </p>
 *
 * @projectName: interpolation
 * @packageName: com.ntq.baseMgr.util
 * @className:
 * @author: shuangyang
 * @date: 17-4-7 下午2:12
 */
public class SessionUtil {
    private SessionUtil() {
    }

    /**
     * 设置session会话
     * @param key
     * @param value
     */
    public static void  setSession(String key,Object value){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.setAttribute(key,value);
    }

    /**
     * 通过键获取对应的session保存的value
     * @param key
     * @return
     */
    public static Object getSession(String key){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
      return session.getAttribute(key);
    }
}
