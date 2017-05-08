package com.thelittlegym.mobile.entity;

/**
 * Created by hibernate on 2017/5/8.
 */
public class Child {
    private String idhz;
    private String name;
    private String age;
    private String rest;
    private String ranking;

    public String getRanking() {
        return ranking;
    }

    public void setRanking(String ranking) {
        this.ranking = ranking;
    }

    public String getIdhz() {
        return idhz;
    }

    public void setIdhz(String idhz) {
        this.idhz = idhz;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getRest() {
        return rest;
    }

    public void setRest(String rest) {
        this.rest = rest;
    }
}
