# Example

This [wpp_convert.py](wpp_convert.py) is from the [pywpsrpc official repository](https://github.com/timxx/pywpsrpc/tree/master/examples/rpcwppapi)

## Usage

```shell
docker build -t xy-wps-ppt .
docker run --rm -v $(pwd):/app/data xy-wps-ppt --format pdf /app/data/test.ppt
```
