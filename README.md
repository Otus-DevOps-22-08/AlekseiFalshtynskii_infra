# AlekseiFalshtynskii_infra
AlekseiFalshtynskii Infra repository

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
