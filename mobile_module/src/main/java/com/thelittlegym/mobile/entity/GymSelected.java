package com.thelittlegym.mobile.entity;

/**
 * Created by hibernate on 2017/5/8.
 */
public class GymSelected {
    private String beginDate;
    private String endDate;
    private Gym gym;

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Gym getGym() {
        return gym;
    }

    public void setGym(Gym gym) {
        this.gym = gym;
    }
}
