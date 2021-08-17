---
title: Kefir
permalink: /kefir.html
author_profile: true
---
{% include toc title="Разделы" %}

## [KEFIR {% include /inc/kefir/version %}](https://github.com/rashevskyv/kefir){:target="_blank"}

![kefir](/images/kefir.png){: width="70%"}
{: .text-center}

### Что такое кефир

**Кефир** - **не прошивка**! Это сборник, состоящий из прошивки (Atmosphere или SX OS на выбор) и необходимого минимума рекомендуемых программ, плагинов, модулей и другого софта. Подробнее о составе кефира ниже. Работает на прошивке **{% include /vars/update_version.txt %}** и ниже 

{% spoiler Зачем нужен кефир? %}

В первую очередь, кефир нужен для того чтобы упростить жизнь пользователя. То есть, если у пользователя стоит рекомендуемая версия системного ПО и последняя версия кефира, то всё должно у него работать. Можно сказать, что пользователь находится в контролируемых условиях. Достаточно назвать версию системного ПО и кефира и сразу становится понятно что примерно установлено в системе. 

{% endspoiler %}

{% spoiler Состав кефира %}

1. **[Kefirosphere](https://github.com/rashevskyv/Kefirosphere)**, форк [Atmosphere](https://github.com/Atmosphere-NX/Atmosphere)
2. **[Сигпатчи](https://github.com/ITotalJustice/patches/releases){:target="_blank"}**. Благодаря сигпатчам на Atmosphere можно запускать неподписанные (читай: *пиратские*) приложения и игры. 
3. **Загрузчик [hekate](https://github.com/CTCaer/hekate/releases/latest){:target="_blank"}**. Благодаря загрузчику вы можете запускать прошивку и другие {% include abbr/payload.txt abbr="пейлоады" %} через удобное меню, создавать и восстанавливать резервную копию NAND, делать EmuNAND, получать информацию о состоянии системы, монтировать карту памяти к ПК без вытаскивания её из свитча, делать переразметку карты памяти для установки других ОС и многое другое
4. **Установленные {% include abbr/payload.txt abbr="пейлоады" %}**:
  * [Lockpick_RCM](https://github.com/rashevskyv/Lockpick_RCM){:target="_blank"} - программа для [дампа ключей приставки](backup-nand#часть-iii---дампим-ключи){:target="_blank"}
  * [Incognoto_RCM](https://github.com/arch-box/Incognito_RCM/releases){:target="_blank"} - программа, стирающая серийный номер приставки, чтобы [заблокировать обновления и спрятать консоль от Nintendo](https://switch.customfw.xyz/block-update){:target="_blank"}
  * [TegraExplorer](https://github.com/suchmememanyskill/TegraExplorer/releases/){:target="_blank"} - файловый менеджер для Switch в виде пейлоада. Аналог GodMode9 для 3DS
5. **Установленное Homebrew**
  * [DBI](https://github.com/rashevskyv/dbi){:target="_blank"} - программа для [установки игр](games){:target="_blank"} по USB или с карты памяти
  * [{% include /inc/tinfoil.txt %}](http://tinfoil.io){:target="_blank"} - программа, позволяющая [качать игры](tinfoil){:target="_blank"} для приставки прямо из сети 
  <!-- * [FreshHay](https://github.com/devgru/FreshHay/releases){:target="_blank"} - программа для скачивания и распаковки рекомендуемой версии системного ПО прямо на приставке -->
  * [NX-Shell](https://github.com/joel16/NX-Shell/releases/latest){:target="_blank"} - файловый менеджер
  * [NX-Activity-Log](https://github.com/tallbl0nde/NX-Activity-Log/releases/latest){:target="_blank"} - программа, позволяющая отслеживать время, проведённое в играх
  * [JKSV](https://github.com/J-D-K/JKSV/releases){:target="_blank"} - программа для резервного копирования и восстановления сейвов
  * [Kefir Updater](https://github.com/rashevskyv/kefir-updater/releases){:target="_blank"} - программа для обновления kefir через интернет
  * [pplay](https://github.com/Cpasjuste/pplay/releases/latest){:target="_blank"} - видеоплеер 
  * [Daybreak](https://github.com/Atmosphere-NX/Atmosphere/tree/0.14.1/troposphere/daybreak){:target="_blank"} - программа для [безопасного обновления](update-to-latest){:target="_blank"} версии системного ПО приставки
  * [NXThemes Installer](https://github.com/exelix11/SwitchThemeInjector/releases/latest){:target="_blank"} - менеджер кастомных тем 
  <!-- * [switch-cheats-updater](https://github.com/HamletDuFromage/switch-cheats-updater/releases){:target="_blank"} - программа для закачки [читов](cheats){:target="_blank"} для установленных игр. -->
  * [Linkhlo](https://github.com/rdmrocha/linkalho){:target="_blank"} - программа [привязки аккаунта](link-account){:target="_blank"}
6. **Установленные модули**. Модули - это дополнительные компоненты, работающие внутри Atmosphere и позволяющие делать разные крутые штуки, как-то использование xbox-сoвместимых контроллеров, эмуляцию amiibo, разгон и прочее. К сожалению, SX OS модули не поддерживает
  * [sys-con](https://github.com/cathery/sys-con/releases/latest){:target="_blank"} - модуль, позволяющий подключать к консоли по USB практически любые геймпады
  * [Mission Control](https://github.com/ndeadly/MissionControl){:target="_blank"} - модуль, позволяющий подключать к консоли по bluetooth практически любые геймпады
  * [Tesla Overlay Menu](https://github.com/WerWolv/Tesla-Menu/releases){:target="_blank"} - специальное оверлей-меню для взаимодействия с системой
    - [nx-ovlloader](https://github.com/WerWolv/nx-ovlloader/releases/){:target="_blank"} - процесс для работы с nro через Tesla Menu
    - [ovlEdiZon.ovl](https://werwolv.net/downloads/EdiZonOverlay.zip){:target="_blank"} - Модуль для [использования читов](cheats){:target="_blank"}
    - [ovlSysmodules.ovl](https://github.com/WerWolv/ovl-sysmodules/releases){:target="_blank"} - Модуль для включения и отключения установленных системных модулей (как-то разгон, emuuibo и прочее)

{% endspoiler %}

### Инструкция по установке kefir 
{% spoiler Инструкции по автоматической установке (только для Windows) %}

1. Скачайте свежий {% include abbr/kefir_git.txt %} (файл `kefir.zip`)
1. Распакуйте `kefir.zip` в любое удобное место **на ПК**
1. **Вставьте в ПК** карту памяти приставки
1. Запустите `install.bat` из папки, в которую вы распаковали `kefir.zip` и внимательно читайте всё, что написано на экране 
1. Вводите ответы, соответствующие вашей ситуации
    * Если вы используете **Caffeine**, не забудьте выбрать его в **опциях** установщика
1. Дождитесь окончания копирования
1. Продолжайте следовать руководству
{% endspoiler %}

{% spoiler Обновление кефира прямо на приставке (версия кефира 529 или выше) %}

1. Запустите [HBL](hbl){:target="_blank"}
1. Выберите **Kefir Updater**
    * Требуется подключение к интернету!
1. Нажмите "**Обновить Kefir**", нажмите на **Kefir %номер_версии%**, выберите **Загрузить**
1. Дождитесь окончания закачки и распаковки, затем нажмите **Продолжить**. Приставка перезагрузится в пейлоад, после чего начнется процесс установки кефира
1. После окотнчания установки, нажмите любую кнопку для загрузки приставки в кефир 


{% endspoiler %}

{% spoiler Инструкция по установке вручную (все ОС) %}

### Подключение карты памяти приставки к ПК: 

Если вы пользователь MacOS, воспользуйтесь [этими рекомендациями](sd-macos){:target="_blank"}, чтобы избежать проблем с картой памяти
{: .notice--warning}

1. Перезагрузите приставку через меню, вызываемое удерживанием кнопки (POWER) 
1. На сплеш-скрине кефира нажмите кнопку понижения громкости, чтобы попасть в hekate 
1. Теперь вы можете извлечь карту памяти из свитча и вставить её в ПК. При вытаскивании карты памяти в hekate, вам не нужно булет заново пробрасывать пейлоад, чтобы войти в прошивку. Достаточно вставить карту в консоль и запустить прошивку через меню **Launch**

### Установка kefir

1. Удалите из корня вашей карты памяти все папки, кроме папок `emuMMC` и `Nintendo`, если таковые там есть
1. Скопируйте в корень карты памяти приставки **содержимое** архива `kefir.zip` из репозитория {% include /abbr/kefir_addr.txt %}
1. Исправьте атрибуты по инструкции ниже 

### Исправление атрибутов

{% include inc/fixatributes.txt %}

{% endspoiler %}

## Запуск Atmosphere 
{% include inc/launch-cfw.txt %}

Если после входа в прошивку приставка не видит карту и требует обновить прошивку для её работы, либо просто зависает в чёрном экране после логотипа Nintendo, то на вашей приставке не установлены драйвера exFAT! Отформатируйте карту памяти в [FAT32](https://format.customfw.xyz){: target="blank_"}
{: .notice--warning}

В {% include abbr/hekate.txt abbr="hekate" %} по-умолчанию настроен автозапуск. То есть при запуске приставки меню {% include abbr/hekate.txt abbr="hekate" %} не будет отображаться, а запустится сразу прошивка. Для перехода в меню {% include abbr/hekate.txt abbr="hekate" %} зажмите (VOL-) во время появления сплеш-скрина.
{: .notice--info}

### **Важная информация!**

  * Перезагрузка в hekate происходит прямо из прошивки, через обычное меню перезагрузки. Просто зажмите (VOL-) во время сплешскрина кефира
  * Вы можете получить доступ к своей карте памяти не вынимая её из приставки по MTP (**DBI** -> **Run MTP Responder**), либо через hekate ({% include inc/sd_hekate.md %}) (не у всех работает корректно, невозможно обновить приставку таким образом)
  * Установка и обновление kefir проводятся одинаково!

## Дополнительная информация 
* Для работы с модулями ([sys-con](https://github.com/cathery/sys-con/releases/latest){:target="_blank"}, [Mission Control](https://github.com/ndeadly/MissionControl){:target="_blank"} и др.) в кефире установлен [Tesla Overlay Menu](https://github.com/WerWolv/Tesla-Menu/releases){:target="_blank"} - специальное оверлей-меню для взаимодействия с системой. Для его активации нажмите (L) + **крестовина вниз** + (R3)
* Обновить кефир можно с помощью утилиты **Kefir Updater**

____

### Изменения от прошлой версии

{% include /inc/kefir/changelog %}

____

[Закрыть страницу](javascript:window.close();)
{: .notice--success}