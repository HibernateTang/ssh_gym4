package com.thelittlegym.mobile.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by hibernate on 2017/4/13.
 */
@Entity
@Table(name="gym")
public class Gym {

    private String gymId;
    private String gymName;

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

}
