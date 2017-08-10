package com.thelittlegym.mobile.user.service.impl;

import com.thelittlegym.mobile.base.model.Page;
import com.thelittlegym.mobile.dao.impl.CouponDaoImpl;
import com.thelittlegym.mobile.entity.Coupon;
import com.thelittlegym.mobile.user.dao.impl.UserDaoImpl;
import com.thelittlegym.mobile.user.model.User;
import com.thelittlegym.mobile.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hibernate on 2017/3/21.
 */
@Component
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserDaoImpl userDao;
    @Autowired
    private CouponDaoImpl couponDao;

    @Override
    public Page<User> getUserPageList(int currentPage, int pageSize) throws Exception {
        String queryHql = "from User where isDelete=0 and create_time <= '2017-10-17 23:59:59' AND telephone != '18917353367' AND telephone != '15949190026'  ORDER BY create_time";
        String countHql = "select count(*) from User where isDelete=0 and create_time <= '2017-10-17 23:59:59' AND telephone != '18917353367' AND telephone != '15949190026' ";
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

    @Override
    public Long getTotal() throws Exception {
        String sql = "select count(*) from User u where u.username != '15949190026' and u.username != '18917353367' ";
        Long l = userDao.findCount(sql);
        return l;
    }

    @Override
    public Boolean isReged(String tel) throws Exception {
        User u = userDao.findOne("from User where telephone = '" + tel + "'");
        if (null == u){
            return false;
        }
        return true;
    }

    @Override
    public Boolean isNum(String tel,Integer num) throws Exception {
        //1.是否已领取
        String hql = "from Coupon where type = 2 and tel = " + tel;
        Coupon coupon = couponDao.findOne(hql);
        if (null != coupon){
            return false;
        }
        //2.是否前num名会员
        String sql = "SELECT count(id) total FROM (SELECT @ROW \\:= @ROW + 1 AS ROW,u.* FROM (SELECT * FROM USER u WHERE create_time <= '2017-10-17 23:59:59' AND telephone != '18917353367' AND telephone != '15949190026'  ORDER BY create_time ) u, (SELECT @ROW \\:= 0) r WHERE @ROW < " + num.toString() + " ) res WHERE res.telephone = '" + tel + "'";
        BigInteger count = userDao.findCountBySql(sql);
        BigInteger c0 = new BigInteger("0");
        if (count.compareTo(c0) == 1){
            return true;
        }
        return false;
    }



}
