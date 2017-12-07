package com.example.huzhou.mapper.test1;

import com.example.huzhou.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

@Mapper
public interface UserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getByUserName(String username);
    @Select("select * from t_user")
    List<User> getList();

//    @Select("select role.rolename from t_user user,t_role role WHERE role.id =#{id} and  user.id = #{id}")
    @Select("SELECT rolename FROM t_role WHERE id IN (\n" +
            "SELECT role_id FROM t_user_role WHERE user_id =#{id})")
    String getRoleById(@Param("id") int id);
}