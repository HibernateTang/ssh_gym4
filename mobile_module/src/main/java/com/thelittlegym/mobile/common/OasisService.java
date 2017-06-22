package com.thelittlegym.mobile.common;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;

/**
 * Created by hibernate on 2017/4/19.
 */
@Service
public class OasisService {
    private static final String POST_URL = "https://bbk.800app.com/uploadfile/staticresource/238592/279832/MobileApiPost.aspx";
    private static final String GET_ADDPOINTS_URL = "https://bbk.800app.com/uploadfile/staticresource/238592/279832/MobileAddPoints.aspx";
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

        } catch (IOException e) {
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

    public Boolean addPoints(String idjt,Integer val,String zx) {
        String url = GET_ADDPOINTS_URL + "?idjt=" + idjt + "&val=" + val + "&zx=" + zx;
        System.out.println(url);

        String result = null;
        try {
            result = httpService.doGet(url);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        if( null != result ){
            JSONObject jsonObject = JSONObject.parseObject(result);
            return "1".equals(jsonObject.getString("resultCode"))?true:false;
        }
        return false;
    }
}
