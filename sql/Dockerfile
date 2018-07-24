FROM mysql
RUN sh -c "touch /manager.sql"
ENV MYSQL_ROOT_PASSWORD=524299
#ENV TZ "Asia/Shanghai"
ADD manager.sql /docker-entrypoint-initdb.d/
EXPOSE 3306
#ENTRYPOINT [ "sh", "-c", "mysql -u root -p 524299 < /manager.sql" ]

#
#ENV MYSQL_ROOT_PASSWORD=test@2017
#ADD binlog.cnf /etc/mysql/conf.d
#ADD init.sql /docker-entrypoint-initdb.d/