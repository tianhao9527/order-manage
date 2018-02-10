package com.tian.common.util;

public class StringUtil {
    /**
     * 移除空白字符，如果为null则改为“”
     *<b>Summary: </b>
     * removeTrim()
     * @param pwd
     * @return
     * @throws Exception
     */
    public static String removeTrim(String pwd){
        if(pwd == null || "".equals(pwd.trim())){
            return "";
        }
        return pwd.replaceAll("\\s+", "");//替换所有空白字符
    }
}
