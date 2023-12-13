FROM tomcat:9-jre11-slim
WORKDIR /app
COPY target/shopping-cart-0.0.1-SNAPSHOT.war /app/
EXPOSE 9000
CMD ["catalina.sh", "run"]

