package com.github.lee.core.service.exception

import org.springframework.util.StringUtils

class InsertException(tableName: String? = "")
    : RuntimeException(if (StringUtils.isEmpty(tableName)) "Insert data fail!" else "Insert data to $tableName fail!\"")

class DeleteException(tableName: String? = "")
    : RuntimeException(if (StringUtils.isEmpty(tableName)) "Delete data fail!" else "Delete data from $tableName fail!\"")

class UpdateException(tableName: String? = "")
    : RuntimeException(if (StringUtils.isEmpty(tableName)) "Update data fail!" else "Update data from $tableName fail!\"")

class QueryException(tableName: String? = "")
    : RuntimeException(if (StringUtils.isEmpty(tableName)) "Query data fail!" else "Query data from $tableName fail!\"")
