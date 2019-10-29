package com.reimu.security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/10/29 11:47
 * @version: 1.0
 **/
@Component
public class SysUserService {


    public SysUser getSysUser(){
        SysUser userDetails = (SysUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return userDetails;
    }
}
