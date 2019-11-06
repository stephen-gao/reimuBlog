package com.reimu.web;

import com.alibaba.fastjson.JSONObject;
import com.reimu.common.biz.BizEnums;
import com.reimu.common.http.HttpResponse;
import com.reimu.utils.DateUtil;
import com.reimu.utils.QiniuOSSUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/11/05 16:34
 * @version: 1.0
 * @blame: GaoSheng
 **/
@Log4j2
@RestController
@RequestMapping("file/upload")
public class FileUploadController {

    @Value("${oss.file.path}")
    private String ossFilePath;

    /**
     * description
     *
     * @param file file
     * @param response response
     * @author GaoSheng
     * @since 2019/11/5
     * @return java.lang.String
     */
    @RequestMapping("image")
    public String imageUpload(@RequestParam("editormd-image-file") MultipartFile file, HttpServletResponse response) {
        JSONObject result = new JSONObject();
        String filename;
        try {
            InputStream inputStream = file.getInputStream();
            filename = QiniuOSSUtil.upload(inputStream);
        } catch (IOException e) {
            log.error("上传图片失败",e.getMessage());
            result.put("success",0);
            result.put("url","");
            result.put("message","失败");
            return result.toJSONString();
        }
        result.put("success",1);
        result.put("url",ossFilePath+filename);
        return result.toJSONString();
    }
}
