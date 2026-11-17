# Kittens (KittenCards)

<!-- Max 80 řádků. Co se nevejde, jde do docs/ a sem jeden odkaz. Veřejné repo: žádné LAN IP, domovské cesty, ID. -->

## Účel
Mobilní speed karetní hra ve stylu Výbušných koťátek: rychlost hodu, časový limit tahu, hra na životy.
Později lokální multiplayer přes MultipeerConnectivity.

## Build a test
```
cd fuse_core && dart pub get && dart test       # gate: core
dart run fuse_core:sim --players 4 --games 500 --seed 1
cd app && flutter test                          # gate: aplikace
flutter run --dart-define=FUSE_AUTOSTART=bots   # rovnou partie botů
```

## Mapa
- `fuse_core/` – čistý Dart: model, engine, pravidla, boti, replay, CLI simulace (`bin/sim.dart`)
- `app/` – Flutter aplikace: stůl, swipe, doutnák, puppet mode, DebugPanel, scénáře
- `Prompts/` – plány fází (`00-PLAN_KITTENS.md`)

## Invarianty
- Herní logika žije ve `fuse_core` bez závislosti na Flutteru; aplikace ji jen používá.

## Kam dál
README.md, `Prompts/00-PLAN_KITTENS.md`
