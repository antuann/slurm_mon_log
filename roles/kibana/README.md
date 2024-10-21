ykibana
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