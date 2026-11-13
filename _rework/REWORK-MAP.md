# Kefir Hub rework map (branch kefir-hub)

Working notes, not published (Jekyll ignores `_rework/`). Line numbers are for base commit `3e1da515 kefir921`.

Verified in Kefir Hub source: data root is `/config/kefir/`. File associations live in `/config/kefir/assoc/`.
Themezer saves to `/themes/`. NTP time sync exists. "Delete user" exists. No equivalent exists for DBI
"Reset required version" or DBI "Cleanup orphaned files" (NCA). Only orphaned saves and cheats are cleaned.

## REWRITE
| Page | Now (lines → tool) |
|---|---|
| `_pages/games/games.md` /games | 12 desc DBI. 19-25 DBI video. 33 Tinfoil→DBI. 43, 54 XCI via DBI. 71-104 USB/MTP via DBI (77-89 OpenMTP macOS still valid; 101-102 DBIbackend.py). 106-127 USB drive via DBI. 129-152 SD via DBI (136 NSPsplitty). 154-170 mods via DBI MTP. Add: PC USB (DBI-compatible, `inc/zadig.txt`), FTP, web upload, Ownfoil, game card, console transfer, installed-games management. Keep anchors `#де-брати-ігри-та-оновлення` (heading 56) and `#використання-перекладів-і-модифікацій` (154). |
| `_pages/system/hbl.md` /hbl | 17-19 Sphaira in titles. 26, 45-48 Sphaira usage. 57-60 .nro via DBI MTP. 62-138 appstore, filebrowser, forwarders, assoc (96: `/config/sphaira/assoc/` → `/config/kefir/assoc/`; 117, 119), roms, Themezer (131 path, 132 NXThemes), web browser. 141-148 fix-attributes stays. → Kefir Hub overview. |
| `_pages/system/backup-saves.md` | 18, 23-62 DBI backup, restore, MTP. Keep warning 18-21. Add DBI/JKSV/Checkpoint import and WebDAV. |
| `_pages/system/link-account.md` | 24-32 Linkalho → Hub Users. Keep intro 17-22. |
| `_pages/system/ftp.md` | 18-36 ftpd → Hub FTP, web file manager, MTP. |
| `_pages/games/cheats.md` | 11 EdiZon title. 16-22 Kefir Updater video. 24-34 download via Kefir Updater → Hub. 36-45 EdiZon overlay toggling (decide whether to keep it). |
| `_pages/system/update-fw.md` | 18, 25, 30, 51, 99-140 Kefir Updater, 142-194 PC + Daybreak → Hub firmware. Keep 196-202 and 209-303 (selector JS). |

## UPDATE
| Page | Lines |
|---|---|
| `_pages/info/kefir.md` | 13, 18-21, 32, 63-71 (component list), 75-84 Ultrahand scripts (77 DBI, 83-84), 128-137 on-console update via Kefir Updater, 158 verify, 182 MTP via DBI, 187-195, 203, 214 Uberhand/Ultrahand naming. Broken link at 60-61. Keep heading 88 (anchor used by tesla-menu). |
| `_pages/info/usage.md` | 12, 51-61 HBL → Hub, 66 deleting games, 68-78 updates. Add saves, cheats, themes, PC file access. |
| `_pages/info/faq.md` | 126, 135, 141 (broken `/dbi#…`), 156 (no Hub equivalent), 183, 188-191 (outdated SX OS), 203-206 |
| `_pages/info/troubleshooting.md` | 101-105, 124-127 (no equivalent), 135-141 (delete), 149-167 Tinfoil tickets, 177-181, 190-195, 209-215, 237-246, 270-291 (DBI tools: NTP → Hub; Delete account → Hub; reset version and orphans have no equivalent) |
| `_pages/info/glossary.md` | 24-26, 52-54 Daybreak, 69 DBI fuses, 80-82 HBL, 88-90, 174-176. Add a "Kefir Hub" entry. |
| `_pages/info/site-navigation.md` | 78, 79, 81, 84, 89 (/tinfoil), 91 |
| `_pages/info/longread.md` | 26, 46, 48-49 Daybreak, 99 Tinfoil |
| `_pages/info/tesla-menu.md` | 29, 30 (Module Manager), 53 (EdiZon still bundled?), 55 (QuickNTP vs Hub NTP) |
| `_pages/info/buying-used.md` | 79-80 DBI USB check → Hub |
| `_pages/games/lanplay.md` | 27-28 hb appstore → Hub App Store |
| `_pages/system/chiaki.md` | 51-52, 56 |
| `_pages/system/emunand.md` | 79 DBI delete account; 147, 151 naming |
| `_pages/system/migrate.md` | 48, 177-181 |
| `_pages/system/downgrade_fw.md` | 16: add a pointer to Hub downgrade for consoles that boot |
| `_pages/redir/launch-hbl.md` | duplicates the `redirect_from` in hbl.md 9-14 (same pattern: launch-cfw vs cfw, update-to-latest vs update-fw) |
| chain pages: preparation-fuse 26-28, 41-43, 53; preparation-caffeine 31-33, 40; preparation-modchip 181-182, 194 | targets change. Optionally add a Kefir Hub step. |

## ARCHIVE
`_pages/games/tinfoil.md`: stub pointing to /games, or delete it and add `/tinfoil` to `redirect_from` in games.md. Inbound links: games.md:33, kefir.md:65, site-navigation.md:89.

## KEEP
home (optionally add Kefir Hub to 77-84), addons, ban, cfw, donations, get-started, emuiibo, backup-nand, downgrade_fw_manual,
autorcm, block-update, sd_macos, system-wipe, preparation-white, exploits/*, dongles/*.

## navigation.yml
Add "Kefir Hub" after Kefir (11-12). Rename 50-51 cheats. Replace 62-63 "DBI full guide" with a link to the Kefir Hub docs. Add /ftp.

## Includes and data
- `inc/launch-hbl.md` 1-8: rename the launcher, check the forwarder.
- `inc/zadig.txt` (unused): rework for Hub USB.
- `inc/hbgshop.txt`, `inc/tinfoil.txt` (unused): delete.
- `inc/additional.txt` 3, 6: labels.
- `llms-full.txt` 27, 29, 39 and `llms.txt`: Kefir Hub.
- Unused images: album.png, dbibackend.jpg, zadig*.png/jpg, nsu*.png.

## Decisions for the user
- DBI features with no Hub equivalent: Reset required version (faq 156, troubleshooting 277); Clean orphaned files (troubleshooting 126, 271; tinfoil 62); fuse count (glossary 69; hekate covers it).
- In-game cheat toggling through the EdiZon overlay: keep it as the in-game method?
- Is DBI still shipped in Kefir?
