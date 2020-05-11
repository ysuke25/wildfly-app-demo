FROM jboss/wildfly
ADD target/SampleApp.war /opt/jboss/wildfly/standalone/deployments/
