package com.thelittlegym.mobile.service;

import java.util.Map;

/**
 * Created by hibernate on 2017/6/16.
 */
public interface ICouponService {
    //查询外部接口是否有优惠券，有则查询本地是否存储，存储则查询是否使用
    public Map<String,Object> getCoupon_http(String tel) throws Exception;

    public Map<String,Object> useCoupon(String tel,String code,String type) throws Exception;

    public Map<String,Object> addCoupon3000(String tel) throws Exception;
}
