#!/usr/bin/env bash

# start postgres
docker compose up -d postgres

sleep 3

# create the database
docker run \
    --rm \
    --network ferret_connector_network \
    postgres:14 \
    psql -h postgres -U user -d ferretdb -c 'CREATE SCHEMA IF NOT EXISTS "acc-ferret_demo"'

# start ferret
docker compose up -d ferretdb

sleep 3

# create collections for the connector
docker run \
    --rm \
    -it \
    --network ferret_connector_network \
    --entrypoint=mongosh mongo:5 mongodb://ferretdb/ \
    --eval 'use("acc-ferret_demo"); createCollection = (name) => { try { db.createCollection(name); console.log("created collection", name) } catch(e) { console.log(e.message) } }; createCollection("AccountInfo"); createCollection("DeviceSecrets"); createCollection("Devices"); createCollection("Relationships"); createCollection("Requests"); createCollection("Secrets"); createCollection("SyncInfo"); createCollection("Templates"); createCollection("meta")'

# start the connector
docker compose up -d
