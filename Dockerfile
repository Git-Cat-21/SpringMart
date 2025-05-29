FROM openjdk:17-jdk as dev

WORKDIR /work 

COPY mvnw /work/mvnw
COPY .mvn /work/.mvn
COPY pom.xml /work/pom.xml

RUN chmod +x ./mvnw
RUN ./mvnw dependency:go-offline

COPY . /work/
RUN ./mvnw install


ENTRYPOINT ["./mvnw", "spring-boot:run"]