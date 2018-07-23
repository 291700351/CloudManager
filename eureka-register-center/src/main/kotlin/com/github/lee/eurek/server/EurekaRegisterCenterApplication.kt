package com.github.lee.eurek.server

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer

@SpringBootApplication
@EnableEurekaServer
class EurekaRegisterCenterApplication


fun main(args: Array<String>) {
    SpringApplication.run(EurekaRegisterCenterApplication::class.java, *args)
}

