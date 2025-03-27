---
lang: ru
permalink: /ru/system-wipe.html
title: Сброс к заводским настройкам
author_profile: true
---

{% include notices %}

Сброс к заводским настройкам удалит все данные из вашей системы, включая игры, сохранения и прочее!
{: .notice--danger}

**Будьте готовы к тому, что на лайте это безвозвратно пожрёт 15% аккумулятора.** Для остальных приставок такой проблемы не замечено
{: .notice--danger}

Рекомендуется сделать бекап перед сбросом!
{: .notice--warning}

1. Запустите {% include abbr/hekate.txt abbr="hekate" %} -> **Payloads** -> `TegraExplorer.bin`
1. Выберите `SystemWipe.te`
1. Выберите **Wipe sysmmc**, чтобы сбросить к заводским {% include abbr/sysnand.md abbr="SysNAND" %} и **Wipe emummc**, чтобы сбросить {% include abbr/emunand.md abbr="EmuNAND" %}
1. Нажмите кнопку (POWER) для подтверждения сброса 
