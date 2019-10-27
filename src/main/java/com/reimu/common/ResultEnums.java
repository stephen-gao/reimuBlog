package com.reimu.common;

import lombok.Data;

public enum ResultEnums {
    SUCCESS("0000","success"),
    FAILED("1000","failed");

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
