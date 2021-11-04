# devops-netology
1. chdir("/tmp")
2. /usr/share/misc/magic.mgc
3. Открыл файл 1.txt в редакторе vi
    удалил .1.txt.swp
    
    vi      1200 vagrant    4u   REG  253,0     4096 141087 /home/vagrant/.1.txt.swp (deleted)
    
    для очистки cp /dev/null /proc/1200/fd/4
    Чищу так логи на рабочих серверах
4. Зомби не занимают памяти (как процессы-сироты), но блокируют записи в таблице процессов, размер которой ограничен для каждого пользователя и системы в целом.
5. PID    COMM               FD ERR PATH
    1      systemd            12   0 /proc/401/cgroup
    393    systemd-udevd      14   0 /sys/fs/cgroup/unified/system.slice/systemd-udevd.service/cgroup.procs
    393    systemd-udevd      14   0 /sys/fs/cgroup/unified/system.slice/systemd-udevd.service/cgroup.threads
    787    vminfo              4   0 /var/run/utmp
    591    dbus-daemon        -1   2 /usr/local/share/dbus-1/system-services
    591    dbus-daemon        18   0 /usr/share/dbus-1/system-services
    591    dbus-daemon        -1   2 /lib/dbus-1/system-services
    591    dbus-daemon        18   0 /var/lib/snapd/dbus-1/system-services/
    605    irqbalance          6   0 /proc/interrupts
    605    irqbalance          6   0 /proc/stat
    605    irqbalance          6   0 /proc/irq/20/smp_affinity
    605    irqbalance          6   0 /proc/irq/0/smp_affinity
    605    irqbalance          6   0 /proc/irq/1/smp_affinity
    605    irqbalance          6   0 /proc/irq/8/smp_affinity
    605    irqbalance          6   0 /proc/irq/12/smp_affinity
    605    irqbalance          6   0 /proc/irq/14/smp_affinity
    605    irqbalance          6   0 /proc/irq/15/smp_affinity
    787    vminfo              4   0 /var/run/utmp
6.  Part of the utsname information is also accessible  via  /proc/sys/ker-
    nel/{ostype, hostname, osrelease, version, domainname}.
7. В случае с && в bash вторая команда выполнится если первая команда выполнится успешно
    Есть ли смысл использовать в bash &&, если применить set -e?
    Нет смысла, так как параметр -e указывает оболочке выйти, если команда дает ненулевой статус выхода
8.	-e указывает оболочке выйти, если команда дает ненулевой статус выхода
    -u обрабатывает неустановленные или неопределенные переменные, за исключением специальных параметров, таких как подстановочные знаки (*) или «@», как ошибки во время раскрытия параметра.
    -x печатает аргументы команды во время выполнения
    -o pipefail возвращает код возврата набора/последовательности команд, ненулевой при последней команды или 0 для успешного выполнения команд
    
    Повышает деталезацию вывода ошибок(логирования), и завершит сценарий при наличии ошибок, на любом этапе выполнения сценария, кроме последней завершающей команды.
9.	ps -xo stat
    STAT
    Ss
    S
    S
    Ss
    T
    R+
    
    S : процесс ожидает (т.е. спит менее 20 секунд);
    T : процесс остановлен;
    R : процесс выполняется в данный момент;