---
redirect_from:
  - /uk/downgrade_fw.html
  - /ru/downgrade_fw.html
lang: uk
permalink: /downgrade_fw
title: Даунгрейд та відновлення прошивки у випадку, якщо приставка вийшла з ладу
author_profile: true
---
{% include toc title="Розділи" %}

Цей гайд для даунгрейду прошивки і для тих, у кого приставка не вмикається, але цілий розділ PRODINFO, або є його бекап (атмосфера 0.8.1 і вище бекапить PRODINFO на карту автоматично). Для оновлення прошивки скористайтеся [цією](/update-fw) інструкцією!

## Що знадобиться

ОБОВ'ЯЗКОВО [зробіть бекап](/backup-nand){:target="_blank"} своєї поточної прошивки до того, як почнете виконання інструкції, навіть якщо ваша приставка не вмикається!
{: .notice--danger}

* [Ключі](backup-nand#частина-ii---дампимо-ключі){:target="_blank"}, унікальні для кожної консолі
* [Прошивка](https://github.com/THZoria/NX_Firmware/releases/latest)
* [SystemRestoreV3.te](/files/SystemRestoreV3.te){:target="_blank"} - скрипт для відновлення прошивки
* Свіжа версія [EmmcHaccGen](https://github.com/suchmememanyskill/EmmcHaccGen){:target="_blank"}
	* Потребує для роботи [.NET SDK 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1){:target="_blank"}
* Створіть [резервну копію NAND](/backup-nand){:target="_blank"} консолі та помістіть її в надійне місце 
* Встановіть {% include abbr/kefir_addr.txt %}, якщо ще не робили цього

## Інструкція

### Частина I - Перепакування прошивки під вашу систему

1. Встановіть [.NET SDK 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1){:target="_blank"}
1. Розпакуйте `.zip-архів` з [EmmcHaccGen](https://github.com/suchmememanyskill/EmmcHaccGen){:target="_blank"} у зручну папку
1. Покладіть у папку з `EmmcHaccGen` ваш файл з [ключами](/backup-nand#частина-ii---дампимо-ключі){:target="_blank"}
1. Розпакуйте `.zip-архів` з прошивкою в папку `EmmcHaccGen` таким чином, щоб папка з прошивкою лежала в тій же директорії, що і `EmmcHaccGen.exe`
1. Запустіть командний рядок у папці `EmmcHaccGen` (викличте контекстне меню з затиснутою клавішею Shift, натиснувши на вільне місце в папці, і виберіть "**Відкрити Командний рядок тут**" або "**Відкрити вікно PowerShell тут**")
1. У вікні, що відкрилося, наберіть:
	* Для powershell: `.\EmmcHaccGen.exe --keys prod.keys --fw X.X.X`
	* Для командного рядка: `EmmcHaccGen.exe --keys prod.keys --fw X.X.X`
	* **X.X.X** - назва папки з вашою прошивкою. Наприклад, `EmmcHaccGen --keys prod.keys --fw 14.1.0`
	* Якщо у вас {% include abbr/mariko.md %}, то додайте ключ `--mariko` після версії прошивки (наприклад, `EmmcHaccGen --keys prod.keys --fw 14.1.0 --mariko`)
1. Дочекайтеся закінчення перепакування. В результаті ви отримаєте папку `Y-X.X.X-exfat`, де `Y` приймає значення `NX` або `a`, залежно від ревізії консолі

### Частина II - Завантаження прошивки на пристрій 

1. На карті пам'яті приставки створіть папку `FW` і помістіть туди [SystemRestoreV3.te](/files/SystemRestoreV3.te){:target="_blank"}, а також `boot.bis` та папку `SYSTEM`, які знаходяться в папці `Y-X.X.X-exfat`
1. Запустіть {% include abbr/hekate.txt abbr="hekate" %} -> **Payloads** -> `TegraExplorer.bin`
1. Виберіть **Browse SD**, перейдіть у папку `FW`, виберіть `systemRestore.te` -> **Launch Script**
1. Дотримуйтесь інформації на екрані та відновіть BIS та SYSTEM (restore both)
1. Пробуйте завантажитися в систему 
	* Майте на увазі, що якщо ваша консоль прошивається Fusée Gelée, то [AutoRCM](/autorcm){:target="_blank"} буде увімкнено
	* Якщо приставка все ще не вантажиться, зробіть [відновлення до заводських налаштувань](/system-wipe)

___

# Наступний крок: [Безпечне оновлення прошивки](/update-fw) 
{: .notice--success}





