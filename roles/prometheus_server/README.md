
prometheus_server
=========

Роль предназначена для установки сервера prometheus
Особенность данной роли заключается в наличии дирректории /etc/prometheus/prometheus.d/. Данная дирректория содержит конфигурационный файл prometheus.yml и
файлы вида job-{{ имя хоста }}.yml. При каждом запуске сервиса prometheus.service эти файлы собираются в конфигурационный файл /etc/prometheus/prometheus.ym
l.

Требования
------------

Роль тестировалась на ОС Debian 12

Переменные роли
--------------

selinux_disable - может принимать значения true/false. По умолчанию false. При true отключает selinux в OS семейства RedHat
firewall_open_port - может принимать значения true/false. По умолчанию false.  открывает порты в фаерволе
prometheus_version - по умолчанию 2.54.1. Можно указать версию Prometheus для установки


Зависимости
------------

Роль самодостаточна

Пример использования
----------------

- name: "install Prometheus"
  hosts: prometheus_servers
  become: true
  roles:
    - role: prometheus_server
      selinux_disable : true
      firewall_open_port : false
      prometheus_version : 2.54.1

Лицензия
-------

BSD

Информаци о авторе
------------------

Автор Дворников