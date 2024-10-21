node_exporter
=========

Роль для установки Node Exporter. Для нормального добавления статического джоба в конфигурационный файл /etc/prometheus/prometheus.yml Сервера. Необходимо и
меть prometheus server установленный с помощью роли prometheus_server.

Требования
------------

Роль тестировалась на ОС Debian 12

Переменные роли
--------------

selinux_disable - может принимать значения true/false. По умолчанию false. При true отключает selinux в OS семейства RedHat
firewall_open_port - может принимать значения true/false. По умолчанию false.  открывает порты в фаерволе
node_exporter_version - принимает текстовые значиени. По умолчанию 1.8.2. Можно указать версию Node Exporter
prometheus_host - в данной переменной необходимо указать сетевое имя для сервера prometheus.
group_name - имя группы в файле prometeus.xml в job данного сервера разделе

Зависимости
------------

Зависит от роли prometheus_server



Пример использования
----------------

- name: "install Node Exporter"
  hosts: node_exporter
  become: true
  roles:
    - role: node_exporter
      node_exporter_version : 1.8.2
      prometheus_host: '127.0.0.1'
      group_name: 'production'
      selinux_disable : true
      firewall_open_port : false

Лицензия
-------

BSD

Информаци о авторе
------------------

Автор Дворников