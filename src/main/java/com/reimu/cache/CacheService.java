package com.reimu.cache;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * ...
 *
 * @author GaoSheng
 * @version 1.0
 * @blame GaoSheng
 * @since 2019/12/26 15:31
 **/
@Component
public class CacheService {

    private static Map<String,CacheEntity> cache = new HashMap<>();

    public static Long oneSec = 1000L;

    public static Long oneMin = 60 * oneSec;

    public static Long halfHour = 30 * oneMin;

    public Object get(String key){
        CacheEntity entity = cache.get(key);
        if(entity != null){
            Long expireTime = entity.getExpireTime();
            Long cacheTime = entity.getCacheTime();
            long now = System.currentTimeMillis();
            if(now - cacheTime < expireTime){
                return entity.getData();
            }
        }
        return null;
    }

    public void put(String key, Object data, Long expireTime){
        CacheEntity entity = new CacheEntity();
        entity.setCacheTime(System.currentTimeMillis());
        entity.setExpireTime(expireTime);
        entity.setData(data);
        entity.setKey(key);
        cache.put(key,entity);
    }

    public void remove(String key){
        cache.remove(key);
    }
}
