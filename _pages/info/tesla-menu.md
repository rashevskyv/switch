---
lang: uk
permalink: /tesla-menu
title: Tesla Overlay Menu
author_profile: true
---

{% include toc title="Розділи" %}

**Tesla-Menu** — це оверлейне меню, розроблене [WerWolv](https://github.com/WerWolv). Його можна порівняти з меню Rosalina на 3DS. Основна мета Tesla-Menu — можливість завантажувати створені спільнотою оверлеї для Homebrew-додатків та системних модулів (sysmodules), до яких можна отримати доступ у будь-який момент

Офіційну сторінку Tesla-Menu на GitHub можна знайти [тут](https://github.com/WerWolv/Tesla-Menu)

> **Залежності**    
> Tesla-Menu залежить від системного модуля під назвою `nx-ovlloader`. Цей модуль відповідає за завантаження `ovlmenu.ovl` з папки `sd:/switch/.overlays`.

### Основні можливості Tesla-Menu:
- Завантаження оверлеїв, створених спільнотою
- Перегляд температури та частот вашого обладнання (потрібен [Status-Monitor-Overlay](https://github.com/masagrator/Status-Monitor-Overlay), що не входить в склад кефіру)
- Зміна конфігурацій системних модулів "на льоту" (якщо підтримується)
- Зміна налаштувань Homebrew-додатків під час гри
- Зручне керування [читами](cheats){:target="_blank"}
- Увімкнення та вимкнення системних модулів

## Як відкрити Tesla-Menu
За замовчуванням Tesla-Menu відкривається комбінацією клавіш {% include inc/btn.txt btn="L" %} + {% include inc/btn.txt btn="R3" %} + {% include inc/btn.txt btn="DOWN" %}

![Tesla Menu](/assets/images/tesla-menu.jpg)

## Зміна комбінації клавіш

Якщо ви бажаєте змінити стандартну комбінацію клавіш, виконайте наступні дії:

1. Перейдіть до папки `sd:/config` на вашій карті пам'яті
2. Створіть папку з назвою `tesla`, якщо вона ще не існує
3. Створіть файл `config.ini` у папці `sd:/config/tesla`
4. Вставте наступний текст у файл `config.ini`:
    ```ini
    [tesla]
    key_combo=L+R+RS
    # Доступні клавіші: A, B, X, Y, LS, RS, L, R, ZL, ZR, PLUS, MINUS, DLEFT, DUP, DRIGHT, DDOWN, SL, SR
    ```
5. Змініть значення `key_combo` на бажане та збережіть файл. Список доступних клавіш наведено у коментарі вище

## Популярні оверлеї для Tesla-Menu
- [EdiZon overlay](https://github.com/proferabg/EdiZon-Overlay) — керування читами (наявний в кефірі)
- [Status-Monitor-Overlay](https://github.com/masagrator/Status-Monitor-Overlay) — моніторинг ресурсів системи
- [QuickNTP](https://github.com/nedex/QuickNTP) — синхронізація часу через інтернет
- [Emuiibo](https://github.com/XorTroll/emuiibo) — емуляція Amiibo (потребує встановленого системного модуля Emuiibo)
- [TriPlayer](https://github.com/DefenderOfHyrule/TriPlayer) — музичний плеєр (потребує встановленого системного модуля TriPlayer)
- [ldn_mitm](https://github.com/DefenderOfHyrule/ldn_mitm) — гра в мережі (потребує встановленого системного модуля ldn_mitm)
- [Fizeau](https://github.com/averne/Fizeau) — налаштування кольоропередачі екрана (потребує встановленого системного модуля Fizeau)

## Вирішення проблем
### Консоль видає помилку при завантаженні після встановлення:

**Причина:** Якщо консоль видає помилку з кодом `2001-0123 (0xf601)` та Title ID `420000000007E51A`, це означає, що Tesla-Menu встановлено некоректно або ви використовуєте застарілу версію. Переконайтеся, що ви використовуєте останню версію `nx-ovlloader` та `Tesla-Menu`, для чого [оновіть кефір](kefir#інструкція-з-встановленняоновлення-kefir){:target="_blank"}

### Консоль видає помилку при відкритті конкретного оверлею:

**Причина:** Якщо помилка `2001-0123 (0xf601)` з Title ID `420000000007E51A` виникає при спробі відкрити оверлей, це означає, що сам оверлей застарілий. Для того щоб його оновити, [оновіть кефір](kefir#інструкція-з-встановленняоновлення-kefir){:target="_blank"}

### Tesla-Menu відображається лише в головному меню, але не в іграх:

**Причина:** Ця проблема зазвичай виникає в режимі док-станції. Переконайтеся, що в налаштуваннях консолі (*System Settings -> TV Output -> Screen size*) встановлено значення 100%. Також перевірте налаштування масштабування на самому телевізорі або моніторі

### Tesla-Menu не відкривається при натисканні комбінації клавіш:

Якщо ви впевнені, що все встановлено правильно, можливо, на файлах встановлено "архівний біт" (часто трапляється при копіюванні файлів з macOS). Спробуйте виправити це через Hekate:
*Tools -> Arch bit • RCM Touch • Pkg1/2 -> Fix Archive Bit*

____

[Закрити сторінку](javascript:window.close();)
{: .notice--success}
