FROM websphere-liberty:20.0.0.3-full-java8-ibmjava
#FROM open-liberty:20.0.0.3-full-java8-openj9

COPY ./target/SampleApp.war /config/dropins/

EXPOSE 9080

