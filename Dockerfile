FROM openjdk:8
# 时区设置
RUN echo "Asia/shanghai" > /etc/timezone && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 8080

# set default language environment
RUN locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

ADD dubbo-admin-server/target/dubbo-admin-server*.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]