package com.thelittlegym.mobile.entity;

/**
 * Created by hibernate on 2017/5/8.
 */
public class Rank {
    private String outpass;
    private String mins;
    private String ranking;
    private String times;
    private String last3;

    public String getLast3() {
        return last3;
    }

    public void setLast3(String last3) {
        this.last3 = last3;
    }

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
}
