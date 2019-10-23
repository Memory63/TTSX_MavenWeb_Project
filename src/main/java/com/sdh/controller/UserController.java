package com.sdh.controller;

import com.sdh.pojo.User;
import com.sdh.service.UserService;
import com.sdh.utils.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @ClassName UserController
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/21 19:51
 * @Version 1.0
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * todo: 登陆业务处理
     * @param username
     * @param password
     * @return
     */
    @PostMapping("login")
    @ResponseBody
    public String login(String username, String password, String code, String remember){
        if(StringUtils.isEmpty(username)||StringUtils.isEmpty(password)||StringUtils.isEmpty(code)){
            System.out.println("输入信息不完整");
            return "0";
        }
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        Subject subject = SecurityUtils.getSubject();
        String value="on";
        if(value.equals(remember)){
            token.setRememberMe(true);
        }else{
            token.setRememberMe(false);
        }

        try {
            subject.login(token);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("登录失败");
            return "0";
        }
        System.out.println("登录成功");
        return "1";
    }

    /**
     * todo: 用户注册
     * @param user
     * @return
     */
    @PostMapping("register")
    @ResponseBody
    public String register(@RequestBody User user){
        if(StringUtils.isEmpty(user.getUsername())||StringUtils.isEmpty(user.getPassword())||StringUtils.isEmpty(user.getEmail())||StringUtils.isEmpty(user.getRepassword())){
            System.out.println("信息不完善");
            return "0";
        }
        if(!user.getPassword().equals(user.getRepassword())){
            System.out.println("密码不相等");
            return "0";
        }
//        System.out.println("user:"+user);
        userService.insertUser(user);
        return "1";
    }

    /**
     * todo: 验证码
     * @param session
     * @param code
     * @return
     */
    @RequestMapping("captchaCheck")
    @ResponseBody
    public int captchaCheck(HttpSession session, String code){
        String captcha = (String) session.getAttribute("captcha");
        System.out.println(captcha+" "+code);
        int data;
        if(code.equalsIgnoreCase(captcha)){
            data=1;
        }else{
            data=0;
        }
        return data;
    }

    /**
     * todo: 跳转注册页面
     * @return
     */
    @GetMapping("register")
    public String registerPage(){
        return "WEB-INF/register";
    }

    /**
     * todo: 检查用户是否可用
     * @param username
     * @return
     */
    @PostMapping("checkUsername")
    @ResponseBody
    public String checkUsername(String username){
        System.out.println("checkUsername:"+username);
        User user = userService.queryUserByUsername(username);
        if(user==null){
            return "0";
        }
        return "1";
    }

    @GetMapping("logout")
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "redirect:index";
    }

    /**
     * todo: 跳转到登陆页面
     * @return
     */
    @GetMapping("login")
    public String loginPage(){
        return "WEB-INF/login";
    }

    /**
     * todo: 跳转到主页面
     * @return
     */
    @GetMapping("index")
    public String indexPage(){
        return "WEB-INF/index";
    }

}
