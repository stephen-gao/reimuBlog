package com.reimu.enums;

public enum  UserStatusEnums {
    NORMAL(1,"正常"),
    FREEZE(2,"冻结"),
    DELETE(9,"删除");

    private Integer status;
    private String description;

    UserStatusEnums() {
    }

    UserStatusEnums(Integer status, String description) {
        this.status = status;
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
