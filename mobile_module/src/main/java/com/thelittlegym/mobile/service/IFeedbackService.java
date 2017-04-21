package com.thelittlegym.mobile.service;

import com.thelittlegym.mobile.base.dao.IBaseDao;
import com.thelittlegym.mobile.entity.Feedback;

import java.util.Map;

/**
 * Created by hibernate on 2017/4/21.
 */
public interface IFeedbackService {
    public void save(Feedback feedback) throws Exception;
}
