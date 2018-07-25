package com.github.lee.server.admin.api

import com.github.lee.core.controller.BaseJsonController
import com.github.lee.core.controller.domain.HeadCode
import com.github.lee.core.controller.domain.JsonResponse
import com.github.lee.server.admin.service.AdminService
import com.github.lee.server.api.AdminServerAPI
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.util.StringUtils
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class AdminServerController : BaseJsonController(), AdminServerAPI {

    @Autowired
    private lateinit var adminService: AdminService

    override fun test(@RequestParam(defaultValue = "") id: String): JsonResponse {
        if (StringUtils.isEmpty(id)) {
            return defaultResponse(HeadCode.ERROR_REQUEST_PARAM_NULL, false)
        }
        val admin = adminService.queryById(id) ?: return defaultResponse(HeadCode.ERROR_REQUEST_PARAM_ERROR, false)

        return successResponse(admin)
    }
}