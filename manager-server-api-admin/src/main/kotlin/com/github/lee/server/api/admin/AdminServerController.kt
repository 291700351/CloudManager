package com.github.lee.server.api.admin

import com.github.lee.core.controller.BaseJsonController
import com.github.lee.core.controller.domain.JsonResponse
import com.github.lee.dao.mapper.AdminMapper
import com.github.lee.server.api.AdminServerAPI
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.RestController

@RestController
class AdminServerController : BaseJsonController(), AdminServerAPI {

    @Autowired
    private lateinit var adminMapper: AdminMapper

    override fun test(id: String): JsonResponse {
        val admin = adminMapper.selectByPrimaryKey(id)
        return successResponse(admin)
    }
}