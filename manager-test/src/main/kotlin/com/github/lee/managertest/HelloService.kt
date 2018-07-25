package com.github.lee.managertest

import com.github.lee.core.controller.domain.JsonResponse
import org.springframework.cloud.openfeign.FeignClient
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam


@FeignClient("manager-zuul")
interface HelloService {
    @RequestMapping("/admin/test")
    fun test(@RequestParam id: String): JsonResponse

}