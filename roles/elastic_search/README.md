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