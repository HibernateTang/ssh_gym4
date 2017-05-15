package com.thelittlegym.mobile.controller;

import com.thelittlegym.mobile.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by hibernate on 2017/5/15.
 */
@Controller
@RequestMapping("/admin")
public class AdminCtrl {


    @RequestMapping(value = "",method = RequestMethod.GET)
    public String adminIndex(HttpServletRequest request, Model model) throws Exception {


        return "/admin/index";
    }
}
