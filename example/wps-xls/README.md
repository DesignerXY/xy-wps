# Example

This [et_convert.py](et_convert.py) is from the [pywpsrpc official repository](https://github.com/timxx/pywpsrpc/tree/master/examples/rpcetapi)

## Usage

```shell
docker build -t xy-wps-xls .
docker run --rm -v $(pwd):/app/data xy-wps-xls --format pdf /app/data/test.xls
```
