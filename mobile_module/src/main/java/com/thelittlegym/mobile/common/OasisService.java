package com.thelittlegym.mobile.common;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thelittlegym.mobile.utils.msg.utils.StringUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.SocketTimeoutException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hibernate on 2017/4/19.
 */
@Service
public class OasisService {
    private static final String POST_URL = "https://bbk.800app.com/uploadfile/staticresource/238592/279832/MobileApiPost.aspx";
    private static final String GET_ADDPOINTS_URL = "https://bbk.800app.com/uploadfile/staticresource/238592/279832/MobileAddPoints.aspx";
    private static final String BBKApp_URL = "https://cn6.800app.com/Default.jsp?mfs=login&msafe=1&lan=zh";
    @Autowired
    private HttpService httpService;

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

        }  catch (IOException e) {
            e.printStackTrace();
        } 
        return jsonArray;
    }

    public JSONObject getObject(String sql, Integer index) {
        JSONObject jsonObject = null;
        JSONArray jsonArray = getResultJson(sql);
        if (jsonArray != null) {
            jsonObject = jsonArray.getJSONObject(index);
        }
        return jsonObject;
    }

    public Boolean addPoints(String idjt, Integer val, String zx) throws Exception {
        zx = URLEncoder.encode(zx, "gb2312");
        Map<String,String> paramMap = new HashMap<String,String>();
        paramMap.put("idjt",idjt);
        paramMap.put("val",val.toString());
        paramMap.put("zx",zx);
        String url = GET_ADDPOINTS_URL + "?idjt=" + idjt + "&val=" + val + "&zx=" + zx;
//        String url = GET_ADDPOINTS_URL ;
//        url = StringUtils.trim(url);
        String result  = httpService.doGet(url);

        if (null != result) {
            JSONObject jsonObject = JSONObject.parseObject(result);
            return "1".equals(jsonObject.getString("resultCode")) ? true : false;
        }
        return false;
    }


}
