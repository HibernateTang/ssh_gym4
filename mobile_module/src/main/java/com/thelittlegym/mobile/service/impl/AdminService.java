package com.thelittlegym.mobile.service.impl;

import com.thelittlegym.mobile.dao.IAdminDao;
import com.thelittlegym.mobile.entity.Admin;
import com.thelittlegym.mobile.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by hibernate on 2017/5/19.
 */
@Component
public class AdminService implements IAdminService {
    @Autowired
    private IAdminDao adminDao;

    @Override
    public Map<String, Object> login(String username, String password) throws Exception {
        HashMap<String,Object> returnMap = new HashMap<String,Object>();
        String hql = "from Admin where username = " + username;

        Admin   admin = adminDao.findOne(hql);
        if (null != admin){
            if(password.equals(admin.getPassword())){
                returnMap.put("value", admin);
                returnMap.put("message", "登录成功");
                returnMap.put("success", true);
            }else{
                returnMap.put("message", "密码错误");
                returnMap.put("success", false);
            }
        }else{
            returnMap.put("message", "用户不存在");
            returnMap.put("success", false);
        }
        return returnMap;
    }
}
