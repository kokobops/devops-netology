# devops-netology

1. Полный хэш aefead2207ef7e2aa5dc81a34aedf0cad4c32545, коментарий Update CHANGELOG.md, команда git show aefea
2. tag: v0.12.23, команда git show 85024d3
3. Хэши рродителей 56cd7859e 9ea88f22f, команда git log --pretty=format:"%h %p" --graph b8d720
4. Команда git log  v0.12.23..v0.12.24  --oneline
-    33ff1c03b (tag: v0.12.24) v0.12.24
-    b14b74c49 [Website] vmc provider links
-    3f235065b Update CHANGELOG.md
-    6ae64e247 registry: Fix panic when server is unreachable
-    5c619ca1b website: Remove links to the getting started guide's old location
-    06275647e Update CHANGELOG.md
-    d5f9411f5 command: Fix bug when using terraform login on Windows
-    4b6d06cc5 Update CHANGELOG.md
-    dd01a3507 Update CHANGELOG.md
-    225466bc3 Cleanup after v0.12.23 release
5. Коммит 8c928e83589d90a031f811fae52a81be7153e82f, команды git log -S'func providerSource' --oneline, далее git show, просмотрел коммиты, нашел в каком добавили
6. 8364383c3, 66ebff90c, 41ab0aef7, 52dbf9483, 78b122055. Сначала ищем файл в котором эта функция git grep 'func globalPluginDirs',
   потом смотрим историю изменения git log -L :'func globalPluginDirs':plugins.go --oneline
7. 5ac311e2a - Martin Atkins mart@degeneration.co.uk, команда git log --pretty=format:'%h - %an %ae' -S'func synchronizedWriters'