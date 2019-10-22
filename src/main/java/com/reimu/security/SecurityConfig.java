package com.reimu.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)  //  启用方法级别的权限认证
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //  允许所有用户访问"/"和"/index.html"
//        http.authorizeRequests()
//                .antMatchers("/", "/index.html").permitAll()
//                .anyRequest().authenticated()   // 其他地址的访问均需验证权限
//                .and()
//                .formLogin()
//                .loginPage("/login.html")   //  登录页
//                .failureUrl("/login-error.html").permitAll()
//                .and()
//                .logout()
//                .logoutSuccessUrl("/index.html");

        http.authorizeRequests()
                // 如果有允许匿名的url，填在下面
                .antMatchers("/test/a").permitAll()
                .anyRequest().authenticated()
                .and()
                // 设置登陆页
                .formLogin()
//                .loginPage("/login")
                // 设置登陆成功页
                .defaultSuccessUrl("/success")
                .failureUrl("/login-error").permitAll()
                // 自定义登陆用户名和密码参数，默认为username和password
//                .usernameParameter("username")
//                .passwordParameter("password")
                .and()
                .logout()
                .logoutSuccessUrl("/login").permitAll();

//        // 关闭CSRF跨域
//        http.csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        // 设置拦截忽略文件夹，可以对静态资源放行
        web.ignoring().antMatchers("/css/**", "/js/**");
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    public static void main(String[] args) {
        String  pwd = "123456";
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encode = encoder.encode(pwd);
        System.out.println(encode);

    }

}