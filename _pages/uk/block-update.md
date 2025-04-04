---
lang: uk
permalink: /uk/block-update.html
title: Блокировка обновлений и доступа к серверам Nintendo через Incognito (только для Caffeine)
author_profile: true
---
{% include toc title="Разделы" %}

Данная инструкция предназначена в первую очередь для пользователей Caffeine. Если вы используете Fusée Gelée, то вам не нужно выполнять эту инструкцию. Atmosphere всё уже сделала за вас.
{: .notice--info}

{% spoiler Видеоинструкция %}

{% include youtube.html id="gUGulsJzDKM"  %}
{: .text-center}
{: .notice--info}

{% endspoiler %}

* **Плюсы**
    * Не блокирует доступ к серверам Nintendo, а блокирует возможность авторизации на них. То есть при общении с сервером Nintendo сервер попросту не будет воспринимать консоль как Switch 
    * Будет работать даже если Nintendo изменит способ авторизации, адреса серверов или мало ли ещё  что 
    * Не требует дополнительной настройки 

* **Минусы**
    * Требует взаимодействия с системными файлами через приложение, поэтому потенциально опасен
	
## Инструкция

### Блокировка доступа к серверам Nintendo  

1. Создайте [резервную копию NAND](/uk/backup-nand){:target="_blank"} консоли и поместите её в надёжное место, если ещё не делали этого
{% include inc/uk/launch-hekate.txt %}
1. Установите {% include abbr/uk/kefir_addr.txt %} по инструкции, находящейся в его репозитории
    * Если уже делали, не нужно делать повторно
1. Перейдите в меню "**Payloads**"
1. Выберите "**Incognito_RCM.bin**"
1. Выберите "**Backup (SysNAND)**" или "**Backup (EmuMMC)**" в зависимости от того в каком из разделов вы хотите заблокировать доступ к серверам Nintendo
    * Навигация по меню осуществляется кнопками громкости, а выбор кнопкой {% include inc/uk/btn.txt btn="POWER" %}
    * Если вы не используете EmuNAND, выберите SysNAND 
    * Если вы используете EmuNAND для пиратки, а SysNAND для лицензии, выберите EmuNAND
1. Выберите "**Incognito (SysNAND)**" или "**Incognito (EmuMMC)**" в зависимости от того в каком из разделов вы хотите заблокировать доступ к серверам Nintendo
1. Дождитесь окончания установки и нажмите на любую кнопку 
1. Выберите **Power Off**? чтобы выключить приставку
1. Извлеките карту памяти из приставки и вставьте её в ПК
1. Скопируйте `prodinfo_sysnand.bin` из корня карты памяти в надёжное место - это бекап вашего PRODINFO в не изменённом состоянии
1. Запустите приставку
 
### Восстановление доступа к серверам Nintendo  

1. Скопируйте `prodinfo_sysnand.bin` в корень вашей карты 
{% include inc/uk/launch-hekate.txt %}
1. Установите {% include abbr/uk/kefir_addr.txt %} по инструкции, находящейся в его репозитории
    * Если уже делали, не нужно делать повторно
1. Перейдите в меню "**Payloads**"
1. Выберите "**Incognito_RCM.bin**"
1. Выберите "**Restore (SysNAND)**" или "**Restore (EmuMMC)**" в зависимости от того в какой из разделов вы хотите восстановить PRODINFO
1. Дождитесь окончания установки и нажмите на любую кнопку 

___

[Закрыть страницу](javascript:window.close();)
{: .notice--success}