FROM maven:3.9-amazoncorretto-21-debian

RUN mkdir site

WORKDIR site

COPY . .

RUN mvn clean package -DskipTests

CMD ["java", "-jar", "target/site.jar"]