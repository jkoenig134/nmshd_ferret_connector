# nmshd_ferret_connector

This little example aims to show how to connect the [Enmeshed Business Connector](https://github.com/nmshd/cns-connector) to a PostgreSQL database using [FerretDB](https://www.ferretdb.io/).

FerretDB is currently in early stages and it is not recommended to run a connector on it for production usage.

> :warning: At the moment FerretDB doesn't create a collection simply by calling it like documented in [this issue](https://github.com/FerretDB/FerretDB/issues/651). Therefore the `start.sh` script generates all collections that are needed by the current connector version. This could break for future connector releases.

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
  - create the collections the connector is using
  - start the connector

## Run on an existing PostgreSQL database

- create the `acc-ferret_demo` schema in your database
- remove the `postgres` service from the `docker-compose.yml`
- update the postgresql-url for the ferretdb service in the `docker-compose.yml`
- **when using ferretdb <0.3.1** create the schemas `AccountInfo`, `DeviceSecrets`, `Devices`, `Relationships`, `Requests`, `Secrets`, `SyncInfo`, `Templates` and `meta` using mongosh
