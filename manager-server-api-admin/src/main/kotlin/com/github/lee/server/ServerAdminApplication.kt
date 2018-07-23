package com.github.lee.server

import com.github.lee.core.Constants
import org.mybatis.spring.annotation.MapperScan
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.EnableEurekaClient

@SpringBootApplication(scanBasePackages = [Constants.SCAN_BASE_PACKAGES])
@EnableEurekaClient
@MapperScan(basePackages = [Constants.SCAN_BASE_MAPPER])
class ServerAdminApplication

fun main(args: Array<String>) {
    runApplication<ServerAdminApplication>(*args)
}
