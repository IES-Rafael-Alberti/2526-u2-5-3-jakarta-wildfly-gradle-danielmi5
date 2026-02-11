FROM quay.io/wildfly/wildfly:latest

ARG WILDFLY_USUARIO
ARG WILDFLY_CONTRA

RUN /opt/jboss/wildfly/bin/add-user.sh ${WILDFLY_USUARIO} ${WILDFLY_CONTRA} --silent

COPY build/libs/*.war /opt/jboss/wildfly/standalone/deployments/

EXPOSE 8080 9990

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
