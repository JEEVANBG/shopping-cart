FROM openjdk:9
ADD target/shopping-cart-0.0.1-SNAPSHOT.war shopping-cart-0.0.1-SNAPSHOT.war
ENTRYPOINT ["java","shopping-cart-0.0.1-SNAPSHOT.war"]
EXPOSE 8080
