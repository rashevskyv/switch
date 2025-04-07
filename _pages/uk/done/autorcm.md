---
lang: uk
permalink: /uk/autorcm.html
title: AutoRCM
author_profile: true
---

{% include toc title="Зміст" %}
{% include notices %}

**AutoRCM** - на консолі спеціальним чином змінюється завантажувальний сектор, внаслідок чого консоль не може завантажитися прямо в систему і завантажується автоматично в режим {% include abbr/uk/rcm.txt abbr="RCM" %}. Достатньо просто увімкнути консоль, і вона автоматично потрапить до режиму відновлення. Не потрібно затискати комбінацію кнопок і використовувати замикач, але пейлоад для запуску прошивки все одно передавати потрібно!
{: .notice--info}

Якщо ви використовуєте [Caffeine](/uk/caffeine){:target="_blank"}, то вам **у жодному разі** не можна використовувати AutoRCM! Інакше приставка перетвориться на цеглину! При будь-яких підозрах на увімкнений AutoRCM, видаліть його за цією інструкцією!
{: .notice--danger}

## Що знадобиться

*   Вміння [запускати пейлоади через Fusée Gelée](/uk/fusee-gelee){:target="_blank"}

### Встановлення AutoRCM

{% include inc/uk/launch-hekate.txt %}
1.  Перейдіть до розділу "**Tools**" -> "**Arch bit - AutoRCM**" (внизу екрана) та встановіть "**AutoRCM**" у положення "**ON**"
2.  Натисніть "**Home**" вгорі екрана
3.  [Запустіть](/uk/cfw){:target="_blank"} {% include abbr/uk/cfw.txt abbr="кастомну прошивку" %}

### Відключення AutoRCM

{% include inc/uk/launch-hekate.txt %}
1.  Перейдіть до розділу "**Tools**" -> "**Arch bit - AutoRCM**" (внизу екрана) та встановіть "**AutoRCM**" у положення "**OFF**"
2.  Натисніть "**Home**" вгорі екрана
3.  [Запустіть](/uk/cfw){:target="_blank"} {% include abbr/uk/cfw.txt abbr="кастомну прошивку" %}

___

[Закрити сторінку](javascript:window.close();)
{: .notice--success}