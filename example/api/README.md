# xy-wps-api

## Usage

```shell
docker build --no-cache -t xy-wps-api:latest .
docker run -d -p 9000:9000 -v ${pwd}/app:/app --name wps-api xy-wps-api:latest
```
