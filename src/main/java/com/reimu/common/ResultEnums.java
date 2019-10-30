package com.reimu.common;

/**
 * 功能:
 * @author: GaoSheng
 * @since: 2019/10/30
 */
public enum ResultEnums {
    /**
     * 返回信息
     */
    SUCCESS("0000","success"),
    FAILED("1000","failed"),
    NOT_LOGIN("9001","not login");

    private String code;

    private String message;

    ResultEnums() {
    }

    ResultEnums(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }


    public String getMessage() {
        return message;
    }

}
