package com.example.huzhou.entity;

import java.util.List;

/**
 * Created by Raytine on 2017/8/25.
 */
//@Entity
//@Table(name = "t_role")
public class Role {

//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String rolename;

    private List<User> userList;// 一个角色对应多个用户

    // 省略 get set 方法

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

//    @Transient
//    public List<String> getPermissionsName() {
//        List<String> list = new ArrayList<String>();
//        List<UserOwner> perlist = getPermissionList();
//        for (UserOwner per : perlist) {
//            list.add(per.getPermissionname());
//        }
//        return list;
//    }
}
