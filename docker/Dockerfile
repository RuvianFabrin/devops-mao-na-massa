FROM maven:3.5-jdk-8 as buildstage
RUN mkdir /opt/cliente
WORKDIR /opt/cliente
RUN git clone https://github.com/RuvianFabrin/rest-cliente.git /opt/cliente
RUN mvn clean
RUN mvn package -Dmaven.test.skip=true

FROM openjdk:8-alpine
RUN addgroup -S notes && adduser -S notes -G notes
RUN mkdir /opt/cliente
RUN chown -R notes:notes /opt/cliente
USER notes:notes
WORKDIR /opt/cliente
COPY --from=buildstage /opt/cliente/target/restCliente-0.0.1-SNAPSHOT.jar .
COPY application.properties application.properties
ENTRYPOINT ["java", "-jar", "/opt/cliente/restCliente.jar"]



