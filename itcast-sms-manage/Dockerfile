FROM anapsix/alpine-java:8_server-jre_unlimited

RUN mkdir -p /sms/manage

WORKDIR /sms/manage

EXPOSE 8770

ADD ./target/itcast-sms-manage.jar ./app.jar

ENTRYPOINT ["java","-Xms256m","-Xmx256m", "-jar", "app.jar"]
