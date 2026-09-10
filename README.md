# Kittens

Mobilní speed karetní hra ve stylu Výbušných koťátek: rozhoduje rychlost hodu
správné karty, tahy mají časový limit, hraje se na životy, později lokální multiplayer přes
MultipeerConnectivity.

| Složka | Obsah |
|---|---|
| [`Prompts/00-PLAN_KITTENS.md`](Prompts/00-PLAN_KITTENS.md) | plán: pravidla v1, architektura, testovací flow, fáze |
| [`fuse_core/`](fuse_core/) | čistý Dart: model, engine, pravidla, boti, replay, CLI simulace |
| [`app/`](app/) | Flutter aplikace: stůl, swipe, doutnák, puppet mode, DebugPanel, scénáře |

```sh
cd fuse_core
dart pub get && dart test
dart run fuse_core:sim --players 4 --games 500 --seed 1

cd ../app
flutter test
flutter run                                        # úvodní obrazovka
flutter run --dart-define=FUSE_AUTOSTART=bots      # rovnou partie botů
```

## Stav

- [x] **Fáze 0** – core bez UI (engine, pravidla v1, testy, boti, CLI sim, replay)
- [x] **Fáze 1** – feel na jednom telefonu (stůl, swipe, timer, puppet mode, DebugPanel, scénáře)
- [ ] **Fáze 2** – akční karty a reakce v UI, balanc
- [ ] **Fáze 3** – síť (MultipeerConnectivity)
- [ ] **Fáze 4** – polish
