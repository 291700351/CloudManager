package com.github.lee.zuul

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.zuul.EnableZuulProxy

@SpringBootApplication
@EnableZuulProxy
class ManagerZuulApplication

fun main(args: Array<String>) {
    runApplication<ManagerZuulApplication>(*args)
}
