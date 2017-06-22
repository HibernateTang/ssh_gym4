package com.thelittlegym.mobile.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by hibernate on 2017/6/21.
 */
@Entity
@Table(name="points")
public class Points {
    @Id
    @GeneratedValue
    private Integer id;
    //活动积分来源类型
    private String type;
    //积分数量
    private Integer num;
    private Date createTime;
    private String tel;
    private String zx;

    public String getZx() {
        return zx;
    }

    public void setZx(String zx) {
        this.zx = zx;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
