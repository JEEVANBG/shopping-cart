FROM tomcat:9-jre11-slim
COPY target/shopping-cart-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
EXPOSE 9000
CMD ["catalina.sh", "run"]

