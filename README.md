# Домашнее задание к лекции - 5.2

## Задача 1.

Опишите своими словами основные преимущества применения на практике IaaC паттернов:
* вся конфигурация храница в виде кода, что позволяет быстро поднять новую систему или же расширить текущую
* Скорость
* Идентичность конфигураций

Какой из принципов IaaC является основополагающим?

Основопологающим принципом является - Идемпотентность

## Задача 2.

Чем Ansible выгодно отличается от других систем управление конфигурациями?

* Конфигурационные файла в формате YAML
* Не нужен агент, используется ssh соединение
* Большое комьюнити
* Оповестит, если что-то пошло не по плану

Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?

Я считаю метод push более надежным

## Задача 3.

VirtualBox

```
bobs@bobs-VirtualBox:~/devops-netology$ vboxmanage --version
6.1.26_Ubuntur145957

```
Vagrant

```
bobs@bobs-VirtualBox:~/devops-netology$ vagrant --version
Vagrant 2.2.19

```
Ansible

```
bobs@bobs-VirtualBox:~/devops-netology$ ansible --version
ansible 2.9.6
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/bobs/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.10 (default, Nov 26 2021, 20:14:08) [GCC 9.3.0]

```