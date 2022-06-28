# nmshd_ferret_connector

This little example aims to show how to connect the [Enmeshed Business Connector](https://github.com/nmshd/cns-connector) to a PostgreSQL database using [FerretDB](https://www.ferretdb.io/).

FerretDB is currently in early stages and it is not recommended to run a connector on it for production usage.

> :warning: This example is written for `FerretDB >=0.4.0` where [this issue](https://github.com/FerretDB/FerretDB/issues/651) was resolved. Make sure you have the newest image pulled.

## Prerequisites

- linux
- docker + docker compose

## Running the example

- replace `<client-id>`, `<client-secret>` and `<api-key>` in `config.json`

- run `./start.sh` in the root directory of the repository

  The script will

  - start the PostgreSQL database
  - create the schema `acc-ferret_demo`
  - start the FerretDB
  - start the connector

## Run on an existing PostgreSQL database

- create the `acc-ferret_demo` schema in your database
- remove the `postgres` service from the `docker-compose.yml`
- update the postgresql-url for the ferretdb service in the `docker-compose.yml`
