package com.reimu.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * ...
 *
 * @author GaoSheng
 * @version 1.0
 * @blame GaoSheng
 * @since 2019/11/16 13:20
 **/
@Data
public class SpecialVO implements Serializable {

    /**
     *
     */
    private String id;

    /**
     *
     */
    private String name;

    /**
     *
     */
    private String description;

    /**
     *
     */
    private String url;

    /**
     *
     */
    private Integer sort;

    private Boolean checked;
}
