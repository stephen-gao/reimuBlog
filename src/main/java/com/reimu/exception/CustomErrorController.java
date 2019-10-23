package com.reimu.exception;

import com.alibaba.fastjson.JSON;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/10/23 20:26
 * @version: 1.0
 **/
@Controller
public class CustomErrorController implements ErrorController {


    private static final String ERROR_PATH = "/error";

    @GetMapping(ERROR_PATH)
    @ResponseBody
    public String error(HttpServletRequest request) {
        System.out.println("CustomErrorController");
        Enumeration<String> attributes = request.getAttributeNames();

        Map<String, Object> map = new HashMap<>();
        while (attributes.hasMoreElements()) {
            String name = attributes.nextElement();
            if (name.startsWith("java")) {
                // spring本身的属性不宜对外暴露，切记！
                Object value = request.getAttribute(name);
                map.put(name, value);
            }
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
}
