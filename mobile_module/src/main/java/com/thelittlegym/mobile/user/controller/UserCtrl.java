package com.thelittlegym.mobile.user.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.common.HttpResult;
import com.thelittlegym.mobile.common.HttpService;
import com.thelittlegym.mobile.user.model.User;
import com.thelittlegym.mobile.utils.msg.config.AppConfig;
import com.thelittlegym.mobile.utils.msg.lib.MESSAGEXsend;
import com.thelittlegym.mobile.utils.msg.utils.ConfigLoader;
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
    private static AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Message);
    @Autowired
    private HttpService httpService;



    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        HashMap<String, String> sqlMap = new HashMap<String, String>();
        String url = "https://bbk.800app.com/uploadfile/staticresource/238592/279832/MobileApiPost.aspx";
        String param = "select name,age,ranking,sum(rest)rest from(select  hz.crm_name name,hz.crmzdy_82017585 ranking,hz.crmzdy_81497217 age,case when crmzdy_81739422<0 then 0 else crmzdy_81739422 end rest from crm_sj_238592_view jt join crm_zdytable_238592_23893_238592_view hz on  hz.crmzdy_80653840_id=jt.id  and jt.crmzdy_80620120='13321125527' join crm_zdytable_238592_25111_238592_view zx on jt.id=zx.crmzdy_81611091_id join  crm_zdytable_238592_25115_238592_view  bmksb on bmksb.crmzdy_81756836_id=zx.id)a group by name,age,ranking";
        param = "select idhz,name,age,replace(ranking,'''','quote;') ranking,sum(rest)rest from(select  hz.id idhz,hz.crm_name name,hz.crmzdy_82017585 ranking,hz.crmzdy_81497217 age,case when crmzdy_81739422<0 then 0 else crmzdy_81739422 end rest from crm_sj_238592_view jt join crm_zdytable_238592_23893_238592_view hz on  hz.crmzdy_80653840_id=jt.id  and jt.crmzdy_80620120='13321125527' join crm_zdytable_238592_25111_238592_view zx on jt.id=zx.crmzdy_81611091_id join  crm_zdytable_238592_25115_238592_view  bmksb on bmksb.crmzdy_81756836_id=zx.id)a group by idhz,name,age,ranking";
        param = "select idhz,name,age,replace(ranking,'''','\\\"') ranking,sum(rest)rest from(select  hz.id idhz,hz.crm_name name,hz.crmzdy_82017585 ranking,hz.crmzdy_81497217 age,case when crmzdy_81739422<0 then 0 else crmzdy_81739422 end rest from crm_sj_238592_view jt join crm_zdytable_238592_23893_238592_view hz on  hz.crmzdy_80653840_id=jt.id  and jt.crmzdy_80620120='13321125527' join crm_zdytable_238592_25111_238592_view zx on jt.id=zx.crmzdy_81611091_id join  crm_zdytable_238592_25115_238592_view  bmksb on bmksb.crmzdy_81756836_id=zx.id)a group by idhz,name,age,ranking";
        sqlMap.put("sql1", param);
        HttpResult httpResult = httpService.doPost(url, sqlMap);

//        sendVal();
        JSONObject jsonObject = JSONObject.parseObject(httpResult.getData());

//        if (jsonObject.getString("resultCode") == "100" ){

        JSONObject indexObj = jsonObject.getJSONArray("list").getJSONObject(0);
        indexObj.put("showAnother", jsonObject.getInteger("totalRecord") > 1 ? true : false);

        System.out.println(jsonObject.getInteger("totalRecord"));
        String ranking = indexObj.getString("ranking");
        JSONObject rankObj = rankUtil(ranking, "last3");

        model.addAttribute("indexObj", indexObj);
        model.addAttribute("rankObj", rankObj);

//            for (Map.Entry<String, Object> entry : jsonObject.entrySet()) {
//                System.out.println(entry.getKey() + ":" + entry.getValue());
//            }
//        }
        System.out.println("封装的model=" + model);
        if (user != null) {
            return "/member/index";
        } else {
            return "redirect:/login.html";
        }
    }

    @RequestMapping(value = "/topic", method = RequestMethod.GET)
    public String details(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            return "/member/topic";
        } else {
            return "redirect:/login.html";
        }
    }


    @RequestMapping(value = "/myinfo", method = RequestMethod.GET)
    public String myinfo(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            return "/member/myinfo";
        } else {
            return "redirect:/login.html";
        }
    }

    /*
    ranking转化jsonobject
     */
    public JSONObject rankUtil(String ranking, String text) {
//        JSONObject jsonObject = JSONObject.parseObject(ranking.replace("quote;", "\""));
        JSONObject jsonObject = JSONObject.parseObject(ranking);
        JSONArray jsonArray = jsonObject.getJSONArray(text);
        JSONObject returnObj = jsonArray.getJSONObject(0);
        return returnObj;
    }

    public Boolean sendVal(){
        MESSAGEXsend submail = new MESSAGEXsend(config);
        submail.addTo("18516693801");
        submail.setProject("IkkGR1");
        submail.addVar("time","30分钟");
        submail.addVar("code", "测试短信12211");
        boolean flag = submail.xsend();
        return flag;
    }
}
