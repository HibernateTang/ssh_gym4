package com.thelittlegym.mobile.entity;

/**
 * Created by hibernate on 2017/5/8.
 */
public class Rank {
    private String outpass;
    private String mins;
    private String ranking;
    private String times;
    private String tian;
    private String times_per_week;

    public String getOutpass() {
        return outpass;
    }

    public void setOutpass(String outpass) {
        this.outpass = outpass;
    }

    public String getMins() {
        return mins;
    }

    public void setMins(String mins) {
        this.mins = mins;
    }

    public String getRanking() {
        return ranking;
    }

    public void setRanking(String ranking) {
        this.ranking = ranking;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }

    public String getTian() {
        return tian;
    }

    public void setTian(String tian) {
        this.tian = tian;
    }

    public String getTimes_per_week() {
        return times_per_week;
    }

    public void setTimes_per_week(String times_per_week) {
        this.times_per_week = times_per_week;
    }
}
