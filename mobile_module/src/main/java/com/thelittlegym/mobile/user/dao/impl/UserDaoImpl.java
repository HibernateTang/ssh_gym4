package com.thelittlegym.mobile.user.dao.impl;

import com.thelittlegym.mobile.base.dao.impl.BaseDaoImpl;
import com.thelittlegym.mobile.user.dao.IUserDao;
import com.thelittlegym.mobile.user.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao {

    public UserDaoImpl(){
        super(User.class);
    }


}