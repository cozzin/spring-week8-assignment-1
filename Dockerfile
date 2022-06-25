FROM openjdk:11 AS builder

COPY . .

RUN ["./gradlew", "build"]

FROM openjdk:11

COPY --from=builder /app/build/libs/app.jar .

CMD ["java", "-jar", "app.jar"]
