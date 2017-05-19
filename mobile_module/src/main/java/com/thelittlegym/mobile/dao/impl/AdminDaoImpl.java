package com.thelittlegym.mobile.dao.impl;

import com.thelittlegym.mobile.base.dao.impl.BaseDaoImpl;
import com.thelittlegym.mobile.dao.IActivityDao;
import com.thelittlegym.mobile.dao.IAdminDao;
import com.thelittlegym.mobile.entity.Admin;
import org.springframework.stereotype.Component;

/**
 * Created by hibernate on 2017/5/19.
 */
@Component
public class AdminDaoImpl extends BaseDaoImpl<Admin> implements IAdminDao{
    public AdminDaoImpl(){
        super(Admin.class);
    }
}
