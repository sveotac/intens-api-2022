FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY . .

COPY .mvn .mvn
COPY pom.xml .

RUN apk add --no-cache maven
RUN mvn clean install -e
RUN apk add --no-cache curl

ENV PORT=8080

EXPOSE 8080

CMD ["java", "-jar", "target/praksa2022-0.0.1-SNAPSHOT.jar"]
