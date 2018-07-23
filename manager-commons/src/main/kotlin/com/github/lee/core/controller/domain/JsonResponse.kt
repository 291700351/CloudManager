package com.github.lee.core.controller.domain

class Head {
    var code = ""
    var msg = ""
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as Head

        if (code != other.code) return false
        if (msg != other.msg) return false

        return true
    }

    override fun hashCode(): Int {
        var result = code.hashCode()
        result = 31 * result + msg.hashCode()
        return result
    }

    override fun toString(): String {
        return "Head(code='$code', msg='$msg')"
    }

}


class JsonResponse {

    var head = Head()
    var body: Any = false

    fun setHead(code: HeadCode) {
        this.head.code = code.code
        this.head.msg = code.msg
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as JsonResponse

        if (head != other.head) return false
        if (body != other.body) return false

        return true
    }

    override fun hashCode(): Int {
        var result = head.hashCode()
        result = 31 * result + body.hashCode()
        return result
    }

    override fun toString(): String {
        return "JsonResponse(head=$head, body=$body)"
    }


}