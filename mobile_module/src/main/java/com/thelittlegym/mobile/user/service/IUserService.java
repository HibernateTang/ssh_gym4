package com.thelittlegym.mobile.user.service;

import com.thelittlegym.mobile.base.model.Page;
import com.thelittlegym.mobile.user.model.User;

import java.util.Map;

/**
 * Created by hibernate on 2017/3/21.
 */
public interface IUserService {
    //获取用户分页列表
    public Page<User> getUserPageList(int currentPage, int pageSize) throws Exception;

    //获取用户分页列表ForSearch
    public Page<User> getUserPageListForSearch(int currentPage, int pageSize,String blurUserName) throws Exception;

    //删除用户
    public Map<String,Object> deleteOneUser(Integer id) throws Exception;

    public User getUserById(Integer id) throws Exception;

}
