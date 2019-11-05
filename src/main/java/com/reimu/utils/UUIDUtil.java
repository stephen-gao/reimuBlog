package com.reimu.utils;

public class UUIDUtil {

    public static String getUUID(){
        String s = java.util.UUID.randomUUID().toString().replaceAll("-","");
        return s;
    }
}