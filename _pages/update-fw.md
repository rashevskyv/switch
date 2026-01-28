---
redirect_from:
  - /uk/update-fw.html
  - /ru/update-fw.html
lang: uk
permalink: /update-fw
title: Безпечне оновлення прошивки 
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}

Нижченаведена інструкція підходить для оновлення системного ПЗ в Atmosphere, тобто в піратській прошивці незалежно від того в {% include abbr/sysnand.md abbr="SysNAND" %} вона у вас встановлена, або в {% include abbr/emunand.md abbr="EmuNAND" %}. Якщо вам потрібно оновити системне ПЗ в офіційній прошивці, ви можете зробити це через Semi-Stock, за допомогою Daybreak, методом, описаним нижче, або через налаштування офіційним способом. Це безпечно.
{: .notice--info}

## Важлива інформація

Цей посібник підходить і для пониження прошивки. Пам'ятайте, що в разі пониження прошивки є шанс, що понижена прошивка не запуститься. У такому випадку вам буде необхідно [відновлювати прошивку вручну](/downgrade_fw). **Обов'язково** [робіть бекап](/backup-nand){:target="_blank"}, перш ніж понижувати прошивку!.

Дотримуйтесь інструкції саме в тому порядку, в якому вона написана: спочатку оновлення кефіру, потім оновлення системного ПЗ! Інакше, приставка просто не запуститься. Якщо з якоїсь безглуздої причини, ви оновили системне ПЗ, але не оновили кефір, оновіть кефір!
{: .notice--warning}

## Теоретична частина

Якщо ви хочете отримати підтримку {% include abbr/exfat.txt %} або {% include abbr/sdhc.txt %}, повністю дотримуйтесь цього посібника, навіть якщо у вас і так вже остання прошивка. Дії для активації {% include abbr/exfat.txt %}, {% include abbr/sdhc.txt %} і для підняття прошивки ідентичний! Так, потрібно робити, навіть якщо у вас вже й так {% include /vars/update_version.txt %}
{: .notice--warning}

При прошивці на деякі версії (1.0.0, 2.0.0, 5.0.0, 6.0.0, 6.2.0, 7.0.0) приставка спалює спеціальні запобіжники на чипі, щоб за їх станом відстежувати версію системного ПЗ на вашій приставці. У звичайному режимі при встановленні прошивки, консоль перевіряє кількість спалених запобіжників. Якщо ця кількість більша, ніж потрібно для прошивки, то консоль розуміє, що ви намагаєтеся встановити прошивку нижче, ніж була встановлена до цього, і не дозволить це зробити. Якщо ж кількість спалених запобіжників нижча, ніж вимагає встановлювана прошивка, то прошивка дозволяється і в ході неї спалюється стільки запобіжників скільки необхідно, щоб відповідати зазначеній в прошивці кількості. Таким чином, якщо ви оновилися до {% include /vars/update_version.txt %} офіційно, у вас на приставці буде спалено умовно 12 запобіжників. Якщо ви спробуєте відновити бекап, скажімо, зроблений на прошивці 8.1.0, для роботи якої потрібно 10 запобіжників (а у вас спалено 12), то приставка зрозуміє це і офіційна прошивка не запуститься!

**Кількість спалених запобіжників не важлива для кастомних прошивок. Ви зможете відкотитися на будь-яку прошивку за умови використання кастомного завантажувача.** Офіційна ж прошивка не запуститься, якщо версія встановленої прошивки нижче, ніж на те вказують запобіжники. Якщо вище, то OFW спалить запобіжники, щоб вони відповідали запущеній версії прошивки.

За цією інструкцією можна міняти версію свого ПЗ на будь-яку, а не тільки на {% include /vars/update_version.txt %}.



## Що знадобиться

* Свіжа версія {% include abbr/kefir_addr.txt %}
* [Прошивка **{% include /vars/update_version.txt %}**](https://github.com/THZoria/NX_Firmware/releases/){:target="_blank"}
* Карта пам'яті

### Частина I - Резервне копіювання NAND

Пропустіть цю частину, якщо у вас вже є резервна копія!

Якщо резервної копії немає, цю частину потрібно робити **обов'язково**!
{: .notice--danger}

1. Створіть [резервну копію NAND](/backup-nand){:target="_blank"} консолі і помістіть її в надійне місце

### Оновлення прошивки

{% capture notice-5 %}
#### Виберіть експлойт, який використовуєте для активації злому 

* **Fusée Gelée** актуальний лише для консолей першої ревізії, що взламуються за допомогою {% include abbr/host.txt abbr="хоста" %}
* **Caffeine** передбачає злам через програмну вразливість у браузері. Якщо для запуску злому ви запускаєте браузер, то у вас точно Caffeine

Якщо ви не знаєте або не впевнені, як саме зламана ваша консоль, запитайте у майстра, який її зламував. В іншому випадку спробуйте запустити консоль без карти пам'яті. У тому випадку, якщо без карти консоль не завантажує прошивку, а показує на екрані малюнок (може бути малинка, або напис NOSD, або щось схоже на гекату), то ваша консоль чипована.
{: .notice--info}

<div class="select_fw__wrapper">
	<div class="select_fw">
	    <input type="radio" id="button0" name="exploit" value="button0" checked />
	    <label for="button0">Чипована консоль</label>
	    <input type="radio" id="button1" name="exploit" value="button1" />
	    <label for="button1">Fusée Gelée</label>
	    <input type="radio" id="button2" name="exploit" value="button2" />
	    <label for="button2">Caffeine</label>
	</div>
</div>

<!--В даний момент останньою прошивкою є {% include /vars/sys_version.txt %}, однак, оскільки вона тільки вийшла і недостатньо оттестована, а так само тому що ще немає ігор, що вимагають її, не рекомендується поки на неї оновлюватися. Якщо ж ви вже на ній встановіть рекомендовану прошивку за інструкцією нижче!
{: .notice--warning}-->

<!-- {% spoiler Відеоінструкція %}

{% include youtube.html id="I6R_XaYt7ps" %}
{: .text-center}
{: .notice--info}

{% endspoiler %}-->
{% endcapture %}

<div id="selector">{{ notice-5 | markdownify }}</div> 

{% spoiler Оновлення прошивки за допомогою Kefir Updater  %}

{% capture notice-2 %}

<!-- Caffeine -->
{% capture notice-3 %}
**Обов'язково переконайтеся, що знаходитесь в EmuNAND!** Для цього перейдіть в "**Системні налаштування**" -> "**Система**". У рядку нижче "**Оновлення системи**" буде написана версія вашого системного ПЗ, версія Atmosphere і буква **S** або **E**, де **S** буде означати *SysNAND*, а **E** - *EmuNAND*.

![](/assets/images/switch/screenshots/atmo_emu.png)
{: .text-center}
{: .notice--info}

**Якщо ви випадково оновите SysNAND до останньої версії системного ПЗ, то будь-яке завантаження в офіційну прошивку зробить прошивку через Caffeine неможливою і вам доведеться чипувати приставку!**
{% endcapture %}
<div class="notice--warning">{{ notice-3 | markdownify }}</div>

{% endcapture %}
<div class="hideble button2 hide">{{ notice-2 | markdownify }}</div>


1. Оновіть {% include abbr/kefir_addr.txt %}. Кефір обов'язково має бути останньої версії
	* Якщо версія вашого системного ПЗ 1.0.0, видаліть папки `\atmosphere\exefs_patches` і `\atmosphere\kip_patches\fs_patches`
		* Після того, як ви вдало оновите системне ПЗ, обов'язково **ще раз встановіть {% include abbr/kefir_addr.txt %}**
1. Запустіть приставку в середовище, яке хочете оновити. Для оновлення EmuNAND, запускайте його, для оновлення офіційної прошивки, запустіть semi-stock 
1. Переконайтеся що консоль під'єднана до інтернету. Якщо ні, під'єднайтесь. Це безпечно і вас за це не забанять
1. Відкрийте [Homebrew Launcher](/hbl){:target="_blank"}
1. Запустіть **Kefir Updater** і виберіть **Скачати прошивку**
1. Оберіть найновішу прошивку та натисніть {% include /inc/btn.txt btn="A" %}, натисніть "**Продовжити**"
1. Дочекайтеся закінчення загрузки і розпаковки прошивки
1. Дочекайтеся закінчення обробки прошивки і натисніть "**Install**", щоб почати встановлення
1. Після закінчення встановлення натисніть "**Reboot**" для перезавантаження, або "**Shutdown**", щоб вимкнути приставку

Зауважте, що оновивши поточне середовище, оновиться лише воно. Наприклад, якщо ви оновили емунанд, це не вплине на версію системного ПЗ сіснанд або інших емунандах, та навпаки. То ж за потреби перезагрузіться в інше середовище та оновіть його. Скачувати наново прошивку при цьому не буде потрібно, запустіть **Daybreak** замість **Kefir Updater**, оберіть папку `firmware` і виконайте вже знайомі дії. 
{: .notice--warning}

В деяких випадках після оновлення сіснанд, приставка перезагрузиться в офіційну прошивку. Просто перезагрузіть консоль ще раз і вона має загрузитися в емунанд. Якщо це не так, зверніться до майстра.
{: .notice--danger}

Ви можете видалити папку `firmware` з прошивкою з карти пам'яті. Вона нам більше не потрібна
{: .notice--info}

{% endspoiler %}

{% spoiler Оновлення за допомогою ПК %}

### Частина I - Підготовка до оновлення
**Важлива інформація!!** Використовуйте карти пам'яті тільки з файловою системою [FAT32](http://customfw.xyz/format_sd){:target="_blank"}!
{: .notice--warning}

1. Оновіть {% include abbr/kefir_addr.txt %}. Кефір обов'язково має бути останньої версії
	* Якщо версія вашого системного ПЗ 1.0.0, видаліть папки `\atmosphere\exefs_patches` і `\atmosphere\kip_patches\fs_patches`
		* Після того, як ви вдало оновите системне ПЗ, обов'язково **ще раз встановіть {% include abbr/kefir_addr.txt %}**
1. Розпакуйте архів `{% include /vars/update_version.txt %}.zip` в папку `firmware`на карті пам'яті вашої приставки (якщо її немає, створіть)
	* Уважно: саме архів **з прошивкою**. Не архів з кефіром! Архів з прошивкою розташований в частині [Що знадобиться](/#що-знадобиться). Потрібно скопіювати не сам архів, а саме його **вміст**
	* Замість цього ви можете скачати архів зі свіжою версією системного ПЗ через додаток **Kefir Updater** прямо на вашій приставці. Для цього запустіть [HBL](/hbl){:target="_blank"} через гру, виберіть додаток **Kefir Updater**, перейдіть в меню "**Скачати прошивку**" і виберіть необхідну версію. Натисніть {% include /inc/btn.txt btn="A" %}, натисніть "**Продовжити**", щоб почати закачування прошивки. Програма сама скачає обрану версію системного ПЗ і розпакує її в папку `firmware`.
1. Вставте карту пам'яті назад у приставку

### Частина II - Оновлення прошивки

{% capture notice-2 %}

<!-- Caffeine -->
{% capture notice-3 %}
**Обов'язково переконайтеся, що знаходитесь в EmuNAND!** Для цього перейдіть в "**Системні налаштування**" -> "**Система**". У рядку нижче "**Оновлення системи**" буде написана версія вашого системного ПЗ, версія Atmosphere і буква **S** або **E**, де **S** буде означати *SysNAND*, а **E** - *EmuNAND*.

![](/assets/images/switch/screenshots/atmo_emu.png)
{: .text-center}
{: .notice--info}

**Якщо ви випадково оновите SysNAND до останньої версії системного ПЗ, то будь-яке завантаження в офіційну прошивку зробить прошивку через Caffeine неможливою і вам доведеться чипувати приставку!**
{% endcapture %}
<div class="notice--warning">{{ notice-3 | markdownify }}</div>

{% endcapture %}
<div class="hideble button2 hide">{{ notice-2 | markdownify }}</div>

<!-- Fusée Gelée -->
1. Запустіть [{% include abbr/cfw.txt abbr="кастом" %}](/cfw){:target="_blank"}
	* Якщо після логотипу Nintendo ви спостерігаєте чорний екран з помилкою, значить у вас не встановлені драйвера exFAT і ви проігнорували [форматування карти пам'яті в FAT32](https://format.customfw.xyz){:target="_blank"}, яке потрібно було зробити вище. Перенесіть всі дані на ПК, відформатуйте картку за інструкцією, поверніть дані та продовжуйте виконання інструкції
1. Відкрийте [Homebrew Launcher](/hbl){:target="_blank"}
1. Запустіть **Daybreak** і виберіть **Install**
1. Перейдіть в папку `firmware`, в ній знаходиться прошивка {% include /vars/update_version.txt %}, скопійована раніше, і натисніть {% include /inc/btn.txt btn="A" %}
	* Якщо ви не можете перейти в папку (папка відображається як файл), значить ваша папка має неправильні *атрибути*. Як їх виправити описано в [FAQ](/faq){:target="_blank"} або в розділі [проблеми та їх рішення](/troubleshooting){:target="_blank"}
1. Дочекайтеся закінчення обробки прошивки і натисніть "**Install**", щоб почати встановлення
1. Після закінчення встановлення натисніть "**Reboot**" для перезавантаження, або "**Shutdown**", щоб вимкнути приставку

Зауважте, що оновивши поточне середовище, оновиться лише воно. Наприклад, якщо ви оновили емунанд, це не вплине на версію системного ПЗ сіснанд і навпаки. То ж за потреби перезагрузіться в інше середовище та оновіть його. Скачувати наново прошивку при цьому не буде потрібно, запустіть **Daybreak** замість **Kefir Updater**, оберіть папку `firmware` і виконайте вже знайомі дії. 
{: .notice--warning}

В деяких випадках після оновлення сіснанд, приставка перезагрузиться в офіційну прошивку. Просто перезагрузіть консоль ще раз і вона має загрузитися в емунанд. Якщо це не так, зверніться до майстра.
{: .notice--danger}

Ви можете видалити папку `firmware` з прошивкою з карти пам'яті. Вона нам більше не потрібна
{: .notice--info}

{% endspoiler %}

## Важливо знати

* Якщо після прошивки вам запропонують оновити контролери - оновлюйте
* Якщо після оновлення у вас чорний екран після логотипу Nintendo, оновіть {% include abbr/kefir_addr.txt %}
	* Якщо не допомогло, прочитайте уважно розділи [Проблеми та їх рішення](/troubleshooting){:target="_blank"} і [FAQ](/faq){:target="_blank"}
* Якщо приставка не завантажується після прошивки (падає з помилкою, наприклад), [відновіть бекап](/backup-nand#%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D1%80%D0%B5%D0%B7%D0%B5%D1%80%D0%B2%D0%BD%D0%BE%D0%B9-%D0%BA%D0%BE%D0%BF%D0%B8%D0%B8){:target="_blank"} або [відновлюйте прошивку вручну](/downgrade_fw){:target="_blank"}
* Якщо при запуску Emunand помилка "Failed to match warmboot with fuses", зробіть щоб емунанд та сіснанд мали однакову версію системного ПЗ

___

[Закрити сторінку](javascript:window.close();)
{: .notice--success}

<script>

document.addEventListener('DOMContentLoaded', function() {
    // Перевірка localStorage при завантаженні сторінки
    const fuse = localStorage.getItem('fuse');
    const caffeine = localStorage.getItem('caffeine');
    const selectorElement = document.getElementById('selector');
    
    // Функція для налаштування відображення контенту на основі вибору
    function setContentVisibility(showMenu, useButton2) {
        // Керування видимістю меню вибору
        if (selectorElement) {
            selectorElement.style.display = showMenu ? 'block' : 'none';
        }
        
        // Керування видимістю контенту для Caffeine
        const button2Elements = document.getElementsByClassName('button2');
        for (let i = 0; i < button2Elements.length; i++) {
            if (useButton2) {
                button2Elements[i].classList.add('show');
                button2Elements[i].classList.remove('hide');
            } else {
                button2Elements[i].classList.remove('show');
                button2Elements[i].classList.add('hide');
            }
        }
    }
    
    // Визначаємо, чи показувати меню вибору
    // Показуємо меню, якщо змінних немає або обидві дорівнюють "0"
    const showMenu = (fuse === null && caffeine === null) || (fuse === "0" && caffeine === "0");
    
    if (showMenu) {
        // Показуємо меню вибору
        document.getElementById('button0').checked = true;
        setContentVisibility(true, false);
    } else {
        // Не показуємо меню вибору, відображаємо відповідний контент
        if (fuse === "1") {
            document.getElementById('button1').checked = true;
            setContentVisibility(false, false);
        } else if (caffeine === "1") {
            document.getElementById('button2').checked = true;
            setContentVisibility(false, true);
        } else {
            document.getElementById('button0').checked = true;
            setContentVisibility(false, false);
        }
    }

    // Додавання обробників подій для радіокнопок
    document.getElementById('button0').addEventListener('change', function() {
        if (this.checked) {
            localStorage.setItem('fuse', "0");
            localStorage.setItem('caffeine', "0");
            setContentVisibility(true, false);
            
            // Встановлюємо термін дії змінних на 1 годину
            setTimeout(function() {
                localStorage.removeItem('fuse');
                localStorage.removeItem('caffeine');
            }, 60 * 60 * 1000); // 1 година в мілісекундах
        }
    });

    document.getElementById('button1').addEventListener('change', function() {
        if (this.checked) {
            localStorage.setItem('fuse', "1");
            localStorage.setItem('caffeine', "0");
            setContentVisibility(true, false);
            
            // Встановлюємо термін дії змінних на 1 годину
            setTimeout(function() {
                localStorage.removeItem('fuse');
                localStorage.removeItem('caffeine');
            }, 60 * 60 * 1000); // 1 година в мілісекундах
        }
    });

    document.getElementById('button2').addEventListener('change', function() {
        if (this.checked) {
            localStorage.setItem('fuse', "0");
            localStorage.setItem('caffeine', "1");
            setContentVisibility(true, true);
            
            // Встановлюємо термін дії змінних на 1 годину
            setTimeout(function() {
                localStorage.removeItem('fuse');
                localStorage.removeItem('caffeine');
            }, 60 * 60 * 1000); // 1 година в мілісекундах
        }
    });
});

</script>





