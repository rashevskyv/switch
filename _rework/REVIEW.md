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

## Decisions (confirmed by the owner 2026-10-02)
1. Kefir Hub is the main path everywhere. The docs URL `hub.customfw.xyz` stays.
2. DBI stays in Kefir. It is mentioned for what Hub lacks (Reset required version, Clean orphaned files).
3. Kefir loses only Daybreak and Linkalho. Kefir Updater, NXThemes Installer and NX-Activity-Log stay.
4. Cheats are switched on inside a game through Tesla → EdiZon.
5. Offline account link carries a ban risk. Use it only on emuMMC isolated from Nintendo servers.
6. The install-enable switch will be removed (kefir-hub plan D.2), and so will the "turn installing on" step.
7. Zadig: DBI Backend Qt 2.9.0 installs the WinUSB driver itself (plan D.1); `inc/zadig.txt` says so. ns-usbloader/Fluffy still use Zadig.
8. Tinfoil is archived. MTP is the recommended install method.

## Before merging
- Kefir intentionally ships Sphaira as `/hbmenu.nro` for now. Kefir Hub goes into Kefir only after the docs, the site and the videos are ready, and this branch is merged together with that release.
- Screenshots: `{% comment %}shot: <id>{% endcomment %}` marks a picture to add. The ids are the same as in the
  Hub docs (`python docs/site/shotlist.py` in kefir-hub).
- Videos: `{% comment %}TODO: new video ...{% endcomment %}` marks where to embed. Scripts are in kefir-hub `docs/video/`.
- Open questions about facts are in kefir-hub `docs/dev/AUDIT-2026-10-02-docs.md` (end of file).
