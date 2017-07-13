package com.thelittlegym.mobile.service;

import com.thelittlegym.mobile.base.dao.IBaseDao;
import com.thelittlegym.mobile.base.model.Page;
import com.thelittlegym.mobile.dao.impl.FeedBackDaoImpl;
import com.thelittlegym.mobile.entity.Feedback;

import java.util.Map;

/**
 * Created by hibernate on 2017/4/21.
 */
public interface IFeedbackService {
    public void save(Feedback feedback) throws Exception;

    public Page<Feedback> getPageList(Integer pageNow ,Integer pageSize) throws Exception;

    public Feedback getOne(Integer id) throws  Exception;

    public void hand(Integer id)throws Exception;
}
