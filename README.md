# XY-WPS

在 docker 环境中使用 [wps](https://linux.wps.cn/)

## 介绍

该镜像的基础镜像为 `debian:bullseye-slim`

## Usage

```shell
docker build -t xy-wps .
```

### 样例

```Dockerfile
FROM akkuman/xy-wps

RUN apt update && apt install libqt5xml5 python3 python3-pip

RUN python3 -m pip --no-cache-dir --no-compile install pywpsrpc

COPY example.py /root/example.py

CMD [ "python3", "example.py" ]
```

示例：\
[doc](example/wps-doc)
\
[xls](example/wps-xls)

## 参考链接

- [pywpsrpc](https://github.com/timxx/pywpsrpc)
