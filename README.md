# devops-netology
1. Команда cd является встроенной командой, выполняется только в текущей сессии
2. grep <some_string> <some_file> -c
3. vagrant@vagrant:~$ pstree -p
systemd(1)─┬─VBoxService(1020)─┬─{VBoxService}(1022)
           │                   ├─{VBoxService}(1023)
           │                   ├─{VBoxService}(1024)
           │                   ├─{VBoxService}(1025)
           │                   ├─{VBoxService}(1026)
           │                   ├─{VBoxService}(1027)
           │                   ├─{VBoxService}(1028)
           │                   └─{VBoxService}(1029)
           ├─accounts-daemon(584)─┬─{accounts-daemon}(598)
           │                      └─{accounts-daemon}(639)
           ├─agetty(2015)
           ├─atd(1984)
           ├─cron(1980)
           ├─dbus-daemon(587)
           ├─fwupd(13523)─┬─{fwupd}(13532)
           │              ├─{fwupd}(13542)
           │              ├─{fwupd}(13543)
           │              └─{fwupd}(13544)
           ├─irqbalance(608)───{irqbalance}(618)
           ├─multipathd(527)─┬─{multipathd}(528)
           │                 ├─{multipathd}(529)
           │                 ├─{multipathd}(530)
           │                 ├─{multipathd}(531)
           │                 ├─{multipathd}(532)
           │                 └─{multipathd}(533)
           ├─networkd-dispat(610)
           ├─polkitd(645)─┬─{polkitd}(647)
           │              └─{polkitd}(649)
           ├─rpcbind(556)
           ├─rsyslogd(612)─┬─{rsyslogd}(629)
           │               ├─{rsyslogd}(630)
           │               └─{rsyslogd}(631)
           ├─sshd(2382)───sshd(13618)───sshd(13666)───bash(13667)───pstree(13675)
           ├─systemd(13631)───(sd-pam)(13632)
           ├─systemd-journal(363)
           ├─systemd-logind(617)
           ├─systemd-network(400)
           ├─systemd-resolve(557)
           └─systemd-udevd(395)─┬─systemd-udevd(13674)
                                └─systemd-udevd(13676)

4. ls -l /root 2>/dev/pts/1
    во второй сессии ls: cannot open directory '/root': Permission denied
5. cat < 1.txt > 2.txt
6. Вывести с помощью перенаправления вывода можно, но увидеть в графическом режиме не полуится
7. bash 5>&1 создаст дескриптор 5 и перенаправит в stdout
    echo netology > /proc/$$/fd/5 выведет на экран netology
    вывод команды эхо мыф посылаем в дескриптор 5, который в свою очередь посылает вывод в stdout, т.е. на экран
8. ls -l /123 666>&2 2>&1 1>&666 | wc -l
9. Будут выведены переменные окружения, команда env сделает тоже самое, только в более читаемом виде
10. /proc/<PID>/cmdline - Этот доступный только для чтения файл содержит полную командную строку для процесса, если только процесс не является зомби.
    /proc/<PID>/exe - Этот файл представляет собой символическую ссылку, содержащую фактический путь к исполняемому файлу.
11. cat /proc/cpuinfo | grep sse
    SSE 4.2
12. По умолчанию, когда вы запускаете команду на удаленном компьютере с помощью ssh, TTY не выделяется для удаленного сеанса
    Ключ -t решает прорблему 
    ssh -t localhost 'tty'
13. sudo reptyr -T 1213
14. Команда tee выводит одновременно и в файл и в stdout, поэтому запуская через sudo имеет права на запись