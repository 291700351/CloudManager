FROM java
VOLUME [ "/tmp" ]
ADD app.jar /app.jar
RUN sh -c "touch /app.jar"
EXPOSE 12000
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar > /logs/manager-test/log.log" ]

