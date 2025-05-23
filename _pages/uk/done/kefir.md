---
lang: uk
title: Kefir
permalink: /uk/kefir.html
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}	

## [KEFIR {% include /inc/kefir/version %}](https://github.com/rashevskyv/kefir/releases){:target="_blank"} - скачати останню версію

![kefir](/assets/images/switch/kefir.png){: width="70%"}
{: .text-center}

### Що таке кефір

Це збірник, що складається з модифікованої Atmosphere, необхідних програм і скриптів, які все це встановлюють правильно. Вона була придумана для полегшення встановлення та обслуговування програмного забезпечення на зламаній Nintendo Switch. Зміни, внесені в Atmosphere, спрямовані на підвищення якості користування самою системою.

Основні відмінності від ванільної Atmosphere:
  * Версії кефіру біля версії системи
  * Встановлення exFAT-драйвера карти пам'яті за замовчуванням при оновленні системи
  * Видалення перевірки ACID-підпису для використання хомбрю без патчів
  * Видалення логування системи для запобігання засмічення карти пам'яті та надмірного її використання
  * Перенаправлення сейвів із внутрішньої пам'яті на карту пам'яті при використанні емунанду, щоб зменшити ймовірність їх втрати при виході з ладу емунанду (опціонально)

**Кефір** - **не прошивка**! Це збірка, що складається з прошивки Atmosphere і необхідного мінімуму рекомендованих програм, плагінів, модулів та іншого софту. Детальніше про склад кефіру нижче. Працює на прошивці **{% include /vars/update_version.txt %}** і нижче

{% spoiler Навіщо потрібен кефір? %}

У першу чергу, кефір потрібен для того, щоб спростити життя користувача. Тобто, якщо у користувача стоїть рекомендована версія системного ПЗ і остання версія кефіру, то все повинно у нього працювати. Можна сказати, що користувач знаходиться в контрольованих умовах. Достатньо назвати версію системного ПЗ і кефіру, і відразу стає зрозуміло, що приблизно встановлено в системі.

{% endspoiler %}

{% spoiler Склад кефіру %}

1. **[Kefirosphere](https://github.com/rashevskyv/Kefirosphere)**, форк [Atmosphere](https://github.com/Atmosphere-NX/Atmosphere)
2. **Сігпатчі**. Завдяки ним на Atmosphere можна запускати непідписані (читай: *піратські*) програми та ігри.
3. **Завантажувач [hekate](https://github.com/CTCaer/hekate){:target="_blank"}**. Завдяки завантажувачу ви можете запускати прошивку та інші {% include abbr/uk/payload.txt abbr="пейлоади" %} через зручне меню, створювати та відновлювати резервну копію NAND, робити EmuNAND, отримувати інформацію про стан системи, монтувати карту пам'яті до ПК без витягування її зі свічу, робити перерозмітку карти пам'яті для встановлення інших ОС і багато іншого
4. **Встановлені {% include abbr/uk/payload.txt abbr="пейлоади" %}**:
  * [Lockpick_RCM](https://codeberg.org/rashevskyv/Locktrick/){:target="_blank"} - програма для [дампу ключів приставки](backup-nand#частина-iii---
lang: ukдампимо-ключі){:target="_blank"}
  * [TegraExplorer](https://github.com/rashevskyv/TegraExplorer/){:target="_blank"} - файловий менеджер для Switch у вигляді пейлоада. Аналог GodMode9 для 3DS
5. **Встановлене Homebrew**
  * [DBI](https://github.com/rashevskyv/dbi){:target="_blank"} - програма для [встановлення ігор](/uk/games){:target="_blank"} по USB або з карти пам'яті
  * [{% include /inc/uk/tinfoil.txt %}](http://tinfoil.io){:target="_blank"} - програма, що дозволяє [качати ігри](/uk/tinfoil){:target="_blank"} для приставки прямо з мережі
  * [Kefir Updater](https://github.com/rashevskyv/kefir-updater){:target="_blank"} - програма для оновлення kefir через інтернет
  * [Sphaira](https://github.com/ITotalJustice/sphaira/releases/){:target="_blank"} - середовище для запуску homebrew, скачування тем та додатків на switch, файловий менеджер 
  * [Daybreak](https://github.com/Atmosphere-NX/Atmosphere/tree/0.14.1/troposphere/daybreak){:target="_blank"} - програма для [безпечного оновлення](/uk/update-fw){:target="_blank"} версії системного ПЗ приставки
  * [NXThemes Installer](https://github.com/exelix11/SwitchThemeInjector){:target="_blank"} - менеджер кастомних тем
  * [Linkalho](https://github.com/rdmrocha/linkalho){:target="_blank"} - програма [прив'язки облікового запису](/uk/link-account){:target="_blank"}
6. **Встановлені модулі**. Модулі - це додаткові компоненти, що працюють всередині Atmosphere і дозволяють робити різні круті штуки, наприклад, використання xbox-сумісних контролерів, емуляцію amiibo, розгін тощо. На жаль, SX OS модулі не підтримує
  * [sys-con](https://github.com/o0Zz/sys-con){:target="_blank"} - модуль, що дозволяє підключати до консолі по USB практично будь-які геймпади
  * [Mission Control](https://github.com/ndeadly/MissionControl){:target="_blank"} - модуль, що дозволяє підключати до консолі по bluetooth практично будь-які геймпади
  * [Uberhand](https://github.com/efosamark/Uberhand-Overlay){:target="_blank"} - спеціальне оверлей-меню для взаємодії з системою p підтримкою користувацьких скриптів і модулів
    - Скрипти:
      * **DBI** - зміна локалізації та оновлення програми
      * **Translate Interface** - додаткові переклади інтерфейсу на вибір
      * **Semi-stock** - завантаження в семісток з меню
      * **Reboot і Shutdown** - перезавантаження та вимкнення консолі з меню
    - Модулі:
      - [nx-ovlloader](https://github.com/WerWolv/nx-ovlloader//){:target="_blank"} - процес для роботи з nro через Tesla Menu
      - [ovlEdiZon.ovl](https://github.com/proferabg/EdiZon-Overlay/releases){:target="_blank"} - Модуль для [використання читів](/uk/cheats){:target="_blank"}
      - [ovlSysmodules.ovl](https://github.com/WerWolv/ovl-sysmodules/){:target="_blank"} - Модуль для вмикання та вимикання встановлених системних модулів (наприклад, розгін, emuuibo тощо)

{% endspoiler %}

### Інструкція з встановлення/оновлення kefir

{% spoiler Перше встановлення або встановлення на чисту карту пам'яті %}

1. Скопіюйте в корінь карти пам'яті приставки **вміст** архіву `kefir.zip` з репозиторію {% include /abbr/uk/kefir_git.txt %}
1. Вставте карту пам'яті в Switch
1. [Запустіть приставку у прошивку](/uk/get-started){:target="_blank"}, відповідно до типу вашого зламу. `payload.bin` - пейлоад, який потрібно пробрасувати при запуску приставки через Fusée Gelée, знаходиться в архіві зі збіркою

{% endspoiler %}

{% spoiler Оновлення kefir або перехід з іншої збірки %}


{% spoiler Інструкція з встановлення вручну (всі ОС) %}

### Підключення карти пам'яті приставки до ПК

Якщо ви користувач MacOS, скористайтеся [цими рекомендаціями](/uk/sd-macos){:target="_blank"}, щоб уникнути проблем з картою пам'яті
{: .notice--warning}

Якщо приставка вимкнена, вставте карту пам'яті в ПК, якщо увімкнена, то:
1. Перезавантажте приставку через меню, що викликається утриманням кнопки {% include inc/uk/btn.txt btn="POWER" %}
1. На сплеш-скріні кефіру натисніть кнопку зниження гучності, щоб потрапити в hekate
1. Тепер ви можете вийняти карту пам'яті зі свіча і вставити її в ПК.

При витяганні карти пам'яті в hekate, вам не потрібно буде заново пробрасувати пейлоад, щоб увійти в прошивку. Достатньо вставити карту в консоль і запустити прошивку через меню **Launch**
{: .notice--info}

### Встановлення kefir (всі ОС)

1. Скопіюйте в корінь карти пам'яті приставки **вміст** архіву `kefir.zip` з репозиторію {% include /abbr/uk/kefir_git.txt %}
1. Вставте карту пам'яті назад у Switch
1. В **hekate** виберіть **More configs** -> **Update Kefir**
1. Після закінчення встановлення приставка запуститься в прошивку

Так само ви можете просто вимкнути консоль, дістати з неї карту, скопіювати на неї кефір із заміною, потім вставити карту назад у Switch і увімкнути консоль. У такому випадку автоматично буде запущений скрипт оновлення
{: .notice--warning}

{% endspoiler %}

{% spoiler Оновлення кефіру прямо на приставці (версія кефіру 529 або вище) %}

1. Запустіть [HBL](/uk/hbl){:target="_blank"}
1. Виберіть **Kefir Updater**
    * Потрібне підключення до інтернету!
1. Натисніть "**Оновити Kefir**", натисніть на "**Kefir {% include /inc/kefir/version %}**", виберіть "**Завантажити**"
1. Дочекайтеся закінчення закачування та розпакування, потім натисніть "**Продовжити**". Приставка перезавантажиться в пейлоад, після чого почнеться процес встановлення кефіру
1. Після закінчення встановлення, натисніть будь-яку кнопку для завантаження приставки в прошивку

{% endspoiler %}

{% spoiler Чисте встановлення кефіру (рекомендується при виникненні помилок) %}

1. Видаліть з карти все, крім папок `Nintendo` і `emummc`, якщо такі є
1. Встановіть кефір зручним способом, розказаним вище

{% endspoiler %}

{% spoiler Налагоджувальне встановлення кефіру (рекомендується, якщо просто чисте не допомогло) %}

1. Скопіюйте папки `Nintendo` і `emummc`, якщо такі є, на ПК
1. [Відформатуйте вашу карту](https://format.customfw.xyz) пам'яті в FAT32 і поверніть папки назад
1. Встановіть кефір зручним способом

{% endspoiler %}

{% endspoiler %}

{% spoiler Вирішення проблем %}

При виникненні помилки [NOFAT] або при будь-якій іншій проблемі з оновленням через скрипт `kefir-updater`, скористайтеся встановленням кефіру через `install.bat`:

1. Розпакуйте `kefir.zip` в будь-яке зручне місце **на ПК**, *окрім картки пам'яті приставки*
1. **Вставте в ПК** карту пам'яті приставки
1. Запустіть `install.bat` з папки, в яку ви розпакували `kefir.zip` і вкажіть букву вашої карти пам'яті
1. Дочекайтеся закінчення копіювання
1. Вставте карту в ПК і запустіть прошивку

При виникненні помилки "**Is BEK missing**" вимкніть приставку й увімкніть наново.
{: .notice--warning}

{% endspoiler %}

## Запуск Atmosphere
{% include inc/uk/launch-cfw.txt %}

Якщо після входу в прошивку приставка не бачить карту і вимагає оновити прошивку для її роботи, або просто зависає в чорному екрані після логотипу Nintendo, то на вашій приставці не встановлені драйвери exFAT! Відформатуйте карту пам'яті в [FAT32](https://format.customfw.xyz){: target="blank_"}
{: .notice--warning}

В {% include abbr/uk/hekate.txt abbr="hekate" %} за замовчуванням налаштований автозапуск. Тобто при запуску приставки меню {% include abbr/uk/hekate.txt abbr="hekate" %} не відображатиметься, а запуститься одразу прошивка. Для переходу в меню {% include abbr/uk/hekate.txt abbr="hekate" %} затисніть (VOL-) під час появи сплеш-скріна.
{: .notice--info}

### **Важлива інформація!**

  * Перезавантаження в hekate відбувається прямо з прошивки, через звичайне меню перезавантаження. Просто затисніть (VOL-) під час сплешскріна кефіру
  * Ви можете отримати доступ до своєї карти пам'яті, не виймаючи її з приставки по MTP (**DBI** -> **Run MTP Responder**), або через hekate ({% include inc/uk/sd_hekate.md %}) (не у всіх працює коректно, **неможливо оновити kefir по MTP**)
  * Встановлення та оновлення kefir проводяться однаково!
  * При виникненні помилки "**Is BEK missing**" вимкніть приставку й увімкніть заново.

## Додаткова інформація
* Для роботи з модулями ([sys-con](https://github.com/cathery/sys-con/releases/latest){:target="_blank"}, [Mission Control](https://github.com/ndeadly/MissionControl){:target="_blank"} та ін.) у кефірі встановлений [Uberhand](https://github.com/efosamark/Uberhand-Overlay){:target="_blank"} - спеціальне оверлей-меню для взаємодії з системою. Для його активації натисніть {% include inc/uk/btn.txt btn="L" %} + {% include inc/uk/btn.txt btn="DOWN" %} + {% include inc/uk/btn.txt btn="R3" %}
* Для переходу в semi-stock
  * **З самої прошивки**: перейдіть в [Uberhand](https://github.com/efosamark/Uberhand-Overlay){:target="_blank"} ({% include inc/uk/btn.txt btn="L" %} + {% include inc/uk/btn.txt btn="DOWN" %} + {% include inc/uk/btn.txt btn="R3" %}), натисніть вправо > `Semi-stock`
  * **При запуску консолі**:
    {% include inc/uk/launch-hekate.txt %}
    1. Виберіть `More-configs` > `Semi-stock (blackscreen fix)`
  * Зверніть увагу, що при запуску з прошивки, встановлена тема буде вимкнена, що дозволить уникнути помилок, якщо на консолі різні версії системного ПЗ та емунанду
* Оновити кефір можна за допомогою утиліти **Kefir Updater**
* [Корисні інструкції з використання приставки](/uk/usage){:target="_blank"}
* [FAQ](/uk/faq){:target="_blank"}
* [Проблеми та їх рішення](/uk/troubleshooting){:target="_blank"}

### Розгін
* **Увімкнення**
  Для активації розгону перейдіть в [Uberhand](https://github.com/efosamark/Uberhand-Overlay){:target="_blank"} ({% include inc/uk/btn.txt btn="L" %} + {% include inc/uk/btn.txt btn="DOWN" %} + {% include inc/uk/btn.txt btn="R3" %}), натисніть вправо > `Settings` > `Use overclock`
* **Вимкнення**
  Для активації розгону перейдіть в [Uberhand](https://github.com/efosamark/Uberhand-Overlay){:target="_blank"} ({% include inc/uk/btn.txt btn="L" %} + {% include inc/uk/btn.txt btn="DOWN" %} + {% include inc/uk/btn.txt btn="R3" %}), натисніть вправо > `Settings` > `Disable overclock`

### Режим підтримки 8Гб пам'яті
* **Увімкнення**
  * Для вмикання перейдіть в [Uberhand](https://github.com/efosamark/Uberhand-Overlay){:target="_blank"} ({% include inc/uk/btn.txt btn="L" %} + {% include inc/uk/btn.txt btn="DOWN" %} + {% include inc/uk/btn.txt btn="R3" %}), натисніть вправо > `Settings` > `Enable 8GB support`
* **Вимкнення**
  * Для вимкнення перевстановіть кефір зручними способом

____

### Зміни від минулої версії

{% spoiler  %}

{% include /inc/kefir/changelog %}

{% endspoiler %}

____

[Закрити сторінку](javascript:window.close();)
{: .notice--success}