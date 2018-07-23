package com.github.lee.cloudmanager

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class CloudManagerApplication

fun main(args: Array<String>) {
    runApplication<CloudManagerApplication>(*args)
}
