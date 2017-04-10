package com.thelittlegym.mobile.entity;

import javax.persistence.Entity;

/**
 * Created by hibernate on 2017/4/10.
 */
@Entity
public class Family {
    private Integer id;
    private String name;
    private String tel;
    private String childname;
    private String zx;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getChildname() {
        return childname;
    }

    public void setChildname(String childname) {
        this.childname = childname;
    }

    public String getZx() {
        return zx;
    }

    public void setZx(String zx) {
        this.zx = zx;
    }
}
