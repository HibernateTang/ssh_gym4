package com.thelittlegym.mobile.dao.impl;

import com.thelittlegym.mobile.base.dao.impl.BaseDaoImpl;
import com.thelittlegym.mobile.dao.IActivityDao;
import com.thelittlegym.mobile.entity.Activity;
import org.springframework.stereotype.Component;

/**
 * Created by hibernate on 2017/5/17.
 */
@Component
public class ActivityDaoImpl extends BaseDaoImpl<Activity> implements IActivityDao {
    public ActivityDaoImpl(){
        super(Activity.class);
    }
}
