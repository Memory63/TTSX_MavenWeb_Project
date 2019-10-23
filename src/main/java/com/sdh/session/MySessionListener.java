package com.sdh.session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListenerAdapter;

/**
 * @ClassName MySessionListener
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 8:32
 * @Version 1.0
 */
public class MySessionListener extends SessionListenerAdapter {
    @Override
    public void onStart(Session session) {
        System.out.println("session:"+session.getId()+"start");
    }

    @Override
    public void onStop(Session session) {
        System.out.println("session:"+session.getId()+"stop");
    }

    @Override
    public void onExpiration(Session session) {
        System.out.println("session:"+session.getId()+"expiration");
    }
}
