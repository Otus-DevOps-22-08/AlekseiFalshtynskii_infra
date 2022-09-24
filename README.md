# AlekseiFalshtynskii_infra
AlekseiFalshtynskii Infra repository

HW03
Подключение к someinternalhost в одну команду
ssh -i .ssh/appuser -J appuser@84.201.157.228 appuser@10.128.0.16

При помощи команды вида ssh someinternalhost
.ssh/config:
Host someinternalhost
Hostname 10.128.0.16
User appuser
ProxyJump appuser@84.201.157.228

Адрес pritunl
https://84-201-157-228.sslip.io

Конфигурация
bastion_IP = 84.201.157.228
someinternalhost_IP = 10.128.0.16
