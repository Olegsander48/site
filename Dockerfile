# Этап 1 - сборка проекта в jar
FROM maven:3.9-amazoncorretto-21-debian AS maven
WORKDIR /site
COPY . /site
RUN mvn install

# Этап 2 - указание как запустить проект
FROM amazoncorretto:21
WORKDIR /site
COPY --from=maven /site/target/site.jar site.jar
CMD ["java", "-jar", "site.jar"]