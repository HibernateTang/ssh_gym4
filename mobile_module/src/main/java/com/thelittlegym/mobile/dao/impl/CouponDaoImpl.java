package com.thelittlegym.mobile.dao.impl;

import com.thelittlegym.mobile.base.dao.impl.BaseDaoImpl;
import com.thelittlegym.mobile.dao.ICouponDao;
import com.thelittlegym.mobile.entity.Coupon;
import org.springframework.stereotype.Component;

/**
 * Created by hibernate on 2017/6/16.
 */
@Component
public class CouponDaoImpl extends BaseDaoImpl<Coupon> implements ICouponDao {
    public CouponDaoImpl(){
        super(Coupon.class);
    }
}
