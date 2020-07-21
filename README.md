# IndexGADM

# Pre-requisities
- Physical or Virtual machine of Linux distribution.
- Install [Docker](https://github.com/docker).
- Install [docker-compose](https://docs.docker.com/get-started/).
- Available disk space 30GB.



# Docker Compose

![N|Solid](https://github.com/docker/compose/raw/master/logo.png?raw=true)

Compose is a tool for defining and running multi-container Docker applications.
With Compose, you use a Compose file to configure your application's services.
Then, using a single command, you create and start all the services
from your configuration. To learn more about all the features of Compose
see [the list of features](https://github.com/docker/docker.github.io/blob/master/compose/overview.md#features).

Compose is great for development, testing, and staging environments, as well as
CI workflows. You can learn more about each case in
[Common Use Cases](https://github.com/docker/docker.github.io/blob/master/compose/overview.md#common-use-cases).

Using Compose is basically a three-step process.

1. Define your app's environment with a `Dockerfile` so it can be
reproduced anywhere.
2. Define the services that make up your app in `docker-compose.yml` so
they can be run together in an isolated environment.
3. Lastly, run `docker-compose up` and Compose will start and run your entire app.

For more information about the Compose file, see the
[Compose file reference](https://github.com/docker/docker.github.io/blob/master/compose/compose-file/compose-versioning.md).

Compose has commands for managing the whole lifecycle of your application:

 * Start, stop and rebuild services
 * View the status of running services
 * Stream the log output of running services
 * Run a one-off command on a service

Installation and documentation
------------------------------

- Full documentation is available on [Docker's website](https://docs.docker.com/compose/).
- Code repository for Compose is on [GitHub](https://github.com/docker/compose).

# GADM
 [GADM](https://gadm.org/index.html) provides maps and spatial data for all countries and their sub-divisions

# Elasticsearch GADM Indices Info

This Elasticsearch installation comes with pre defined Indices. Theese indices contain the spatial polygon for all countries divided by their sub-divisions.

Having the above spatial data inside elasticsearch give us the ability to execute [geo queries](https://www.elastic.co/guide/en/elasticsearch/reference/current/geo-queries.html).

We have also created an [API](https://gardian.bigdata.cgiar.org/api/#/Geospatial_query/Geospatial) that returns the polygon that falls inside a coordinate point.

# Elasticsearch GADM Indices Installation

To install Elasticsearch GADM Indices follow the next steps:
1. Clone the SCiO [github](https://github.com/SCiO-systems/IndexGADM) repository.
2. Navigate inside the cloned repository.
3. Execute the following command

```sh
$host= {IP address} docker-compose -f {docker-compose.yml path} up
```
 {IP address}: The IP of the VM or physical machine that will host the Elasticsearch. Keep in mind that Elasticsearch indices and all its components are hosted in a single machine.

The source code of Elasticsearh GADM indices is in [Github](https://github.com/SCiO-systems/IndexGADM).

# [docker-compose.yml](https://github.com/SCiO-systems/IndexGADM/blob/master/docker-compose.yml)

    version: '2.2'
        services:
         gadm:
          image: scioquiver/elasticsearch:gadm_countries
          container_name: elastic
          ports:
             - 9200:9200
          environment:
             - ${host}
    



List of Docker Images
------------------------------
| Component | Location |
| ------ | ------ |
| Elasticsearch | [scioquiver/elasticsearch:gadm_countries](https://hub.docker.com/r/scioquiver/elasticsearch) |


