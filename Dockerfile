FROM tomcat:7
ADD target/shopping-cart-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
