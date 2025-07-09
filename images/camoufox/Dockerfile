FROM python:3.12

RUN apt-get update && \
    apt-get install -y \
        libgtk-3-0 \
        libasound2 \
        libx11-xcb1 \
        xvfb && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install camoufox[geoip]
RUN camoufox fetch
RUN mkdir -p /opt/camoufox
RUN mkdir -p /data

ADD startup.py /opt/camoufox/startup.py

CMD ["python3", "/opt/camoufox/startup.py"]