package com.thelittlegym.mobile.controller;

import com.thelittlegym.mobile.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by hibernate on 2017/5/11.
 */
@Controller
@RequestMapping("/exist")
public class ExistCtrl {
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String activities(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        Object objSession = session.getAttribute("user");
        session.invalidate();
        return "redirect:/login.html";
    }
}
