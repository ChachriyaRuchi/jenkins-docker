FROM openjdk:17
WORKDIR /AppSpring
COPY ./target/JenkinsDocker.jar /AppSpring
EXPOSE 8585
CMD ["java","-jar","JenkinsDocker"]
