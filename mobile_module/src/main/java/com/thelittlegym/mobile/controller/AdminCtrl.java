package com.thelittlegym.mobile.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.base.model.Page;
import com.thelittlegym.mobile.dao.impl.ActivityDaoImpl;
import com.thelittlegym.mobile.entity.Activity;
import com.thelittlegym.mobile.entity.Admin;
import com.thelittlegym.mobile.login.service.ILoginService;
import com.thelittlegym.mobile.service.IAdminService;
import com.thelittlegym.mobile.user.model.User;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by hibernate on 2017/5/15.
 */
@Controller
@RequestMapping("/admin")
public class AdminCtrl {
    @Autowired
    private ActivityDaoImpl activityDao;
    @Autowired
    private IAdminService adminService;
    @Autowired
    private ILoginService loginService;

    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String adminToLogin(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Object sessionObj = session.getAttribute("admin");
        Admin admin = new Admin();
        if (sessionObj != null){
            return "/admin";
        }else{
            return "/admin/login";
        }
    }

    @RequestMapping(value="/valLogin",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> adminLogin(HttpServletRequest request,String username,String password) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();
        try {
            Map<String ,Object> map =  adminService.login( username, password);
            Object object = map.get("value");
            if (object != null) {
                Admin admin = (Admin) object;
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
            }
            returnMap.put("value", object);
            returnMap.put("message", map.get("message"));
            returnMap.put("success", map.get("success"));
        }catch (Exception e){
            returnMap.put("message", "异常：登录失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }

        return returnMap;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String adminIndex(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        Object sessionObj = session.getAttribute("admin");
        if (sessionObj == null){
            return "/admin/login";
        }
        String queryHql = "from Activity where isDelete = 0 order by createTime desc ";
        String countHql = "select count(id) from Activity where isDelete = 0  ";
        String pageNowStr = request.getParameter("pageNow");
        int pageSize = 9;
        int  pageNow = 1;
        if ( null != pageNowStr && !"".equals(pageNowStr) ){
            if (pageNowStr.matches("[0-9]+")){
                pageNow = Integer.parseInt(pageNowStr);
            }
        }

        Page<Activity> page = activityDao.findPage(pageNow, pageSize, queryHql, countHql);
        page.setCurrent(pageNow);
        model.addAttribute("page",page);
        return "/admin/index";
    }

    @RequestMapping(value = "/activityToAdd", method = RequestMethod.GET)
    public String activityToAdd(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        Object sessionObj = session.getAttribute("admin");
        if (sessionObj == null){
            return "/admin/login";
        }
        return "/admin/activityAdd";
    }

    @RequestMapping(value = "/activityAdd", method = RequestMethod.POST)
    public String activityAdd(HttpServletRequest request, MultipartFile banner, String name, String detail, Date beginDate, Date endDate, String type,
                              String chargeType, String crowd, String strength) throws Exception {
        HttpSession session = request.getSession();
        Object sessionObj = session.getAttribute("admin");
        if (sessionObj == null){
            return "/admin/login";
        }
        Activity activity = new Activity();
        activity.setName(name);
        activity.setDetail(detail);
        activity.setBeginDate(beginDate);
        activity.setEndDate(endDate);
        activity.setType(type);
        activity.setChargeType(chargeType);
        activity.setCrowd(crowd);
        activity.setStrength(strength);
        activity.setCreateTime(new Date());
        activity.setGyms("上海环球中心");
        activity.setDelete(false);
        activity.setBannerSrc(uploadFile(request, banner, "/upload/admin/activity/banner/"));
        activityDao.save(activity);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/activityToEdit", method = RequestMethod.GET)
    public String activityToEdit(HttpServletRequest request, Model model, Integer id) throws Exception {
        HttpSession session = request.getSession();
        Object sessionObj = session.getAttribute("admin");
        if (sessionObj == null){
            return "/admin/login";
        }
        Activity activity = activityDao.findOne("from Activity where isDelete = 0 and id= " + id);
        model.addAttribute("activity", activity);
        return "/admin/activityEdit";
    }

    @RequestMapping(value = "/activityEdit", method = RequestMethod.POST)
    public String activityEdit(HttpServletRequest request, MultipartFile banner, String name, String detail, String  beginDate, String endDate, String type,
                               String chargeType, String crowd, String strength) throws Exception {
        HttpSession session = request.getSession();
        Object sessionObj = session.getAttribute("admin");
        if (sessionObj == null){
            return "/admin/login";
        }
        String id = request.getParameter("id");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-DD");
        Activity activity = new Activity();
        if(null != id && !"".equals(id)){
            activity = activityDao.findOne("from Activity where isDelete = 0 and id= " + id);
            if ( null != activity ){
                activity.setName(name);
                activity.setDetail(detail);

                activity.setBeginDate(sdf.parse(beginDate));
                activity.setEndDate(sdf.parse(endDate));
                activity.setType(type);
                activity.setChargeType(chargeType);
                activity.setCrowd(crowd);
                activity.setStrength(strength);
                activity.setCreateTime(new Date());
                activity.setGyms("上海环球中心");
                if (!banner.isEmpty()){
                    delFile(request.getSession().getServletContext().getRealPath("") + activity.getBannerSrc());
                    activity.setBannerSrc(uploadFile(request, banner, "/upload/admin/activity/banner/"));
                }
                activityDao.update(activity);
            }
        }
        return "redirect:/admin";
    }

    @RequestMapping(value = "/activityDel", method = RequestMethod.GET)
    public String activityDel(HttpServletRequest request, String id) throws Exception {
        HttpSession session = request.getSession();
        Object sessionObj = session.getAttribute("admin");
        if (sessionObj == null){
            return "/admin/login";
        }
        HashMap<String, Object> returnMap = new HashMap<String, Object>();
        id = request.getParameter("id");
        Activity activity  = new Activity();
        if(null != id && !"".equals(id)){
            activity = activityDao.findOne("from Activity where isDelete = 0 and id= " + id);
            if ( null != activity ){
                activity.setDelete(true);
                activityDao.update(activity);
            }
        }

        activityDao.update(activity);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/simulation", method = RequestMethod.GET)
    public String simulation(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Object sessionObj = session.getAttribute("admin");
        if (sessionObj == null) {
            return "/admin/login";
        }
        return "/admin/simulation";
    }

    @RequestMapping(value = "/member", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> member(HttpServletRequest request, String tel)  {
        HttpSession session = request.getSession();
        Map<String,Object> returnMap = new HashMap<String,Object>();
        Map<String,Object> map = null;
        try {
            map = loginService.login(tel);
            Object object = map.get("value");
            if (object != null) {
                User user = (User) object;
                session = request.getSession(true);
                Object objSession = session.getAttribute("user");
                //重复登录清空之前session所有attr
                if ( null != objSession ){
                    Enumeration<String> em = session.getAttributeNames();
                    while (em.hasMoreElements()) {
                        if (!"admin".equals(em.nextElement())){
                            session.removeAttribute(em.nextElement());
                        }
                    }
                }
                session.setAttribute("user", user);
                returnMap.put("success",true);
                returnMap.put("message","登录成功");
            }
        } catch (Exception e) {
            returnMap.put("success",false);
            returnMap.put("message","登录异常，请重试");
        }
        //获取user实体
        Object object = map.get("value");
        if (object != null) {
            User user = (User) object;
            Object objSession = session.getAttribute("user");

            session.setAttribute("user", user);
            returnMap.put("success",true);
            returnMap.put("message","登录成功");
            return returnMap;
        }else {
            returnMap.put("success",false);
            returnMap.put("message","该号码未注册");
            return map;
        }
    }

    @RequestMapping(value = "/activityView", method = RequestMethod.POST)
    @ResponseBody
    //TODO   很多判断，懒得写了
    public JSONArray activityView(HttpServletRequest request, String id) throws Exception {
        Activity activity  = new Activity();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.hh HH:mm:ss");
        activity = activityDao.findOne("from Activity where isDelete = 0 and id= " + id);
        System.out.println(sdf.format(activity.getBeginDate()));
        JSONObject jsonObject = (JSONObject)JSON.toJSON(activity);
        jsonObject.put("beginDate",sdf.format(activity.getBeginDate()));
        jsonObject.put("endDate",sdf.format(activity.getEndDate()));
        JSONArray jsonArray = new JSONArray();
        jsonArray.add(jsonObject);

        return jsonArray;
    }

    //删除指定文件
    public boolean delFile(String filePath){
        boolean flag = false;
        File file = new File(filePath);
        if (file.exists()){
            file.delete();
            flag = true;
        }
        return flag;
    }

    public String uploadFile(HttpServletRequest request, MultipartFile file, String headPath) throws IOException {
        // 获取图片原始文件名
        String originalFilename = file.getOriginalFilename();

//             文件名使用当前时间
        String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        // 获取上传图片的扩展名(jpg/png/...)
        String extension = FilenameUtils.getExtension(originalFilename);

        // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）
        String path = headPath + fileName +"." + extension.toUpperCase();
//        String originalPath = headPath + fileName + "Original" + "." + extension;
        // 图片上传的绝对路径
        String url = request.getSession().getServletContext().getRealPath("") + path;
//        String originalUrl = request.getSession().getServletContext().getRealPath("") + originalPath;
        File dir = new File(url);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // 上传图片
        file.transferTo(new File(url));

        //压缩
        Thumbnails.of(url).size(960, 700).toFile(url);
        return path;
    }
}
