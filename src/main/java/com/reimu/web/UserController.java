package com.reimu.web;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.Result;
import com.reimu.entity.User;
import com.reimu.model.vo.UserVO;
import com.reimu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 * 用户表  前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping("user-page")
    public ModelAndView userPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/user");
        return mv;
    }

    @RequestMapping("user-page-data")
    @ResponseBody
    public Result userPageData(@RequestBody UserVO vo){
        IPage page = userService.userPage(vo);
        return Result.getSuccess(page);
    }
}
