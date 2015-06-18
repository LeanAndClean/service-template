#Service Template

##Configuration parameter

```
export SERVICE_PORT=50000
export SERVICE_SSL=0
export SERVICE_APIKEY=abcde12345
```

##Build

```
docker build -t service-template .
```

##Run locally

```
docker run -t -i -p 50000:50000 service-template
```

##Publish into private repository

```
docker tag service-template 46.101.191.124:5000/service-template:0.2.75
docker push 46.101.191.124:5000/service-template:0.2.75
```

##Deploy via Shipyard

```
curl -X POST \
-H 'Content-Type: application/json' \
-H 'X-Service-Key: pdE4.JVg43HyxCEMWvsFvu6bdFV7LwA7YPii' \
http://46.101.191.124:8080/api/containers?pull=true \
-d '{  
  "name":"46.101.191.124:5000/service-template:0.2.75",
  "cpus":0.1,
  "memory":64,
  "environment":{
    "SERVICE_CHECK_SCRIPT":"curl -s http://46.101.191.124:50000/manage/os?apikey=abcde12345",
    "SERVICE_PORT":"50000",
    "SERVICE_SSL":"0",
    "SERVICE_TAGS":"ecommerce,feature1",
    "SERVICE_APIKEY":"abcde12345"
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
       "port":50000,
       "container_port":50000
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