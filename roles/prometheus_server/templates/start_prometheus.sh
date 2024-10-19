#!/bin/sh
cat /etc/prometheus/prometheus.d/prometheus.yml > /etc/prometheus/prometheus.yml;
cat /etc/prometheus/prometheus.d/job*.yml>>/etc/prometheus/prometheus.yml;
/usr/local/bin/prometheus \
--config.file /etc/prometheus/prometheus.yml \
--storage.tsdb.path /var/lib/prometheus/ \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/console_libraries