FROM openjdk:21


# Install Maven
RUN apt-get update && \
    apt-get install -y maven

WORKDIR /app

# Copy the Maven project files
COPY pom.xml .

# Copy the source code
COPY src src

# Build the Maven project
RUN mvn clean package

# Copy the built JAR file
COPY target/employeemanager-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
