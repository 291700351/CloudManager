package com.github.lee.core.controller.domain

enum class HeadCode(var code: String = "0000", var msg: String = "") {

    SUCCESS("0000", ""),
    ERROR_SYSTEM("5000", "系统错误，请稍后再试"),

    ERROR_REQUEST_PARAM_NULL("1000", "缺少必要请求参数"),
    ERROR_REQUEST_PARAM_ERROR("1001", "请求参数错误"),




}