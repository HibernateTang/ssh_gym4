package com.thelittlegym.mobile.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by hibernate on 2017/4/21.
 */
@Entity
@Table(name="feedback")
public class Feedback {
    @Id
    @GeneratedValue
    private Integer id;
    private String name;
    private String franchisee;
    private String contactTel;
    private String details;
    private Date createTime;
    private String type;
    private Boolean handled;
    private Date handledTime;

    public Boolean getHandled() {
        return handled;
    }

    public void setHandled(Boolean handled) {
        this.handled = handled;
    }

    public Date getHandledTime() {
        return handledTime;
    }

    public void setHandledTime(Date handledTime) {
        this.handledTime = handledTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFranchisee() {
        return franchisee;
    }

    public void setFranchisee(String franchisee) {
        this.franchisee = franchisee;
    }

    public String getContactTel() {
        return contactTel;
    }

    public void setContactTel(String contactTel) {
        this.contactTel = contactTel;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
