package com.tian.common.util;

import com.alibaba.fastjson.JSON;
import com.tian.common.pojo.weather.Daily;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.SignatureException;
import java.util.Date;
import java.util.List;

public class WeatherUtil {

    private String TIANQI_DAILY_WEATHER_URL = "https://api.seniverse.com/v3/weather/daily.json";

    private String TIANQI_API_SECRET_KEY = "mgpgyfqcqoyciamp"; //

    private String TIANQI_API_USER_ID = "UBDE6623A8"; //

    /**
     * Generate HmacSHA1 signature with given data string and key
     * @param data
     * @param key
     * @return
     * @throws SignatureException
     */
    private String generateSignature(String data, String key) throws SignatureException {
        String result;
        try {
            // get an hmac_sha1 key from the raw key bytes
            SecretKeySpec signingKey = new SecretKeySpec(key.getBytes("UTF-8"), "HmacSHA1");
            // get an hmac_sha1 Mac instance and initialize with the signing key
            Mac mac = Mac.getInstance("HmacSHA1");
            mac.init(signingKey);
            // compute the hmac on input data bytes
            byte[] rawHmac = mac.doFinal(data.getBytes("UTF-8"));
            result = new sun.misc.BASE64Encoder().encode(rawHmac);
        }
        catch (Exception e) {
            throw new SignatureException("Failed to generate HMAC : " + e.getMessage());
        }
        return result;
    }

    /**
     * Generate the URL to get diary weather
     * @param location
     * @param language
     * @param unit
     * @param start
     * @param days
     * @return
     */
    public String generateGetDiaryWeatherURL(
            String location,
            String language,
            String unit,
            String start,
            String days
    )  throws SignatureException, UnsupportedEncodingException {
        String timestamp = String.valueOf(new Date().getTime());
        String params = "ts=" + timestamp + "&ttl=30&uid=" + TIANQI_API_USER_ID;
        String signature = URLEncoder.encode(generateSignature(params, TIANQI_API_SECRET_KEY), "UTF-8");
        return TIANQI_DAILY_WEATHER_URL + "?" + params + "&sig=" + signature + "&location=" + location + "&language=" + language + "&unit=" + unit + "&start=" + start + "&days=" + days;
    }

    public static String getWeather(String localName) throws UnsupportedEncodingException, SignatureException {
        WeatherUtil demo = new WeatherUtil();
        String url = demo.generateGetDiaryWeatherURL(localName, "zh-Hans", "c", "1", "7");
        return url;
    }

    public static void main(String args[]){
        WeatherUtil demo = new WeatherUtil();
        try {
            String url = demo.generateGetDiaryWeatherURL(
                    "邢台",
                    "zh-Hans",
                    "c",
                    "1",
                    "7"
            );
            System.out.println("URL:" + url);
            String s = HttpClientUtil.requestByGetMethod(url);
            String result = HttpClientUtil.requestByGetMethod(url);
            result = "["+result.substring(result.indexOf("daily")+8,result.lastIndexOf("last_update")-3)+"]";
            List<Daily> dailies = JSON.parseArray(result, Daily.class);
            System.out.println(dailies);
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }

    }
}