FROM ubuntu:22.04
RUN apt-get update && apt-get install -y  \
    supervisor  \
    sudo unzip tree nano wget jq net-tools curl \
    python3-pip python-is-python3
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
