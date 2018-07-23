package com.github.lee.server.api

import com.github.lee.core.controller.domain.JsonResponse
import org.springframework.web.bind.annotation.RequestMapping

@RequestMapping(AdminServerAPI.MAPPING_ROOT)
interface AdminServerAPI {
    companion object {
        const val MAPPING_ROOT = "/admin"
        private const val MAPPING_TEST = "/test"
    }

    @RequestMapping(MAPPING_TEST)
    fun test(id: String): JsonResponse
}