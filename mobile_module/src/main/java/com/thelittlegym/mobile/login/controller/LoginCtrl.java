package com.thelittlegym.mobile.login.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.common.OasisService;
import com.thelittlegym.mobile.entity.Family;
import com.thelittlegym.mobile.entity.Feedback;
import com.thelittlegym.mobile.service.IFeedbackService;
import com.thelittlegym.mobile.utils.msg.config.AppConfig;
import com.thelittlegym.mobile.utils.msg.lib.MESSAGEXsend;
import com.thelittlegym.mobile.utils.msg.utils.ConfigLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thelittlegym.mobile.base.model.Page;
import com.thelittlegym.mobile.login.service.ILoginService;
import com.thelittlegym.mobile.user.model.User;
import com.thelittlegym.mobile.user.service.IUserService;

@Controller
@RequestMapping("/login")
public class LoginCtrl {
    private static AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Message);
    @Autowired
    private ILoginService loginService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IFeedbackService feedbackService;
    @Autowired
    private OasisService oasisService;
    @RequestMapping(value = "/tologin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest request, String username, String password) {
        Map<String, Object> returnMap = new HashMap<String, Object>();

        try {
            Map<String, Object> map = loginService.login(username, password);
            //获取user实体
            Object object = map.get("value");
            if (object != null) {
                User user = (User) object;
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
            }
            returnMap.put("value", object);
            returnMap.put("message", map.get("message"));
            returnMap.put("success", map.get("success"));
        } catch (Exception e) {
            returnMap.put("message", "异常：登录失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> register(HttpServletRequest request, String username, String valnum, String password, String email) {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        Map valNumMap = new HashMap();

//        Map<String,String> existMap = new HashMap<String,String>();
        String sqlExist = "select  crm_surname name,id,crmzdy_80620120 tel,crmzdy_81802271 childname,crmzdy_81778300 zx from   crm_sj_238592_view  where charindex('" +username+"',crmzdy_81767199)>0";
//        existMap.put("sql1", sqlExist);

        HttpSession session = request.getSession();

        try {
//            HttpResult httpResult = httpService.doPost(POST_URL, existMap);
//            JSONObject obj = JSONObject.parseObject(httpResult.getData());
            JSONArray jsonArray = oasisService.getResultJson(sqlExist);
            //是否是会员校验
            if (jsonArray != null){
                    returnMap.put("message", "手机号非会员!");
                    returnMap.put("success", false);
                    return returnMap;
            }

            JSONObject familyObj = jsonArray.getJSONObject(0);
            Family family = JSONObject.toJavaObject(familyObj,Family.class);

            //验证码校验
            if (session.getAttribute("valNumMap") != null) {
                valNumMap = (HashMap) session.getAttribute("valNumMap");
                if (valNumMap.get("valNum").equals(valnum) == false) {
                    returnMap.put("message", "验证码错误!");
                    returnMap.put("success", false);
                    return returnMap;
                }
                long minsPass = getDateDiffMins((Date) valNumMap.get("valTimeStamp"), new Date());
                if (minsPass > 30) {
                    returnMap.put("message", "验证码已过期!");
                    returnMap.put("success", false);
                    return returnMap;
                }
            } else {
                returnMap.put("message", "验证码错误!");
                returnMap.put("success", false);
                return returnMap;
            }

            Map<String, Object> map = loginService.register(username, password,email,family.getId());
            //获取user实体
            Object object = map.get("value");
            if (object != null) {
                User user = (User) object;

                session.setAttribute("user", user);
            }
            returnMap.put("value", object);
            returnMap.put("message", map.get("message"));
            returnMap.put("success", map.get("success"));
        } catch (Exception e) {
            returnMap.put("message", "异常：注册失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }


    @RequestMapping(value = "/getUserPageListForSearch", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserPageListForSearch(HttpServletRequest request, int currentPage, int pageSize, String blurUserName) {
        Map<String, Object> returnMap = new HashMap<String, Object>();

        try {
            Page<User> userPage = userService.getUserPageListForSearch(currentPage, pageSize, blurUserName);

            returnMap.put("page", userPage);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：获取失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value = "/validateNum", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> validateNum(HttpServletRequest request, String tel, String timestamp) {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        Map valnumMap = new HashMap();
        String valnum = getRandomStr(1000, 9999);
        HttpSession session = request.getSession();

        MESSAGEXsend submail = new MESSAGEXsend(config);
        submail.addTo(tel);
        submail.setProject("IkkGR1");
        submail.addVar("time", "30分钟");
        submail.addVar("code", valnum);
        submail.xsend();


        try {
            //验证码map
            valnumMap.put("valNum", valnum);
            valnumMap.put("valTimeStamp", new Date());

            session.setAttribute("valNumMap", valnumMap);

            returnMap.put("message", valnum);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：发送失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value = "/deleteOneUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteOneUser(HttpServletRequest request, Integer id) {
        Map<String, Object> returnMap = new HashMap<String, Object>();

        try {
            Map<String, Object> map = userService.deleteOneUser(id);

            returnMap.put("message", map.get("message"));
            returnMap.put("success", map.get("success"));
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value = "/getUserPageList", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserPageList(HttpServletRequest request, int currentPage, int pageSize, String blurUserName) {
        Map<String, Object> returnMap = new HashMap<String, Object>();

        try {
            Page<User> userPage = userService.getUserPageList(currentPage, pageSize);

            returnMap.put("page", userPage);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：获取失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }


    @RequestMapping(value = "/exist", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> exist(String telephone) {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        String sqlExist = "select  crm_surname name,id,crmzdy_80620120 tel,crmzdy_81802271 childname,crmzdy_81778300 zx from   crm_sj_238592_view  where charindex('" +telephone+"',crmzdy_81767199)>0";
        if (oasisService.getResultJson(sqlExist) != null){
            returnMap.put("success",true);
            returnMap.put("message","该号码是会员");
        }else{
            returnMap.put("success",false);
            returnMap.put("message","该号码非会员");
        }
        return returnMap;
    }

    @RequestMapping(value = "/feedback", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> feedback(String Franchisee,String details,String contactTel) {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        Feedback feedback = new Feedback();
        try {
            feedback.setFranchisee(Franchisee);
            feedback.setCreateTime(new Date());
            feedback.setContactTel(contactTel);
            feedback.setDetails(details);
            feedbackService.save(feedback);
            returnMap.put("success",true);
            returnMap.put("message","反馈成功");
        } catch (Exception e) {
            returnMap.put("success",false);
            returnMap.put("message","反馈失败");
        }
        return returnMap;
    }



    /*
    生成随机数验证码
     */
    public String getRandomStr(int min, int max) {
        int randNum = min + (int) (Math.random() * ((max - min) + 1));
        return randNum + "";
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