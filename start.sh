#!/usr/bin/env bash

# start postgres
docker compose up -d postgres

sleep 3

# create the schema
docker run \
    --rm \
    --network ferret_connector_network \
    postgres:14 \
    psql -h postgres -U user -d ferretdb -c 'CREATE SCHEMA IF NOT EXISTS "acc-ferret_demo"'

# start ferret
docker compose up -d ferretdb

sleep 3

# start the connector
docker compose up -d
