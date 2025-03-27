---
lang: ru
permalink: /ru/ftp.html
title: Использование FTP
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}


Эта программа нужна для того, чтобы закидывать в приставку файлы не вынимая карты памяти. Скорость закачки в таком случае будет сильно меньше, но не придется перезапускать консоль и, как следствие, {% include abbr/cfw.txt abbr="прошивку" %}

## Что понадобится

* Запущенная [{% include abbr/cfw.txt abbr="CFW" %}](cfw){:target="_blank"}
* Настроенный и работающий [Homebrew Launcher](hbl){:target="_blank"}
* Свежая версия [ftpd](https://github.com/mtheall/ftpd/releases/latest){:target="_blank"} (**NRO**)

## Инструкция

### Часть I - Установка программы 

1. Выключите Switch и вставьте его карту памяти в ПК 
1. Скопируйте `.nro`-файл ftpd в папку `switch` в корне карты памяти приставки
1. Вставьте карту памяти в приставку и запустите [{% include abbr/cfw.txt abbr="CFW" %}](cfw){:target="_blank"} 

### Часть II - подключение к FTP-серверу 

Ваш IP-адрес будет показан на экране консоли в верхней строке

Подключитесь к серверу с адресом `указанный-ip:5000` любым удобным для вас способом. 

___

[Закрыть страницу](javascript:window.close();)
{: .notice--success}