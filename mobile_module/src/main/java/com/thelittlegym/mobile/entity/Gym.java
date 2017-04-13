package com.thelittlegym.mobile.entity;

import javax.persistence.Entity;

/**
 * Created by hibernate on 2017/4/13.
 */
@Entity
public class Gym {
    private String idGym;
    private String gymName;
    private String idgym_default;

    public String getIdGym() {
        return idGym;
    }

    public void setIdGym(String idGym) {
        this.idGym = idGym;
    }

    public String getGymName() {
        return gymName;
    }

    public void setGymName(String gymName) {
        this.gymName = gymName;
    }

    public String getIdgym_default() {
        return idgym_default;
    }

    public void setIdgym_default(String idgym_default) {
        this.idgym_default = idgym_default;
    }
}
