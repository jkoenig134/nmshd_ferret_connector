# nmshd_ferret_connector

This little example aims to show how to connect the [Enmeshed Business Connector](https://github.com/nmshd/cns-connector) to a PostgreSQL database using [FerretDB](https://www.ferretdb.io/).

FerretDB is currently in early stages and it is not recommended to run a connector on it for production usage.

## Prerequisites

- docker
- docker compose

## Running the example

- replace `<client-id>` and `<client-secret>` in `config.json`
- run `docker compose up -d`

## Run on an existing PostgreSQL database

- create the `acc-ferret_demo` schema in your database
- remove the `postgres` service from the `docker-compose.yml`
- update the postgresql-url for the ferretdb service in the `docker-compose.yml`
- run `docker compose up -d`

## Accessing the Connector

- [Docs](http://localhost:8080/docs/swagger/) => api key: `xyz`
- Programatically using the baseUrl `http://localhost:8080` and the api key `xyz`
