# Kittens — Fuse

Mobilní speed karetní hra ve stylu Výbušných koťátek (pracovní název **Fuse**): rozhoduje rychlost hodu
správné karty, tahy mají časový limit, hraje se na životy, později lokální multiplayer přes
MultipeerConnectivity.

| Složka | Obsah |
|---|---|
| [`Prompts/00-PLAN_KITTENS.md`](Prompts/00-PLAN_KITTENS.md) | plán: pravidla v1, architektura, testovací flow, fáze |
| [`fuse_core/`](fuse_core/) | čistý Dart: model, engine, pravidla, boti, replay, CLI simulace |
| `app/` | Flutter aplikace (fáze 1) |

```sh
cd fuse_core
dart pub get && dart test
dart run fuse_core:sim --players 4 --games 500 --seed 1
```

## Stav

- [x] **Fáze 0** – core bez UI (engine, pravidla v1, testy, boti, CLI sim, replay)
- [ ] **Fáze 1** – feel na jednom telefonu (stůl, swipe, timer, puppet mode, DebugPanel)
- [ ] **Fáze 2** – akční karty a reakce v UI, balanc
- [ ] **Fáze 3** – síť (MultipeerConnectivity)
- [ ] **Fáze 4** – polish
