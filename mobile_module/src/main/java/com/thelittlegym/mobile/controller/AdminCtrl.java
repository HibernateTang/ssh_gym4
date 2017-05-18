package com.thelittlegym.mobile.controller;

import com.thelittlegym.mobile.base.model.Page;
import com.thelittlegym.mobile.dao.impl.ActivityDaoImpl;
import com.thelittlegym.mobile.entity.Activity;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by hibernate on 2017/5/15.
 */
@Controller
@RequestMapping("/admin")
public class AdminCtrl {
    @Autowired
    private ActivityDaoImpl activityDao;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String adminIndex(HttpServletRequest request, Model model,Integer pageNow) throws Exception {
        String queryHql = "from Activity where isDelete = 0 order by createTime desc ";
        String countHql = "select count(id) from Activity where isDelete = 0  ";
        String pageNowStr = request.getParameter("pageNow");
        int pageSize = 9;
        pageNow = 1;
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

        return "/admin/activityAdd";
    }

    @RequestMapping(value = "/activityAdd", method = RequestMethod.POST)
    public String activityAdd(HttpServletRequest request, MultipartFile banner, String name, String detail, Date beginDate, Date endDate, String type,
                              String chargeType, String crowd, String strength) throws Exception {
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
        Activity activity = activityDao.findOne("from Activity where isDelete = 0 and id= " + id);
        model.addAttribute("activity", activity);
        return "/admin/activityEdit";
    }

    @RequestMapping(value = "/activityEdit", method = RequestMethod.POST)
    public String activityEdit(HttpServletRequest request, MultipartFile banner, String name, String detail, String  beginDate, String endDate, String type,
                               String chargeType, String crowd, String strength) throws Exception {
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
        Thumbnails.of(url).size(290, 120).toFile(url);
        return path;
    }
}
