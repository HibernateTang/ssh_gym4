package com.thelittlegym.mobile.user.controller;

import com.thelittlegym.mobile.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 汁 on 2017/3/25.
 */
@Controller
@RequestMapping("/index")
public class UserCtrl {
//    @Autowired
//    private IUserService userService;

    @RequestMapping(value="",method = RequestMethod.GET)
    public String index(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            return "/member/index";
        }else{
            return "redirect:/login.html";
        }
    }

    @RequestMapping(value="/details",method = RequestMethod.GET)
    public String details(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            return "/member/details";
        }else{
            return "redirect:/login.html";
        }
    }
}
