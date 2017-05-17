package com.thelittlegym.mobile.controller;

import com.thelittlegym.mobile.dao.impl.ActivityDaoImpl;
import com.thelittlegym.mobile.entity.Activity;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
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

    @RequestMapping(value = "",method = RequestMethod.GET)
    public String adminIndex(HttpServletRequest request, Model model) throws Exception {
        String queryHql = "from Activity where isDelete = 0 ";
        String countHql = "select count(*) from Activity";
        List<Activity> activityList  =  activityDao.findPage(1,9,queryHql,countHql).getList();
        model.addAttribute("activityList",activityList);
        return "/admin/index";
    }

    @RequestMapping(value = "/activityToAdd",method = RequestMethod.GET)
    public String activityToAdd(HttpServletRequest request, Model model) throws Exception {
        System.out.println("toAddActivity");

        return "/admin/activityAdd";
    }

    @RequestMapping(value = "/activityAdd",method = RequestMethod.POST)
    public String activityAdd(HttpServletRequest request,MultipartFile banner,String name, String detail,Date beginDate,Date endDate,String type,
                              String chargeType,String crowd, String strength) throws Exception {
        HashMap returnMap = new HashMap();
        ArrayList<String> gymsList = new ArrayList<String>();
        Activity activity = new Activity();

        try {
            activity.setName(name);
            activity.setDetail(detail);
            activity.setBeginDate(beginDate);
            activity.setEndDate(endDate);
            activity.setType(type);
            activity.setChargeType(chargeType);
            activity.setCrowd(crowd);
            activity.setStrength(strength);
            activity.setCreateTime(new Date());
            activity.setGyms(gymsList);
            activity.setDelete(false);
            // 获取图片原始文件名
            String originalFilename = banner.getOriginalFilename();

//             文件名使用当前时间
            String bannerName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
            // 获取上传图片的扩展名(jpg/png/...)
            String extension = FilenameUtils.getExtension(originalFilename);

            // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）
            String path = "/upload/admin/activity/banner/"+ name + "." + extension.toUpperCase();
            String originalPath = "/upload/admin/activity/banner/"  + name + "Original" + "." + extension;
            // 图片上传的绝对路径
            String url = request.getSession().getServletContext().getRealPath("") + path;
            String originalUrl = request.getSession().getServletContext().getRealPath("") + originalPath;
            File dir = new File(originalUrl);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // 上传图片
            banner.transferTo(new File(originalUrl));
            //压缩
            Thumbnails.of(originalUrl).size(150, 80).outputFormat("jpg").toFile(url);
            activity.setBannerSrc(path);
            activityDao.save(activity);
            returnMap.put("success", true);
            returnMap.put("message", path);
        } catch (Exception e) {
            e.printStackTrace();
            returnMap.put("success", false);
            returnMap.put("message", "请重新登录后再试");
        }
        return "/admin/index";
    }

    @RequestMapping(value = "/activityEdit",method = RequestMethod.GET)
    public String activityEdit(HttpServletRequest request, Model model) throws Exception {


        return "/admin/activityEdit";
    }

    @RequestMapping(value = "/activityDel",method = RequestMethod.GET)
    public String activityDel(HttpServletRequest request, Model model) throws Exception {


        return "/admin/activityDel";
    }
}
