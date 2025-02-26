# XY-WPS

在 docker 环境中使用 [wps](https://linux.wps.cn/)

## Introduction

该镜像的基础镜像为 `debian:bullseye-slim`

## WPS Software

WPS Linux [下载地址]https://aur.archlinux.org/cgit/aur.git/log/?h=wps-office-cn

## Usage

```shell
docker build -t xy-wps:latest .
```

### Example

```Dockerfile
FROM xy-wps:latest

RUN apt update && apt install libqt5xml5 python3 python3-pip

RUN python3 -m pip --no-cache-dir --no-compile install pywpsrpc

COPY example.py /root/example.py

CMD [ "python3", "example.py" ]
```

Examples：
[doc](example/wps-doc)、[xls](example/wps-xls)、[ppt](example/wps-ppt)

## References

- [pywpsrpc](https://github.com/timxx/pywpsrpc)
- [headless-wps](https://github.com/akkuman/headless-wps)
- [wps2pdf](https://github.com/sun-wming/wps2pdf)
- [WpsToPdf](https://github.com/xlgwr/WpsToPdf)
