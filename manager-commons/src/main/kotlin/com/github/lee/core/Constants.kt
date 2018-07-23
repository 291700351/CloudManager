package com.github.lee.core

class Constants {
    companion object {
        /**SpringBoot启动类上添加包扫描*/
        const val SCAN_BASE_PACKAGES = "com.github.lee"
        /**数据库操作的Mapper扫描地*/
        const val SCAN_BASE_MAPPER ="com.github.lee.dao.mapper"
    }
}