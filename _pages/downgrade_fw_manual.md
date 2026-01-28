---
redirect_from:
  - /uk/downgrade_fw_old.html
  - /ru/downgrade_fw_old.html
lang: uk
permalink: /downgrade_fw_old
title: Даунгрейд та відновлення прошивки у випадку, якщо приставка вийшла з ладу
author_profile: true
---
{% include toc title="Розділи" %}

Цей гайд для даунгрейду прошивки і для тих, у кого приставка не вмикається, але цілий розділ PRODINFO, або є його бекап (атмосфера 0.8.1 і вище бекапить PRODINFO на карту автоматично). Для оновлення прошивки скористайтеся [цією](/update-fw) інструкцією!

Це ДУЖЕ складний і комплексний метод. ОБОВ'ЯЗКОВО [зробіть бекап](/backup-nand){:target="_blank"} своєї поточної прошивки до того, як почнете виконання цього методу. ОБОВ'ЯЗКОВО. 
{: .notice--danger}

## Що знадобиться

* Увімкніть [відображення розширень файлів](https://customfw.xyz/file-extensions-windows){:target="_blank"}, якщо у вас Windows
* Вміння [запускати пейлоади через Fusée Gelée](/fusee-gelee){:target="_blank"}
* Приставка має бути повністю заряджена!
* Свіжа версія пейлоада {% include inc/uk/hekate.txt %}
* [Ключі](/files/keys.zip){:target="_blank"}, однакові для всіх консолей
* Прошивка **6.1.0**:
	* [ЯД](https://yadi.sk/d/Qaaj2QznA1wc_g){:target="_blank"}
	* [MEGA](https://mega.nz/#!cwVjlCbK!OzSENIs6Z8oNMVJPQFKhQSYu3rre01xRejZNKCkc40o){:target="_blank"}
	* [FEX](https://fex.net/912191309314/1157451339?fileId=1157451383){:target="_blank"}
* Свіжа версія [EmmcHaccGen](https://github.com/suchmememanyskill/EmmcHaccGen){:target="_blank"}
	* Потребує для роботи [.NET SDK 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1){:target="_blank"}
* Свіжа версія [memloader](/files/memloader.zip){:target="_blank"}
* Свіжа версія [Etcher](https://github.com/resin-io/etcher/releases/latest){:target="_blank"} качайте версію Portable для вашої платформи (для Windows - **exe x86**)
* Свіжа версія [HacDiskMount](https://switchtools.sshnuke.net/){:target="_blank"}

## Інструкція

### Частина I - Резервне копіювання NAND

Цей пункт потрібно робити **обов'язково**! Для продовження роботи нам знадобляться унікальні ключі саме вашої приставки! Без жартів! Ймовірність, що щось піде не так набагато вища за нуль, без бекапу ви нічого не зможете виправити. Ну і обов'язково потрібен дамп ключів. 
{: .notice--danger}

1. Створіть [резервну копію NAND](/backup-nand){:target="_blank"} консолі та помістіть її в надійне місце 
1. Встановіть {% include abbr/uk/kefir_addr.txt %}, якщо ще не робили цього

### Частина II - Перепакування прошивки під вашу систему

1. Встановіть [.NET SDK 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1){:target="_blank"}
1. Розпакуйте `.zip-архів` з [EmmcHaccGen](https://github.com/suchmememanyskill/EmmcHaccGen){:target="_blank"} у зручну папку
1. Покладіть у папку з `EmmcHaccGen` ваш файл з [ключами](/backup-nand#частина-iii---дампимо-ключі){:target="_blank"}
1. Розпакуйте `.zip-архів` з прошивкою **6.1.0** у папку `EmmcHaccGen` таким чином, щоб папка з прошивкою лежала в тій же директорії, що і `EmmcHaccGen.exe`
1. Відкрийте файли `keys.txt` та `prod.keys` (бекап ваших ключів) за допомогою програми [notepad++](https://notepad-plus-plus.org/download/v7.6.3.html){:target="_blank"}, який у вас вийшов у ході виконання "Частини I"
1. Скопіюйте значення рядка "**secure_boot_key**" з файлу `prod.keys` замість `XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX` у поле "**secure_boot_key**" у файлі `keys.txt`
1. Скопіюйте значення рядка "**tsec_key**" з файлу `prod.keys` замість `XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX` у поле "**tsec_key**" у файлі `keys.txt`

	![](/assets/images/switch/screenshots/keys.png) 
	{: .text-center}
	{: .notice--info}
1. Запустіть командний рядок у папці `EmmcHaccGen` (викличте контекстне меню з затиснутою клавішею Shift, натиснувши на вільне місце в папці, і виберіть "**Відкрити Командний рядок тут**" або "**Відкрити вікно PowerShell тут**")
1. У вікні, що відкрилося, наберіть:
	* Для powershell: `.\EmmcHaccGen.exe --keys prod.keys --fw 6.1.0`
	* Для командного рядка: `EmmcHaccGen.exe --keys prod.keys --fw 6.1.0`
1. Дочекайтеся закінчення перепакування. В результаті ви отримаєте папку `NX-6.1.0-exfat`

### Частина III - Підготовка карти пам'яті

{% capture notice-6 %}   
**УВАГА!!!** Якщо ви в процесі виконання керівництва побачите діалогове вікно з пропозицією відформатувати диск - **натисніть скасувати**!!

![](/assets/images/switch/screenshots/format.png) 
{: .text-center}
{% endcapture %}
<div class="notice--danger">{{ notice-6 | markdownify }}</div>

1. Вимкніть консоль
1. Вставте карту пам'яті приставки в ПК
1. Скопіюйте **вміст** `.zip`-архіву з [memloader](/files/memloader.zip){:target="_blank"} у **корінь** вашої карти пам'яті, погоджуючись на заміну (об'єднати в macOS)
1. Скопіюйте пейлоад `memloader.bin` у папку `bootloader/payloads`
1. Поверніть карту пам'яті назад у Switch
{% include inc/uk/launch-hekate.txt %}
1. Перейдіть у меню "**Payloads**"
1. Виберіть "**memloader.bin**"

### Частина IV - Завантаження прошивки на пристрій 

{% spoiler Монтування BOOT0 в "LINUX UMS DISK 0" %}

{% include inc/uk/mount_boot.txt

	boot="BOOT0" 

%}

{% endspoiler %}

{% spoiler Завантаження BOOT0/1 %}

1. Встановіть та запустіть Etcher
1. Натисніть "**Select Image**" та виберіть `BOOT0.BIN`, який знаходиться в папці `NX-6.1.0-exfat`, яку ми згенерували в **Частині III**
1. У вікні, що з'явилося, натисніть "**Continue**"
1. Програма автоматично вибере "**LINUX UMS DISK 0**" у другому пункті
	* Якщо це не так, натисніть "**Change та виберіть його вручну**"

	![](/assets/images/switch/screenshots/etcher_boot0.png) 
	{: .text-center}
	{: .notice--info}

1. Натисніть "**Flash!**" та очікуйте закінчення завантаження
1. Закрийте програму
1. Утримуйте кнопку {% include inc/uk/btn.txt btn="POWER" %} 15 секунд, поки не згасне підсвічування екрана Switch
1. **Повторіть для BOOT1**

{% endspoiler %}

{% spoiler Монтування eMMC RAW в "LINUX UMS DISK 0" %}

{% include inc/uk/mount_boot.txt 

	boot="eMMC RAW" 

%}

{% endspoiler %}

{% spoiler Налаштування eMMC через HacDiskMount %}

1. Розпакуйте [HacDiskMount](https://switchtools.sshnuke.net/){:target="_blank"} у зручну папку
1. Запустіть `HacDiskMount.exe` від імені адміністратора 
1. Виберіть  "**File**" -> "**Open Physical**"
1. Виберіть `UMS Linux Disk 0 (29.121GiB)`
1. Ви побачите повний список розділів, що містяться в цьому диску

	![](/assets/images/switch/screenshots/hdm_disk.png) 
	{: .text-center}
	{: .notice--info}
	
1. Двічі натисніть на `PRODINFO`
1. Відкрийте файл `prod.keys`, який ми отримали при створенні дампу ключів у Частині I
1. У розділі "**bis_key_00**" є довга 64-символьна послідовність, перші 32 символи - це "**Crypto**", останні - "**Tweak**". У файлі з ключами ключі діляться попарно. У кожній парі є також ключ з міткою "**Crypto**" (crypt) та "**Tweak**" (tweak). 

	![](/assets/images/switch/screenshots/hdm_key_test.png) 
	{: .text-center}
	{: .notice--info}
	
1. Скопіюйте ключі відповідно до їх міток з текстового файлу `prod.keys` у вікно програми та натисніть кнопку "**Test**"
1. Поруч із кнопкою висвітиться напис зеленого кольору (**OK! Enthropy: (tested)**), то ключ скопійований вірно - натисніть кнопку "**Save**" та закрийте вікно (не програму!)
	* Якщо після тестування напис червоний - ви скопіювали не вірну пару!
1. Повторіть ту саму процедуру для розділів `SAFE`, `SYSTEM` та `USER`, прописавши їм пари "**bis_key_01**", "**bis_key_02**" та "**bis_key_03**" (два останні ключі однакові - це нормально) відповідно 
	* Звертайте увагу на результат тестування та не забувайте натискати кнопку "**Save**"
1. Двічі натисніть на `PRODINFO`
1. У вікні, що відкрилося, вже будуть вбиті ключі. Протестуйте їх та переконайтеся, що результат зелений. Закрийте вікно не зберігаючи.

{% endspoiler %}

{% spoiler Перенесення образів BCPKG2  %}

1. Двічі натисніть на `BCPKG2-1-Normal-Main`
1. Переконайтеся, що поля для ключів порожні. Якщо це не так, очистіть їх
1. У секції "**Restore from file**" натисніть "**Browse**"

	![](/assets/images/switch/screenshots/hdm_bcpkg21-nm.png) 
	{: .text-center}
	{: .notice--info}

1. Виберіть `BCPKG2-1-Normal-Main.bin`, який знаходиться в папці `NX-6.1.0-exfat`, яку ми згенерували в Частині III 
1. Натисніть кнопку "**Start**"
1. Після закінчення завантаження закрийте вікно (не програму!)
1. Повторіть те саме для `BCPKG2-2-Normal-Sub`, `BCPKG2-3-SafeMode-Main` та `BCPKG2-4-SafeMode-Sub`
	* Переконайтеся, що прошиваєте файли з назвами, ідентичними назвам розділів!
	* Не забувайте стирати ключі, якщо такі будуть

{% endspoiler %}

{% spoiler Робота з розділом SAFE  %}

{% include inc/uk/mount.txt 

	mount="SAFE" 

%}
1. Якщо на диску є файли - видаліть їх усі!
1. Після закінчення відмонтуйте диск, натиснувши на кнопку "**Unmount**" у вікні HacDiskMount

{% endspoiler %}

{% spoiler Робота з розділом SYSTEM %}

{% include inc/uk/mount.txt 

	mount="SYSTEM" 

%}

#### Оберіть один з методів: 

##### Метод 1 - Повна ініціалізація системи

Пішовши цим шляхом ви видалите всі дані з консолі, включаючи акаунти, ігри та збереження. Однак цей шлях більш безпечний і не призведе до проблем надалі

1. Виділіть всі файли на диску та видаліть їх!

##### Метод 2 - Збереження налаштувань

Це експериментальний метод! Він може не спрацювати при спробі надалі знизити прошивку!

1. Видаліть папку "**Content**"
1. Видаліть "**PRF2SAFE.RCV**", якщо такий є
1. Перейдіть у папку `save` та видаліть файл `8000000000000047`

#### Копіювання файлів у розділ SYSTEM

1. Перейдіть у папку `NX-6.1.0-exfat`, яку ми згенерували в Частині III та скопіюйте весь **вміст** папки `SYSTEM` на змонтований диск із заміною (**об'єднати** на macOS)
1. Після закінчення копіювання відмонтуйте диск, натиснувши на кнопку "**Unmount**" у вікні HacDiskMount

{% endspoiler %}

{% spoiler Робота з розділом USER %}

{% include inc/uk/mount.txt 

	mount="USER" 

%}

#### Оберіть один з методів: 

##### Метод 1 - Повна ініціалізація системи

Пішовши цим шляхом ви видалите всі дані з консолі, включаючи акаунти, ігри та збереження. Однак цей шлях більш безпечний і не призведе до проблем надалі

1. Виділіть всі файли на диску та видаліть їх!

##### Метод 2 - Збереження налаштувань

1. Видаліть "PRF2SAFE.RCV", якщо такий є

### Копіювання файлів у розділ USER

1. Перейдіть у папку `NX-6.1.0-exfat`, яку ми згенерували в Частині III та скопіюйте весь **вміст** папки `USER` на змонтований диск із заміною (**об'єднати** на macOS)
1. Після закінчення копіювання відмонтуйте диск, натиснувши на кнопку "**Unmount**" у вікні HacDiskMount
1. Закрийте HacDiskMount
1. Вимкніть Switch, затиснувши кнопку {% include inc/uk/btn.txt btn="POWER" %} на 15 секунд, поки підсвічування екрана не вимкнеться

{% endspoiler %}


### Частина V - AutoRCM

{% include inc/uk/launch-hekate.txt %}
1. Перейдіть у розділ "**Tools**" -> "**autoRCM**" і виберіть "**Enable AutoRCM**", потім натисніть будь-яку кнопку і виберіть "**Back**" для повернення в головне меню

___

# Наступний крок: [Безпечне оновлення прошивки](/update-fw) 
{: .notice--success}





