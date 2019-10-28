package com.reimu.utils;

import lombok.extern.log4j.Log4j2;

import java.util.Date;
import java.util.UUID;

/**
 * 8位UUID生成
 *
 * @author: GaoSheng
 * @since: 2019/10/28 20:36
 * @version: 1.0
 **/
@Log4j2
public class AtricleIdUtil {
    /**
     * 得到8位的UUID-(码)
     */
    private static String[] chars = new String[] { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
            "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8",
            "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
            "U", "V", "W", "X", "Y", "Z" };

    private static String getUUID_8() {
        StringBuffer shortBuffer = new StringBuffer();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        for (int i = 0; i < 8; i++) {
            String str = uuid.substring(i * 4, i * 4 + 4);
            int x = Integer.parseInt(str, 16);
            shortBuffer.append(chars[x % 0x3E]);
        }
        return shortBuffer.toString();
    }

    public static String getArticleId(){
        return DateUtil.convert(new Date(), "yyMM")+getUUID_8();
    }

    public static void main(String[] args) {
        log.info(getArticleId());

    }
}
