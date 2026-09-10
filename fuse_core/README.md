# fuse_core

Čistý Dart balíček s herní logikou hry **Kittens** (viz `../Prompts/00-PLAN_KITTENS.md`).
Žádná závislost na Flutteru → unit testy, CLI simulace, deterministický replay.

```sh
dart pub get
dart test                                                   # pravidla, boti, replay, hodiny
dart run fuse_core:sim --players 4 --games 500 --seed 1     # balancovací report
dart run fuse_core:sim -p 3 -g 1 --log                      # event log jedné partie
dart run fuse_core:sim --help                               # limity, prahy, IQ/reakce botů, --json, --replay-out
```

## Mapa

| Soubor | Co dělá |
|---|---|
| `lib/src/model/` | `Card`, `RulesConfig` (všechna čísla z §2), `GameState` (immutable, JSON), `GameSetup` + `buildDeck` |
| `lib/src/rules/` | čisté funkce: `match_rule`, `turn_reward`, `bomb_fuse`, `reactions` |
| `lib/src/engine/game_engine.dart` | `GameEngine.newGame(setup)`, `GameEngine.apply(state, command) → (state, events)` |
| `lib/src/engine/tx.dart` | pracovní kopie stavu pro jeden krok + primitivy (tah, dobírání, deadliny, životy) |
| `lib/src/commands.dart` | `PlayCard`, `PlayReaction`, `GhostNope`, `TimerExpired`, `Debug*` (vše s `serverTs`/`clientTs`, JSON) |
| `lib/src/events.dart` | `TurnStarted`, `CardThrown`, `LifeLossPending`, `BombSurfaced`, `TurnStolen`, … |
| `lib/src/view/player_view.dart` | co smí vidět jeden hráč (skryté ruce, Slepá) – boti vidí jen tohle |
| `lib/src/clock/game_clock.dart` | `ManualClock` (testy/sim), `ScaledClock` (rychlost 0,1–2×, pauza, krok) |
| `lib/src/bots/` | `Bot` = čistá funkce `(PlayerView) → BotIntent?`; `BasicBot` s IQ `smart/firstValid/sloppy` a reakční dobou |
| `lib/src/replay/replay.dart` | `Replay` (setup + seed + log commandů, JSON), `RecordedGame` (stav + log) |
| `lib/src/host/host_loop.dart` | `HostLoop`: plánování hosta – deadliny a záměry botů v pořadí herního času, lidské commandy se zařadí podle příchodu. Sdílí ho CLI sim i `HostSession` v appce |
| `lib/src/sim/` | `Simulation` (headless host nad `HostLoop`, diskrétní čas) + `GameStats`/`AggregateStats` |
| `bin/sim.dart` | CLI |

## Principy (z plánu §4)

- **Engine je čistá funkce** a jediný zdroj pravdy. Nečte hodiny: čas přichází jen jako `serverTs`
  na commandu (host ho razítkuje, nesmí klesat).
- **Timer žije na hostu.** `state.nextDeadline` říká, kdy má host poslat `TimerExpired`. Každý command
  nejdřív vyřeší všechny deadliny `< serverTs` (timeout tahu, konec okna Štítu), `TimerExpired` i `= serverTs`.
  Pozdě doručený hod se tak posoudí až po timeoutu → spravedlivé a deterministické.
- **Determinismus.** Vlastní PRNG (xoshiro128**, stav je součástí `GameState`) → stejný seed + stejné
  commandy = stejná hra na libovolném zařízení. Replay test to ověřuje přes JSON.
- **Debug commandy** (vnutit kartu, bombu s fuse, limit, životy, cíl) jdou přes engine a logují se →
  scénáře pro fázi 1 = `Replay` s předponou debug commandů.

## Interpretace pravidel (rozhodnuto při implementaci – k odsouhlasení)

Plán v některých místech připouští víc čtení. Zvolil jsem tohle; vše je v enginu na jednom místě
a většina je parametr v `RulesConfig`.

1. **Deck a cíl.** Dobírací deck + odhazovací hromádka. „Cíl" = poslední hozená **číselná** karta;
   akční karty cíl nemění. Bomba se nikdy nedostane do ruky: když ji někdo dobere, *vynoří se*
   (a spotřebuje to jedno dobrání). Druhá bomba při aktivní bombě jde na odhazovací hromádku.
   Prázdný deck → zamíchá se odhazovací hromádka.
2. **Kittens** počítá **dokončené** tahy (platný hod, neplatný hod, timeout) včetně aktuálního; tah, který ho
   srazí na 0, dostane −2. **Předané** tahy (Kradež, Odpal, návrat přes Ne!) fuse netikají → kdo krade,
   přebírá i bombu. Odpal: fuse 1 a cíl je na tahu → když nic neudělá, bouchne po jeho tahu jemu.
3. **Akční karty hozené na deck:** Otoč a Slepá jsou vždy platné; Zneškodni a Odpal jen při aktivní
   bombě; reakční karta hozená nahoru = neplatný hod. Akční karta dostává stejnou časovou odměnu jako číselná.
4. **Neplatný hod** → karta se vrátí do ruky, −1 život, dobírá 2, tah přechází. **Chybný command**
   (není tvůj tah, karta není v ruce, Odpal bez cíle, Kradež moc brzy) → `CommandRejected`, bez trestu.
5. **Ztráta života je dvoufázová:** `LifeLossPending` hned (start animace), odečet až po 1,0 s
   (okno Štítu). Hra mezitím běží dál.
6. **Štít** hraje jen oběť; sníží čekající ztrátu o `shieldSavesLives` = 1 → na bombu (−2) jsou potřeba
   dva Štíty. Trestné dobírání neruší.
7. **Ne!** smí kdokoliv, i hráč na tahu (typicky cíl Odpalu), na **poslední** akční kartu (Zneškodni,
   Odpal, Otoč, Slepá, Štít, Kradež), dokud trvá tah, který akce založila, a max `nopeWindowMs` = 2 s.
   Ne! nejde zrušit dalším Ne! → druhé propadne (karta je pryč). Ne! bez cíle je odmítnuto (karta zůstává).
   Zrušení: Zneškodni → bomba zpět s původním fuse · Odpal → fuse zpět a tah zpět odpalujícímu ·
   Kradež → tah zpět okradenému, jeho 2 karty zpět na deck · Štít → ztráta znovu čeká · Otoč/Slepá → vráceno.
8. **Kradež:** živý hráč mimo tah, striktně > 2,0 s od začátku tahu. Oběť dobere 2, zloděj má nový tah
   s plným limitem a hra pokračuje od něj.
9. **Duch** je přeskakován, ruku si nechává, 1× za kolo Ne! **bez karty** (`ghostNopeNeedsCard`).
10. **Kolo** = tolik tahů, kolik je živých hráčů (funguje i s Kradeží/Odpalem). Limit se určí při startu
    tahu; `limitDecay: perRound | perElimination` (otevřená otázka §8).
11. **Otoč** je přepínač (platí do dalšího Otoč): číslo ±1, bez přetečení 10→1, stejné číslo neplatí.
12. **Slepá** skryje cíl v `PlayerView` na 2 dokončené tahy; engine soudí proti skutečnému cíli.
13. **Hranice:** hod přesně v limitu je včas · ≤ 1 000 ms = rychlý hod · Štít přesně na konci okna platí.
14. **Zneškodněná/vybuchlá bomba** jde na náhodnou pozici v decku **včetně vrchu** (v1 „náhodně") –
    může se tedy hned znovu vynořit.

## Co dál (fáze 1)

`app/` ve Flutteru: `HostSession` = smyčka ze `Simulation`, jen řízená `ScaledClock` místo diskrétního
času; `LoopbackTransport`; puppet mode (boti jsou už hotoví a vidí jen `PlayerView`); DebugPanel
(rychlost/pauza přes `ScaledClock`, vnucení karet přes `Debug*` commandy, export/load `Replay`).
