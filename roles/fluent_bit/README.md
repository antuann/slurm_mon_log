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