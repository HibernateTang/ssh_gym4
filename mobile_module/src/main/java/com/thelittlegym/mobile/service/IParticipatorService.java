package com.thelittlegym.mobile.service;

import com.thelittlegym.mobile.entity.Participator;

import java.util.Map;

/**
 * Created by hibernate on 2017/5/26.
 */
public interface IParticipatorService {
    //参与活动
    public Map<String,Object> addPar(String tel, String name,String actid) throws Exception;
    //修改信息
    public void updatePar(Participator p) throws Exception;
    //验证码是否通过
    public Boolean valPar(Map<String,Object> sendMap,String reqNum) throws Exception;
}
