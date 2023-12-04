FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/shopping-cart-0.0.1-SNAPSHOT.war /app/
EXPOSE 8080
CMD ["java", "-war", "shopping-cart-0.0.1-SNAPSHOT.war"]
