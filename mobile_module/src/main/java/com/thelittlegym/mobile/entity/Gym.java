package com.thelittlegym.mobile.entity;

import javax.persistence.Entity;

/**
 * Created by hibernate on 2017/4/13.
 */
public class Gym {
    private String gymId;
    private String gymName;
    private String defaultId;

    public String getGymId() {
        return gymId;
    }

    public void setGymId(String gymId) {
        this.gymId = gymId;
    }

    public String getGymName() {
        return gymName;
    }

    public void setGymName(String gymName) {
        this.gymName = gymName;
    }

    public String getDefaultId() {
        return defaultId;
    }

    public void setDefaultId(String defaultId) {
        this.defaultId = defaultId;
    }
}
