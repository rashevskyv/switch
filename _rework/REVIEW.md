# Branch kefir-hub: what to review

Jekyll ignores `_rework/`, so these notes are not published. The line-level map of the old pages is in `REWORK-MAP.md`.

## Preview
```
bundle exec jekyll serve
```
Links into the Kefir Hub docs use `{{ site.kefir_hub_docs }}` (`_config.yml`; the URL is a placeholder for now).
The same literal URL also appears in `_data/navigation.yml`, `llms.txt` and `llms-full.txt`.
Change it in all four places when the docs get their real address.
All 58 links to docs pages and anchors were checked against the docs build.

## What changed
- **Rewritten for Kefir Hub.**
  - `games`: 5 install methods, the queue, cartridges, managing games.
  - `hbl`: now the Kefir Hub page.
  - `backup-saves`, `link-account`, `cheats`.
  - `ftp`: file access from a PC (web, FTP, MTP).
  - `update-fw`: Kefir and firmware through the Updater; Daybreak removed.
- **Updated.**
  - Pages: `kefir`, `usage`, `faq`, `troubleshooting`, `glossary`, `site-navigation`, `longread`, `tesla-menu`,
    `buying-used`, `lanplay`, `chiaki`, `emunand`, `migrate`, `downgrade_fw`, and the three `preparation-*` chain pages.
  - Includes: `inc/launch-hbl.md`, `inc/additional.txt`, `inc/zadig.txt`.
  - Data: `navigation.yml`, `llms*.txt`.
- **Archived.** `tinfoil` is now a stub pointing to /games. `inc/hbgshop.txt` and `inc/tinfoil.txt` were deleted (unused).

## Decisions taken as defaults (change if wrong)
1. Kefir Hub is the main path everywhere.
2. DBI stays only for what Hub lacks: "Reset required version" and "Clean orphaned files" (worded "також можна через DBI").
3. Cheats are switched on inside a game through Tesla → EdiZon, as before.
4. Tinfoil is archived. Daybreak is removed from `update-fw`.
5. MTP is the recommended install method. NSPsplitty is dropped. DBI "delete after install" has no equivalent and was dropped.
6. Ultrahand everywhere (Uberhand was the old name).
7. `kefir.md` still lists Daybreak, NXThemes Installer and NX-Activity-Log because we could not confirm whether they stay in Kefir.
8. Zadig: it is not confirmed whether Hub USB install needs a driver. `inc/zadig.txt` is a short notice with a TODO.

## Before merging
- Kefir 921 still ships Sphaira as `/hbmenu.nro` and no Kefir Hub. The site already describes Hub; merge together with the Kefir release that ships it.
- Screenshots: `{% comment %}shot: <id>{% endcomment %}` marks a picture to add. The ids are the same as in the
  Hub docs (`python docs/site/shotlist.py` in kefir-hub).
- Videos: `{% comment %}TODO: new video ...{% endcomment %}` marks where to embed. Scripts are in kefir-hub `docs/video/`.
- Open questions about facts are in kefir-hub `docs/dev/AUDIT-2026-10-02-docs.md` (end of file).
