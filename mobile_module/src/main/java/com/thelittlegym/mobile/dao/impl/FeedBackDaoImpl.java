package com.thelittlegym.mobile.dao.impl;

import com.thelittlegym.mobile.base.dao.impl.BaseDaoImpl;
import com.thelittlegym.mobile.dao.IFeedbackDao;
import com.thelittlegym.mobile.entity.Feedback;
import org.springframework.stereotype.Component;

/**
 * Created by hibernate on 2017/4/21.
 */
@Component
public class FeedBackDaoImpl extends BaseDaoImpl<Feedback> implements IFeedbackDao{
    public FeedBackDaoImpl(){
        super(Feedback.class);
    }
}
