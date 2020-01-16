FROM amazoncorretto:8u242

RUN mkdir -p /migration

WORKDIR /migration

# Install wget
RUN yum install -y wget \
    && yum clean all

RUN wget https://github.com/hhandoko/cassandra-migration/releases/download/cassandra-migration-0.17/cassandra-migration-0.17-jar-with-dependencies.jar \
    -O cassandra-migration.jar

ENTRYPOINT ["java", "-jar", "cassandra-migration.jar"]

