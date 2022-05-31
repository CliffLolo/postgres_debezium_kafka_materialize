
# Event stream processing using Postgres + Debezium + Kafka + Materialize + Metabase
## Run Locally

1. Clone the project 

```bash
  git clone https://github.com/CliffLolo/postgres_kafka.git
```

2. Go to the project directory

```bash
  cd postgres_kafka
```

3. Run the docker compose file

```bash
  docker-compose up -d
```
If it is successful, you'll have everything running in their own containers, with Debezium configured to ship changes from Postgres into Kafka.

4. Open a new terminal and run this command to point Debezium to Postgres
```bash
curl -X POST -H “Accept:application/json” -H 'Content-Type:application/json' localhost:8083/connectors --data '
{
  "name": "inventory-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "plugin.name": "pgoutput",
    "database.hostname": "postgres",
    "database.port": "5432",
    "database.user": "postgresuser",
    "database.password": "postgrespw",
    "database.dbname" : "inventory_db",
    "database.server.name": "postgres"		
  }
}
```

5. Log into the debezium container and run this to view the Kafka topics
```bash
  bin/kafka-topics.sh --list --bootstrap-server postgres_kafka_kafka_1:9092
```

6. Launch the Materialize CLI
```bash
  docker-compose run cli
```

7. Now that you're in the Materialize CLI, define all of the tables in postgres.inventory_db as Kafka sources:
```bash
CREATE SOURCE sales
FROM KAFKA BROKER 'kafka:9092' TOPIC 'postgres.public.sales_sale'
FORMAT AVRO USING CONFLUENT SCHEMA REGISTRY 'http://schema-registry:8081'
ENVELOPE DEBEZIUM;

CREATE SOURCE sale_items
FROM KAFKA BROKER 'kafka:9092' TOPIC 'postgres.public.sales_saleitem'
FORMAT AVRO USING CONFLUENT SCHEMA REGISTRY 'http://schema-registry:8081'
ENVELOPE DEBEZIUM;
```
Note that materialize knows the column types to use for each attribute because the sources we created above are pulling message schema data from the registry.<br>


8. Run ```SHOW SOURCES;``` in the CLI to see all the sources created

9. Create a materialized view summarizing cost_price by product_alias_id
```bash
CREATE MATERIALIZED VIEW cost_price AS
SELECT sale_items.product_alias_id AS product_alias_id,
                        SUM(sale_items.unit_cost*sale_items.quantity) AS total_selling_price,
                        MAX(sale_items.unit_cost) as unit_selling_price,
                        SUM(sale_items.quantity) AS quantity_sold
FROM sale_items
JOIN sales ON sales.id=sale_items.sale_id
GROUP BY product_alias_id;
```

10. Now, if you select from this materialized view, you can see the results in real-time:
```bash
  SELECT * FROM cost_price ORDER;
```

11. Run ```SHOW VIEWS;``` in the CLI to see all the views created<br>


13. We now have a materialized view we can visualize in a BI tool like Metabase. Close out of the Materialize CLI (Ctrl + D).

## Business Intelligence: Metabase
1. In a browser, go to <localhost:3030>

2. Click **Let's get started**.

3. Complete the first set of fields.
4. On the **Add your data** page, fill in the following information:

   | Field             | Enter...         |
   |------------------| ---------------- |
   | Database type         | **Postgres**     |
   | Name              | **inventory**    |
   | Host              | **materialized** |
   | Port              | **6875**         |
   | Database name     | **materialize**  |
   | Database username | **materialize**  |
   | Database password | Leave empty      |

5. Proceed past the screens until you reach your primary dashboard.

6. Click **Ask a question**

7. Click **Native query**.

8. From **Select a database**, select **inventory**.

9. In the query editor, enter:

   ```sql
   SELECT * FROM item_summary;
   ```

10. You can save the output and add it to a dashboard, once you've drafted a dashboard you can manually set the refresh rate to 1 second by adding `#refresh=1` to the end of the URL.
