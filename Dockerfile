FROM openjdk:8
# 时区设置
RUN echo "Asia/shanghai" > /etc/timezone && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 8080

ADD dubbo-admin-server/target/dubbo-admin-server*.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]