---
lang: uk
permalink: /uk/block-update.html
title: Блокування оновлень та доступу до серверів Nintendo через Incognito (тільки для Caffeine)
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}

Ця інструкція призначена насамперед для користувачів Caffeine. Якщо ви використовуєте Fusée Gelée, то вам не потрібно виконувати цю інструкцію. Atmosphere все вже зробила за вас.
{: .notice--info}

*   **Плюси**
    *   Не блокує доступ до серверів Nintendo, а блокує можливість авторизації на них. Тобто при спілкуванні з сервером Nintendo сервер просто не сприйматиме консоль як Switch
    *   Працюватиме навіть якщо Nintendo змінить спосіб авторизації, адреси серверів або ще щось
    *   Не потребує додаткового налаштування

*   **Мінуси**
    *   Вимагає взаємодії з системними файлами через додаток, тому потенційно небезпечно

## Інструкція

### Блокування доступу до серверів Nintendo

1.  Створіть [резервну копію NAND](/uk/backup-nand){:target="_blank"} консолі та помістіть її в надійне місце, якщо ще не робили цього
{% include inc/uk/launch-hekate.txt %}
2.  Встановіть {% include abbr/uk/kefir_addr.txt %} за інструкцією, що знаходиться в його репозиторії
    *   Якщо вже робили, не потрібно робити повторно
3.  Перейдіть до меню "**Payloads**"
4.  Виберіть "**Incognito_RCM.bin**"
5.  Виберіть "**Backup (SysNAND)**" або "**Backup (EmuMMC)**" залежно від того, в якому з розділів ви хочете заблокувати доступ до серверів Nintendo
    *   Навігація по меню здійснюється кнопками гучності, а вибір кнопкою {% include inc/uk/btn.txt btn="POWER" %}
    *   Якщо ви не використовуєте EmuNAND, виберіть SysNAND
    *   Якщо ви використовуєте EmuNAND для піратки, а SysNAND для ліцензії, виберіть EmuNAND
6.  Виберіть "**Incognito (SysNAND)**" або "**Incognito (EmuMMC)**" залежно від того, в якому з розділів ви хочете заблокувати доступ до серверів Nintendo
7.  Дочекайтеся закінчення встановлення та натисніть будь-яку кнопку
8.  Виберіть **Power Off**, щоб вимкнути приставку
9.  Вийміть карту пам'яті з приставки та вставте її в ПК
10. Скопіюйте `prodinfo_sysnand.bin` з кореня карти пам'яті в надійне місце - це бекап вашого PRODINFO в незміненому стані
11. Запустіть приставку

### Відновлення доступу до серверів Nintendo

1.  Скопіюйте `prodinfo_sysnand.bin` в корінь вашої карти пам'яті
{% include inc/uk/launch-hekate.txt %}
2.  Встановіть {% include abbr/uk/kefir_addr.txt %} за інструкцією, що знаходиться в його репозиторії
    *   Якщо вже робили, не потрібно робити повторно
3.  Перейдіть до меню "**Payloads**"
4.  Виберіть "**Incognito_RCM.bin**"
5.  Виберіть "**Restore (SysNAND)**" або "**Restore (EmuMMC)**" залежно від того, в який з розділів ви хочете відновити PRODINFO
6.  Дочекайтеся закінчення встановлення та натисніть будь-яку кнопку

___

[Закрити сторінку](javascript:window.close();)
{: .notice--success}