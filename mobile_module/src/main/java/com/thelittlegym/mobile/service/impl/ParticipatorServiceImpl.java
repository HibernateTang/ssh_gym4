package com.thelittlegym.mobile.service.impl;

import com.thelittlegym.mobile.dao.IParticipator;
import com.thelittlegym.mobile.entity.Participator;
import com.thelittlegym.mobile.service.IParticipatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hibernate on 2017/5/26.
 */
@Component
public class ParticipatorServiceImpl implements IParticipatorService {
    @Autowired
    private IParticipator participatorDao;

    @Override
    public Map<String, Object> addPar(String tel, String name, String actid) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        Participator p = new Participator();
        String hql = "from Participator where phone = '" + tel + "' and actid = " + actid;
        if (null != participatorDao.findOne(hql)) {
            returnMap.put("message", "该用户已报名");
            returnMap.put("success", false);
        } else {
            p.setPhone(tel);
            p.setName(name);
            p.setActid(actid);
            p.setCreateTime(new Date());
            participatorDao.save(p);
            returnMap.put("value", p);
            returnMap.put("message", "报名成功");
            returnMap.put("success", true);
        }
        return returnMap;
    }

    @Override
    public void updatePar(Participator p) throws Exception {
        participatorDao.update(p);
    }

    @Override
    public Boolean valPar(Map<String, Object> sendMap, String reqNum)  {
        Boolean flag = false;
        try {
            if (null != sendMap && sendMap.size() > 0) {
                Object objSuccess = sendMap.get("success");
                Date timeStamp = (Date) sendMap.get("timestamp");
                Boolean isSend = (Boolean) objSuccess;
                String message = sendMap.get("message").toString();
                Long diffMins = getDateDiffMins(timeStamp,new Date());
                if (isSend && diffMins <= 30 && message.equals(reqNum)) {
                    flag = true;
                }
            }
        }catch (Exception e){
            flag = false;
        }

        return flag;
    }

    /*
 时间比较，分钟
  */
    public long getDateDiffMins(Date initDate, Date nowDate) {
        long nm = 1000 * 60;
        long diff = nowDate.getTime() - initDate.getTime();
        long mins = diff / nm;
        return mins;
    }
}
