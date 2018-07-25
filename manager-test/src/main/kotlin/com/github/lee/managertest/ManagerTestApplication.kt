package com.github.lee.managertest

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.EnableEurekaClient
import org.springframework.cloud.openfeign.EnableFeignClients

@EnableEurekaClient
@EnableFeignClients
@SpringBootApplication
class ManagerTestApplication

fun main(args: Array<String>) {
    runApplication<ManagerTestApplication>(*args)
}
