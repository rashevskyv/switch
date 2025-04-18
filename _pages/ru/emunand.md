---
lang: ru
permalink: /ru/emunand.html
title: Установка EmuNAND
author_profile: true
---

{% include toc title="Розділи" %}
{% include notices %}

Для уже прошитых пользователей, которые хотят восстановить возможность играть онлайн на уже прошитой приставке, а пиратить исключительно в EmuNAND есть отдельная инструкция - [Переход на EmuNAND для уже прошитых](/ru/preparation-white){: target="blank_"}
{: .notice--info}

## Что нужно знать про EmuNAND

**EmuNAND** - это копия системной прошивки, расположенная на карте памяти, из которой загружается система. Если есть эмунанд, значит есть и {% include abbr/ru/sysnand.md abbr="стоковая" %} прошивка. Обычно стоковую прошивку, SysNAND, используют для игры онлайн в купленные или официально скачанные из eShop игры. Если не запускать на {% include abbr/ru/sysnand.md abbr="SysNAND" %} пиратку, то шанс, что его забанят крайне невысок. EmuNAND же наоборот, используют как раз для запуска пиратки. В нём специальным образом скрывают серийный номер приставки, так что даже при работающем интернет-подключении, Nintendo не может отследить что на приставке было запущено неавторизированное ПО. 

### EmuNAND вам может понадобиться если...

* вы хотите играть онлайн в купленные\бесплатные игры.  В таком случае вы будете загружаться в EmuNAND для игры в пиратку, а {% include abbr/ru/sysnand.md abbr="SysNAND" %} использовать исключительно для игры в лицензию. В этом случае шанс бана существенно ниже.
* вы используете {% include abbr/ru/caffeine.txt abbr="Caffeine" %}. В таком случае у вас нет выбора и единственный способ прошить приставку - использовать EmuNAND 
* вы используете [4IFIR](https://github.com/rashevskyv/4IFIR) для разгона. Там эмунанд требуется в целях безопасности. 

В иных случаях EmuNAND не обязателен. То есть, если вы собираетесь просто играть в пиратку и вам не интересен онлайн, то от EmuNAND пользы не будет. 

Помните, что без EmuNAND запустив Full Stock или Semi-Stock, после установки пиратки на консоль, вы **неминуемо** получите бан!
{: .notice--danger}

Если вы очень хотите играть онлайн, но вас уже забанили, то EmuNAND вам не поможет.
{: .notice--info}

### Можно ли работать без EmuNAND
Да, вполне. Если вам не нужен онлайн на приставке, или приставка уже в бане, EmuNAND вам не понадобится. 

### Сколько EmuNAND занимает места
Как правило, размер EmuNAND равен размеру внутренней памяти приставки. У всех Switch, кроме OLED, его размер равен 32Гб, у OLED - 64Гб Имейте ввиду, что вы не сможете использовать **внутреннюю память вашей приставки** (те самые встроенные 32Гб) для установки игр, поскольку в качестве внутренней памяти будет выступать сам EmuNAND, который полностью расположен на карте памяти. То есть, запустив EmuNAND, вы увидите "внутреннюю память", которую можно использовать для установки игр, но это внутренняя память эмунанда, которая расположена на карте памяти, а не самой приставки. Важно это понимать. 

Для простоты понимания представьте, что вы достали из консоли внутреннюю память и расположили её внутри вашей карты памяти. Это и есть EmuNAND. Когда вы работаете из EmuNAND, то не имеете доступа к физической внутренней памяти вашей консоли, расположенной на отдельно чипе. Когда вы используете внутреннюю память, {% include abbr/ru/sysnand.md abbr="SysNAND" %}, то не имеете прямого доступа к её копии на карте памяти - EmuNAND.

### Плюсы и минусы использования EmuNAND

* Плюсы
    * **Полная изоляция от основной системы** - эмунанд находится в полностью изолированной среде, потому действия в нём никак не влияют на основную систему. У него отдельные игры, отдельные сохранения, отдельные логи. Если вы испортите EmuNAND это никак не повлияет на основную систему и приставка продолжит работать.
    * **Безопасный онлайн** - следствие предыдущего пункта. Благодаря тому, что эмунанд изолирован, вы можете смело пользоваться стоковой прошивкой (и внутренней памятью приставки) с минимальными рисками быть забаненным. 
    * **Простота резервного копирования** - так как эмунанд находится на карте, его можно просто периодически копировать на ПК в качестве резервной копии. 

* Минусы
    * **Невозможно использовать внутреннюю память консоли** - для установки игр и приложений будет доступен только объём вашей карты памяти. Встроенные в приставку 32Гб будут доступны только для официальной прошивки. При этом в настройках вы все равно будете видеть виртуальную "внутреннюю память", которая фактически расположена на карте памяти приставки, поскольку EmuNAND - всего лишь копия внутренней памяти на SD-карте.

### Как перенести EmuNAND на другую карту
Если EmuNAND сделан на отдельном разделе, то следует воспользоваться программой [EmuTool](https://gbatemp.net/threads/emutool-move-partition-emu-on-another-sd-switch-emu-type-on-sxos-and-more.550756/){: target="blank_"} или её аналогами. Если же EmuNAND создан в виде файлов (именно такой создаётся в процессе выполнения этого руководства), то он переносится простым копированием. Помните, что целевая карта должна быть в [FAT32](http://format.customfw.xyz) 

### Как сделать резервную копию EmuNAND на ПК
Для создания резервной копии EmuNAND достаточно просто скопировать на ПК папку `emuMMC/SD00/eMMC` (вместо `SD00` может быть другое название)

{% include inc/ru/sysnand_warning.md %}

## Создание EmuNAND

{% spoiler Подготовительные работы %}

1. Запустите приставку и **выберите светлую тему** в настройка Switch, а так же **переименуйте ваш аккаунт в "SysNAND"**
	* Это необходимо сделать для того, чтобы вы всегда могли визуально отличить EmuNAND от SysNAND.
	* Вы можете наоборот поставить тёмную тему в SYSNAND, а светлую в EmuNAND - это не имеет значения. Главное, чтобы вы могли отличить оба раздела визуально. 
1. Загрузитесь в официальную прошивку и отключите в настройках приставки облачные сохранения (настройки -> управление данными -> облачное хранилище -> настройки), если они включены. Если не включены, то пропустите этот пункт
    * Если вы пропустили этот пункт и у вас были включены облачные сохранения, то в эмунанде при запуске игр будет вылетать ошибка, чтобы её устранить, в **эмунанде** через DBI удалите аккаунт на котором появляется ошибка через **Tools > Delete account**, после чего создайте новый с тем же именем. 
    * Следующий шаг уничтожит все данные на вашей карте памяти, поэтому перенесите их на ПК
    * Все установленные на карту памяти игры находятся в папке `Nintendo`
    * Все сохранения находятся во внутренней памяти приставки и **не** будут удалены, даже в том случае, если вы проигнорируете этот шаг
1. [Отформатируйте вашу карту памяти в FAT32](https://format.customfw.xyz){:target="_blank"}
    * Не форматируйте, если уже делали это на этапе создания бекапа
    * Да, именно в FAT32. Нет, проблем с играми больше 4Гб не будет
    * Делайте это даже в том случае, если ваша карта памяти не содержит данных
    * Делайте именно по этой инструкции
1. Убедитесь, что включили [отображение расширений файлов](https://customfw.xyz/file-extensions-windows){:target="_blank"}, если у вас Windows

{% endspoiler %}

{% spoiler Создание EmuNAND %}

{% spoiler Если вы только что сделали бекап и не удалили его с карты памяти %}

1. Включите консоль, удерживая кнопку понижения громкости, чтобы загрузиться в **hekate**
1. Перейдите в "**emuMMC**"
1. Нажмите "**Migrate emuMMC**" -> "**Backup**"
    * Ваш бекап будет переконвертирован в эмунанд. То есть, его не нужно будет потом дополнительно удалять. 
1. После окончания, нажмите "**ОК**"
	* Теперь при запуске приставки она автоматически будет запускать emuMMC. 
	* Чтобы попасть в официальную прошивку, запустите **hekate** -> "**Launch**" -> "**Full Stock**"

{% endspoiler %}

{% spoiler Если вы не делали только что бекап, или удалили его с карты памяти %}

1. Выключите консоль
1. Вставьте карту памяти в ПК и установите {% include abbr/ru/kefir_addr.txt %}, если ещё не делали этого, после чего верните карту памяти в консоль
1. Включите консоль, удерживая кнопку понижения громкости, чтобы загрузиться в **hekate**
1. Перейдите в "**emuMMC**"
1. Нажмите "**Create emuMMC**" -> "**SD File**"
	* Для создания emuMMC нужно иметь не менее 32Гб свободного места на карте, или 64Гб в случае если у вас OLED! Если у вас нет столько, возьмите другую карту, либо удалите часть игр с консоли, загрузившись в сток
1. После окончания создания emuMMC, нажмите "**ОК**"
	* Теперь при запуске приставки она автоматически будет запускать emuMMC. 
	* Чтобы попасть в официальную прошивку, запустите **hekate** -> "**Launch**" -> "**Full Stock**"

{% endspoiler %}

{% endspoiler %}

### Запуск прошивки

{% spoiler Запуск EmuNAND %}

По-умолчанию кефир настроен таким образом, что при пробросе `payload.bin` из состава {% include abbr/ru/kefir_addr.txt %}, Atmosphere будет загружать EmuNAND, если он есть и активирован. Если его нет, либо он не активирован, будет загружаться SysNAND со всеми патчами. То есть без EmuNAND запуск **Full Stock** или **Semi-Stock** после установки пиратки на консоль вы **неминуемо** получите бан!

Если же вы находитесь в {% include abbr/ru/hekate.txt abbr="hekate" %}, то просто перейдите в "**Launch**" -> "**Atmosphere**"

{% endspoiler %}

{% spoiler Работа со стоковой прошивки %}

### Запуск стока

{% include inc/ru/sysnand_warning.md %}

{% include inc/ru/launch-hekate.txt %}
1. Перейдите в "**Launch**"
1. Запустите "**Full Stock**" для запуска {% include abbr/ru/sysnand.md abbr="официальной прошивки" %}

### Запуск EmuNAND из стока

* Если вы находитесь в **Semi-Stock**, запустите **Uberhand** ((L) + (R3) + (DDOWN)), перейдите в меню **Packages**, нажав вправо и выберите **Emunand**
* Если вы находитесь в **Full Stock** и ваша приставка чипована, просто перезагрузите приставку 
* Если вы находитесь в **Full Stock** в приставке, без чипа: 
    1. Выключите приставку 
    {% include inc/ru/launch-cfw.txt %}

{% endspoiler %}

___

### Важно знать
* Без EmuNAND запуск **Full Stock** или **Semi-Stock** после установки пиратки на консоль вы **неминуемо** получите бан!
* Действия которые вы выполняете в EmuNAND не влияют на состояние SysNAND и наоборот
* Если вы переносили в EmuNAND SysNAND, в котором уже были установлены игры, то в EmuNAND они работать не будут, до тех пор, пока вы не переместите папку `Nintendo` в папку `emuMMC/SD00`
* Форматирование (восстановление до заводских) SysNAND не влияет на EmuNAND и наоборот
* Если вы используете [{% include abbr/ru/fusegele.txt abbr="Fusée Gelée" %}](/ru/fusee-gelee){:target="_blank"} для взлома, то вы можете обновить SysNAND, а не создавать для игры в лицензию отдельный emuMMC-раздел, до последней прошивки и использовать его для игры в лицензию, в том числе и онлайн. Это безопасно!
* **НИКОГДА не обновляйте SysNAND, если вы используете [Caffeine](/ru/caffeine){:target="_blank"}** для запуска прошивки! Обновив SysNAND вы не сможете запустить взлом! В дальнейшем мы установим защиту на SysNAND, чтобы избежать случайного обновления! 

___

[Закрыть страницу](javascript:window.close();)
{: .notice--success}