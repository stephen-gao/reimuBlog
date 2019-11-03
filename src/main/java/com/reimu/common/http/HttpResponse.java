package com.reimu.common.http;

import com.reimu.common.biz.BizEnums;
import com.reimu.common.biz.BizResponse;
import lombok.Data;

@Data
public class HttpResponse {

    private Integer code;

    private String message;

    private Object data;


    public HttpResponse(Integer code, Object data) {
        this.code = code;
        this.data = data;
    }

    public HttpResponse(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public HttpResponse(BizResponse response) {
        this.code = response.getCode();
        this.message = response.getMessage();
    }

    public static HttpResponse getSuccess(Object data){
        return new HttpResponse(BizEnums.SUCCESS.getCode(),data);
    }

    public static HttpResponse getResponse(BizEnums bizEnums, String message){
        return new HttpResponse(bizEnums.getCode(),null == message ? bizEnums.getMessage(): message);
    }

    public static HttpResponse getResponse(BizResponse response){
        return new HttpResponse(response);
    }

    public static HttpResponse defaultSuccess(){
        return new HttpResponse(BizEnums.SUCCESS.getCode(),BizEnums.SUCCESS.getMessage());
    }
}
