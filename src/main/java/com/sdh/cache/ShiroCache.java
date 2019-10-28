package com.sdh.cache;

import lombok.Getter;
import lombok.Setter;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.Collection;
import java.util.Set;

/**
 * @ClassName MyCache
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/28 20:51
 * @Version 1.0
 */
@Setter
@Getter
public class ShiroCache implements Cache {
    private String name;
    private RedisTemplate<String,Object> template;
    public ShiroCache(){
    }

    //在cachemanager中会调用此方法
    public ShiroCache(String name) {
        this.name = name;
    }

    /**
     * todo: 检查缓存，以用户凭证为key
     * @param o = key=用户凭证 ≈ 用户名
     * @return
     * @throws CacheException
     */
    @Override
    public Object get(Object o) throws CacheException {
        System.out.println("检查缓存"+o.toString());
        Object data = template.opsForValue().get(o.toString());
        if(data==null){
            System.out.println("权限信息，检查缓存但未命中");
            return null;
        }
        System.out.println("权限信息，检查缓存,命中");
        return data;
    }

    /**
     * todo: 将从数据库中查询出的该用户的权限信息，存入缓存
     * @param o 和上面一样
     * @param o2 = 权限信息
     * @return
     * @throws CacheException
     */
    @Override
    public Object put(Object o, Object o2) throws CacheException {
        System.out.println("添加缓存");
        template.opsForValue().set(o.toString(),o2);
        return null;
    }

    /**
     * todo: 何以移除某个用户的权限信息的缓存，用于subject.logout();
     * @param o
     * @return
     * @throws CacheException
     */
    @Override
    public Object remove(Object o) throws CacheException {
        System.out.println(o+"的权限信息缓存被清楚了");
        template.delete(o.toString());
        return null;
    }

    @Override
    public void clear() throws CacheException {

    }

    @Override
    public int size() {
        return 0;
    }

    @Override
    public Set keys() {
        return null;
    }

    @Override
    public Collection values() {
        return null;
    }
}
