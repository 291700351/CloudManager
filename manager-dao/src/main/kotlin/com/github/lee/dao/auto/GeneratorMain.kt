package com.github.lee.dao.auto

import org.mybatis.generator.api.MyBatisGenerator
import org.mybatis.generator.config.xml.ConfigurationParser
import org.mybatis.generator.internal.DefaultShellCallback
import java.io.File
import java.util.*


/**
 * 项目名称&#09;：&#09;main<br>
 * 作者&#09;：&#09;Ice Lee<br>
 * 邮箱&#09;：&#09;lb291700351@live.cn<br>
 * 时间&#09;：&#09;2017/${MOUTH}/31 22:50<br>
 * 类描述&#09;：&#09;${END}<br>
 */
fun main(args: Array<String>) {
    val helper = MyBatisGenerateHelper()
    helper.delete()
    helper.generate()
}

class MyBatisGenerateHelper {
    fun generate() {
        val classLoader = javaClass.classLoader
        val url = classLoader.getResource("mybatis/generatorConfig.xml")
        if (null == url) {
            println("Can not get resource ")
            return
        }
        val configFile = File(url.file)
        if (!configFile.exists() || !configFile.isFile) {
            println("Can not find $configFile, Please check it......")
            return
        }

        val warnings = ArrayList<String>()
        val overwrite = true
        //指向逆向工程配置文件
        val cp = ConfigurationParser(warnings)
        val config = cp.parseConfiguration(configFile)
        val callback = DefaultShellCallback(overwrite)
        val myBatisGenerator = MyBatisGenerator(config,
                callback, warnings)
        myBatisGenerator.generate(null)
    }

    fun delete() {
        //删除java接口
        val mapperPath = File("./manager-dao/src/main/java/com/github/lee/dao/mapper")
        if (mapperPath.isDirectory) {
            val mapperFiles = mapperPath.listFiles()
            mapperFiles
                    .filter { it.isFile && it.name.contains("Mapper.java") }
                    .forEach { it.delete() }
        }
        //删除xml映射文件
        val mapperXmlPath = File("./manager-dao/src/main/resources/mappers")
        if (mapperXmlPath.isDirectory) {
            val mapperXmlFiles = mapperXmlPath.listFiles()
            mapperXmlFiles
                    .filter { it.isFile && it.name.contains("Mapper.xml") }
                    .forEach { it.delete() }
        }
        //删除po
        val poPath = File("./manager-pojo/src/main/java/com/github/lee/model")
        if (poPath.isDirectory) {
            val poFiles = poPath.listFiles()
            poFiles
                    .filter { it.isFile }
                    .forEach { it.delete() }
        }
        println("Delete finished")
    }
}
