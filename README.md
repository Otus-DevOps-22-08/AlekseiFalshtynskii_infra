# AlekseiFalshtynskii_infra
AlekseiFalshtynskii Infra repository

### HW09
Создан и протестирован плейбук с одним сценарием reddit_app_one_play.yml\
Создан и протестирован плейбук с отдельными миграциями reddit_app_multiple_plays.yml\
Созданы и протестированы отдельные плейбуки каждый с одной миграцией, собранные в плейбуке site.yml
```
db.yml
app.yml
deploy.yml
```
Изменены провиженеры packer на использование плейбуков ansible
```
packer_db.yml
packer_app.yml
```
Пересозданы образы, пересоздана и протестирована конфигурация terraform stage

★ Автоматическая инвентаризация
Скачан плагин yc_compute.py и помещен в ~/.ansible/plugins/inventory\
Создан inventory файл для плагина с настройкой keyed_groups\
```
yc.yml
```
В db.yml, app.yml, deploy.yml поправлены значения hosts на _reddit_app и _reddit_db соответственно, возвращаемые командой\
В app.yml параметризировано получение хоста базы данных\
Настроен ansible.cfg для использования плагина

### HW08
Установлен ansible\
Развернута конфигурация terraform stage, правда с пользователем ubuntu (не appuser)\
Выполнены базовые команды управления хостами из руководства\
Проверена работа плейбука клонирования приложения\
В первом случае changed=0, т.к. шагом раньше было клонировано модулем git\
После выполнения команды удаления приложения
```
ansible app -m command -a 'rm -rf ~/reddit'
```
в результате выполнения плейбука change=1, т.к. клонирование произошло\
Созданы статические inventory файлы в форматах ini, yml, json\
Написан скрипт inventory.sh для динамического формирования json "на лету"\
Формат json для статического и динамического использования отличается наполнением поля hosts\
Для динамического в нем перечисляется массив ip, а для статического объекты с наименованием и хостом ansible_host\
Команда\
```
ansible all -m ping
```
работает с любым указанием inventory файла в ansible.cfg\
```
inventory = ./inventory
inventory = ./inventory.yml
inventory = ./inventory.json
inventory = ./inventory.sh
```

### HW07
Конфигурации развертывания инстансов приложения, базы данных и vpc разделены по модулям\
В конфигурацию приложения возвращен provisioner деплоя приложения\
В деплой приложения передается ip инстанса, на котором разветывается база данных\
Добавлена переменная app_deploy, при включении которой при развертывании инстанса задеплоится приложение\
Сконфигурировано создание хранилища объектов s3\
Сконфигурировано хранение файла состояния терраформа в backend\
Конфигурации развертывания инстансов разделены на окружения stage и prod\
\
Адрес приложения
```
http://84.201.133.243:9292
```
Адрес базы данных
```
http://84.201.135.96:27017
```

### HW06
С помощью terraform создан один инстанс, описанный в main.tf\
Добавлены провизионеры для деплоя и запуска тестового приложения внутри инстанса\
Добавлен вывод ip адрес создаваемого инстанса в файле outputs.tf\
Параметризированы переменные в файле variables.tf, значения указаны в terraform.tfvars\
Создан вручную второй инстанс копированием настроек первого\
Сконфигурирован балансировщик в файле lb.tf, в него добавлены оба инстанса\
Добавлен вывод ip адреса балансировщика в outputs.tf\
Проверена доступность приложения при отключении сервиса на одном из инстансов\
Удалено дублирование настроек второго инстанса и заменено применением переменной count\
В настройках балансировщика прямое указание инстансов заменено динамическим блоком\
\
Адрес балансировщика
```
http://62.84.127.227:666
```

### HW05
Настроен параметризированный ubuntu16.json с параметрами в variables.json для создания первого образа
```
packer build -var-file ./variables.json ./ubuntu16.json
```
Настроен параметризированный immutable.json для создания baked-образа со стартующим приложением
```
packer build -var-file ./variables.json ./immutable.json
```
Создан скрипт create-reddit-vm.sh для создания ВМ из предыдущего baked-образа
```
./config-scripts/create-reddit-vm.sh
```
Развернутая ВМ с приложением
```
http://51.250.96.243:9292/
```

### HW04
Создание инстанса одной командой
```
yc compute instance create\
--name reddit-app\
--hostname reddit-app\
--memory=4\
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB\
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4\
--metadata serial-port-enable=1\
--metadata-from-file user-data=./metadata.yaml
```
Конфигурация
```
testapp_IP = 130.193.36.139
testapp_port = 9292
```

### HW03
Подключение к someinternalhost в одну команду
```
ssh -i .ssh/appuser -J appuser@84.201.157.228 appuser@10.128.0.16
```
При помощи команды вида ssh someinternalhost
.ssh/config:
```
Host someinternalhost
Hostname 10.128.0.16
User appuser
ProxyJump appuser@84.201.157.228
```
Адрес pritunl
```
https://84-201-157-228.sslip.io
```
Конфигурация
```
bastion_IP = 84.201.157.228
someinternalhost_IP = 10.128.0.16
```
