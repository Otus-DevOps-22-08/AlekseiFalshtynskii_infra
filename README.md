# AlekseiFalshtynskii_infra
AlekseiFalshtynskii Infra repository

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
