package com.example.huzhou.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Raytine on 2017/9/3.
 */
public class ViewObject {
    private Map<String, Object> objs = new HashMap<String, Object>();
    public void set(String key, Object value) {
        objs.put(key, value);
    }

    public Object get(String key) {
        return objs.get(key);
    }
}
