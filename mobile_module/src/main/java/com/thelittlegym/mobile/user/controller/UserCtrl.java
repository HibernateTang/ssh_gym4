package com.thelittlegym.mobile.user.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.common.HttpResult;
import com.thelittlegym.mobile.common.HttpService;
import com.thelittlegym.mobile.entity.GymClass;
import com.thelittlegym.mobile.user.model.User;
import com.thelittlegym.mobile.utils.msg.config.AppConfig;
import com.thelittlegym.mobile.utils.msg.utils.ConfigLoader;
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
import java.util.Map;

/**
 * Created by 汁 on 2017/3/25.
 */
@Controller
@RequestMapping("/index")
public class UserCtrl {
    //    @Autowired
//    private IUserService userService;
    private static String POST_URL = "https://bbk.800app.com/uploadfile/staticresource/238592/279832/MobileApiPost.aspx";
    @Autowired
    private HttpService httpService;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        Object objSession = session.getAttribute("user");
        User user;
        if (objSession == null){
            return "redirect:/login.html";
        }else{
            user =(User)objSession;
        }
        HashMap<String, String> userMap = new HashMap<String, String>();
        HashMap<String, String> classMap = new HashMap<String, String>();
        List<GymClass> listGymClass = new ArrayList<GymClass>();
        Integer idFamily = user.getIdFamily();
        JSONObject rankObj=null;
        //家庭
        String sqlUser = "declare @rest float;set @rest =isnull((select sum(kss)rest from(select top 6 crmzdy_81739422 kss from crm_zdytable_238592_25111_238592_view zx join crm_zdytable_238592_25115_238592_view bmksb on zx.crmzdy_81611091_id= "  + idFamily + " and bmksb.crmzdy_81756836_id=zx.id and bmksb.crmzdy_81733119='销售'  and bmksb.crmzdy_81739422/*rest*/>0 join crm_zdytable_238592_23796_238592_view ht on ht.id=bmksb.crmzdy_81486464_id and datediff(d,getdate(),crmzdy_81733324/*dtDaoQi*/)>=0 order by bmksb.id desc)bmksb),0);select hz.id idhz,hz.crm_name name,hz.crmzdy_81497217 age,replace(isnull(hz.crmzdy_82017585,''),'''','\\\"')ranking,@rest rest from crm_zdytable_238592_23893_238592_view hz where crmzdy_80653840_id=" + idFamily;
        userMap.put("sql1", sqlUser);
        HttpResult httpResultUser = httpService.doPost(POST_URL, userMap);
        JSONObject jsonObjectUser = JSONObject.parseObject(httpResultUser.getData());
        JSONObject indexObj = jsonObjectUser.getJSONArray("list").getJSONObject(0);
        String idChild = indexObj.getString("idhz");

        //全国排名
        String ranking = indexObj.getString("ranking");
        if (ranking != null && !ranking.equals("")){
             rankObj = rankUtil(ranking, "last3");
        }

        //孩子考勤
        String sqlClass = "select rq.crm_name date,bj.crmzdy_80612384 time,bj.crmzdy_80612382 course,kq from(select crmzdy_81486481 kq,crmzdy_81486480_id idrq from crm_zdytable_238592_25118_238592_view bmks where bmks.crmzdy_81618215_id="+idChild+"/*idhz*/ and bmks.crmzdy_81636525>='2015-01-01'/*dtbegin*/ and bmks.crmzdy_81636525<='2017-04-01'/*dtend*/ and crmzdy_81619234='已报名' union all select crmzdy_80652349,crmzdy_80652340_id from crm_zdytable_238592_23696_238592_view bk where crmzdy_80658051_id=352741 and bk.crmzdy_81761865>='2015-01-01'/*dtbegin*/ and bk.crmzdy_81761865<='2017-04-01'/*dtend*/)ks join crm_zdytable_238592_23870_238592_view rq on ks.idrq=rq.id join crm_zdytable_238592_23583_238592_view bj on rq.crmzdy_80650267_id=bj.id and bj.crmzdy_80620202_id='9'/*idgym*/order by date";
        classMap.put("sql1",sqlClass);
        HttpResult httpResultClass = httpService.doPost(POST_URL, classMap);

        JSONObject jsonObjectClass = JSONObject.parseObject(httpResultClass.getData());


        JSONArray classArray = jsonObjectClass.getJSONArray("list");


        listGymClass = JSONObject.parseArray(classArray.toString(), GymClass.class);
        indexObj.put("showAnother", jsonObjectUser.getInteger("totalRecord") > 1 ? true : false);


        model.addAttribute("indexObj", indexObj);
        model.addAttribute("rankObj", rankObj);
        model.addAttribute("listGymClass", listGymClass);
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
    public String myinfo(HttpServletRequest request,Model model) throws Exception {
        HttpSession session = request.getSession();
        Object objSession = session.getAttribute("user");
        User user;
        if (objSession != null){
            user =(User)objSession;
        }else{
            return "redirect:/login.html";
        }
        Integer idFamily = user.getIdFamily();
        HashMap<String,String> myInfoMap = new HashMap<String, String>();
        String sqlMyInfo = "select top 6 ht.crmzdy_80646021 报名日期,ht.crmzdy_80646031 报名课时数,crmzdy_81733324 有效期,bmksb.crmzdy_81739422 剩余课时数,bmksb.crmzdy_81739425 累计请假数,isnull(bjap.kc,'暂未排课') 课程,ht.crmzdy_81733120 赠课,zx.crmzdy_81802626 积分 from crm_zdytable_238592_25111_238592_view zx join crm_zdytable_238592_25115_238592_view bmksb on zx.crmzdy_81611091_id=" + idFamily + " and bmksb.crmzdy_81756836_id=zx.id  join crm_zdytable_238592_23796_238592_view ht on ht.id=bmksb.crmzdy_81486464_id  outer apply(select top 1 bj.crmzdy_80612382 kc from crm_zdytable_238592_25117_238592_view bjap join crm_zdytable_238592_23583_238592_view bj on bj.id=bjap.crmzdy_81486476_id where ht.id=bjap.crmzdy_81598938_id)bjap where bmksb.crmzdy_81733119='销售'  and bmksb.crmzdy_81739422/*rest*/>0 and datediff(d,getdate(),ht.crmzdy_81733324/*dtDaoQi*/)>=0";
        myInfoMap.put("sql1",sqlMyInfo);

        HttpResult httpResultUser = httpService.doPost(POST_URL, myInfoMap);
        JSONObject jsonObjectInfo = JSONObject.parseObject(httpResultUser.getData());
        //可能有多个合同
        JSONObject infoObj = jsonObjectInfo.getJSONArray("list").getJSONObject(0);

        model.addAttribute("infoObj",infoObj);

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
        JSONObject jsonObject = JSONObject.parseObject(ranking);
        JSONArray jsonArray = jsonObject.getJSONArray(text);
        JSONObject returnObj = jsonArray.getJSONObject(0);
        return returnObj;
    }


}
