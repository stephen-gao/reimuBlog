package com.reimu.cache;

import lombok.Data;

/**
 * ...
 *
 * @author GaoSheng
 * @version 1.0
 * @blame GaoSheng
 * @since 2019/12/26 15:43
 **/
@Data
public class CacheEntity {

    /**
     * 过期时间
     */
    private Long expireTime;

    private Long cacheTime;

    private Object data;

    private String key;

}
