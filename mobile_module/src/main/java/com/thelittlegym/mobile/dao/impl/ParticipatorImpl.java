package com.thelittlegym.mobile.dao.impl;

import com.thelittlegym.mobile.base.dao.impl.BaseDaoImpl;
import com.thelittlegym.mobile.dao.IParticipator;
import com.thelittlegym.mobile.entity.Participator;
import org.springframework.stereotype.Component;

/**
 * Created by hibernate on 2017/5/25.
 */
@Component
public class ParticipatorImpl extends BaseDaoImpl<Participator> implements IParticipator {
    public ParticipatorImpl(){
        super(Participator.class);
    }
}
