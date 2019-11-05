package com.reimu.model.page;

import lombok.Data;

import java.io.Serializable;

@Data
public class BasePage implements Serializable {

    private Integer pageNumber = 1;

    private Integer pageSize = 10;
}
