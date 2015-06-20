#Service Template

##Service configuration

```
export SERVICE_PORT=50000
export SERVICE_SSL=0
export SERVICE_APIKEY=abcde12345
```

##Deploy configuration

```
export PUBLISH_SERVICE=46.101.191.124:5000
export DEPLOY_SERVICE=46.101.191.124:8080
export SERVICE_TAGS=ecommerce,feature1
```

##Build

```
docker build -t service-template .
```

##Run locally

```
docker run -t -i -p $SERVICE_PORT:$SERVICE_PORT service-template
```

##Publish into private repository

```
docker tag service-template $PUBLISH_SERVICE/service-template:0.2.75
docker push $PUBLISH_SERVICE/service-template:0.2.75
```

##Deploy via Shipyard

```
curl -X POST \
-H 'Content-Type: application/json' \
-H 'X-Service-Key: pdE4.JVg43HyxCEMWvsFvu6bdFV7LwA7YPii' \
http://$DEPLOY_SERVICE/api/containers?pull=true \
-d '{  
  "name":"'$PUBLISH_SERVICE'/service-template:0.2.75",
  "cpus":0.1,
  "memory":64,
  "environment":{
    "SERVICE_CHECK_SCRIPT":"curl -s http://$SERVICE_IP:$SERVICE_PORT/manage/os?apikey='$SERVICE_APIKEY'",
    "SERVICE_PORT":"'$SERVICE_PORT'",
    "SERVICE_SSL":"'$SERVICE_SSL'",
    "SERVICE_TAGS":"'$SERVICE_TAGS'",
    "SERVICE_APIKEY":"'$SERVICE_APIKEY'"
  },
  "hostname":"",
  "domain":"",
  "type":"service",
  "network_mode":"bridge",
  "links":{},
  "volumes":[],
  "bind_ports":[  
    {  
       "proto":"tcp",
       "host_ip":null,
       "port":'$SERVICE_PORT',
       "container_port":'$SERVICE_PORT'
    }
  ],
  "labels":[],
  "publish":false,
  "privileged":false,
  "restart_policy":{  
    "name":"no"
  }
}'
```