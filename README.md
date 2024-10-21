Данный проект разрабатывался в связи с выполнением практикума по курсу Kubernetes: мониторинг и логирование
В данном проекте содержится 5 ролей prometheus_server, node_exporter, elastic_search, kibana, fluent_bit

prometheus_server
=========

Роль предназначена для установки сервера prometheus
Особенность данной роли заключается в наличии дирректории /etc/prometheus/prometheus.d/. Данная дирректория содержит конфигурационный файл prometheus.yml и файлы вида job-{{ имя хоста }}.yml. При каждом запуске сервиса prometheus.service эти файлы собираются в конфигурационный файл /etc/prometheus/prometheus.yml.
 
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


node_exporter
=========

Роль для установки Node Exporter. Для нормального добавления статического джоба в конфигурационный файл /etc/prometheus/prometheus.yml Сервера. Необходимо иметь prometheus server установленный с помощью роли prometheus_server.

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

elastic_search
=========

Роль для установки ElasticSearch.

Требования
------------

Роль тестировалась на ОС Debian 12

Переменные роли
--------------

selinux_disable - может принимать значения true/false. По умолчанию false. При true отключает selinux в OS семейства RedHat
firewall_open_port - может принимать значения true/false. По умолчанию false.  открывает порты в фаерволе
elastic_search_version - По умолчанию 8.9.2. Можно указать версию ElasticSearch
elasticsearch_password - можно указать пароль для пользователя elastic

Зависимости
------------

Роль самодостаточна

Пример использования
----------------

- name: "install ElasticSearch"
  hosts: elastic_search
  become: true
  roles:
    - role: elastic_search
      elastic_search_version: 8.9.2
      selinux_disable : true
      firewall_open_port : false
      elasticsearch_password: "secrets123"

Лицензия
-------

BSD

Информаци о авторе
------------------

Автор Дворников

kibana
=========

Роль для установки Kibana.

Требования
------------

Роль тестировалась на ОС Debian 12
Для работы Kibana нужен установленный ElasticSearch

Переменные роли
--------------

selinux_disable - может принимать значения true/false. По умолчанию false. При true отключает selinux в OS семейства RedHat
firewall_open_port - может принимать значения true/false. По умолчанию false.  открывает порты в фаерволе
kibana_version - по умолчанию 8.10.3. Можно указать версию Kibana
elasticsearch_host - нужно установить сетевое имя сервера ElasticSearch в виде строки 'протокол подключения://имя сервера:порт'
elasticsearch_user - имя пользователя для подключения к серверу ElasticSearch
elasticsearch_password: - пароль для подключения к серверу ElasticSearch

Зависимости
------------

Роль самодостаточна

Пример использования
----------------

- name: "install Kibana"
  hosts: kibana
  become: true
  roles:
    - role: kibana
      kibana_version: 8.9.2
      selinux_disable : true
      firewall_open_port : false
      elasticsearch_user: "elastic"
      elasticsearch_password: "secrets123"
      elasticsearch_host: 'http://127.0.0.1:9200'

Лицензия
-------

BSD

Информаци о авторе
------------------

Автор Дворников


fluent_bit
=========

Роль для установки FluentBit.

Требования
------------

Роль тестировалась на ОС Debian 12
Для отправки логов на ElasticSearch, нужен установленный ElasticSearch

Переменные роли
--------------

selinux_disable - может принимать значения true/false. По умолчанию false. При true отключает selinux в OS семейства RedHat
firewall_open_port - может принимать значения true/false. По умолчанию false.  открывает порты в фаерволе
fluent_bit_version - по умолчанию 3.1.9. Можно указать версию fluent-bit
elasticsearch_host - нужно установить сетевое имя сервера ElasticSearch
elasticsearch_port - по умолчанию 9200. Можно установить порт подключения для сервера ElasticSearch

Зависимости
------------

Роль самодостаточна

Пример использования
----------------

- name: "install FluentBit"
  hosts: fluent_bit
  become: true
  roles:
    - role: fluent_bit
      selinux_disable : true
      firewall_open_port : false
      elasticsearch_host: '127.0.0.1'
      elasticsearch_port: '9200'


Лицензия
-------

BSD

Информаци о авторе
------------------

Автор Дворников


