package com.thelittlegym.mobile.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hibernate on 2017/5/23.
 */
@Controller
public class ErrorCtrl {
    @RequestMapping("/")
    public String errorPage(){
        //如果你的spring mvc配置文件中配置了跳转后缀则不需要加.jsp后缀
        //即直接return "demo/pagefile";
        return "demo/pagefile.jsp";
    }
}
