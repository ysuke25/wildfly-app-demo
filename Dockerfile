FROM websphere-liberty:20.0.0.3-full-java8-ibmjava

COPY ./target/SampleApp.war /config/dropins/

EXPOSE 9080

