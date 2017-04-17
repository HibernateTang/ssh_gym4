package com.thelittlegym.mobile.user.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.common.HttpResult;
import com.thelittlegym.mobile.common.HttpService;
import com.thelittlegym.mobile.entity.Gym;
import com.thelittlegym.mobile.entity.GymClass;
import com.thelittlegym.mobile.user.model.User;
import com.thelittlegym.mobile.utils.msg.config.AppConfig;
import com.thelittlegym.mobile.utils.msg.utils.ConfigLoader;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

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
        Object gymSession = session.getAttribute("gym");
        Object gymListSession = session.getAttribute("gymList");
        HashMap<String, Object> gymMap = new HashMap<String, Object>();
        List<Gym> listGym = new ArrayList<Gym>();

        User user;

        if (objSession == null) {
            return "redirect:/login.html";
        } else {
            user = (User) objSession;
        }
        //家庭
        Integer idFamily = user.getIdFamily();
        String sqlUser = "declare @rest float;set @rest =isnull((select sum(kss)rest from(select top 6 crmzdy_81739422 kss from crm_zdytable_238592_25111_238592_view zx join crm_zdytable_238592_25115_238592_view bmksb on zx.crmzdy_81611091_id= " + idFamily + " and bmksb.crmzdy_81756836_id=zx.id and bmksb.crmzdy_81733119='销售'  and bmksb.crmzdy_81739422/*rest*/>0 join crm_zdytable_238592_23796_238592_view ht on ht.id=bmksb.crmzdy_81486464_id and datediff(d,getdate(),crmzdy_81733324/*dtDaoQi*/)>=0 order by bmksb.id desc)bmksb),0);select hz.id idhz,hz.crm_name name,hz.crmzdy_81497217 age,replace(isnull(hz.crmzdy_82017585,''),'''','\\\"')ranking,@rest rest from crm_zdytable_238592_23893_238592_view hz where crmzdy_80653840_id=" + idFamily;
        JSONArray indexArray = getResultJson(sqlUser);
        JSONObject indexObj = null;
        if (indexArray != null){
            indexObj = indexArray.getJSONObject(0);
        }

        indexObj.put("showAnother", indexArray.size() > 1 ? true : false);

        //全国排名
        JSONObject rankObj = rankUtil(indexObj.getString("ranking"), "last3");

        String beginDate;
        String endDate;
        String idGym;
        String idChild = indexObj.getString("idhz");
        //孩子考勤
        if (gymSession != null) {
            gymMap = (HashMap<String, Object>) gymSession;
            beginDate = gymMap.get("beginDate").toString();
            endDate = gymMap.get("endDate").toString();
            idGym = gymMap.get("idGymSelected").toString();
        } else {
            beginDate = "2017-04-01";
            endDate = "2017-04-10";
            //gym picker
            String sqlGym = "select crmzdy_81620171 gymname,crmzdy_81620171_id idgym from crm_zdytable_238592_25111_238592_view where crmzdy_81611091_id ="  + idFamily;
            JSONArray gymArray = getResultJson(sqlGym);

            idGym = gymArray.getJSONObject(0).getString("idgym");

            listGym = JSONObject.parseArray(gymArray.toString(), Gym.class);
            gymMap.put("idGymSelected", idGym);
            gymMap.put("beginDate", beginDate);
            gymMap.put("endDate", endDate);
            session.setAttribute("listGym",listGym);
            session.setAttribute("gym", gymMap);
        }
        List<GymClass> listGymClass = new ArrayList<GymClass>();

        String sqlClass = "select bj.crmzdy_80620202_id idgym,rq.crm_name date,bj.crmzdy_80612384 time,bj.crmzdy_80612382 course,case when kq='未考勤' then '尚未开课' else kq  end kq from(select crmzdy_81486481 kq,crmzdy_81486480_id idrq from " +
                "crm_zdytable_238592_25118_238592_view bmks where bmks.crmzdy_81618215_id="+idChild+"/*idhz*/ and bmks.crmzdy_81636525>='"+beginDate+"'/*dtbegin*/ and bmks.crmzdy_81636525<='"+endDate+"'/*dtend*/ and crmzdy_81619234='已报名' union all select crmzdy_80652349,crmzdy_80652340_id from crm_zdytable_238592_23696_238592_view bk where crmzdy_80658051_id=3519 and bk.crmzdy_81761865>='"+beginDate+"'/*dtbegin*/ and bk.crmzdy_81761865<='"+endDate+"'/*dtend*/)ks join crm_zdytable_238592_23870_238592_view rq on ks.idrq=rq.id join crm_zdytable_238592_23583_238592_view bj on rq.crmzdy_80650267_id=bj.id and bj.crmzdy_80620202_id="+idGym+"/*idgym*/order by date desc";
        System.out.println("sqlClass"+sqlClass);

        JSONArray classArray = getResultJson(sqlClass);
        if (classArray != null){
            listGymClass = JSONObject.parseArray(classArray.toString(), GymClass.class);
        }


        String last3Attend = "select  *,0 xh into # from (select top 3000 bj.crmzdy_80620202_id idgym,rq.crm_name date,bj.crmzdy_80612384 time,bj.crmzdy_80612382 course,kq from(select crmzdy_81486481 kq,crmzdy_81486480_id idrq from crm_zdytable_238592_25118_238592_view bmks where bmks.crmzdy_81618215_id=195102/*idhz*/ and bmks.crmzdy_81636525<=dateadd(d,-90,getdate()) and crmzdy_81619234='已报名' union all select crmzdy_80652349,crmzdy_80652340_id from crm_zdytable_238592_23696_238592_view bk where crmzdy_80658051_id=195102 and bk.crmzdy_81761865<=dateadd(d,-90,getdate()))ks join crm_zdytable_238592_23870_238592_view rq on ks.idrq=rq.id join crm_zdytable_238592_23583_238592_view bj on rq.crmzdy_80650267_id=bj.id order by date desc)ks ;declare @kq varchar(100)='';declare @i int=1;update # set @i=case  when @kq='' then @i when kq=@kq then @i else @i+1 end,xh=@i,@kq=kq;select num from(select top 1 kq,xh,count(*)num from # group by kq,xh having kq='出勤' order by num desc)a/*近三个月最高连续出勤数*/ ";

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
    public String myinfo(HttpServletRequest request, String idhz, Model model) throws Exception {
        HttpSession session = request.getSession();
        Object objSession = session.getAttribute("user");
        User user;
        if (objSession != null) {
            user = (User) objSession;
        } else {
            return "redirect:/login.html";
        }
        //我的信息
        Integer idFamily = user.getIdFamily();
        String sqlMyInfo = "select top 6 convert(varchar(10),ht.crmzdy_80646021,111) 报名日期,ht.crmzdy_80646031  报名课时数,ht.crmzdy_81636090 合同金额,convert(varchar(10),crmzdy_81733324,111)   有效期,bmksb.crmzdy_81739422 剩余课时数,bmksb.crmzdy_81739425 累计请假数,isnull(bjap.kc,'暂未排课') 课程,ht.crmzdy_81733120 赠课,zx.crmzdy_81802626 积分 from crm_zdytable_238592_25111_238592_view zx join crm_zdytable_238592_25115_238592_view bmksb on zx.crmzdy_81611091_id=" + idFamily + " and bmksb.crmzdy_81756836_id=zx.id  join crm_zdytable_238592_23796_238592_view ht on ht.id=bmksb.crmzdy_81486464_id  outer apply(select top 1 bj.crmzdy_80612382 kc from crm_zdytable_238592_25117_238592_view bjap join crm_zdytable_238592_23583_238592_view bj on bj.id=bjap.crmzdy_81486476_id where ht.id=bjap.crmzdy_81598938_id)bjap where bmksb.crmzdy_81733119='销售'  and bmksb.crmzdy_81739422/*rest*/>0 and datediff(d,getdate(),ht.crmzdy_81733324/*dtDaoQi*/)>=0";
        JSONArray infoArray = getResultJson(sqlMyInfo);
        JSONObject infoObj = null;
        if (infoArray != null){
            infoObj = infoArray.getJSONObject(0);
        }

        //孩子id查询信息
        String sqlChild = "select  crm_name name,crmzdy_81497217 age from crm_zdytable_238592_23893_238592_view where id = " + idhz;
        JSONObject childObj = getResultJson(sqlChild).getJSONObject(0);

        model.addAttribute("infoObj", infoObj);
        model.addAttribute("childObj", childObj);

        if (user != null) {
            return "/member/myinfo";
        } else {
            return "redirect:/login.html";
        }
    }


    //date change
    @RequestMapping(value = "/attend", method = RequestMethod.GET)
    @ResponseBody
    public JSONArray getAttend(HttpServletRequest request,String idGym, Integer idChild, String beginDate, String endDate) {
        HashMap<String, String> gymMap = new HashMap<String, String>();
        HttpSession session = request.getSession();
        //TODO session判断
        JSONArray classArray;
        gymMap.put("idGymSelected", idGym);
        gymMap.put("beginDate", beginDate);
        gymMap.put("endDate", endDate);
        session.setAttribute("gym", gymMap);
        String sqlClass = "select bj.crmzdy_80620202_id idgym,rq.crm_name date,bj.crmzdy_80612384 time,bj.crmzdy_80612382 course,case when kq='未考勤' then '尚未开课' else kq  end kq from(select crmzdy_81486481 kq,crmzdy_81486480_id idrq " +
                "from crm_zdytable_238592_25118_238592_view bmks where bmks.crmzdy_81618215_id="+ idChild+ " /*idhz*/ and bmks.crmzdy_81636525>='"+beginDate+"'/*dtbegin*/ and bmks.crmzdy_81636525<='"+endDate+"'/*dtend*/ and crmzdy_81619234='已报名' union all select crmzdy_80652349,crmzdy_80652340_id from crm_zdytable_238592_23696_238592_view bk where crmzdy_80658051_id=3519 and bk.crmzdy_81761865>='"+beginDate+"'/*dtbegin*/ and bk.crmzdy_81761865<='"+endDate+"'/*dtend*/)ks join crm_zdytable_238592_23870_238592_view rq on ks.idrq=rq.id join crm_zdytable_238592_23583_238592_view bj on rq.crmzdy_80650267_id=bj.id and bj.crmzdy_80620202_id="+idGym+"/*idgym*/order by date desc";
        System.out.println("2个:\n"+sqlClass);
        classArray = getResultJson(sqlClass);
        return classArray;
    }

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getAttend(MultipartFile avatar, HttpServletRequest request, String idGym) {
        HashMap<String, Object> returnMap = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        try {
            // 获取图片原始文件名
            String originalFilename = avatar.getOriginalFilename();
            System.out.println(originalFilename);

            // 文件名使用当前时间
            String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());

            // 获取上传图片的扩展名(jpg/png/...)
            String extension = FilenameUtils.getExtension(originalFilename);

            // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）
            String path = "/upload/" + name + "." + extension;
            System.out.println(path);
            // 图片上传的绝对路径
            String url = request.getSession().getServletContext().getRealPath("") + path;

            File dir = new File(url);
            if(!dir.exists()) {
                dir.mkdirs();
            }

            // 上传图片
            avatar.transferTo(new File(url));

//            // 将相对路径写回（json格式）
//            JSONObject jsonObject = new JSONObject();
//            // 将图片上传到本地
//            jsonObject.put("path", path);

//            // 设置响应数据的类型json
//            response.setContentType("application/json; charset=utf-8");
//            // 写回
//            response.getWriter().write(jsonObject.toString());
              returnMap.put("success",true);
              returnMap.put("message",path);
        } catch (Exception e) {
            throw new RuntimeException("服务器繁忙，上传图片失败");
        }

        return returnMap;
    }

    /*
    ranking转化jsonobject
     */
    public JSONObject rankUtil(String ranking, String text) {
        JSONObject returnObj = null;
        if (ranking != null && !ranking.equals("")) {
            JSONObject jsonObject = JSONObject.parseObject(ranking);
            JSONArray jsonArray = jsonObject.getJSONArray(text);
            returnObj = jsonArray.getJSONObject(0);
        }
        return returnObj;
    }

    //输入sql获得list的jsonarray
    public JSONArray getResultJson(String sql) {
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("sql1", sql);
        JSONArray jsonArray = null;
        HttpResult httpResultUser = null;
        try {
            httpResultUser = httpService.doPost(POST_URL, hashMap);
            JSONObject jsonResult = JSONObject.parseObject(httpResultUser.getData());
            if (jsonResult != null) {
                if (jsonResult.getString("resultCode").equals("100") && jsonResult.getInteger("totalRecord") > 0) {
                    jsonArray = jsonResult.getJSONArray("list");
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonArray;
    }


    //获得某一天的日期

}
