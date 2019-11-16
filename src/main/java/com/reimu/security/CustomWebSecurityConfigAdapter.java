package com.reimu.security;

import com.reimu.service.IPermissionService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * CustomWebSecurityConfigAdapter
 *
 * @blame GaoSheng
 */
@Log4j2
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class CustomWebSecurityConfigAdapter extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private IPermissionService permissionService;

    @Autowired
    private CustomAccessDeniedHandler accessDeniedHandler;

    @Autowired
    private CustomAuthenticationEntryPoint authenticationEntryPoint;


    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http = addAntMatchers(http);
        http.authorizeRequests()
                .and()
                // 设置登陆页
                .formLogin()
                .loginPage("/login")
                // 设置登陆成功页
                .defaultSuccessUrl("/manage", true)
                .failureUrl("/login-error").permitAll()
                .and()
                .logout()
                .logoutSuccessUrl("/login").permitAll()
                .and()
                .exceptionHandling()

                /**
                 * 无权限处理
                 */
                .accessDeniedHandler(accessDeniedHandler)
                /**
                 * 未登录，登录超时处理
                 */
                .authenticationEntryPoint(authenticationEntryPoint)
//                .accessDeniedPage("/error-403");
                .and()
                .headers().frameOptions().sameOrigin();
        // 关闭CSRF跨域
        http.csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        // 设置拦截忽略文件夹，可以对静态资源放行
        web.ignoring().antMatchers("/css/**", "/js/**", "/fonts/**", "/lib/**", "/assets/**", "/images/**", "/plugins/**");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    private HttpSecurity addAntMatchers(HttpSecurity http) throws Exception {
        List<SysPermission> permissionList = permissionService.getAllPermAndRole();
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry = http.authorizeRequests();
        log.info("注册中心配置信息：");
        registry.antMatchers("/manage/**").authenticated();
        // 设置接口权限
        permissionList.forEach(p -> {
            if (!StringUtils.isEmpty(p.getRoleName())) {
                registry.antMatchers(p.getCode()).hasAnyRole(p.getRoleName().split(","));
                log.info("权限[{}]-[{}]：角色[{}]", p.getName(), p.getCode(), ("ROLE_" + p.getRoleName()).replace(",", ",ROLE_"));
            } else {
                registry.antMatchers(p.getCode()).denyAll();
                log.info("权限[{}]-[{}]：禁止访问", p.getName(), p.getCode());
            }
        });
        registry.anyRequest().permitAll();
        return http;
    }

    public static void main(String[] args) {
        String pwd = "123456";
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encode = encoder.encode(pwd);
        System.out.println(encode);

    }

}