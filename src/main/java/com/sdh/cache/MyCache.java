package com.sdh.cache;

import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.ContextLoader;

import java.util.Set;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * @ClassName MyCahce
 * @Description 再mybatis完成查询后，将数据缓存起来；当查询数据是先检查缓存
 * @Author SDH
 * @CreateDate 2019/10/15 20:21
 * @Version 1.0
 */
public class MyCache implements Cache {

    /**
     * 当前Mapper的 namespace
     */
    private String id;
    private ReadWriteLock lock= new ReentrantReadWriteLock();
    private RedisTemplate<String, Object> template;
    public MyCache() {
    }

    /**
     *
     * @param id 是mybatis创建此缓存组件的实例时，会传入的
     */
    public MyCache(String id) {
        System.out.println("create cache instance id:"+id);
        this.id = id;
    }

    @Override
    public String getId() {
        return this.id;
    }

    /**
     * todo: 查询执行后，将结果缓存起来
     * @param key  此次查询的标识，其中包含SQL语句（string）
     * @param value  此次查询的结果数据,User List<User>
     */
    @Override
    public void putObject(Object key, Object value) {
        System.out.println("缓存数据:\n\rkey:"+key+"\n\rvalue:"+value);
        //将查询结果，存入Redis，缓存起来备用
        template.opsForValue().set(key.toString(),value);
    }

    /**
     * 从缓存中获取数据，如果没有数据调用上面put方法存入数据，反之不会调用上面的方法存数据
     * @param key
     * @return
     */
    @Override
    public Object getObject(Object key) {
        template = (RedisTemplate<String, Object>) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        System.out.println("检查缓存，key"+key.getClass());
        Object cache = template.opsForValue().get(key.toString());
        if(cache!=null){
            System.out.println("缓存中，有数据存在");
            return cache;
        }
        System.out.println("检查缓存,但未命中");
        return null;
    }

    /**
     * 删除某一个数据
     * @param key
     * @return
     */
    @Override
    public Object removeObject(Object key) {
        template = (RedisTemplate<String, Object>) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        template.delete(key.toString());
        return null;
    }

    /**
     * 当一个mapper中，触发了任意一个写操作，该mapper下的数据都会删除
     * 为什么要在写操作的时候删除其他数据呢？
     * 答：当向数据库中添加新的数据时，需要清除缓存，重新获取新的数据。
     */
    @Override
    public void clear() {
        System.out.println("清除当前mapper下所有的缓存数据");
        template = (RedisTemplate<String, Object>) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        //获取当前mapper下所有的缓存数据
        Set<String> keys = template.keys("*" + this.getId() + "*");
        //删除这些key
        template.delete(keys);
    }

    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return this.lock;
    }
}
