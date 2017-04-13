package com.thelittlegym.mobile.entity;

import javax.persistence.Entity;
import java.util.Date;

/**
 * Created by 汁 on 2017/4/9.
 */
@Entity
public class GymClass {
    private String idgym;
    private Date date;
    private String time;
    private String course;
    private String kq;

    public String getIdgym() {
        return idgym;
    }

    public void setIdgym(String idgym) {
        this.idgym = idgym;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getKq() {
        return kq;
    }

    public void setKq(String kq) {
        this.kq = kq;
    }


}
