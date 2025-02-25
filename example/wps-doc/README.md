# doc

This [convertto.py](convertto.py) is from the [pywpsrpc official repository](https://github.com/timxx/pywpsrpc/blob/master/examples/rpcwpsapi/convertto)

## Usage

```shell
docker build -t xy-wps-doc .
docker run --rm -v $(pwd):/app/data xy-wps-doc --format pdf /app/data/test.docx
```
