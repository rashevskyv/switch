---
lang: uk
title: "Переход с SXOS на Atmosphere"
permalink: /uk/migrate
author_profile: true
---

{% include toc title="Разделы" %}

{% spoiler Зачем переходить на Atmosphere? %}

В октябре 2020 года [были арестованы два лидера Xecuter Team](https://www.theverge.com/2020/10/2/21499297/team-xecuter-selling-nintendo-hacks-arrested-charged-fraud){:target="_blank"} - кампании, занимавшейся разработкой и поддержкой SXOS, а так же производством чипов для модификации приставок с закрытой уязвимостью. 

1-го декабря 2020 года в свет выходит обновление системного ПО Switch под версией 11.0.0 и уже спустя 5 дней команда SXOS выпустила прошивку с поддержкой этого обновления. Казалось бы, всё идёт хорошо и несмотря на аресты, TX всё ещё работают. 

Однако, примерно в это же время, все китайские площадки, продававшие чипы в один голос начали говорить о том, что чипы у них закончились и перспективы производства новых партий весьма призрачны. Так же начали распространяться слухи о том, что все производственные фабрики чипов закрыты, а продукция конфискована. Штат сотрудников разогнан, а запрет на продажу чипов пущен чуть ли не из верхушки коммунистической партии Китая. Во что не так уж и сложно поверить, если вспомнить, что мощнейшая корпорация Tencent является официальным дистрибутором продукции Nintendo в Китае. 

Последней же каплей, подтверждающей, что злые языки, вероятно, правы, стал выход прошивки 11.0.1, которая на момент написания этой заметки до сих пор не работает на SXOS. 

Стоит отметить, что 11.0.1 обновление минорное и Atmosphere буквально к вечеру того же дня уже с ним работала. 

В начале 2021 года вышла Atmosphere 0.17.0, которая уже полностью поддерживала работу на чипованных приставках, так что теперь можно уже и не ждать новых версий SXOS - это просто уже не нужно. 

{% endspoiler %}

## Переход из SX на Atmosphere

{% spoiler Видеоинструкция %}

{% include youtube.html id="LQK_U6LSLIo" %}
{: .text-center}
{: .notice--info}

{% endspoiler %}

### Часть I - Подготовительные работы

Если ваша приставка не запускается, например, после обновления sysnand через настройки, то сразу переходите к **части II**
{: .notice--warning}

1. Выполните резервное копирование сохранений по [этой инструкции](/uk/backup-saves.html){:target="_blank"}
	+ Если вам не нужны сохранения, можете пропустить. Если нужны, делать **обязательно**
1. Запустите ваш текущий эмунанд и запомните какая там версия системного ПО (**Системные настройки** -> **Система** -> **Текущая версия системы**)
	* Эта информация пригодится вам, если эмунанд нормально не заработает на Atmosphere. В таком случае, вам придётся генерировать чистые буты. 
1. Если у вас Switch Lite или приставка второй ревизии (Mariko), проделайте следующие действия, если нет, пропустите их и переходите к следующему пункту:
	* Напоминаю, что приставки второй ревизии имеют серийные номера со второй буквой **K**, например **XKJ**, **XKW** и т. п.
	1. Включите приставку, удерживая кнопку повышения громкости, пока не появится меню SXOS 
	1. Перейдите в "**Options**" -> "**SX Core**" -> "**Cleanup**", затем выберите **Power Off** и **не включайте** приставку, пока не установите кефир!
1. Вставьте карту памяти приставки в ПК 
1. Установите свежий {% include abbr/uk/kefir_addr.txt %}
1. Дождитесь окончания установки, затем верните карту памяти в консоль

### Часть II - Миграция Emunand 

Если вы не знаете есть ли у вас {% include abbr/uk/emunand.md abbr="EmuNAND" %}, вставьте карту памяти в ПК и посмотрите есть ли в папке `sxos` папка `emunand`. Если пака есть - у вас есть эмунанд 
{: .notice--info}

1. Включите консоль 
1. **Если у вас был EmuNAND** (если не было, то достаточно просто установки кефира), на заставке кефира **нажмите кнопку понижения громкости**, чтобы попасть в hekate 	
	1. Перейдите в "**emuMMC**"
	1. Нажмите "**Migrate emuMMC**"
	1. Выберите "**Emunand**" -> "**Continue**"
	1. После окончания миграции, нажмите "**Change emuMMC**" и в правой части экрана выберите "**emuMMC/EF00**" (вместо EF могут быть другие буквы)
	1. Нажмите "**ОК**"
		* Теперь при запуске приставки она автоматически будет запускать emuMMC. 
		* Чтобы попасть в официальную прошивку, запустите **hekate -> Launch -> Full Stock**
		* Чтобы попасть в пиратскую прошивку, запустите **hekate -> Launch -> Atmosphere**. Будет запущен Emunand. 
		* Если Emunand запускается с ошибкой, либо долго висит на черном экране, обратитесь к разделу [проблемы и их решения](/uk/#проблемы-и-их-решения){:target="_blank"} внизу страницы

### Часть III - Бекап прошивки и ключей

Пропустите, если у вас уже есть бекап прошивки и ключей.
{: .notice--warning}

1. Выключите консоль
1. Вставьте карту памяти приставки в ПК 
1. Скопируйте папку `emuMMC/eMMC` из корня вашей карты памяти на ПК. Это ваш эмунанд. Он идентичен бекапу, поэтому нет никакого смысла создавать бекап отдельно 
	* Если такой папки нет, то у вас нет EmuNAND, тогда сделайте бекап согласно это [инструкции](/uk/backup-nand){:target="_blank"}
1. Сделайте бекап ключей, согласно [этой инструкции](backup-nand#часть-ii---
lang: ukдампим-ключи){:target="_blank"}
1. Перейдите в папку `sd:/switch` и скопируйте файлы `prod.keys` и `partialaes.keys` (если есть) в ту же папку, в которую вы скопировали ваш бекап

Поместите бекап в надёжное место, желательно в несколько разных. И в облако. И на флешку какую-либо. Не потеряйте его!
{: .notice--danger}

### Часть IV - Завершение миграции

1. Попробуйте запустить SysNAND (**hekate** -> "**More Configs**" -> "**Full Stock**"). Если он не запускается, обратитесь к разделу [проблемы и их решения](/uk/#проблемы-и-их-решения){:target="_blank"} внизу страницы
1. [Обновите Emunand](/uk/update-fw){:target="_blank"} до системного ПО версии **{% include /vars/update_version.txt %}**

## Проблемы и их решения

{% spoiler Черный экран при запуске SysNAND %}

1. Выключите приставку, удерживая 30 секунд кнопку питания 
1. Вставьте карту памяти приставки в ПК 
1. Скачайте {% include vars/sxos.txt %}
1. Поместите скачанный `boot.dat` в корень карты памяти с заменой, вставьте КП в консоль 
1. Включите консоль, удерживая кнопку повышения громкости, чтобы попасть в меню загрузчика SX OS
1. Перейдите в "**Options**" -> "**SX Core** / **SX Lite**", затем выберите "**Cleanup**" -> "**Continue**"
7. Перейдите в "**Payloads**" -> `payload.bin`"`, затем выберите "**Launch**". Должен загрузиться SysNAND.

Теперь установите {% include abbr/uk/kefir_addr.txt %} ещё раз. Последующие запуски kefir будет запускаться автоматически сразу при включении приставки.
{: .notice--info}

{% endspoiler %}

{% spoiler Восстановление BOOT / Черный экран при запуске EmuNAND / Ошибки при запуске EmuNAND, связанные с boot %}

Сперва попробуйте запустить SysNAND и выполняйте нижеследующую инструкцию только если SysNAND запускается! Если нет, сперва решите эту проблему, а затем вернитесь к выполнению этой инструкции!
{: .notice--warning}

#### Если SysNAND и EmuNAND одной версии: 
1. Включите консоль 
1. На заставке кефира **нажмите кнопку понижения громкости**, чтобы попасть в hekate 
1. Перейдите в "**Tools**" -> "**Backup eMMC**" -> "**eMMC BOOT0 & BOOT1**"
1. Нажмите "**Close**", "**Close**", перейдите в "**Home**" и нажмите "**Power Off**", подтвердите выключение
1. Вставьте карту памяти приставки в ПК 
1. Перейдите в папку `sd:\backup\%emmc_id%`, где **%emmc_id%** - уникальный номер для каждой отдельной приставки.
1. Скопируйте `BOOT0` и `BOO1` из этой папки в папку `emuMMC\ED00\eMMC` с заменой
1. Пробуйте запустить эмунанд. 

#### Если не помогло или версии SysNAND и EmuNAND разные: 

{% spoiler Как узнать версию своего emunand:  %}

1. Запустите {% include abbr/uk/hekate.txt abbr="hekate" %}
1. Запустите **TegraExplorer** (**Payloads** -> `TegraExplorer.bin`)
1. Запустите `FW_version.te` (**Launch script**)
1. Дождитесь появления версии Sys и EmuNAND на экране

{% endspoiler %}

1. [Снимите копию ключей вашей приставки](backup-nand#часть-ii---
lang: ukдампим-ключи){:target="_blank"}
1. Вставьте карту памяти приставки в ПК 
1. Скачайте [reBoot.zip](/files/reBoot.zip){:target="_blank"}
1. [Скачайте прошивку](https://darthsternie.net/switch-firmwares/){:target="_blank"}, соответствующую **текущей версии прошивки вашего emunand**
1. Распакуйте архив с прошивкой в папку `firmware` на вашем ПК 
1. Поместите файлы из архива [reBoot.zip](/files/reBoot.zip){:target="_blank"} в папку `firmware`
1. Поместите в папку `firmware` ваш файл с ключами (`prod.keys`)
1. Запустите `recreate_boot_by_yoti.bat`. После окончания работы программы вы получите файлы `BOOT0_ERISTA`, `BOOT0_MARIKO`, `BOOT1_ERISTA`, `BOOT1_MARIKO`
1. Определите какой ревизии ваша приставка (**Erista** или **Mariko**) и переименуйте файлы, соответствующие вашей ревизии в `BOOT0` и `BOOT1`
	* Если серийник вашей консоли начинается на **XK**, то у вас **Mariko**. В остальных случаях - **Erista** (**XAW, XAJ, XAK итп.**)
		* Серийный номер приставки находится в **Системных настройках =- Система =- Серийные номера**, самый первый серийник. Он же находится рядом с разъемом для зарядки на нижней грани планшета. 
	* Switch Lite всегда Mariko 
1. Скопируйте `BOOT0` и `BOO1` для вашей ревизии в папку `emuMMC\ED00\eMMC` с заменой
	* Вместо `ED00` в пути может быть как `SD01` так и любые другие сочетания из двух букв и двух чисел
	* Теперь при запуске приставки она автоматически будет запускать emuMMC. 
	* Чтобы попасть в официальную прошивку, запустите **hekate** -> "**Launch**" -> "**Full Stock**"

Если не помогло, вам придётся [создавать новый EmuNAND](/uk/emunand){:target="_blank"}
{: .notice--info}

Теперь установите {% include abbr/uk/kefir_addr.txt %} ещё раз. Последующие запуски kefir будет запускаться автоматически сразу при включении приставки.
{: .notice--info}


{% endspoiler %}

{% spoiler Ошибка "Pkg1 decryption failed! Is BEK Missing?" %}

Выключите и включите приставку. Перезагрузка не поможет. Необходимо именно полное отключение. 
{% endspoiler %}

{% spoiler У меня другая ошибка %}

Расскажите об этом в [группе](http://tg.customfw.xyz). **Обязательно** приложите скриншот ошибки, версию своей приставки (если не знаете какая - серийник), как запускается прошивка (чип (если да, то какой), донгл (если да, то какой), ещё как-то), версию системного ПО, наличие EmuNAND, что именно выдает ошибку - EmuNAND или SysNAND, версию кефира, после чего возникает ошибка. 
Отсутствие **любого** из этих пунктов приведет к тому, что ваш пост удалят или проигнорируют. 

{% endspoiler %}

{% spoiler Не могу запустить HBL %}

В Atmosphere HBL запускается, удерживая {% include inc/uk/btn.txt btn="R" %} при запуске альбомов. Подробнее - [Homebrew Launcher](/uk/hbl){:target="_blank"}

{% endspoiler %}