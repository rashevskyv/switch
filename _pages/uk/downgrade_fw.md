---
lang: uk
permalink: /uk/downgrade_fw.html
title: Даунгрейд и восстановление прошивки в случае, если приставка вышла из строя
author_profile: true
---
{% include toc title="Разделы" %}

Этот гайд для даунгрейда прошивки и для тех, у кого приставка не включается, но цел раздел PRODINFO, либо есть его бекап (атмосфера 0.8.1 и выше бекапит PRODINFO на карту автоматически). Для обновления прошивки воспользуйтесь [этой](/uk/update-fw) инструкцией!

## Что понадобится

ОБЯЗАТЕЛЬНО [сделайте бекап](/uk/backup-nand){:target="_blank"} своей текущей прошивки до того, как начнёте выполнение инструкции, даже если ваша приставка не включается!
{: .notice--danger}

* [Ключи](backup-nand#часть-ii---
lang: ukдампим-ключи){:target="_blank"}, уникальны для каждой консоли
* [Прошивка](https://github.com/THZoria/NX_Firmware/releases/latest)
* [SystemRestoreV3.te](/files/SystemRestoreV3.te){:target="_blank"} - скрипт для восстановления прошивки
* Свежая версия [EmmcHaccGen](https://github.com/suchmememanyskill/EmmcHaccGen){:target="_blank"}
	* Требует для работы [.NET SDK 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1){:target="_blank"}
* Создайте [резервную копию NAND](/uk/backup-nand){:target="_blank"} консоли и поместите её в надёжное место 
* Установите {% include abbr/uk/kefir_addr.txt %}, если ещё не делали этого

## Инструкция

### Часть I - Перепаковка прошивки под вашу систему

1. Установите [.NET SDK 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1){:target="_blank"}
1. Распакуйте `.zip-архив` с [EmmcHaccGen](https://github.com/suchmememanyskill/EmmcHaccGen){:target="_blank"} в удобную папку
1. Положите в папку с `EmmcHaccGen` ваш файл с [ключами](/backup-nand#часть-ii---
lang: ukдампим-ключи){:target="_blank"}
1. Распакуйте `.zip-архив` с прошивкой в папку `EmmcHaccGen` таким образом, чтобы папка с прошивкой лежала в той же директории, что и `EmmcHaccGen.exe`
1. Запустите командную строку в папке `EmmcHaccGen` (вызовите контекстное меню с зажатой клавишей Shift, нажав на свободное место в папке, и выберите "**Открыть Командную строку здесь**" или "**Открыть окно PowerShell здесь**")
1. В открывшемся окне наберите:
	* Для powershell: `.\EmmcHaccGen.exe --keys prod.keys --fw X.X.X`
	* Для командной строки: `EmmcHaccGen.exe --keys prod.keys --fw X.X.X`
	* **X.X.X** - название папки с вашей прошивкой. Например, `EmmcHaccGen --keys prod.keys --fw 14.1.0`
	* Если у вас {% include abbr/uk/mariko.md %}, то добавьте ключ `--mariko` после версии прошивки (например, `EmmcHaccGen --keys prod.keys --fw 14.1.0 --mariko`)
1. Дождитесь окончания перепаковки. В результате вы получите папку `Y-X.X.X-exfat`, где `Y` принимает значение `NX` или `a`, в зависимости от ревизии консоли

### Часть II - Загрузка прошивки на устройство 

1. На карте памяти приставки создайте папку `FW` и поместите туда [SystemRestoreV3.te](/files/SystemRestoreV3.te){:target="_blank"}, а так же `boot.bis` и папку `SYSTEM`, которые находятся в папке `Y-X.X.X-exfat`
1. Запустите {% include abbr/uk/hekate.txt abbr="hekate" %} -> **Payloads** -> `TegraExplorer.bin`
1. Выберите **Browse SD**, перейдите в папку `FW`, выберите `systemRestore.te` -> **Launch Script**
1. Следуйте информации на экране и восстановите BIS и SYSTEM (restore both)
1. Пробуйте загрузиться в систему 
	* Имейте ввиду, что если ваша консоль прошивается Fusée Gelée, то [AutoRCM](/uk/autorcm){:target="_blank"} будет включен
	* Если приставка всё ещё не грузится, сделайте [восстановление к заводским настройкам](/uk/system-wipe)

___

# Следующий шаг: [Безопасное обновление прошивки](/uk/update-fw) 
{: .notice--success}