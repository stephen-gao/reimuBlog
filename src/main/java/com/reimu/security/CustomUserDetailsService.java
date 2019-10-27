//package com.reimu.security;
//
//import com.reimu.entity.Permission;
//import com.reimu.entity.Role;
//import com.reimu.entity.User;
//import com.reimu.service.IPermissionService;
//import com.reimu.service.IRoleService;
//import com.reimu.service.IUserRoleService;
//import com.reimu.service.IUserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import java.util.ArrayList;
//import java.util.List;
//
////@Service("userDetailsService")
//public class CustomUserDetailsService implements UserDetailsService {
//
//    @Autowired
//    private IUserService userService;
//
//    @Autowired
//    private IRoleService roleService;
//
//    @Autowired
//    private IUserRoleService userRoleService;
//
//    @Autowired
//    private IPermissionService permissionService;
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        User system = userService.getOneByName(username);
//        if (system == null) {
//            throw new UsernameNotFoundException("用户名不存在");
//        }
//        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
//        List<Role> roleList = roleService.getListByUserId(system.getId());
//        roleList.forEach(role -> {
//            authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getName()));
//        });
//
//        return new SysUser(system.getId(), system.getUsername(), system.getPassword(), authorities);
//    }
//}
