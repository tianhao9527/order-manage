package com.tian.common.pojo.weather;

import java.io.Serializable;

public class Weather implements Serializable{
    private String date;
    private String low;
    private String high;

    public Weather (){}

    public Weather(String date, String low, String high) {
        this.date = date;
        this.low = low;
        this.high = high;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLow() {
        return low;
    }

    public void setLow(String low) {
        this.low = low;
    }

    public String getHigh() {
        return high;
    }

    public void setHigh(String high) {
        this.high = high;
    }
}
