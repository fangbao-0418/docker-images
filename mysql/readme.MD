# 参考地址

dockerhub: https://hub.docker.com/_/mysql?tab=description

github: https://github.com/docker-library/mysql

# 版本

8.0.29-oracle, 8.0-oracle, 8-oracle, oracle
8.0.29, 8.0, 8, latest, 8.0.29-debian, 8.0-debian, 8-debian, debian
5.7.38-oracle, 5.7-oracle, 5-oracle
5.7.38, 5.7, 5, 5.7.38-debian, 5.7-debian, 5-debian

# 启动一个mysql服务实例
```dotnetcli
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```

# docker compose 或 docker stack deploy 
```dotnetcli
# Use root/example as user/password credentials
version: '3.1'

services:

  db:
    image: mysql
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
```

# 自定义配置文件
```dotnetcli
docker run --name some-mysql -v /my/custom:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```

# 存储数据

存储数据的位置
重要提示:有几种方法可以存储运行在Docker容器中的应用程序使用的数据。我们鼓励mysql映像的用户熟悉可用选项，包括:

让Docker使用自己的内部卷管理将数据库文件写入主机系统上的磁盘，从而管理数据库数据的存储。这是默认设置，对用户来说非常简单和透明。缺点是，可能很难找到直接在主机系统(即外部容器)上运行的工具和应用程序的文件。
在主机系统(容器外部)上创建一个数据目录，并将其挂载到容器内部可见的目录。这将数据库文件放置在主机系统的已知位置，使主机系统上的工具和应用程序可以轻松地访问这些文件。缺点是用户需要确保目录存在，例如，目录权限和主机系统上的其他安全机制被正确设置。
Docker文档是理解不同存储选项和变体的一个很好的起点，有很多博客和论坛帖子在这方面进行讨论并给出建议。我们将在这里简单地展示后一种选择的基本过程:

在主机系统上的合适卷上创建一个数据目录，例如/my/own/datadir。

像这样启动你的mysql容器:
```
 docker run --name some-mysql -v /my/own/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```

# 环境变量
- MYSQL_ROOT_PASSWORD
- MYSQL_DATABASE
- MYSQL_USER, MYSQL_PASSWORD
- MYSQL_ALLOW_EMPTY_PASSWORD
- MYSQL_RANDOM_ROOT_PASSWORD
- MYSQL_ONETIME_PASSWORD
- MYSQL_INITDB_SKIP_TZINFO

# Creating database dumps
```dotnetcli
docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql
```

# Restoring data from dump files
```dotnetcli
docker exec -i some-mysql sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql
```

# 进入容器操作
```dotnetcli
mysql -p

create database test;
```