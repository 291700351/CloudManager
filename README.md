# 使用 Gradle + Kotlin + SpringCloud 实现分布式系统

## 项目关系
- ### 本地基础依赖
    - #### manager-commons           基础工具包，Controller、Service基类核心包 
    - #### manager-pojo              项目POJO，使用Mybatis逆向工程自动生成
    - #### manager-dao               Mybatis数据库操作，使用逆向工程代码自动化生成
    - #### manager-server-api        服务提供者的基类声明，在该项目中进行服务提供者的接口进行声明，方便统一管理

- ### 核心服务
    - #### eureka-register-center    端口：7000，注册中心
    - #### manager-zuul              端口：80，服务网关
    - #### manager-server-api-admin  端口：11000，后台Admin服务，继承manager-server-api项目
 
## HOW TO PLAY
```
git clone https://github.com/291700351/CloudManager.git
cd CloudManager
./docker-run
docker-compose up -d
```
When you run ```docker-compose up -d```,It will auto create docker images(mysql,eureka-register-center,manager-zuul,manager-server-api-admin).<br>
Now! You can browse <a href="http:localhost/admin/test?id=1">http:localhost/admin/test?id=1</a> in your browser

## LICENSE
```
MIT License

Copyright (c) 2018 AndroidCoder

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
