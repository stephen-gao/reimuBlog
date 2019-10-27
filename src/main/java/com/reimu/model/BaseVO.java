package com.reimu.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class BaseVO implements Serializable {

    private Integer pageNumber = 1;

    private Integer pageSize = 10;
}
