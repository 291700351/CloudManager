package com.github.lee.managertest

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloController {

    @Autowired
    private lateinit var helloService: HelloService

    @RequestMapping("/test2")
    fun hello(@RequestParam(defaultValue = "") id: String): String {
        val jsonResponse = helloService.test(id)
        //        val res = helloServcie!!.hello(fallback)
        return "调用服务结果为$jsonResponse"
    }
}