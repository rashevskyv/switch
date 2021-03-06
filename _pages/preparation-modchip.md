---
permalink: /preparation-modchip.html
title: Чиповка Nintendo Switch 
author_profile: true
---

{% include toc title="Разделы" %}

В этой части мы уделим время настройке свитча до и после чиповки. Про саму же чиповку хорошо рассказано в официальных мануалах. Впрочем, всему своё время.

Изначально в чип зашит загрузчик от SX OS, который предназначен в первую очередь для запуска, собственно, SX OS. Поскольку эта система уже не поддерживается ни разработчиками, ни руководством, мы перезапишем загрузчик на открытый - [Spacecraft-NX](https://github.com/Spacecraft-NX/firmware){:target="_blank"}, который будет загружать любой пейлоад, находящийся на карте памяти под именем `payload.bin`. При большом желании, через Spacecraft можно загрузить и SX OS. 

## Прошивка чипа на Spacecraft-NX
Если у вас {% include abbr/mariko.md %}, пропустите часть с прошивкой чипа. 
{% spoiler  %}

1. Вставьте USB-кабель из комплекта чипа в сам чип
	 * Не перепутайте и не поставьте случайно вверх ногами. На ленте кабеля есть отметка, где у него верх, а где них. 
	 * Для SX Core верхом считается металлическое основание, на SX Light верх совпадает с направлением крышки процессора. То есть, после монтажа чипа в приставку, та сторона, которая будет смотреть вверх и есть верхняя. 

		![SX Core ribbon](/images/modchips/core_up.png)![SX Light ribbon](/images/modchips/light_up.png)
		{: .text-center}
		{: .notice--info}

1. Подключите чип к ПК кабелем. Если лента вставлена правильно, светодиод на чипе засветится зелёным. 
1. Откройте **диспетчер устройств** Windows и дождитесь установки драйверов. Если драйвера установлены верно, чип будет виден как "**USB Serial Device**"

	![](/images/modchips/device_manager.png)
	{: .text-center}
	{: .notice--info}

1. Скачайте [release_0.1.0.zip](https://github.com/Spacecraft-NX/firmware/releases/latest){:target="_blank"} из репозитория Spacecraft-NX и распакуйте в корень диска `C` вашего ПК.
	* По пути к файлу `flash.bat`, находящемуся в распакованном архиве не должно быть пробелов или других символов не латиницы!
1. Запустите `flash.bat`
	* Не отключайте USB-кабель в процессе заливки загрузчика! Иначе рискуете получить брик!
1. Дождитесь окончания прошивки и нажмите любую кнопку, чтобы закрыть окно 
	* После успешного окончания прошивки, светодиод сменит цвет на желто-зелёный.

	![](/images/modchips/done.png)
	{: .text-center}
	{: .notice--info}

{% spoiler Возможные ошибки %}

{% spoiler Скрипт завис, ничего не происходит %}

![](/images/modchips/freeze.png)
{: .text-center}
{: .notice--info}

Происходит. Наберитесь терпения

{% endspoiler %}

{% spoiler Spacecraft-NX DFU not found! %}

![](/images/modchips/DFU.png)
{: .text-center}
{: .notice--info}

Windows не успела установить драйвера. Попробуйте еще раз. Если не помогло, перезагрузите ПК, попробуйте другой порт, попробуйте другой кабель

{% endspoiler %}

{% spoiler Failed to read! 6 %}

![](/images/modchips/error6.png)
{: .text-center}
{: .notice--info}

Попробуйте перезапустить скрипт. Пробуйте столько раз, сколько необходимо, до тех пор, пока не получится. Если не помогло, перезагрузите ПК, попробуйте другой порт, попробуйте другой кабель
{% endspoiler %}

{% endspoiler %}

{% endspoiler %}

## Установка чипа в приставку 

1. Обновите приставку до последней версии системного ПО чрез настройки, прежде чем устанавливать чип
1. Воспользуйтесь официальной инструкцией для установки чипа в приставку для [полноразмерного Switch](https://drive.google.com/open?id=1QI68FoAY9eFNz1wxMvAN1og1sQ1wgwSL){:target="_blank"} или [Switch Lite](https://drive.google.com/open?id=1Q8H2FwMVk1GwQBM2gLVjhCRTymx20Of_){:target="_blank"}.
	* Не забудьте смонтировать NAND на чип, если у вас SX Core!
1. После установки чипа убедитесь, что в приставке нет карты памяти и включите её. Чип замигает желтым цветом (ближе к зелёному на самом деле, если чип не прошивался Spacecraft, то зелёным)
	* Терпеливо ожидайте. Чип обучается! Обучение может длиться до получаса.
1. Как только мигание прекратится, обратите внимание на экран консоли, на нем должно отображаться сообщение, что в приставку не вставлена карта памяти
1. Выключите консоль, удерживая кнопку питания до тех пор, пока экран не потухнет 

## Установка прошивки в EmuNAND

1. [Установка и запуск Kefir](kefir){:target="blank_"}
1. [Резервное копирование NAND](backup-nand){:target="_blank"}
1. [Создание EmuNAND](emunand){:target="blank_"}
1. [Привязка аккаунта](link-account){:target="blank_"} - последний штрих. Привязки аккаунта для работы требуют некоторые игры
1. [Запуск игр](games){:target="blank_"} - финальная часть, ради которой всё и делалось
1. [Использование уже прошитой приставки](usage)

Теперь вы можете использовать EmuNAND для игры в пиратку, а SysNAND для игры в лицензию.

Категорически не рекомендуется использовать приставки ревизии {% include abbr/mariko.md %} без эмунанда. На Mariko эмунанд не опция, а необходимость, поскольку для этой ревизии нет инструментов, которые помогут воскресить вашу консоль буквально из любого состояния в случае поломки. Поэтому запуск приставки без EmuNAND мы рассматривать в руководстве не будем!
{: .notice--warning}

___

{% spoiler Материалы для самостоятельного изучения %}

{% include inc/additional.txt %}

{% endspoiler %}

{% include /inc/final_message.md %}

<script>
	localStorage.setItem('fuse', 1);
</script>