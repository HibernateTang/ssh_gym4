package com.thelittlegym.mobile.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.common.H5Service;
import com.thelittlegym.mobile.common.HttpService;
import com.thelittlegym.mobile.dao.ICouponDao;
import com.thelittlegym.mobile.entity.Coupon;
import com.thelittlegym.mobile.service.ICouponService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hibernate on 2017/6/16.
 */
@Service
public class CouponService implements ICouponService {
    private static final String useCode = "Sw6cWT88";
    @Autowired
    private H5Service h5Service;
    @Autowired
    private ICouponDao couponDao;

    @Override
    public Map<String, Object> getCoupon_http(String tel) {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        try {
            //是否已存，已存则不去调接口
            Coupon c = couponDao.findOne("from Coupon where tel = '" + tel + "'");
            if (null != c) {
                returnMap.put("value", c);
                returnMap.put("success", true);
                returnMap.put("message", "存在");
                return returnMap;
            }
            tel = StringUtils.trim(tel);
            JSONArray couponArr = h5Service.getByType(tel, "coupon");
//            JSONObject couponObject = couponArr.getJSONObject(0);
            if (null != couponArr ) {
                //优惠券
                Coupon coupon = new Coupon();
                coupon.setCreate_time(new Date());
                coupon.setMoney(500.0f);
                coupon.setName("好朋友转介绍优惠券");
                coupon.setType("1");
                coupon.setUsed(false);
                coupon.setTel(tel);
                couponDao.save(coupon);
                returnMap.put("value", coupon);
                returnMap.put("success", true);
                returnMap.put("message", "第一次存入");
                return returnMap;

            } else {
                returnMap.put("success", false);
                returnMap.put("message", "返回结果为空");
                return returnMap;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Map<String, Object> useCoupon(String tel, String code) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        if (useCode.equals(code)) {
            Coupon coupon = couponDao.findOne("from Coupon where tel ='" + tel + "' and used = false");

            if (null != coupon) {
                coupon.setUsed(true);
                couponDao.update(coupon);
                returnMap.put("success", true);
                returnMap.put("message", "使用成功");
            } else {
                returnMap.put("success", false);
                returnMap.put("message", "该用户没有优惠券");
            }

        } else {
            returnMap.put("success", false);
            returnMap.put("message", "核销码错误");
        }
        return returnMap;
    }
}
