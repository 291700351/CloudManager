package com.github.lee.server.admin.service.impl

import com.github.lee.dao.mapper.AdminMapper
import com.github.lee.server.admin.service.AdminService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class AdminServiceImpl : AdminService {
    @Autowired
    private lateinit var adminMapper: AdminMapper

    override fun getMapper(): AdminMapper {
        return adminMapper
    }

}