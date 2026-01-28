```
---
redirect_from:
  - /uk/rcmloader.html
  - /ru/rcmloader.html
lang: uk
permalink: /rcmloader
title: Інструкція з прошивки донгла RCMLoader
author_profile: true
---
{% include toc title="Розділи" %}

{% spoiler Відеоінструкція %}

{% include youtube.html id="kp_VoNN_7Zk" %}
{: .text-center}
{: .notice--info}

{% endspoiler %}

Інструкція призначена власникам {% include abbr/uk/dongle.txt abbr="донгла" %} RCMLoader і створювалася на підтримку тих, хто купив пристрій у мене. 

![](/assets/images/switch/dongle/rcmloader.jpg)
{: .text-center}
{: .notice--info}

Купити донгл з прошивкою, що найбільш підходить для гайду, можна [тут](http://vk.com/switchopen){:target="_blank"}. Куплений у мене донгл за замовчуванням прошитий таким чином, що завантажуватиме hekate 4, будучи вставленим у приставку. 

## Перепрошивка донгла

1. Підключіть донгл до ПК за допомогою комплектного microUSB-USB кабелю
1. Донгл змонтується як новий диск
1. Покладіть пейлоад `payload.bin` з архіву з кефіром у папку, що відповідає його функції, згідно з таблицею

	![](/assets/images/switch/dongle/rcmloader_table.png)
	{: .text-center}
	{: .notice--info}

1. Від'єднайте {% include abbr/uk/dongle.txt abbr="донгл" %} від ПК
1. Довгим натисканням кнопки {% include inc/uk/btn.txt btn="+" %} перемкніть {% include abbr/uk/dongle.txt abbr="донгл" %} у потрібний режим, згідно з кольором діода та відповідністю його таблиці

## Використання донгла

1. Вимкніть консоль
1. Вставте карту пам'яті в ПК
1. Оновіть {% include abbr/uk/kefir_addr.txt %} за інструкцією з репозиторію, якщо не робили цього раніше
1. Поверніть карту пам'яті в приставку
1. Вставте замикач замість правого джойкона

    ![](/assets/images/switch/dongle/rcmloader_jig.png)
    {: .text-center}
    {: .notice--info}

1. Перемкніть {% include abbr/uk/dongle.txt abbr="донгл" %} на блакитне світло діода за допомогою довгого натискання на кнопку {% include inc/uk/btn.txt btn="+" %}
	* Достатньо виставити один раз
1. Вставте {% include abbr/uk/dongle.txt abbr="донгл" %} в USBtype-C порт світча
1. Утримуючи (VOL+), увімкніть приставку
1. Приставка завантажиться в {% include abbr/uk/cfw.txt abbr="CFW" %}

___

## [Запуск CFW](/cfw)
{: .notice--success}

## [Запуск будь-якого пейлоада через донгл](/fusee-gelee#запуск-через-донгл)
{: .notice--success}
```





