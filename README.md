[![GADM:v3.6](https://img.shields.io/badge/GADM-v3.6-green)](https://gadm.org/data.html)
[![CGIAR:BigDataPlatform](https://img.shields.io/badge/CGIAR-BigDataPlatform-orange)](https://bigdata.cgiar.org/)
[![CGIAR:GARDIAN](https://img.shields.io/badge/CGIAR-GARDIAN-orange)](https://gardian.bigdata.cgiar.org/)
[![maintainer:SCiO](https://img.shields.io/badge/maintainer-SCiO-blue)](https://scio.systems)

# IndexGADM
This project provides a dockerized version of an Elasticsearch instance that contains a pre-defined index that includes documents with spatial polygons of administrative areas for countries accross the world. [GADM](https://gadm.org/index.html), a project that provides maps and spatial data for all countries and their sub-divisions, is the source & provider of the geospatial information. The use of Elasticsearch enables easier access to the provided geospatial information and also allows the building of complex spatial queries.

The index is also available for simple queries through [GARDIAN's API](https://gardian.bigdata.cgiar.org/api/#/Geospatial_query/Geospatial)

The IndexGADM has been created in the context of  [CGIAR's Big Data Platform](https://bigdata.cgiar.org/) and is part of the 
 [GARDIAN](https://gardian.bigdata.cgiar.org/) ecosystem. 


# Elasticsearch GADM Indices Installation

To install Elasticsearch GADM Indices follow the next steps:
1. Clone the SCiO [github](https://github.com/SCiO-systems/IndexGADM) repository.
2. Navigate inside the cloned repository.
3. Execute the following command for default settings (INDEX=gadm_polygons, SHARDS=1, REPLICAS=0)

```sh
 docker-compose -f {docker-compose.yml path} up
```
4. Execute the following command for custom settings

```sh
  INDEX=my_index_name SHARDS=1 REPLICAS=1 docker-compose -f {docker-compose.yml path} up
```
The source code of Elasticsearh GADM indices is in [Github](https://github.com/SCiO-systems/IndexGADM).

# [docker-compose.yml](https://github.com/SCiO-systems/IndexGADM/blob/master/docker-compose.yml)

    version: '2.2'
        services:
         gadm:
          image: scioquiver/elasticsearch:gadm_polygons
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


