---
lang: uk
permalink: /uk/downgrade_fw_old.html
title: Даунгрейд и восстановление прошивки в случае, если приставка вышла из строя
author_profile: true
---
{% include toc title="Разделы" %}

Этот гайд для даунгрейда прошивки и для тех, у кого приставка не включается, но цел раздел PRODINFO, либо есть его бекап (атмосфера 0.8.1 и выше бекапит PRODINFO на карту автоматически). Для обновления прошивки воспользуйтесь [этой](/uk/update-fw) инструкцией!

Это ОЧЕНЬ сложный и комплексный метод. ОБЯЗАТЕЛЬНО [сделайте бекап](/uk/backup-nand){:target="_blank"} своей текущей прошивки до того, как начнёте выполнение этого метода. ОБЯЗАТЕЛЬНО. 
{: .notice--danger}

## Что понадобится

* Включите [отображение расширений файлов](https://customfw.xyz/file-extensions-windows){:target="_blank"}, если у вас Windows
* Умение [запускать пейлоады через Fusée Gelée](/uk/fusee-gelee){:target="_blank"}
* Приставка должна быть полностью заряжена!
* Свежая версия пейлоада {% include inc/uk/hekate.txt %}
* [Ключи](/files/keys.zip){:target="_blank"}, одинаковые для всех консолей
* Прошивка **6.1.0**:
	* [ЯД](https://yadi.sk/d/Qaaj2QznA1wc_g){:target="_blank"}
	* [MEGA](https://mega.nz/#!cwVjlCbK!OzSENIs6Z8oNMVJPQFKhQSYu3rre01xRejZNKCkc40o){:target="_blank"}
	* [FEX](https://fex.net/912191309314/1157451339?fileId=1157451383){:target="_blank"}
* Свежая версия [EmmcHaccGen](https://github.com/suchmememanyskill/EmmcHaccGen){:target="_blank"}
	* Требует для работы [.NET SDK 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1){:target="_blank"}
* Свежая версия [memloader](/files/memloader.zip){:target="_blank"}
* Свежая версия [Etcher](https://github.com/resin-io/etcher/releases/latest){:target="_blank"} качайте версию Portable для вашей платформы (для Windows - **exe x86**)
* Свежая версия [HacDiskMount](https://switchtools.sshnuke.net/){:target="_blank"}

## Инструкция

### Часть I - Резервное копирование NAND

Этот пункт нужно делать **обязательно**! Для продолжения работы нам понадобятся уникальные ключи именно вашей приставки! Без шуток! Вероятность, что что-то пойдёт не так много выше нуля, без бекапа вы ничего не сможете исправить. Ну и обязательно нужен дамп ключей. 
{: .notice--danger}

1. Создайте [резервную копию NAND](/uk/backup-nand){:target="_blank"} консоли и поместите её в надёжное место 
1. Установите {% include abbr/uk/kefir_addr.txt %}, если ещё не делали этого

### Часть II - Перепаковка прошивки под вашу систему

1. Установите [.NET SDK 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1){:target="_blank"}
1. Распакуйте `.zip-архив` с [EmmcHaccGen](https://github.com/suchmememanyskill/EmmcHaccGen){:target="_blank"} в удобную папку
1. Положите в папку с `EmmcHaccGen` ваш файл с [ключами](/backup-nand#%D1%87%D0%B0%D1%81%D1%82%D1%8C-iii---
lang: uk%D0%B4%D0%B0%D0%BC%D0%BF%D0%B8%D0%BC-%D0%BA%D0%BB%D1%8E%D1%87%D0%B8){:target="_blank"}
1. Распакуйте `.zip-архив` с прошивкой **6.1.0** в папку `EmmcHaccGen` таким образом, чтобы папка с прошивкой лежала в той же директории, что и `EmmcHaccGen.exe`
1. Откройте файлы `keys.txt` и `prod.keys` (бекап ваших ключей) с помощью программы [notepad++](https://notepad-plus-plus.org/download/v7.6.3.html){:target="_blank"}, который у вас получился в ходе выполнения "Части I"
1. Скопируйте значение строки "**secure_boot_key**" из файла `prod.keys` вместо `XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX` в поле "**secure_boot_key**" в файле `keys.txt`
1. Скопируйте значение строки "**tsec_key**" из файла `prod.keys` вместо `XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX` в поле "**tsec_key**" в файле `keys.txt`

	![]({{ base_path }}/images/screenshots/keys.png) 
	{: .text-center}
	{: .notice--info}
1. Запустите командную строку в папке `EmmcHaccGen` (вызовите контекстное меню с зажатой клавишей Shift, нажав на свободное место в папке, и выберите "**Открыть Командную строку здесь**" или "**Открыть окно PowerShell здесь**")
1. В открывшемся окне наберите:
	* Для powershell: `.\EmmcHaccGen.exe --keys prod.keys --fw 6.1.0`
	* Для командной строки: `EmmcHaccGen.exe --keys prod.keys --fw 6.1.0`
1. Дождитесь окончания перепаковки. В результате вы получите папку `NX-6.1.0-exfat`

### Часть III - Подготовка карты памяти

{% capture notice-6 %}   
**ВНИМАНИЕ!!!** Если вы в процессе выполнения руководства увидите диалоговое окно, с предложением отформатировать диск - **нажмите отмена**!!

![]({{ base_path }}/images/screenshots/format.png) 
{: .text-center}
{% endcapture %}
<div class="notice--danger">{{ notice-6 | markdownify }}</div>

1. Выключите консоль
1. Вставьте карту памяти приставки в ПК
1. Скопируйте **содержимое** `.zip`-архива с [memloader](/files/memloader.zip){:target="_blank"} в **корень** вашей карты памяти, соглашаясь на замену (объединение в macOS)
1. Скопируйте пейлоад `memloader.bin` в папку `bootloader/payloads`
1. Верните карту памяти обратно в Switch
{% include inc/uk/launch-hekate.txt %}
1. Перейдите в меню "**Payloads**"
1. Выберите "**memloader.bin**"

### Часть IV - Загрузка прошивки на устройство 

{% spoiler Монтирование BOOT0 в "LINUX UMS DISK 0" %}

{% include inc/uk/mount_boot.txt

	boot="BOOT0" 

%}

{% endspoiler %}

{% spoiler Загрузка BOOT0/1 %}

1. Установите и запустите Etcher
1. Нажмите "**Select Image**" и выберите `BOOT0.BIN`, который находится в папке `NX-6.1.0-exfat`, которую мы сгенерировали в **Части III**
1. В появившемся окне нажмите "**Continue**"
1. Программа автоматически выберет "**LINUX UMS DISK 0**" во втором пункте
	* Если это не так, нажмите "**Change и выберите его вручную**"

	![]({{ base_path }}/images/screenshots/etcher_boot0.png) 
	{: .text-center}
	{: .notice--info}

1. Нажмите "**Flash!**" и ожидайте окончания закачки
1. Закройте программу
1. Удерживайте кнопку {% include inc/uk/btn.txt btn="POWER" %} 15 секунд, пока не погаснет подсветка экрана Switch
1. **Повторите для BOOT1**

{% endspoiler %}

{% spoiler Монтирование eMMC RAW в "LINUX UMS DISK 0" %}

{% include inc/uk/mount_boot.txt 

	boot="eMMC RAW" 

%}

{% endspoiler %}

{% spoiler Настройка eMMC через HacDiskMount %}

1. Распакуйте [HacDiskMount](https://switchtools.sshnuke.net/){:target="_blank"} в удобную папку
1. Запустите `HacDiskMount.exe` от имени администратора 
1. Выберите  "**File**" -> "**Open Physical**"
1. Выберите `UMS Linux Disk 0 (29.121GiB)`
1. Вы увидите полный список разделов, содержащихся в этом диске

	![]({{ base_path }}/images/screenshots/hdm_disk.png) 
	{: .text-center}
	{: .notice--info}
	
1. Дважды нажмите на `PRODINFO`
1. Откройте файл `prod.keys`, который мы получили при создании дампа ключей в Части I
1. В разделе "**bis_key_00**" есть длинная 64-х символьная последовательность, первые 32 символа - это - "**Crypto**", последние - "**Tweak**". В файле с ключами ключи делятся попарно. В каждой паре есть так же ключ с меткой "**Crypto**" (crypt) и "**Tweak**" (tweak). 

	![]({{ base_path }}/images/screenshots/hdm_key_test.png) 
	{: .text-center}
	{: .notice--info}
	
1. Скопируйте ключи соответственно их меткам  из текстового файла `prod.keys` в окно программы и нажмите кнопку "**Test**"
1. Рядом с кнопкой высветится надпись зелёного цвета (**OK! Enthropy: (tested)**), то ключ скопирован верно - нажмите кнопку "**Save**" и закройте окно (не программу!)
	* Если после тестирования надпись красная - вы скопировали не верную пару!
1. Повторите ту же самую процедуру для разделов `SAFE`, `SYSTEM` и `USER`, прописав им пары "**bis_key_01**", "**bis_key_02**" и "**bis_key_03**" (два последних кюча одинаковые - это нормально) соответственно 
	* Обращайте внимание на результат тестирования и не забывайте нажимать кнопку "**Save**"
1. Дважды нажмите на `PRODINFO`
1. В открывшемся окошке уже будут вбиты ключи. Протестируйте их и удостоверьтесь, что результат зелёный. Закройте окно не сохраняя.

{% endspoiler %}

{% spoiler Перенос образов BCPKG2  %}

1. Дважды нажмите на `BCPKG2-1-Normal-Main`
1. Убедитесь, что поля для ключей пустые. Если это не так, отчистите их
1. В секции "**Restore from file**" нажмите "**Browse**"

	![]({{ base_path }}/images/screenshots/hdm_bcpkg21-nm.png) 
	{: .text-center}
	{: .notice--info}

1. Выберите `BCPKG2-1-Normal-Main.bin`, который находится в папке `NX-6.1.0-exfat`, которую мы сгенерировали в Части III 
1. Нажмите кнопку "**Start**"
1. После окончания загрузки закройте окно (не программу!)
1. Повторите то же самое для `BCPKG2-2-Normal-Sub`, `BCPKG2-3-SafeMode-Main` и `BCPKG2-4-SafeMode-Sub`
	* Убедитесь, что прошиваете файлы с названиями, идентичными названиям разделов!
	* Не забывайте стирать ключи, если таковые будут

{% endspoiler %}

{% spoiler Работа с разделом SAFE  %}

{% include inc/uk/mount.txt 

	mount="SAFE" 

%}
1. Если на диске есть файлы - удалите их все!
1. После окончания отмонтируйте диск, нажав на кнопку "**Unmount**" в окне HacDiskMount

{% endspoiler %}

{% spoiler Работа с разделом SYSTEM %}

{% include inc/uk/mount.txt 

	mount="SYSTEM" 

%}

#### Выберите один из методов: 

##### Метод 1 - Полная инициализация системы

Пойдя этим путём вы удалите все данные из консоли, включая аккаунты, игры и сохранения. Однако этот путь более безопасный и не приведёт к проблемам в дальнейшем

1. Выделите все файлы на диске и удалите их!

##### Метод 2 - Сохранение настроек

Это экспериментальный метод! Он может не сработать при попытке в дальнейшем понизить прошивку!

1. Удалите папку "**Content**"
1. Удалите "**PRF2SAFE.RCV**", если таковой имеется
1. Перейдите в папку `save` и удалите файл `8000000000000047`

#### Копирование файлов в раздел SYSTEM

1. Перейдите в папку `NX-6.1.0-exfat`, которую мы сгенерировали в Части III и скопируйте всё **содержимое** папки `SYSTEM` на смонтированный диск с заменой (**объединить** на macOS)
1. После окончания копирования отмонтируйте диск, нажав на кнопку "**Unmount**" в окне HacDiskMount

{% endspoiler %}

{% spoiler Работа с разделом USER %}

{% include inc/uk/mount.txt 

	mount="USER" 

%}

#### Выберите один из методов: 

##### Метод 1 - Полная инициализация системы

Пойдя этим путём вы удалите все данные из консоли, включая аккаунты, игры и сохранения. Однако этот путь более безопасный и не приведёт к проблемам в дальнейшем

1. Выделите все файлы на диске и удалите их!

##### Метод 2 - Сохранение настроек

1. Удалите "PRF2SAFE.RCV", если таковой имеется

### Копирование файлов в раздел USER

1. Перейдите в папку `NX-6.1.0-exfat`, которую мы сгенерировали в Части III и скопируйте всё **содержимое** папки `USER` на смонтированный диск с заменой (**объединить** на macOS)
1. После окончания копирования отмонтируйте диск, нажав на кнопку "**Unmount**" в окне HacDiskMount
1. Закройте HacDiskMount
1. Выключите Switch, зажав кнопку {% include inc/uk/btn.txt btn="POWER" %} на 15 секунд, пока подсветка экрана не отключится

{% endspoiler %}


### Часть V - AutoRCM

{% include inc/uk/launch-hekate.txt %}
1. Перейдите в раздел "**Tools**" -> "**autoRCM**" и выберите "**Enable AutoRCM**", затем нажмите любую кнопку и выберите "**Back**" для возвращения в главное меню

___

# Следующий шаг: [Безопасное обновление прошивки](/uk/update-fw) 
{: .notice--success}