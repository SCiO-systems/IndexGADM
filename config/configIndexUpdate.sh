sleep 500 

index="${INDEX}"
shards="${SHARDS}"
replicas="${REPLICAS}"

if [ -z "${index}" ]; then
    echo "index is unset"
    exit 1
fi

if [ -z "${shards}" ]; then
    echo "shards is unset"
    exit 1
fi

if [ -z "${replicas}" ]; then
    echo "replicas is unset"
    exit 1
fi


curl -XPUT "http://localhost:9200/${index}" -H 'Content-Type: application/json' -d'
{



"settings": {
    "index": {
      "number_of_shards" : '"$shards"',  
      "number_of_replicas":'"$replicas"' 
    }
  },



    "mappings": {



  "FeatureCollection": {



    "properties": {



      "type": {



        "type": "text"



      },



      "properties": {



        "properties": {



          "GID_0": {



            "type": "keyword"



          },



          "NAME_0": {



            "type": "keyword"



          },



          "GID_1": {



            "type": "keyword"



          },



          "NAME_1": {



            "type": "keyword"



          },



          "GID_2": {



            "type": "keyword"



          },



          "NAME_2": {



            "type": "keyword"



          },



          "GID_3": {



            "type": "keyword"



          },



          "NAME_3": {



            "type": "keyword"



          },



          "GID_4": {



            "type": "keyword"



          },



          "NAME_4": {



            "type": "keyword"



          },



          "VARNAME_4": {



            "type": "keyword"



          },



          "TYPE_4": {



            "type": "keyword"



          },



          "ENGTYPE_4": {



            "type": "keyword"



          },



          "CC_4": {



            "type": "keyword"



          }



        }



      },



      "geometry": {



        "type": "geo_shape"



      }



    },



    "_meta": {



      "fid": "ogc_fid",



      "geomfields": {



        "geometry": "POLYGON"



      }



    }



  }



}



}'



curl -X POST "localhost:9200/_reindex" -H 'Content-Type: application/json' -d'
{
  "source": {
    "index": "gadm_polygons"
  },
  "dest": {
    "index": "${index}"
  }
}
'

sleep 500

curl -XDELETE "http://localhost:9200/gadm_polygons?pretty"
