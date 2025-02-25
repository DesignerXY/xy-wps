FROM xy-wps:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV LANG=C.UTF-8 \
    TZ=Asia/Shanghai \
    PYTHONUNBUFFERED=1 \
    # prevents python creating .pyc files
    PYTHONDONTWRITEBYTECODE=1 \
    # pip:
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

WORKDIR /app

# python3.9(3.9.2)
RUN sed -i "s|http://deb.debian.org/debian|http://mirror.sjtu.edu.cn/debian|g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y libqt5xml5 python3 python3-pip && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/* && \
    # strip --remove-section=.note.ABI-tag /usr/lib64/libQt5Core.so.5
    strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5

COPY ./requirements.txt ./convertto.py ./entrypoint.sh ./test.docx /app/
RUN python3 -m pip install --no-cache-dir -r /app/requirements.txt && \
    chmod +x /app/entrypoint.sh

# The original entrypoint of the xy-wps image is xvfb-run, which is rewritten here, so you need to add it manually 
ENTRYPOINT [ "/app/entrypoint.sh" ]
