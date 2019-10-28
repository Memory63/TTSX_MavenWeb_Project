package com.sdh.cache;

import lombok.Setter;
import org.apache.shiro.cache.AbstractCacheManager;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.data.redis.core.RedisTemplate;

/**
 * @ClassName MySchiroCacheManager
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/20 21:45
 * @Version 1.0
 */
@Setter
public class MySchiroCacheManager extends AbstractCacheManager {

    private RedisTemplate<String, Object> template;
    /**
     * 当shiro中需要缓存数据（身份数据，权限数据，都会需要一个CacheManageru)
     * CacheManager,核心工作之一：创建一个缓存对象
     * @param s 权限信息的标识字符串
     * @return
     * @throws CacheException
     */
    @Override
    protected Cache createCache(String s) throws CacheException {
        System.out.println("标识:"+s);
        ShiroCache cache = new ShiroCache(s);
        cache.setTemplate(template);
        return cache;
    }
}
