---
lang: ru
permalink: /ru/preparation-modchip.html
title: Чиповка Nintendo Switch 
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}

В этой части мы уделим время настройке свитча до и после чиповки. Про саму же чиповку хорошо рассказано в официальных мануалах. Впрочем, всему своё время.

В данный момент существуют чипы двух типов - HWFLY, являющийся клоном чипа SX, и чипы на базе процессора rp2040 в различных вариациях. Последние могут носить разные названия (rp2040, picofly, часто можно встретить и HWFLY rp2040, которые не имеют ничего общего с HWFLY). Обращайте внимание на маркировку процессора, если не знаете какой у вас чип. На момент написания єтого материала большинство чипов будут именно RP2040. Вам так же может попасться чип под маркировкой InstinctNX: по-сути єто тот же HWFLY.

{% spoiler Внешний вид чипов HWFLY %}

* OLED: 

![](/assets/images/switch/modchips/hwfly/hw_oled.jpg)
{: .text-center}
{: .notice--info}

* Lite: 

![](/assets/images/switch/modchips/hwfly/hw_lite.jpg)
{: .text-center}
{: .notice--info}

* Core: 

![](/assets/images/switch/modchips/hwfly/hw_core.png)
{: .text-center}
{: .notice--info}

Обратите внимание на количество элементов на чипе. Их значительно больше, чем на чипах на базе RP2040
{: .notice--warning}

{% endspoiler %}

{% spoiler Внешний вид чипов RP2040 %}

* Сам процессор: 

![](/assets/images/switch/modchips/rp2040/chip.png)
{: .text-center}
{: .notice--info}

* Универсальный классический: 

![](/assets/images/switch/modchips/rp2040/rp2040.png)
{: .text-center}
{: .notice--info}

* OLED: 

![](/assets/images/switch/modchips/rp2040/rp_oled.png)
{: .text-center}
{: .notice--info}

* Lite: 

![](/assets/images/switch/modchips/rp2040/rp_lite.png)
{: .text-center}
{: .notice--info}

* Core: 

![](/assets/images/switch/modchips/rp2040/rp_core.png)
{: .text-center}
{: .notice--info}

* Другие варианты: 

![](/assets/images/switch/modchips/rp2040/other_1.png)
![](/assets/images/switch/modchips/rp2040/other_2.png)
{: .text-center}
{: .notice--info}

Обратите внимание на количество элементов на чипе. Их значительно меньше, чем на чипах HWFLY. Так же зачастую присутствуют большие золотистые кнопки.
{: .notice--warning}

{% endspoiler %}

Как правило в чипе прошивка старой версии, которая может не работать, или работать плохо на приставках со свежей версией системного ПО, потому его следует обновить на свежую версию прошивки - [HWFLY](https://github.com/hwfly-nx/firmware){:target="_blank"}, который будет загружать любой пейлоад, находящийся на карте памяти под именем `payload.bin`. При большом желании, через HWFLY-NX можно загрузить и SX OS. 

<!-- ## Прошивка чипа на HWFLY-NX
Если у вас приставка ревизии {% include abbr/ru/mariko.md %}, пропустите часть с прошивкой чипа. 
{% spoiler  %}

1. Вставьте USB-кабель из комплекта чипа в сам чип
	 * Не перепутайте и не поставьте случайно вверх ногами. На ленте кабеля есть отметка, где у него верх, а где них. 
	 * Для SX Core верхом считается металлическое основание, на SX Light верх совпадает с направлением крышки процессора. То есть, после монтажа чипа в приставку, та сторона, которая будет смотреть вверх и есть верхняя. 

		![SX Core ribbon](/assets/images/switch/modchips/core_up.png)![SX Light ribbon](/assets/images/switch/modchips/light_up.png)
		{: .text-center}
		{: .notice--info}

1. Подключите чип к ПК кабелем. Если лента вставлена правильно, светодиод на чипе засветится зелёным. 
1. Откройте **диспетчер устройств** Windows и дождитесь установки драйверов. Если драйвера установлены верно, чип будет виден как "**USB Serial Device**"

	![](/assets/images/switch/modchips/device_manager.png)
	{: .text-center}
	{: .notice--info}

1. Скачайте [свежую версию прошивки](/files/HWFLY031.zip/firmware){:target="_blank"} из репозитория HWFLY-NX и распакуйте в корень диска `C` вашего ПК.
	* По пути к файлу `flash.bat`, находящемуся в распакованном архиве не должно быть пробелов или других символов не латиницы!
1. Запустите `flash.bat`
	* Не отключайте USB-кабель в процессе заливки загрузчика! Иначе рискуете получить брик!
1. Дождитесь окончания прошивки и нажмите любую кнопку, чтобы закрыть окно 
	* После успешного окончания прошивки, светодиод сменит цвет на желто-зелёный.

	![](/assets/images/switch/modchips/done.png)
	{: .text-center}
	{: .notice--info}

{% spoiler Возможные ошибки %}

{% spoiler Скрипт завис, ничего не происходит %}

![](/assets/images/switch/modchips/freeze.png)
{: .text-center}
{: .notice--info}

Происходит. Наберитесь терпения

{% endspoiler %}

{% spoiler DFU not found! %}

![](/assets/images/switch/modchips/DFU.png)
{: .text-center}
{: .notice--info}

Windows не успела установить драйвера. Попробуйте ещё раз. Если не помогло, перезагрузите ПК, попробуйте другой порт, попробуйте другой кабель

{% endspoiler %}

{% spoiler Failed to read! 6 %}

![](/assets/images/switch/modchips/error6.png)
{: .text-center}
{: .notice--info}

Попробуйте перезапустить скрипт. Пробуйте столько раз, сколько необходимо, до тех пор, пока не получится. Если не помогло, перезагрузите ПК, попробуйте другой порт, попробуйте другой кабель
{% endspoiler %}

{% endspoiler %}

{% endspoiler %}-->

## Установка чипа в приставку 

1. Обновите приставку до последней версии системного ПО чрез настройки, прежде чем устанавливать чип
1. Для установки чипа воспользуйтесь следующими инструкциями
	* [Универсальный гайд для PicoFLY](https://gbatemp.net/download/a-definitive-picofly-install-guide.37968/){:target="_blank"} универсального типа
	* Гайд для HWFLY, а так же чипов RP2040 с набором шлейфов от HWFLY:
		* [Обычный Switch первой или второй ревизии](https://www.sthetix.info/installing-the-sx-core-mod-kit-full-guide/){:target="_blank"}
			* **Не забудьте смонтировать на чип вашу NAND-память!**
		* [Switch Lite](https://www.sthetix.info/installing-the-sx-lite-mod-kit/){:target="_blank"}
		* [Switch OLED](https://www.sthetix.info/hacking-the-switch-oled/){:target="_blank"}.
1. После установки чипа убедитесь, что в приставке нет карты памяти и включите её. Чип замигает светодиодом (цвет зависит от типа чипа и его прошивки)
	* Терпеливо ожидайте. Чип обучается! Обучение может длиться до получаса.
	* Если у вас rp2040 и при включении он не мигает светодиодом, убедитесь что вы залили прошивку в чип, как єто сказано в [универсальной инструкции](https://gbatemp.net/download/a-definitive-picofly-install-guide.37968/){:target="_blank"} (при подключении чипа к ПК должен отобразится диск, куда и следует скопировать прошивку; если диск не появился, зажмите на чипе кнопку BOOT и, не отпуская её, нажмите RESET)
1. Как только мигание прекратится, обратите внимание на экран консоли, на нем должно отображаться сообщение, что в приставку не вставлена карта памяти
1. Выключите консоль, удерживая кнопку питания до тех пор, пока экран не потухнет 

## Установка прошивки в EmuNAND

1. [Установка и запуск Kefir](/ru/kefir){:target="blank_"}
1. [Резервное копирование NAND](/ru/backup-nand){:target="_blank"}
1. [Создание EmuNAND](/ru/emunand){:target="blank_"}
1. [Привязка аккаунта](/ru/link-account){:target="blank_"} - последний штрих. Привязки аккаунта для работы требуют некоторые игры
1. [Запуск игр](/ru/games){:target="blank_"} - финальная часть, ради которой всё и делалось
1. [Использование уже прошитой приставки](/ru/usage)

Теперь вы можете использовать EmuNAND для игры в пиратку, а SysNAND для игры в лицензию.

Категорически не рекомендуется использовать приставки ревизии {% include abbr/ru/mariko.md %} без эмунанда. На Mariko эмунанд не опция, а необходимость, поскольку для этой ревизии нет инструментов, которые помогут воскресить вашу консоль буквально из любого состояния в случае поломки. Поэтому запуск приставки без EmuNAND мы рассматривать в руководстве не будем!
{: .notice--warning}

___

{% spoiler Материалы для самостоятельного изучения %}

{% include inc/ru/additional.txt %}

{% endspoiler %}

{% include /inc/ru/final_message.md %}

<script>
	localStorage.setItem('fuse', 1);
</script>