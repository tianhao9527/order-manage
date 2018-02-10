package com.tian.common.pojo.weather;

import java.io.Serializable;
import java.util.List;

public class WeatherResult implements Serializable{
    private Location location;
    private List<Daily> daily;
    private String last_update;

    public WeatherResult(){}

    public WeatherResult(Location location, List<Daily> daily, String last_update) {
        this.location = location;
        this.daily = daily;
        this.last_update = last_update;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public List<Daily> getDaily() {
        return daily;
    }

    public void setDaily(List<Daily> daily) {
        this.daily = daily;
    }

    public String getLast_update() {
        return last_update;
    }

    public void setLast_update(String last_update) {
        this.last_update = last_update;
    }
}
