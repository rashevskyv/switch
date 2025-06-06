---
lang: ru
permalink: /ru/cfw.html
title: Кастомные прошивки
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}

В данный момент под кастомной прошивкой понимается официальная прошивка с рядом патчей, которые позволяют запускать не подписанный код и добавляют в прошивку ряд уникальных функций, например {% include abbr/ru/lfs.txt abbr="LayeredFS" %}. Наиболее важными можно считать **Atmosphere**, из которой отпочковались RajNX, ReiNX и SX OS. Последняя, так же как и остальные, базируется на исходных кодах первой и является более дружественной к пользователю. Однако, она не бесплатная. 

Использование любой прошивки в её текущем виде совершенно легально (до тех пор, пока вы не начинаете пиратить, поскольку прошивка разворачивается в оперативной памяти приставки и не меняет никакие файлы официальной прошивки. 

## Atmosphere
[Github](https://github.com/Atmosphere-NX/Atmosphere){:target="_blank"}

Atmosphere - open source проект. Она состоит из пяти основных модулей, каждый из которых наделён своими функциями:

* **Fusée** - загрузчик первого этапа. Он отвечает за запуск и проверку второго этапа (кастомный TrustZone) и package2 (ядро и системные модули), а так же за патчинг их по мере необходимости (**реализован**) 
* **Exosphère** - изменённый TrustZone, необходимый для запуска Secure Monitor (**реализован**)
* **Thermosphère** - модуль, обеспечивающий поддержку EmuNAND (**реализован**)
* **Stratosphère** - изменённые системные модули. Будет что-то типа Rosalina на 3DS, что позволит расширить возможности ядра и предоставит новые функции (**частично реализован**)
* **Troposphère** - патчи для реализации запланированных функций кастомной прошивки. Уровень взаимодействия с приложениями (**не реализован**)

Позволяет устанавливать игры в любом формате, устанавливать к ним обновления, DLC. 

{% spoiler Плюсы %}
+ Бесплатная
+ Постоянно развивается 
+ Умеет запускать образы eShop-игр 
+ Поддерживает {% include abbr/ru/lfs.txt abbr="LayeredFS" %}
+ Поддерживает {% include abbr/ru/emunand.md abbr="EmuNAND" %}, в том числе и переключение между несколькими эмунандами
+ Поддерживает [читы](/ru/cheats){:target="_blank"}
+ Умеет устанавливать игры с USB-носителя
+ С открытым исходным кодом
+ Модульная архитектура (благодаря модулям осуществим разгон, эмуляция amiibo и многое другое)
+ Наиболее защищённая
+ Работает на всех версиях системного ПО
{% endspoiler %}

{% spoiler Минусы %}
+ Не умеет монтировать XCI, но умеет устанавливать 
{% endspoiler %}

{% spoiler Установка Atmosphere %}

### Что понадобится 

* Умение [вводить консоль в режим восстановления (RCM)](fusee-gelee#%D1%87%D0%B0%D1%81%D1%82%D1%8C-i---
lang: ru%D0%B2%D1%85%D0%BE%D0%B4-%D0%B2-rcm){:target="_blank"}
* Свежая версия {% include abbr/ru/kefir_addr.txt %}

### Инструкция

#### Подготовительные работы 

1. Установите {% include abbr/ru/kefir_addr.txt %}, если ещё не делали этого
1. `payload.bin` из `.zip`-архива {% include abbr/ru/kefir_addr.txt %} - это {% include abbr/ru/hekate.txt abbr="hekate" %}

#### Запуск Atmosphere 
{% include inc/ru/launch-cfw.txt %}

Если после входа в прошивку приставка не видит карту и требует обновить прошивку для её работы, либо просто зависает в чёрном экране после логотипа Nintendo, то на вашей приставке не установлены драйвера exFAT! Отформатируйте карту памяти в [FAT32](https://format.customfw.xyz){: target="blank_"}. 
{: .notice--warning}

В {% include abbr/ru/hekate.txt abbr="hekate" %} по-умолчанию настроен автозапуск. То есть при запуске приставки меню {% include abbr/ru/hekate.txt abbr="hekate" %} не будет отображаться, а запустится сразу прошивка. Для перехода в меню {% include abbr/ru/hekate.txt abbr="hekate" %} зажмите (VOL-) во время появления сплеш-скрина.
{: .notice--info}

{% endspoiler %}

{% spoiler Запуск Atmosphere %}
{% include inc/ru/launch-cfw.txt %}

Если после входа в прошивку приставка не видит карту и требует обновить прошивку для её работы, либо просто зависает в чёрном экране после логотипа Nintendo, то на вашей приставке не установлены драйвера exFAT! Отформатируйте карту памяти в [FAT32](https://format.customfw.xyz){: target="blank_"}. 
{: .notice--warning}

В {% include abbr/ru/hekate.txt abbr="hekate" %} по-умолчанию настроен автозапуск. То есть при запуске приставки меню {% include abbr/ru/hekate.txt abbr="hekate" %} не будет отображаться, а запустится сразу прошивка. Для перехода в меню {% include abbr/ru/hekate.txt abbr="hekate" %} зажмите (VOL-) во время появления сплеш-скрина.
{: .notice--info}
{% endspoiler %}

## Обратите внимание

Если вы запустили прошивку в {% include abbr/ru/emunand.md abbr="EmuNAND" %} в первый раз, не забудьте выполнить рекомендации по смене имени на "EmuNAND" и по смене темы на противоположную той, с которой вы загрузились, как это было описано в инструкции по созданию [EmuNAND](/ru/emunand){: target="blank_"}.
Если вы не уверены, что EmuNAND работает, просто перезагрузите приставку и убедитесь, что загрузился {% include abbr/ru/sysnand.md abbr="SysNAND" %}. На это будет указывать другая цветовая схема, а так же иное имя пользователя. 

___

[Закрыть страницу](javascript:window.close();)
{: .notice--success}