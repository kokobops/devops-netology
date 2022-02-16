#Домашнее задание к занятию 5.3

##Задача 1

https://hub.docker.com/r/kokobops/nginx

```
CONTAINER ID   IMAGE               COMMAND                  CREATED         STATUS         PORTS                               NAMES
68ae91ee3f8d   kokobops/nginx:v1   "/docker-entrypoint.…"   5 seconds ago   Up 4 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   sad_curie
root@bobsvm:/home/kokobops/netology# curl localhost
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
```

##Задача 2

* Высоконагруженное монолитное java веб-приложение;
Лучше всего подойдет подойдет VM или физическая машина, так как приложение монолитное и высоконогруженное

* Nodejs веб-приложение;
Docker подойдет

* Мобильное приложение c версиями для Android и iOS;
Виртаульная машина, потому что скорее всего там нужен будет GUI

* Шина данных на базе Apache Kafka;
Если потеря данных не критична, то докер, инче ВМ

* Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;
Elasticsearch на ВМ, logstash и kibana на Docker

* Мониторинг-стек на базе Prometheus и Grafana;
Docker, т.к. данные не хранятся

* MongoDB, как основное хранилище данных для java-приложения;
Физический сервер или ВМ, зависит от нагрузки

* Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.
Виртуальная машина для БД и файлов, docker для сервисов


##Задача 3

```
root@bobsvm:/home/kokobops/netology# docker run -it -d --name centos -v /home/kokobops/netology/data:/data centos
Unable to find image 'centos:latest' locally
latest: Pulling from library/centos
a1d0c7532777: Pull complete
Digest: sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177
Status: Downloaded newer image for centos:latest
a0bff84b14e58e261a7aa34297a9b8d71080b8084a2a5d32ad3216da25a01484
```

```
root@bobsvm:/home/kokobops/netology# docker run -it -d --name debian -v /home/kokobops/netology/data:/data debian
Unable to find image 'debian:latest' locally
latest: Pulling from library/debian
0c6b8ff8c37e: Pull complete
Digest: sha256:fb45fd4e25abe55a656ca69a7bef70e62099b8bb42a279a5e0ea4ae1ab410e0d
Status: Downloaded newer image for debian:latest
a607d5b40a34fcbc7011e2f2d61c5543ef8ba622f0e062c19fcbcb472f14d49f
```

```
root@bobsvm:/home/kokobops/netology# docker exec -it centos bash
[root@a0bff84b14e5 /]# cd data/
[root@a0bff84b14e5 data]# touch centos.txt
[root@a0bff84b14e5 data]# exit
```

```
root@bobsvm:/home/kokobops/netology# touch ./data/host.txt
```

```
root@bobsvm:/home/kokobops/netology# docker exec -it debian bash
root@a607d5b40a34:/# cd /data/
root@a607d5b40a34:/data# ls -al
total 8
drwxr-xr-x 2 root root 4096 Feb 16 13:06 .
drwxr-xr-x 1 root root 4096 Feb 16 13:00 ..
-rw-r--r-- 1 root root    0 Feb 16 13:04 centos.txt
-rw-r--r-- 1 root root    0 Feb 16 13:06 host.txt
```
