package com.thelittlegym.mobile.user.service.impl;

import com.thelittlegym.mobile.base.model.Page;
import com.thelittlegym.mobile.user.dao.impl.UserDaoImpl;
import com.thelittlegym.mobile.user.model.User;
import com.thelittlegym.mobile.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by hibernate on 2017/3/21.
 */
@Component
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserDaoImpl userDao;

    @Override
    public Page<User> getUserPageList(int currentPage, int pageSize) throws Exception {
        String queryHql = "from User u where u.id!=0 and u.isDelete=0";
        String countHql = "select count(*) from User u where u.id!=0 and u.isDelete=0";
        Page<User> returnPage = userDao.findPage(currentPage, pageSize, queryHql, countHql);
        return returnPage;
    }

    @Override
    public Page<User> getUserPageListForSearch(int currentPage, int pageSize, String blurUserName) throws Exception {
        String queryHql = " from User u where u.id!=0 and u.username like '%"+blurUserName+"%' ";
        String countHql = " select count(*) from User u where u.id!=0 and u.username like '%"+blurUserName+"%' ";
        Page<User> returnPage = userDao.findPage(currentPage, pageSize, queryHql, countHql);

        return returnPage;
    }

    @Override
    public Map<String, Object> deleteOneUser(Integer id) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();

        //String hql = "from User u where u.id='"+id+"'";
        User user = new User();
        try {
            user = userDao.getOne(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(user != null){
            user.setIsDelete(true);
            userDao.update(user);
            //然后把user_role关系表中的对应记录删除
//            String delhql = " delete UserRole where userId='"+id+"' ";
//            userDao.deleteWithHql(delhql);

            returnMap.put("message", "删除成功");
            returnMap.put("success", true);
            return returnMap;
        }else{
            returnMap.put("message", "删除失败");
            returnMap.put("success", false);
            return returnMap;
        }
    }

    @Override
    public User getUserById(Integer id) throws Exception {
        User user = userDao.getOne(id);
        return user;
    }

    @Override
    public void updateUser(User user) throws Exception {
        userDao.update(user);
    }


}
