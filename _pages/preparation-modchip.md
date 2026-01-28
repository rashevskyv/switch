---
redirect_from:
  - /uk/preparation-modchip.html
  - /ru/preparation-modchip.html
lang: uk
permalink: /preparation-modchip
title: Чипування Nintendo Switch
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}

У цій частині ми приділимо час налаштуванню світча до та після чипування. Про саме ж чипування добре розказано в офіційних мануалах. Втім, усьому свій час.

На даний момент існує лише один чип - це чип на базі процесора **rp2040** у різних варіаціях. Вони  можуть мати різні назви (**rp2040**, **picofly**, часто можна зустріти й **HWFLY rp2040**, які не мають нічого спільного з HWFLY). Звертайте увагу на маркування процесора, якщо не знаєте, який саме у вас мод-чип. На момент написання цього матеріалу більшість чипів уц продажі будуть саме RP2040. 

Між тим, на вашій консолі можуть стояти і чипи, що були розповсюджені раніше - **SX Core, SX Lite, HWFLY або  InstinctNX**. Всі ці чипи побудовані на однаковій елементній базі і більше не продаються, оскільки у всьому гірші за RP2040

{% spoiler Зовнішній вигляд чипів RP2040 %}

*   Сам процесор:

    ![](/assets/images/switch/modchips/rp2040/chip.png)
    {: .text-center}
    {: .notice--info}

*   Універсальний класичний:

    ![](/assets/images/switch/modchips/rp2040/rp2040.png)
    {: .text-center}
    {: .notice--info}

*   OLED:

    ![](/assets/images/switch/modchips/rp2040/rp_oled.png)
    {: .text-center}
    {: .notice--info}

*   Lite:

    ![](/assets/images/switch/modchips/rp2040/rp_lite.png)
    {: .text-center}
    {: .notice--info}

*   Core:

    ![](/assets/images/switch/modchips/rp2040/rp_core.png)
    {: .text-center}
    {: .notice--info}

*   Інші варіанти:

    ![](/assets/images/switch/modchips/rp2040/other_1.png)
    ![](/assets/images/switch/modchips/rp2040/other_2.png)
    {: .text-center}
    {: .notice--info}

Зверніть увагу маркування процесору, там намальовано логотип RP2040. Елементів на мод-чипі також значно менше, ніж на чипах HWFLY. Часто присутні великі золотисті кнопки. 
{: .notice--warning}

{% endspoiler %}

{% spoiler Зовнішній вигляд чипів HWFLY %}

*   OLED:

    ![](/assets/images/switch/modchips/hwfly/hw_oled.jpg)
    {: .text-center}
    {: .notice--info}

*   Lite:

    ![](/assets/images/switch/modchips/hwfly/hw_lite.jpg)
    {: .text-center}
    {: .notice--info}

*   Core:

    ![](/assets/images/switch/modchips/hwfly/hw_core.png)
    {: .text-center}
    {: .notice--info}

Зверніть увагу на кількість елементів на чипі. Їх значно більше, ніж на чипах на базі RP2040
{: .notice--warning}

{% endspoiler %}

Як правило, в чипі встановлена прошивка старої версії, яка може не працювати або працювати погано на приставках зі свіжою версією системного ПЗ, тому її слід оновити на свіжу версію прошивки - [прошивку для чіпу](https://github.com/hwfly-nx/firmware/releases){:target="_blank"}, яка завантажуватиме будь-який пейлоад, що знаходиться на карті пам'яті під ім'ям `payload.bin`. За великим бажанням, через спеціальну прошивку чипу можна завантажити й SX OS.

<!-- ## Прошивка чипа на HWFLY-NX
Якщо у вас приставка ревізії {% include abbr/uk/mariko.md %}, пропустіть частину з прошивкою чипа.
{% spoiler Прошивка чипа %}

1.  Вставте USB-кабель з комплекту чипа в сам чип
    *   Не переплутайте і не поставте випадково догори ногами. На стрічці кабелю є позначка, де в нього верх, а де низ.
    *   Для SX Core верхом вважається металева основа, на SX Light верх збігається з напрямком кришки процесора. Тобто, після монтажу чипа в приставку, та сторона, яка буде дивитися вгору, і є верхньою.

        ![SX Core ribbon](/assets/images/switch/modchips/core_up.png)![SX Light ribbon](/assets/images/switch/modchips/light_up.png)
        {: .text-center}
        {: .notice--info}

2.  Підключіть чип до ПК кабелем. Якщо стрічка вставлена правильно, світлодіод на чипі засвітиться зеленим.
3.  Відкрийте **диспетчер пристроїв** Windows і дочекайтеся встановлення драйверів. Якщо драйвери встановлені правильно, чип буде видно як "**USB Serial Device**"

    ![](/assets/images/switch/modchips/device_manager.png)
    {: .text-center}
    {: .notice--info}

4.  Скачайте [свіжу версію прошивки для чіпу](https://github.com/hwfly-nx/firmware/releases){:target="_blank"} та розпакуйте в корінь диска `C` вашого ПК.
    *   За шляхом до файлу `flash.bat`, що знаходиться в розпакованому архіві, не повинно бути пробілів або інших символів не латиниці!
5.  Запустіть `flash.bat`
    *   Не відключайте USB-кабель у процесі заливки завантажувача! Інакше ризикуєте отримати брик!
6.  Дочекайтеся закінчення прошивки та натисніть будь-яку кнопку, щоб закрити вікно
    *   Після успішного закінчення прошивки, світлодіод змінить колір на жовто-зелений.

    ![](/assets/images/switch/modchips/done.png)
    {: .text-center}
    {: .notice--info}

{% spoiler Можливі помилки %}

{% spoiler Скрипт завис, нічого не відбувається %}

![](/assets/images/switch/modchips/freeze.png)
{: .text-center}
{: .notice--info}

Таке буває. Наберіться терпіння.

{% endspoiler %}

{% spoiler DFU not found! %}

![](/assets/images/switch/modchips/DFU.png)
{: .text-center}
{: .notice--info}

Windows не встигла встановити драйвери. Спробуйте ще раз. Якщо не допомогло, перезавантажте ПК, спробуйте інший порт, спробуйте інший кабель.

{% endspoiler %}

{% spoiler Failed to read! 6 %}

![](/assets/images/switch/modchips/error6.png)
{: .text-center}
{: .notice--info}

Спробуйте перезапустити скрипт. Пробуйте стільки разів, скільки необхідно, доки не вийде. Якщо не допомогло, перезавантажте ПК, спробуйте інший порт, спробуйте інший кабель.
{% endspoiler %}

{% endspoiler %}

{% endspoiler %} -->

## Встановлення чипа в приставку

1.  Оновіть приставку до останньої версії системного ПЗ через налаштування, перш ніж встановлювати чип
2.  Для встановлення чипа скористайтеся наступними інструкціями
    *   [Універсальний гайд для PicoFLY](https://gbatemp.net/download/a-definitive-picofly-install-guide.37968/){:target="_blank"} універсального типу
    *   Гайд для HWFLY, а також чипів RP2040 з набором шлейфів від HWFLY:
        *   [Звичайний Switch першої або другої ревізії](https://www.sthetix.info/installing-the-sx-core-mod-kit-full-guide/){:target="_blank"}
            *   **Не забудьте змонтувати на чип вашу NAND-пам'ять!**
        *   [Switch Lite](https://www.sthetix.info/installing-the-sx-lite-mod-kit/){:target="_blank"}
        *   [Switch OLED](https://www.sthetix.info/hacking-the-switch-oled/){:target="_blank"}.
3.  Після встановлення чипа переконайтеся, що в приставці немає карти пам'яті, та увімкніть її. Чип заблимає світлодіодом (колір залежить від типу чипа та його прошивки)
    *   Терпляче чекайте. Чип навчається! Навчання може тривати до півгодини.
    *   Якщо у вас rp2040 і при ввімкненні він не блимає світлодіодом, переконайтеся, що ви залили прошивку в чип, як це сказано в [універсальній інструкції](https://gbatemp.net/download/a-definitive-picofly-install-guide.37968/){:target="_blank"} (при підключенні чипа до ПК має відобразитися диск, куди й слід скопіювати прошивку; якщо диск не з'явився, затисніть на чипі кнопку BOOT і, не відпускаючи її, натисніть RESET)
4.  Як тільки блимання припиниться, зверніть увагу на екран консолі, на ньому має відображатися повідомлення, що в приставку не вставлено карту пам'яті
5.  Вимкніть консоль, утримуючи кнопку живлення до тих пір, поки екран не погасне

## Встановлення прошивки в EmuNAND

1.  [Встановлення та запуск Kefir](/kefir){:target="blank_"}
2.  [Резервне копіювання NAND](/backup-nand){:target="blank_"}
3.  [Створення EmuNAND](/emunand){:target="blank_"}
4.  [Прив'язка акаунту](/link-account){:target="blank_"} - останній штрих. Прив'язки акаунту для роботи вимагають деякі ігри
5.  [Запуск ігор](/games){:target="blank_"} - фінальна частина, заради якої все й робилося
6.  [Використання вже прошитої приставки](/usage)

Тепер ви можете використовувати {% include abbr/uk/emunand.md abbr="EmuNAND" %} для гри в піратку, а {% include abbr/uk/sysnand.md abbr="SysNAND" %} для гри в ліцензію.

Категорично не рекомендується використовувати приставки ревізії {% include abbr/uk/mariko.md %} без емунанда. На {% include abbr/uk/mariko.md %} емунанд не опція, а необхідність, оскільки для цієї ревізії немає інструментів, які допоможуть воскресити вашу консоль буквально з будь-якого стану у випадку поломки. Тому запуск приставки без {% include abbr/uk/emunand.md abbr="EmuNAND" %} ми розглядати в посібнику не будемо!
{: .notice--warning}

___

{% spoiler Матеріали для самостійного вивчення %}

{% include inc/uk/additional.txt %}

{% endspoiler %}

{% include inc/uk/final_message.md %}

<script>
	localStorage.setItem('fuse', 1);
</script>





