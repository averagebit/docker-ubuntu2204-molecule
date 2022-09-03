FROM ubuntu:22.04
MAINTAINER averagebit <averagebit@pm.me>

RUN apt-get update && apt-get install -y --no-install-recommends \
       rsyslog \
       software-properties-common \
       sudo \
       systemd \
       systemd-cron \
       ansible \
    && rm -rf /usr/share/doc \
    && rm -rf /usr/share/man \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

RUN mkdir -p /etc/ansible \
 && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

CMD ["/lib/systemd/systemd"]
