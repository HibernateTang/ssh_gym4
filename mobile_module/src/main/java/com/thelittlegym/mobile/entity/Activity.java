package com.thelittlegym.mobile.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by hibernate on 2017/5/17.
 */
@Entity
@Table(name="activity")
public class Activity {
    @Id
    @GeneratedValue
    private Integer id;
    private Date createTime;
    private String name;
    private String detail;
    private Date beginDate;
    private Date endDate;
    private String type;
    //收费总类
    private String chargeType;
    //人群
    private String crowd;
    //强度
    private String strength;
    private Boolean isDelete;
    private String bannerSrc;
    private ArrayList<String> gyms;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getChargeType() {
        return chargeType;
    }

    public void setChargeType(String chargeType) {
        this.chargeType = chargeType;
    }

    public String getCrowd() {
        return crowd;
    }

    public void setCrowd(String crowd) {
        this.crowd = crowd;
    }

    public String getStrength() {
        return strength;
    }

    public void setStrength(String strength) {
        this.strength = strength;
    }

    public Boolean getDelete() {
        return isDelete;
    }

    public void setDelete(Boolean delete) {
        isDelete = delete;
    }

    public String getBannerSrc() {
        return bannerSrc;
    }

    public void setBannerSrc(String bannerSrc) {
        this.bannerSrc = bannerSrc;
    }

    public ArrayList<String> getGyms() {
        return gyms;
    }

    public void setGyms(ArrayList<String> gyms) {
        this.gyms = gyms;
    }
}
