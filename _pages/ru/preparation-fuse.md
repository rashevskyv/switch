---
lang: ru
permalink: /ru/preparation-fuse.html
title: Подготовка к запуску кастомной прошивки через Fusée Gelée
author_profile: true
---

{% include notices %}

В этом разделе нас ждёт практическое применение теоретических знаний, полученных в прошлый раз. Каждый из пунктов **обязателен** к выполнению, если вы хотите получить максимум от прошивки своей консоли. Каждый из этих пунктов самодостаточен. Если вы по какой-то причине ранее не выполнили любой из них, вы можете вернуться к этому позже.

## Установка прошивки в EmuNAND

1. [Установка и запуск Kefir](/ru/kefir){:target="blank_"}
1. [Резервное копирование NAND](/ru/backup-nand){:target="_blank"}
1. [Создание EmuNAND](/ru/emunand){:target="blank_"}
1. [Обновление SysNAND до рекомендуемой версии системного ПО](/ru/update-fw){:target="blank_"}
1. [Привязка аккаунта](/ru/link-account){:target="blank_"} - последний штрих. Привязки аккаунта для работы требуют некоторые игры
1. [Запуск игр](/ru/games){:target="blank_"} - финальная часть, ради которой всё и делалось
1. [Использование уже прошитой приставки](/ru/usage)

Теперь вы можете использовать EmuNAND для игры в пиратку, а SysNAND для игры в лицензию.
{% spoiler Запуск прошивки без использования EmuNAND (не рекомендуется) %}

Вы не сможете пользоваться онлайном даже в купленных играх, до тех пор, пока не перенесёте SysNAND в {% include abbr/ru/emunand.md abbr="EmuNAND" %} [по этой инструкции](/ru/preparation-white){:target="blank_"}, а в SysNAND не восстановите чистый бекап.
{: .notice--danger}

1. [Запуск кастомной прошивки](/ru/cfw){:target="blank_"}
1. [Обновление SysNAND до рекомендуемой версии системного ПО](/ru/update-fw){:target="blank_"}
1. [Привязка аккаунта](/ru/link-account){:target="blank_"} - последний штрих. Привязки аккаунта для работы требуют некоторые игры
1. [Запуск игр](/ru/games){:target="blank_"} - финальная часть, ради которой всё и делалось

{% endspoiler %}

___

{% spoiler Материалы для самостоятельного изучения %}

{% include inc/ru/additional.txt %}

{% endspoiler %}

{% include /inc/ru/final_message.md %}

<script>
	localStorage.setItem('fuse', 1);
</script>