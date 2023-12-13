FROM tomcat:9.0-jdk11-openjdk
WORKDIR /usr/local/tomcat/webapps
RUN rm -rf ROOT
COPY target/shopping-cart-0.0.1-SNAPSHOT.war .
EXPOSE 8080
CMD ["catalina.sh", "run"]
