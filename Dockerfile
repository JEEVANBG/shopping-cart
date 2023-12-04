FROM tomcat:9-jre11-slim
WORKDIR /app
COPY target/shopping-cart-0.0.1-SNAPSHOT.war /app/
EXPOSE 8080
CMD ["catalina.sh", "run"]
