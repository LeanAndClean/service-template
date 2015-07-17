#Service Template

##Configuration

```
export SERVICE_SSL=0
export SERVICE_APIKEY=abcde12345
export SERVICE_PORT=50000
export SERVICE_VERSION=0.2.75
export PUBLISH_SERVICE=<ip>:<port>
```

##Build

```
docker build -t service-template .
docker pull $PUBLISH_SERVICE/service-template:$SERVICE_VERSION
```

##Run locally

```
docker run -t -i -p $SERVICE_PORT:$SERVICE_PORT service-template
```

##Publish into private repository

```
docker tag service-template:latest $PUBLISH_SERVICE/service-template:$SERVICE_VERSION
docker push $PUBLISH_SERVICE/service-template:$SERVICE_VERSION
```
