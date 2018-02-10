package com.tian.common.util;

import java.security.MessageDigest;

/**
 * 数据加密辅助类(默认编码UTF-8)
 *
 * @author ShenHuaJie
 * @since 2011-12-31
 */
public final class SecurityUtil {
    public static final String CHARSET = "UTF-8";
    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd',
            'e', 'f'};

    private SecurityUtil() {
    }

    public static final String encodeMD5(String value) {
        if (value == null) {
            return null;
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(value.getBytes());
            return getFormattedText(messageDigest.digest());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static final String getFormattedText(byte[] bytes) {
        int len = bytes.length;
        StringBuilder buf = new StringBuilder(len * 2);
        for (int j = 0; j < len; j++) {
            buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buf.toString();
    }

    public static String encryptPassword(String password) {
        return encodeMD5(password);
    }


}
