package com.sdh.realm;

import com.sdh.pojo.User;
import com.sdh.service.UserService;
import lombok.Getter;
import lombok.Setter;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.util.ByteSource;

/**
 * @ClassName MyRealm
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/21 20:09
 * @Version 1.0
 */
@Setter
@Getter
public class MyRealm extends AuthenticatingRealm{

    private UserService userService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        User user = userService.queryUserByUsername(username);
        if(user==null){
            return null;
        }
        System.out.println("用户登录成功"+user);
        return new SimpleAuthenticationInfo(
                user.getUsername(),
                user.getPassword(),
                ByteSource.Util.bytes(user.getSalt()),
                this.getName());
    }
}
