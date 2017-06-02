package com.thelittlegym.mobile.common;

import com.thelittlegym.mobile.utils.weixin.main.Sign;
import com.thelittlegym.mobile.utils.weixin.utils.WeixinUtil;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by hibernate on 2017/6/1.
 */
@Service
public class WeixinService {
    public Map<String,String>  getSign() {
        Sign sign = new Sign();
        String jsapi_ticket = WeixinUtil.getJsApiTicket().getTicket();

        // 注意 URL 一定要动态获取，不能 hardcode
        String url = "http://test.thelittlegym.com.cn:8080/index";
        Map<String, String> ret = sign.sign(jsapi_ticket, url);
        for (Map.Entry entry : ret.entrySet()) {
            System.out.println(entry.getKey() + ", " + entry.getValue());
        }
        return ret;
    }
}
