FROM debian:bullseye-slim AS finally

LABEL maintainer="xy<itbuff@outlook.com> (https://www.xy.com)"

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Shanghai

WORKDIR /root

RUN apt update && \
    apt-get install -y wget bsdmainutils xdg-utils libxslt1.1 xvfb libqt5gui5 && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    # wget https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/10161/wps-office_11.1.0.10161_amd64.deb && \
    # apt install -y ./wps-office_11.1.0.10161_amd64.deb && \
    # rm -rf ./wps-office_11.1.0.10161_amd64.deb && \
    # wget https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/10920/wps-office_11.1.0.10920_amd64.deb && \
    wget https://mirrors.163.com/ubuntukylin/pool/partner/wps-office_11.1.0.11723_amd64.deb && \
    apt install -y ./wps-office_11.1.0.11723_amd64.deb && \
    rm -rf ./wps-office_11.1.0.11723_amd64.deb && \
    mkdir -p /root/.config/Kingsoft/ && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

COPY Office.conf /root/.config/Kingsoft/Office.conf
COPY entrypoint.sh /root/entrypoint.sh

# for chinese font
ADD ../fonts /usr/share/fonts

RUN chmod +x /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
