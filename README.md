# SpringMVC的学习例子，spring，hibernate，mysql

- 本项目是一个简易版的二手交易市场。
- 本项目只是一个简单的例子，包含了一个有4张表的数据库；
- 4张表分别为：user（用户表），goodsinfo（商品详细信息表），message（消息表），comment（商品评论表）

### 部署教程如下：

- 1、进入dos
- 2、进入mysql根目录输入“mysql -u root -p”其中root为你的mysql数据库用户名，然后输入密码：
![](https://raw.githubusercontent.com/Tticc/fleaMarket-SpringMVC/master/images/001.PNG)
- 3、创建数据库：CREATE DATABASE des DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci des为数据库名，可以自己修改为其他名称。
- 4、将项目导入MyEclipse
- 5、打开项目->打开jdbc.properties
![](https://raw.githubusercontent.com/Tticc/fleaMarket-SpringMVC /master/images/002.PNG)
- 6、jdbc.properties内容如下：根据你的mysql数据库修改jdbc.username，jdbc.password。若你在第3步创建数据库时使用了自己命名的数据库，则修改jdbc.databaseurl中的 “proj”为你的数据库名，且端口号默认为3306。
![](https://raw.githubusercontent.com/Tticc/fleaMarket-SpringMVC/master/images/003.PNG)
- 7、部署到tomcat，输入http://localhost:8080/DES访问
- 8、点击右上角 清理闲置/出售中/消息 中的任意一个进行登录，有三个初始账号：cv、中文、cvs 密码都是：admin
![](https://raw.githubusercontent.com/Tticc/fleaMarket-SpringMVC/master/images/004.PNG)



