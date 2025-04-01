---
lang: uk
permalink: /uk/rcmloader.html
title: Инструкция по прошивке донгла RCMLoader
author_profile: true
---
{% include toc title="Разделы" %}

{% spoiler Видеоинструкция %}

{% include youtube.html id="kp_VoNN_7Zk" %}
{: .text-center}
{: .notice--info}

{% endspoiler %}

Инструкция предназначена владельцам {% include abbr/uk/dongle.txt abbr="донгла" %} RCMLoader и создавалась в поддержку купивших устройство у меня. 

![](/assets/images/switch/dongle/rcmloader.jpg)
{: .text-center}
{: .notice--info}

Купить донгл с прошивкой, наиболее подходящей для гайда можно [здесь](http://vk.com/switchopen){:target="_blank"}. Купленный у меня донгл по-умолчанию прошит таким образом, что будет загружать hekate 4, будучи вставленным в приставку. 

## Перепрошивка донгла

1. Подключите донгл к пк с помощью комплектного microUSB-USB кабеля
1. Донгл смонтируется как новый диск
1. Положите пейлоад `payload.bin` из архива с кефиром в папку, соответствующую его функции, согласно таблице

	![](/assets/images/switch/dongle/rcmloader_table.png)
	{: .text-center}
	{: .notice--info}

1. Отсоедините {% include abbr/uk/dongle.txt abbr="донгл" %} от ПК
1. Длинным нажатием кнопки {% include inc/uk/btn.txt btn="+" %} переключите {% include abbr/uk/dongle.txt abbr="донгл" %} в нужный режим, согласно цвету диода и соответствию его таблице

## Использование донгла

1. Выключите консоль
1. Вставьте карту памяти в ПК
1. Обновите {% include abbr/uk/kefir_addr.txt %} по инструкции из репозитория, если не делали этого ранее
1. Верните карту памяти в приставку
1. Вставьте замыкатель вместо правого джойкона

    ![](/assets/images/switch/dongle/rcmloader_jig.png)
    {: .text-center}
    {: .notice--info}

1. Переключите {% include abbr/uk/dongle.txt abbr="донгл" %} на голубой свет диода, с помощью длинного нажатия на кнопку {% include inc/uk/btn.txt btn="+" %}
	* Достаточно выставить единожды
1. Вставьте {% include abbr/uk/dongle.txt abbr="донгл" %} в USBtype-C порт свитча
1. Удерживая (VOL+) включите приставку
1. Приставка загрузится в {% include abbr/uk/cfw.txt abbr="CFW" %}

___

## [Запуск CFW](/uk/cfw)
{: .notice--success}

## [Запуск любого пейлоада через донгл](/uk/fusee-gelee#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-%D0%B4%D0%BE%D0%BD%D0%B3%D0%BB)
{: .notice--success}