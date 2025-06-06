---
permalink: /
title: "Switch Hack Guide"
author_profile: true
header:	
  overlay_color: "#5e616c"
  overlay_image: assets/images/switch/home-page-feature.jpg
  overlay_filter: 0.5
  caption:
---

{% include toc title="Розділи" %}
{% include notices %}	

## Як читати цей посібник

Посібник побудовано лінійно. Тобто передбачається, що його читатимуть, починаючи з цієї сторінки, і до того моменту, поки не отримаєте бажаний результат.

Перш за все, рекомендується прочитати посібник повністю, подумки виконуючи всі дії, які ви робитимете під час прошивки. Ознайомтеся з [FAQ](/uk/faq){:target="_blank"}. Так вам буде набагато легше зрозуміти, чого від вас вимагають під час проходження гайду в реальних умовах. Посібник великий і комплексний, часто включає багато термінів, незнайомих для новачка, та перехресні посилання. Багато інформації, що зустрічається в посібнику, може здатися вам зайвою, оскільки метою посібника було охопити найбільшу кількість користувачів та їхніх конфігурацій. Неможливо одночасно допомогти кожному і зробити гайд доступним для розуміння навіть маленькій дитині. Бажаєте прошити - *розбирайтеся*.

Рекомендую відкрити посібник в окремому вікні браузера, оскільки під час його виконання відкриватиметься багато додаткових вкладок. Якщо ви бачите в посібнику посилання - переходьте за ним, воно там не просто так. Практично всі посилання, окрім тих, що переводять на наступний крок інструкції, відкриватимуться в новій вкладці. Після того, як ви виконаєте інструкцію за цим посиланням, закрийте її та поверніться до тієї сторінки, з якої це посилання відкрили.

## Я не хочу прошивати приставку сам

+ Ви можете прошити приставку [в мене (автора цього гайда та прошивки кефір)](https://t.me/xhrxhrxhr){:target="_blank"}
+ Ви можете купити вже прошиту приставку [у мене, якщо живете в Україні](https://shop.customfw.xyz/){:target="_blank"}
+ Якщо у вас виникли труднощі при прошивці або потрібна допомога у виборі приставки - звертайтеся до [групи](http://t.me/kefir_urk){:target="_blank"}

## Основні терміни

У процесі прошивки ви зіткнетеся з безліччю нових термінів, знання яких вам будуть необхідні як у процесі проходження посібника, так і в спілкуванні з однодумцями у [групі в телеграмі](http://t.me/kefir_urk){:target="_blank"}. Ознайомтеся з [глосарієм термінів](/uk/glossary){:target="_blank"}. У разі, якщо ви забудете якийсь термін, просто поверніться до глосарію і освіжіть пам'ять.

## Як працює злам?

З появою "не прошивних" приставок типи зламу стали ділитися на **злам за допомогою Fusée Gelée** і на **злам за допомогою чипа**. Обидва методи злама працюють на будь-яких версіях системного ПО. Однак сама прошивка може не працювати на останній версії системного ПО. Тобто, взломати приставку вийде, однак запустити прошивку - ні. 

Остання версія прошивки що підтримується кефіром:  **{% include /vars/update_version.txt %}** і нижче

Остання версія системного ПО: **{% include /vars/sys_version.txt %}**

Простими словами, якщо виходить нова версія системного ПО, кефіру (прошивці) треба деякий час на оновлення. Або доведеться понижати версію вашого системного ПО. Якщо ви не впевнені чи підтримується ваша прошивка, зверніться до [групи в телеграмі](http://t.me/kefir_urk){:target="_blank"} за консультацією. 

### Злам за допомогою Fusée Gelée

Цей метод експлуатує вразливість у старих версіях чипа Tegra, завдяки якій в приставку можна відправити пейлоад, файл з виконуваним кодом, який буде запускатися на приставці. Цей метод "не прив'язний", тобто, якщо приставку повністю відключити, то пейлоад пробрасувати потрібно заново, після її включення. Детальніше про цей метод буде розказано у відповідному розділі посібника. Наразі для приставок вразливих до такого методу взлома все одно рекомендовано ставити чипа. 

### Злам за допомогою чипа

Цей метод підходить для взагалі всіх типів приставок. Він опціональний, проте рекомендований, для тих приставок, що можна прошити за допомогою Fusée Gelée. 

Приставка зламується завдяки встановленому на її материнську плату мод-чипу. 

Майте на увазі, що установка чипа не проста і вимагає наявності досвіду й інструментів, тому не рекомендується робити це самостійно. Краще зверніться до [майстра](https://t.me/xhrxhrxhr){:target="_blank"} 

## Що встановлюється в цьому посібнику?

За допомогою цього посібника ви навчитеся:

+ Робити бекап NAND консолі
+ Робити EmuNAND
+ Запускати кастомну прошивку
+ Запускати Homebrew
+ Оновлювати системне ПЗ та прошивку
+ І нарешті, запускати піратські ігри

## Що потрібно знати перед тим, як почати?

+ Злам знаходиться в активній розробці. Тому деякі елементи його можуть здатися нетривіальними і вимагатимуть спритності і технічних знань
+ Тут і далі під словосполученням "системне ПЗ" мається на увазі версія системного ПЗ офіційної прошивки. Під словом "прошивка" - сам процес прошивання, або збірка кефір (в залежності від контексту). "Версія прошивки" - версія кефіру.
+ У будь-який момент ви можете отримати бан, навіть якщо ваша мета всього лише запуск Homebrew
	+ Одного разу хоча б запустивши хомбрю на приставці, ви залишаєте на ній логи, які будуть відправлені в Nintendo відразу ж при підключенні інтернету. В даний момент всі кастоми вміють зберігати логи на карті пам'яті, замість того, щоб відправляти їх в Nintendo, однак навіть це не дає 100% гарантії, що вас не забанять. **Якщо вас забанять, все, що ви втратите - це доступ до сервісів Nintendo**. Рівно цього ж ви позбавитеся, якщо навмисно відключите себе від інтернету в спробі уникнути бану.
	+ В кастомній прошивці доступ до серверів Nintendo заблоковано, тобто інтернетом користуватися безпечно
	+ Всі методи захисту від бану чисто теоретичні, немає ніякої гарантії, що вони спрацюють
	+ Найбільш дієвим методом проти бану на даний момент є використання неліцензійного ПЗ в EmuNAND. Ми створимо його в ході виконання посібника.
	+ Використовуйте EmuNAND для запуску неліцензійного ПЗ і SysNAND для онлайну
	+ Після проходження посібника ви зможете безпечно використовувати інтернет, але як і раніше не зможете грати в онлайн-ігри не купивши їх.
+ Ваша карта пам'яті повинна бути [SDHC](https://uk.wikipedia.org/wiki/Secure_Digital){:target="_blank"} або краще, [відформатована в FAT32](https://format.customfw.xyz){:target="_blank"}. Карти пам'яті з GPT працювати не будуть. Карти в exFAT будуть працювати, однак, FAT32 **сильно** надійніше.

___

<center><a href="/uk/get-started" style="margin:20px auto; text-align:center; display:block; width:200px;" class="btn btn--short">Почнемо!!</a></center>
{: .notice--success}