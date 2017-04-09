package com.thelittlegym.mobile.user.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.common.HttpResult;
import com.thelittlegym.mobile.common.HttpService;
import com.thelittlegym.mobile.entity.GymClass;
import com.thelittlegym.mobile.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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



    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        HashMap<String, String> userMap = new HashMap<String, String>();
        HashMap<String, String> classMap = new HashMap<String, String>();
        List<GymClass> listGymClass = new ArrayList<GymClass>();
        String url = "https://bbk.800app.com/uploadfile/staticresource/238592/279832/MobileApiPost.aspx";
        String sqlUser = "select name,age,ranking,sum(rest)rest from(select  hz.crm_name name,hz.crmzdy_82017585 ranking,hz.crmzdy_81497217 age,case when crmzdy_81739422<0 then 0 else crmzdy_81739422 end rest from crm_sj_238592_view jt join crm_zdytable_238592_23893_238592_view hz on  hz.crmzdy_80653840_id=jt.id  and jt.crmzdy_80620120='13321125527' join crm_zdytable_238592_25111_238592_view zx on jt.id=zx.crmzdy_81611091_id join  crm_zdytable_238592_25115_238592_view  bmksb on bmksb.crmzdy_81756836_id=zx.id)a group by name,age,ranking";
        sqlUser = "select idhz,name,age,replace(ranking,'''','\\\"') ranking,sum(rest)rest from(select  hz.id idhz,hz.crm_name name,hz.crmzdy_82017585 ranking,hz.crmzdy_81497217 age,case when crmzdy_81739422<0 then 0 else crmzdy_81739422 end rest from crm_sj_238592_view jt join crm_zdytable_238592_23893_238592_view hz on  hz.crmzdy_80653840_id=jt.id  and jt.crmzdy_80620120='13321125527' join crm_zdytable_238592_25111_238592_view zx on jt.id=zx.crmzdy_81611091_id join  crm_zdytable_238592_25115_238592_view  bmksb on bmksb.crmzdy_81756836_id=zx.id)a group by idhz,name,age,ranking";

        String sqlClass = "select rq.crm_name date,bj.crmzdy_80612384 time,bj.crmzdy_80612382 course,kq from(select crmzdy_81486481 kq,crmzdy_81486480_id idrq from crm_zdytable_238592_25118_238592_view bmks where bmks.crmzdy_81618215_id=352741/*idhz*/ and bmks.crmzdy_81636525>='2015-01-01'/*dtbegin*/ and bmks.crmzdy_81636525<='2017-04-01'/*dtend*/ and crmzdy_81619234='已报名' union all select crmzdy_80652349,crmzdy_80652340_id from crm_zdytable_238592_23696_238592_view bk where crmzdy_80658051_id=352741 and bk.crmzdy_81761865>='2015-01-01'/*dtbegin*/ and bk.crmzdy_81761865<='2017-04-01'/*dtend*/)ks join crm_zdytable_238592_23870_238592_view rq on ks.idrq=rq.id join crm_zdytable_238592_23583_238592_view bj on rq.crmzdy_80650267_id=bj.id and bj.crmzdy_80620202_id='9'/*idgym*/order by date";

        userMap.put("sql1", sqlUser);
        HttpResult httpResultUser = httpService.doPost(url, userMap);
        classMap.put("sql1",sqlClass);
        HttpResult httpResultClass = httpService.doPost(url, classMap);
//        sendVal();

        JSONObject jsonObjectUser = JSONObject.parseObject(httpResultUser.getData());

        JSONObject jsonObjectClass = JSONObject.parseObject(httpResultClass.getData());
//        if (jsonObject.getString("resultCode") == "100" ){

        JSONObject indexObj = jsonObjectUser.getJSONArray("list").getJSONObject(0);
        JSONArray classArray = jsonObjectClass.getJSONArray("list");
        String ranking = indexObj.getString("ranking");
        JSONObject rankObj = rankUtil(ranking, "last3");
        listGymClass = JSONObject.parseArray(classArray.toString(), GymClass.class);
        indexObj.put("showAnother", jsonObjectUser.getInteger("totalRecord") > 1 ? true : false);

        model.addAttribute("indexObj", indexObj);
        model.addAttribute("rankObj", rankObj);
        model.addAttribute("listGymClass", listGymClass);
        System.out.println(listGymClass.get(0).getCourse());
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


}
