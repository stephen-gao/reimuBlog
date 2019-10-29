package com.reimu.model.vo;

import com.reimu.model.BaseVO;
import lombok.Data;

import java.io.Serializable;

@Data
public class UserVO extends BaseVO implements Serializable {


    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 昵称
     */
    private String nickname;

    /**
     *
     */
    private String photo;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 简介
     */
    private String information;

    /**
     * 状态 1正常，2冻结，9删除
     */
    private Integer status;
}
