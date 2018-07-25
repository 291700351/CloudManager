package com.github.lee.managertest

import com.github.lee.core.controller.domain.JsonResponse
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloController {

    @Autowired
    private lateinit var helloService: HelloService

    @RequestMapping("/test2")
    fun hello(@RequestParam(defaultValue = "") id: String): JsonResponse {
        return helloService.test(id)
        //        val res = helloServcie!!.hello(fallback)
        //         "调用服务结果为$jsonResponse"
    }
}