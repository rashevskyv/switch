---
redirect_from:
  - /uk/preparation-fuse.html
  - /ru/preparation-fuse.html
lang: uk
permalink: /preparation-fuse
title: Підготовка до запуску кастомної прошивки через Fusée Gelée
author_profile: true
---


{% include toc title="Розділи" %}
{% include notices %}	

У цьому розділі на нас чекає практичне застосування теоретичних знань, отриманих минулого разу. Кожен із пунктів **обов'язковий** до виконання, якщо ви хочете отримати максимум від прошивки своєї консолі. Кожен із цих пунктів самодостатній. Якщо ви з якоїсь причини раніше не виконали будь-який із них, ви можете повернутися до цього пізніше.

## Встановлення прошивки в EmuNAND

1. [Встановлення та запуск Kefir](/kefir){:target="blank_"}
1. [Резервне копіювання NAND](/backup-nand){:target="_blank"}
1. [Створення EmuNAND](/emunand){:target="blank_"}
1. [Оновлення SysNAND до рекомендованої версії системного ПЗ](/update-fw){:target="blank_"}
1. [Прив'язка облікового запису](/link-account){:target="blank_"} - останній штрих. Прив'язки облікового запису для роботи потребують деякі ігри
1. [Запуск ігор](/games){:target="blank_"} - фінальна частина, заради якої все й робилося
1. [Використання вже прошитої приставки](/usage)

Тепер ви можете використовувати EmuNAND для гри в піратку, а SysNAND для гри в ліцензію.

## Запуск прошивки без використання EmuNAND (не рекомендується)

{% spoiler %}

Ви не зможете користуватися онлайном навіть у куплених іграх, доти, доки не перенесете SysNAND в {% include abbr/uk/emunand.md abbr="EmuNAND" %} [за цією інструкцією](/preparation-white){:target="blank_"}, а в SysNAND не відновите чистий бекап.
{: .notice--danger}

1. [Запуск кастомної прошивки](/cfw){:target="blank_"}
1. [Оновлення SysNAND до рекомендованої версії системного ПЗ](/update-fw){:target="blank_"}
1. [Прив'язка облікового запису](/link-account){:target="blank_"} - останній штрих. Прив'язки облікового запису для роботи потребують деякі ігри
1. [Запуск ігор](/games){:target="blank_"} - фінальна частина, заради якої все й робилося

{% endspoiler %}

___

## Матеріали для самостійного вивчення

{% spoiler %}

{% include /inc/additional.txt %}

{% endspoiler %}

{% include /inc/final_message.md %}

<script>
    // Встановлюємо значення
    localStorage.setItem('caffeine', "1");
    
    // Видаляємо значення через 1 годину
    setTimeout(function() {
        localStorage.removeItem('caffeine');
    }, 60 * 60 * 1000); // 1 година в мілісекундах
</script>





