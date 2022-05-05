
# Streaming data from postgres into kafka using debezium
## Run Locally

Clone the project

```bash
  git clone https://github.com/CliffLolo/postgres_kafka.git
```

Go to the project directory

```bash
  cd postgres_kafka
```

Run the docker compose file

```bash
  docker-compose up -d
```

Open a new terminal and run this command
```bash
curl -X POST -H “Accept:application/json” -H 'Content-Type:application/json' localhost:8083/connectors --data '
{
  "name": "shipments-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "plugin.name": "pgoutput",
    "database.hostname": "postgres",
    "database.port": "5432",
    "database.user": "postgresuser",
    "database.password": "postgrespw",
    "database.dbname" : "shipment_db",
    "database.server.name": "postgres",
    "table.include.list": "public.shipments"

  }
}'
```

Log in to the Postgres container and execute the following query against the shipment_db

```bash
  update shipments set status='COMPLETED' where order_id = 12500;
```

To see the changes in action, run this command in a new terminal

```bash
docker run --tty \
--network postgres-docker_default \
confluentinc/cp-kafkacat \
kafkacat -b kafka:9092 -C \
-s key=s -s value=avro \
-r http://schema-registry:8081 \
-t postgres.public.shipments
```
