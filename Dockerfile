#FROM tomcat:9-jre11-slim
#WORKDIR /app
#COPY target/shopping-cart-0.0.1-SNAPSHOT.war /app/
#EXPOSE 8090
#CMD ["catalina.sh", "run"]



# Use a base image with Java JDK 8+
FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY target/shopping-cart-0.0.1-SNAPSHOT.war /app/
# Set environment variables
ENV MAVEN_VERSION 3.6.3
ENV ECLIPSE_VERSION 2020-12
ENV TOMCAT_VERSION 8.5.70
# Install necessary tools
RUN apk --no-cache add wget tar bash
# Install Maven
RUN wget http://www-us.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O /tmp/maven.tar.gz \
    && tar -xzf /tmp/maven.tar.gz -C /opt/ \
    && ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven \
    && rm /tmp/maven.tar.gz
# Install Eclipse
RUN wget http://eclipse.mirror.rafal.ca/technology/epp/downloads/release/$ECLIPSE_VERSION/R/eclipse-jee-$ECLIPSE_VERSION-R-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz \
    && tar -xzf /tmp/eclipse.tar.gz -C /opt/ \
    && rm /tmp/eclipse.tar.gz
# Install Tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -O /tmp/tomcat.tar.gz \
    && tar -xzf /tmp/tomcat.tar.gz -C /opt/ \
    && ln -s /opt/apache-tomcat-$TOMCAT_VERSION /opt/tomcat \
    && rm /tmp/tomcat.tar.gz
# Set environment variables for Eclipse and Maven
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV ECLIPSE_HOME=/opt/eclipse
# Add Maven and Eclipse binaries to the system PATH
ENV PATH=${M2_HOME}/bin:${ECLIPSE_HOME}:${PATH}
# Expose Tomcat port
EXPOSE 8070
CMD ["catalina.sh", "run"]  # Uncomment this line if you want to start Tomcat automatically

