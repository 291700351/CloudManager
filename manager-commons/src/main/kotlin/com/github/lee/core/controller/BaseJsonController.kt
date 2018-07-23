package com.github.lee.core.controller

import com.github.lee.core.controller.domain.HeadCode
import com.github.lee.core.controller.domain.JsonResponse

/**
 * Json响应相关的Controller基类
 */
open class BaseJsonController : BaseController() {

    /**
     * 生成默认的JsonResponse
     */
    protected fun defaultResponse(code: HeadCode, body: Any = false): JsonResponse {
        val response = JsonResponse()
        response.head.code = code.code
        response.head.msg = code.msg
        response.body = body
        return response
    }

    /**
     * 生成响应成功的Response
     */
    protected fun successResponse(body: Any): JsonResponse {
        return defaultResponse(HeadCode.SUCCESS, body)
    }

    /**
     * 生成系统错误的Response
     */
    protected fun systemErrorResponse(): JsonResponse {
        return defaultResponse(HeadCode.ERROR_SYSTEM, false)
    }

}