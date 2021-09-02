# 1 集信达

## 1.1 环境安装：

`本次环境安装使用docker方式部署`

### 1.1.1 安装nacos

```shell
# 安装nacos
docker run --env MODE=standalone --name nacos -d -p 8848:8848 nacos/nacos-server
# 查看日志
docker logs -f nacos
```

测试 地址：http://localhost:8848/nacos    用户名：nacos   密码：nacos

<img src="install.assets/image-20210830152232691.png" alt="image-20210830152232691"  />

### 1.1.2 安装mysql

```shell
# 安装mysql
docker run --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d -i -p 3306:3306 mysql:latest
# 查看日志
docker logs -f mysql
```

测试（使用navcat）  Host：localhost    Port：3306    User Name：root    Password：123456

<img src="install.assets/image-20210830152548433.png" alt="image-20210830152548433" style="zoom:50%;" />

录入信息后 点击【Test Connection】按钮，弹出‘Successful’ 字样表示成功

<img src="install.assets/image-20210830152631400.png" alt="image-20210830152631400" style="zoom:50%;" />

### 1.1.3 安装redis (哨兵)

第一步：执行redis启动命令

```shell
# 切换目录到 doc/dockerfile/redis
docker-compose -f docker-compose.yml up -d
```

<img src="install.assets/image-20210902142530021.png" alt="image-20210902142530021" style="zoom:50%;" />

第二步：执行sentinel启动命令

```shell
# 切换目录到 doc/dockerfile/sentinel
docker-compose -f docker-compose.yml up -d
```

<img src="install.assets/image-20210902142549176.png" alt="image-20210902142549176" style="zoom:50%;" />



第三步：分别测试三台redis服务是否正常（使用Redis Desktop Manager）

Address：127.0.0.1 ：16380         Auth: 123456

Address：127.0.0.1 ：16381         Auth: 123456

Address：127.0.0.1 ：16382         Auth: 123456

录入信息后 点击【Test Connection】按钮，弹出‘Successful’ 字样表示成功

<img src="install.assets/image-20210902142831226.png" alt="image-20210902142831226" style="zoom:50%;" />

<img src="install.assets/image-20210902142902845.png" alt="image-20210902142902845" style="zoom: 50%;" />

## 1.2 数据导入

### 1.2.1 nacos配置导入

#### 1.2.1.1 创建命名空间

![image-20210830154104472](install.assets/image-20210830154104472.png)

录入 信息，如下图：

- 命名空间名：itcast-sms
- 描述：集信达

<img src="install.assets/image-20210902143930535.png" alt="image-20210902143930535" style="zoom:67%;" />

#### 1.2.1.2 导入配置

![image-20210902145838290](install.assets/image-20210902145838290.png)

选择文件  项目根目录：docs/naocs/nacos_config_export_.zip

![image-20210902145941234](install.assets/image-20210902145941234.png)

![image-20210902150006859](install.assets/image-20210902150006859.png)


### 1.2.2 mysql数据导入

#### 1.2.2.1 创建数据库

<img src="install.assets/image-20210830155103917.png" alt="image-20210902151019481" style="zoom: 67%;" />

 

<img src="install.assets/image-20210902151019481.png" alt="image-20210902151019481" style="zoom:67%;" />

#### 1.2.2.2 导入数据库脚本

<img src="install.assets/image-20210902151303454.png" alt="image-20210902151303454" style="zoom:67%;" />

选择文件 项目根目录：docs/mysql/itcast_sms.sql

<img src="install.assets/image-20210902151643661.png" alt="image-20210902151643661" style="zoom:50%;" />

<img src="install.assets/image-20210902151708372.png" alt="image-20210902151708372" style="zoom:50%;" />

## 1.3 项目启动

### 1.3.1 修改根pom文件

修改pom中的namespace

![image-20210902152926170](install.assets/image-20210902152926170.png)

namespace 为1.2.1.1 章节中创建 

![image-20210902153026689](install.assets/image-20210902153026689.png)

### 1.3.2 编译工程

```shell
mvn clean install -DskipTests
```

<img src="install.assets/image-20210902153206225.png" alt="image-20210902153206225" style="zoom:50%;" />

### 1.3.3 启动服务

分别启动SmsApiApplication、SmsManagerApplication、SmsServerApplication

<img src="install.assets/image-20210902153425112.png" alt="image-20210902153425112" style="zoom:50%;" />



启动成功 查看SmsServerApplication日志、点击Swagger文档 选择一个接口测试服务是否正常返回

![image-20210902153610267](install.assets/image-20210902153610267.png)

![image-20210902153833075](install.assets/image-20210902153833075.png)

