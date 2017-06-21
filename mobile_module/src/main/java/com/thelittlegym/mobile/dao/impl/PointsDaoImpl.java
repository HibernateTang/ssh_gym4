package com.thelittlegym.mobile.dao.impl;

import com.thelittlegym.mobile.base.dao.impl.BaseDaoImpl;
import com.thelittlegym.mobile.dao.IPointsDao;
import com.thelittlegym.mobile.entity.Points;
import org.springframework.stereotype.Component;

/**
 * Created by hibernate on 2017/6/21.
 */
@Component
public class PointsDaoImpl extends BaseDaoImpl<Points> implements IPointsDao{
    public PointsDaoImpl(){
        super(Points.class);
    }
}
