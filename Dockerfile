FROM jboss/wildfly
#ADD target/SampleApp.war /opt/jboss/wildfly/standalone/deployments/
ADD node-info/node-info.war /opt/jboss/wildfly/standalone/deployments/
