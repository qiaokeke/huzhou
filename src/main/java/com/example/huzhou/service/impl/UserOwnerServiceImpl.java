package com.example.huzhou.service.impl;

import com.example.huzhou.entity.PowerInfo;
import com.example.huzhou.entity.SsjcMapInfo;
import com.example.huzhou.entity.UserOwner;
import com.example.huzhou.entity.WaterInfo;
import com.example.huzhou.mapper.test1.UserOwnerDao;
import com.example.huzhou.service.UserOwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Raytine on 2017/9/3.
 */
@Service
public class UserOwnerServiceImpl implements UserOwnerService {
    @Autowired
    UserOwnerDao userOwnerDao;

    @Override
    public List<SsjcMapInfo> selectMapInfo() {
        return userOwnerDao.selectMapInfo();
    }

    @Override
    public List selectPcodeByAcode(String aCode) {
        return userOwnerDao.selectPcodeByAcode(aCode);
    }

    @Override
    public String getAcodeByPcode(int pCode) {
        return userOwnerDao.selectAcodeByPcode(pCode);
    }

    @Override
    public String selectAcodeByUserId(int userid) {
        return userOwnerDao.selectAcodeByUserId(userid);
    }

    @Override
    public List<UserOwner> selectCompanyNameById(int id) {
        return userOwnerDao.selectCompanyNameById(id);
    }
    @Override
    public Double getCoalByYear() {
        return userOwnerDao.selectCoalByYear();
    }

    @Override
    public List<PowerInfo> getSsjcConsumption() {
        return userOwnerDao.selectSsjcConsumption();
    }

    @Override
    public String getEnameByPCode(int pCode) {
        return userOwnerDao.selectEnameByPCode(pCode);
    }
    @Override
    public List<WaterInfo> getCurrWater(String aCode) {
        return userOwnerDao.selectCurrWater(aCode);
    }

    @Override
    public List<WaterInfo> getWaterByMonth(String aCode) {
        return userOwnerDao.selectWaterByMonth(aCode);
    }

    @Override
    public List<UserOwner> getAllType() {
        return userOwnerDao.selectAllType();
    }
}
