package com.reimu.utils;

import com.reimu.security.SysUser;
import org.springframework.security.core.context.SecurityContextHolder;

public class UserUtil {

    public static SysUser getCurrentUser(){
        SysUser user = (SysUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return user;
    }
}
