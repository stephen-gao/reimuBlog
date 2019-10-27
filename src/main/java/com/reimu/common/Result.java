package com.reimu.common;

import lombok.Data;

@Data
public class Result {

    private String code;

    private String message;

    private Object data;

    public Result() {
    }

    public Result(String code, Object data) {
        this.code = code;
        this.data = data;
    }

    public Result(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public static Result getSuccess(Object data){
        return new Result(ResultEnums.SUCCESS.getCode(),data);
    }

    public static Result getResult(ResultEnums resultEnums,String message){
        return new Result(resultEnums.getCode(),null == message ? resultEnums.getMessage(): message);
    }

    public static Result defaultSuccess(){
        return new Result(ResultEnums.SUCCESS.getCode(),ResultEnums.SUCCESS.getMessage());
    }
}
