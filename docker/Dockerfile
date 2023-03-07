FROM openjdk:8-alpine
RUN addgroup -S notes && adduser -S notes -G notes
ENV MAVEN_VERSION 3.9.0
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH
RUN wget https://repo1.maven.org/maven2/org/apache/maven/apache-maven/$MAVEN_VERSION/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    mv apache-maven-$MAVEN_VERSION /usr/lib/mvn
RUN apk --update add git
RUN mkdir /opt/cliente
RUN chown -R notes:notes /opt/cliente
USER notes:notes
WORKDIR /opt/cliente
RUN git clone https://github.com/RuvianFabrin/rest-cliente.git /opt/cliente
RUN mvn clean
RUN mvn package -Dmaven.test.skip=true
ARG JAR_FILE=*.jar
RUN cp ./target/restCliente-0.0.1-SNAPSHOT.jar /opt/cliente/restCliente.jar
COPY application.properties application.properties
ENTRYPOINT ["java", "-jar", "/opt/cliente/restCliente.jar"]