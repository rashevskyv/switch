---
lang: uk
permalink: /uk/system-wipe.html
title: Сброс к заводским настройкам
author_profile: true
---

Сброс к заводским настройкам удалит все данные из вашей системы, включая игры, сохранения и прочее!
{: .notice--danger}

**Будьте готовы к тому, что на лайте это безвозвратно пожрёт 15% аккумулятора.** Для остальных приставок такой проблемы не замечено
{: .notice--danger}

Рекомендуется сделать бекап перед сбросом!
{: .notice--warning}

1. Запустите {% include abbr/ua/hekate.txt abbr="hekate" %} -> **Payloads** -> `TegraExplorer.bin`
1. Выберите `SystemWipe.te`
1. Выберите **Wipe sysmmc**, чтобы сбросить к заводским {% include abbr/ua/sysnand.md abbr="SysNAND" %} и **Wipe emummc**, чтобы сбросить {% include abbr/ua/emunand.md abbr="EmuNAND" %}
1. Нажмите кнопку {% include inc/ua/btn.txt btn="POWER" %} для подтверждения сброса 
