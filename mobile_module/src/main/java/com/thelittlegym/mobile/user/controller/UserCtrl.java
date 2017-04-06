package com.thelittlegym.mobile.user.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.common.HttpResult;
import com.thelittlegym.mobile.common.HttpService;
import com.thelittlegym.mobile.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 汁 on 2017/3/25.
 */
@Controller
@RequestMapping("/index")
public class UserCtrl {
//    @Autowired
//    private IUserService userService;
    @Autowired
    private HttpService httpService;
    @RequestMapping(value="",method = RequestMethod.GET)
    public String index(HttpServletRequest request,Model model) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        HashMap<String,String> sqlMap = new HashMap<String, String>();
        String url = "https://bbk.800app.com/uploadfile/staticresource/238592/279832/MobileApiPost.aspx";
        String param = "select name,age,ranking,sum(rest)rest from(select  hz.crm_name name,hz.crmzdy_82017585 ranking,hz.crmzdy_81497217 age,case when crmzdy_81739422<0 then 0 else crmzdy_81739422 end rest from crm_sj_238592_view jt join crm_zdytable_238592_23893_238592_view hz on  hz.crmzdy_80653840_id=jt.id  and jt.crmzdy_80620120='13321125527' join crm_zdytable_238592_25111_238592_view zx on jt.id=zx.crmzdy_81611091_id join  crm_zdytable_238592_25115_238592_view  bmksb on bmksb.crmzdy_81756836_id=zx.id)a group by name,age,ranking";
        sqlMap.put("sql1",param);
        HttpResult httpResult = httpService.doPost(url,sqlMap);

        JSONObject jsonObject =  JSONObject.parseObject(httpResult.getData());

//        if (jsonObject.getString("resultCode") == "100" ){

            JSONObject indexObj = jsonObject.getJSONArray("list").getJSONObject(0);
            indexObj.put("showAnother",jsonObject.getInteger("totalRecord")>1?"1":"0");

        System.out.println(indexObj.getString("ranking"));
            model.addAttribute("indexObj",indexObj);

//            for (Map.Entry<String, Object> entry : jsonObject.entrySet()) {
//                System.out.println(entry.getKey() + ":" + entry.getValue());
//            }
//        }
        System.out.println("封装的model="+model);
        if (user != null) {
            return "/member/index";
        }else{
            return "redirect:/login.html";
        }
    }

    @RequestMapping(value="/topic",method = RequestMethod.GET)
    public String details(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            return "/member/topic";
        }else{
            return "redirect:/login.html";
        }
    }


    @RequestMapping(value="/myinfo",method = RequestMethod.GET)
    public String myinfo(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            return "/member/myinfo";
        }else{
            return "redirect:/login.html";
        }
    }
}
