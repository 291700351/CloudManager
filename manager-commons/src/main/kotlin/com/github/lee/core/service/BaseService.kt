package com.github.lee.core.service

import com.github.lee.core.service.exception.DeleteException
import com.github.lee.core.service.exception.InsertException
import com.github.lee.core.service.exception.QueryException
import com.github.lee.core.service.exception.UpdateException
import com.github.pagehelper.PageHelper
import com.github.pagehelper.PageInfo


/**
 * 业务层基类接口
 * @param ID 数据库主键数据类型
 * @param TYPE 对应操作的POJO对象类型
 * @param EXAMPLE 数据库条件操作的Example对象
 * @param MAPPER Mybatis数据库操作的Mapper对象
 */
interface BaseService<ID, TYPE, EXAMPLE, MAPPER> {

    fun getExample(): EXAMPLE
    fun getMapper(): MAPPER

    //===Desc:Insert=================================================================
    @Throws(InsertException::class)
    fun insert(data: TYPE): Boolean

    @Throws(InsertException::class)
    fun insert(list: List<TYPE>): Boolean {
        for (item in list) {
            if (!insert(item)) {
                throw RuntimeException()
            }
        }
        return true
    }

    //===Desc:Delete=================================================================
    @Throws(DeleteException::class)
    fun deleteById(id: ID): Boolean

    @Throws(DeleteException::class)
    fun deleteList(list: List<ID>): Boolean

    //===Desc:Update=================================================================
    @Throws(UpdateException::class)
    fun updateById(id: ID, data: TYPE): Boolean

    //===Desc:Query=================================================================
    @Throws(QueryException::class)
    fun queryById(id: ID): TYPE?

    @Throws(QueryException::class)
    fun queryList(example: EXAMPLE? = null): List<TYPE>

    @Throws(QueryException::class)
    fun queryOne(example: EXAMPLE? = null): TYPE? {
        val list = queryList(example)
        return if (list.isEmpty()) {
            null
        } else {
            list[0]
        }
    }

    @Throws(QueryException::class)
    fun queryByPage(page: Int, size: Int, example: EXAMPLE? = null): PageInfo<TYPE> {
        PageHelper.startPage<TYPE>(page, size)
        val list = queryList(example)
        return PageInfo(list)
    }
}