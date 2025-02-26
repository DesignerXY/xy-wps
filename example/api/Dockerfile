FROM xy-wps:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8 \
    DISPLAY=:0

WORKDIR /app

ADD entrypoint.sh  /
ADD sources.list  /etc/apt
ADD dummy.conf /etc/X11/xorg.conf.d
  
# 安装必要的软件包
RUN apt update -y \
    apt install -y \
    libqt5xml5 \
    python3 \
    python3-pip \
    xserver-xorg-video-dummy \
    locales \
    procps && \
    echo "Packages installed successfully."
    
RUN python3 -m pip --no-cache-dir  install pywpsrpc flask -i https://pypi.tuna.tsinghua.edu.cn/simple/  \
    && fc-cache -v \
    && chmod +x /entrypoint.sh \
    && echo "zh_CN.UTF-8 UTF-8"  >/etc/locale.gen  \
    && locale-gen \
    && update-locale LANG=zh_CN.UTF-8 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean -y

ADD converter.py   ./
EXPOSE 9000

ENTRYPOINT [ "/entrypoint.sh" ]
