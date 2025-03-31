---
lang: ru
permalink: /ru/autorcm.html
title: AutoRCM
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}	

AutoRCM - на консоли специальным образом изменяется загрузочный сектор, вследствие чего консоль не может загрузиться прямо в систему и загружается автоматически в режим RCM. Достаточно просто включить консоли и она автоматически попадёт в режим восстановления. Не нужно зажимать комбинацию кнопок и использовать замыкатель, но пейлоад для запуска прошивки всё равно передавать нужно!
{: .notice--info}

Если вы используете [Caffeine](caffeine){:target="_blank"}, то вам **ни в коем случае** нельзя использовать AutoRCM! Иначе приставка превратится в кирпич! При любых подозрениях на включенный AutoRCM, удалите его по этой инструкции!
{: .notice--danger}

# Что понадобится

* Умение [запускать пейлоады через Fusée Gelée](fusee-gelee){:target="_blank"}

# Рекомендуемый способ 

## Установка AutoRCM

{% include inc/ru/launch-hekate.txt %}
1. Перейдите в раздел "**Tools**" -> "**Archive bit - AutoRCM**" (внизу экрана) и установите "**AutoRCM**" в положение "**ON**"
1. Нажмите "**Home**" вверху экрана
1. [Запустите](cfw){:target="_blank"} {% include abbr/ru/cfw.txt abbr="кастомную прошивку" %}

___

[Закрыть страницу](javascript:window.close();)
{: .notice--success}

## Отключение AutoRCM 

{% include inc/ru/launch-hekate.txt %}
1. Перейдите в раздел "**Tools**" -> "**Archive bit - AutoRCM**" (внизу экрана) и установите "**AutoRCM**" в положение "**OFF**"
1. Нажмите "**Home**" вверху экрана
1. [Запустите](cfw){:target="_blank"} {% include abbr/ru/cfw.txt abbr="кастомную прошивку" %}

___

[Закрыть страницу](javascript:window.close();)
{: .notice--success}
