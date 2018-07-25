package com.github.lee.core.service.impl

import com.github.lee.core.service.BaseService
import org.apache.shiro.crypto.hash.Md5Hash
import org.apache.shiro.util.ByteSource
import java.util.*


fun randomUUID(): String =
        UUID.randomUUID()
                .toString()
                .toUpperCase(Locale.CHINESE)

/**生成32位随机大写字符串*/
fun random32UUID(): String =
        randomUUID().replace("-", "")
                .toUpperCase(Locale.CHINESE)

/**将随机字符串转换成max一下的数字*/
fun getStringSum(str: String, max: Int = 0): Int {
    var num = 0
    val bytes = str.toByteArray()
    for (b in bytes) {
        num = num.plus(b)
    }
    if (max > 0) {
        num %= max
    }
    return num
}

/**
 * 业务层String主键的基础实现
 *
 */
interface BaseServiceStringImpl<TYPE, EXAMPLE, MAPPER> : BaseService<String, TYPE, EXAMPLE, MAPPER> {
    //    protected val logger = LoggerFactory.getLogger(this.javaClass)
    /**生成密码*/
    fun generatePassword(username: String, password: String,
                         salt: ByteSource? = null): String {
        val u = Md5Hash(username, salt ?: "", getStringSum(username))
                .toHex()
                .toUpperCase(Locale.CHINESE)
        val p = Md5Hash(password, salt ?: "", getStringSum(password))
                .toHex()
                .toUpperCase(Locale.CHINESE)
        val up = u + p
        return Md5Hash(up, salt ?: "", getStringSum(up))
                .toHex().toUpperCase()
    }

    /**生成密码*/
    fun generatePassword(username: String, password: String,
                         salt: String? = null): String {
        return generatePassword(username, password, ByteSource.Util.bytes(salt))
    }
}
