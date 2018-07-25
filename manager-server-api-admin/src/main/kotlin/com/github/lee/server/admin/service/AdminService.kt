package com.github.lee.server.admin.service

import com.github.lee.core.service.impl.BaseServiceStringImpl
import com.github.lee.dao.mapper.AdminMapper
import com.github.lee.model.Admin
import com.github.lee.model.AdminExample
import org.springframework.util.StringUtils

interface AdminService : BaseServiceStringImpl<Admin, AdminExample, AdminMapper> {

    override fun getExample(): AdminExample =
            AdminExample()


    override fun insert(data: Admin): Boolean {
        if (StringUtils.isEmpty(data.username) || StringUtils.isEmpty(data.password)) {
            return false
        }
        val example = getExample()
        example.createCriteria()
                .andUsernameEqualTo(data.username)
        val admin = queryOne(example)
        if (null != admin) {
            return false
        }
        return getMapper().insert(data) > 0
    }

    override fun deleteById(id: String): Boolean {
        return getMapper().deleteByPrimaryKey(id) > 0
    }

    override fun deleteList(list: List<String>): Boolean {
        val example = getExample()
        example.createCriteria()
                .andIdIn(list)
        return getMapper().deleteByExample(example) > 0
    }

    override fun updateById(id: String, data: Admin): Boolean {
        if (StringUtils.isEmpty(data.username)
                || StringUtils.isEmpty(data.password)) {
            return false
        }
        queryById(id) ?: return false
        data.id = id
        return getMapper().updateByPrimaryKey(data) > 0
    }

    override fun queryById(id: String): Admin? {
        return getMapper().selectByPrimaryKey(id)
    }

    override fun queryList(example: AdminExample?): List<Admin> {
        return getMapper().selectByExample(example)
    }
}