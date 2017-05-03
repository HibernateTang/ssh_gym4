package com.thelittlegym.mobile.controller;

import com.thelittlegym.mobile.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by hibernate on 2017/5/3.
 */
@Controller
@RequestMapping("/activity")
public class ActivityCtrl {

    @RequestMapping(value = "",method = RequestMethod.GET)
    public String activities(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        Object objSession = session.getAttribute("user");
        User user;
        if (objSession != null) {

        } else {
            user = (User) objSession;
        }

         return "/activity/activities";
    }

    @RequestMapping(value = "search",method = RequestMethod.GET)
    public String search(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Object objSession = session.getAttribute("user");
        User user;
        if (objSession != null) {

        } else {
            user = (User) objSession;
        }

        return "/activity/search";
    }

    @RequestMapping(value = "activity",method = RequestMethod.GET)
    public String activity(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Object objSession = session.getAttribute("user");
        User user;
        if (objSession != null) {

        } else {
            user = (User) objSession;
        }

        return "/activity/activity";
    }

    @RequestMapping(value = "myinfo",method = RequestMethod.GET)
    public String info(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Object objSession = session.getAttribute("user");
        User user;
        if (objSession != null) {

        } else {
            user = (User) objSession;
        }

        return "/activity/myinfo";
    }
}
