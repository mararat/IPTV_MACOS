# IPTV macOS

Professional OTT/IPTV Client Application for macOS.

## Tech Stack
- **Framework:** Flutter (macOS desktop), SDK ^3.10.7
- **Video:** media_kit + media_kit_video (mpv-based native rendering)
- **State:** flutter_bloc / Cubit
- **API:** Xtream Codes (live, VOD, series)
- **Storage:** flutter_secure_storage (Keychain), shared_preferences

## Architecture
Feature-based structure under `lib/features/`:
- `player/` — Playback (PlayerBloc, PlayerPageMac)
- `catalog/` — Live TV channels, VOD listing
- `series/` — Series listing and episodes
- `home/` — Home/dashboard page
- `settings/` — App settings
- `auth/` — Login and credentials

Shared code under `lib/core/`:
- `widgets/` — Reusable widgets (InlinePlayer in `player_overlay.dart`)
- `theme/` — AppColors, theming
- `di/` — Service locator

## Key Conventions
- Commit messages: `type: description` (feat, fix, refactor, etc.)
- Turkish UI strings (CANLI, Altyazi, Ses Dili, etc.)
- Two video players:
  - `InlinePlayer` (`lib/core/widgets/player_overlay.dart`) — embedded in catalog pages
  - `PlayerPageMac` (`lib/features/player/presentation/pages/player_page_mac.dart`) — fullscreen player
- Video widget must use `SizedBox.expand()` wrapper on macOS (not Center)

## Running
```bash
flutter run -d macos
```

## Keyboard Shortcuts (Player)
- Space: Play/Pause
- Left/Right arrows: Seek -/+ 10s
- Up/Down arrows: Volume +/- 5
- M: Mute toggle
- F: Fullscreen (InlinePlayer)
- Esc: Back/Close
- [ / ]: Decrease/Increase playback speed
