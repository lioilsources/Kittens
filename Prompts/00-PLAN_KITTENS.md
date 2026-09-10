# PLAN.md — Speed karetní hra (pracovní název: **Fuse**)

## 1. Cíl
Mobilní karetní hra ve stylu Výbušných koťátek, kde rozhoduje **rychlost hodu správné karty**.
Rychlé tahy s časovým limitem, přežití na životy, lokální multiplayer přes MultipeerConnectivity
(peer-to-peer WiFi/BT bez sdílené sítě), lobby.

Prototyp v1 = ověřit *feel* (limit tahu, swipe, penalizace). Síť až po feelu.

---

## 2. Pravidla v1 (baseline, iterujeme)

**Setup**
- 2–5 hráčů, 3 životy každý, 5 karet do ruky.
- Bomby a Zneškodni se míchají do decku až po rozdání. Vrchní karta decku je otočená = "cíl".

**Tah** (jen hráč na tahu, hodiny běží od převzetí tahu)
- Limit `turnLimit` = 3,0 s (každé kolo −0,25 s, min 1,5 s).
- Platný hod = shoda **barva nebo číslo** s vrchní kartou (mění Otoč).
- Odměna podle času k překročení čáry decku:
  - ≤ 1,0 s → dobíráš 0
  - 1,0–limit → dobíráš 1
  - vypršel čas / neplatná karta → **−1 život**, dobíráš 2
- Po hodu tah přechází po směru hry.

**Bomba**
- Objeví se na vrchu → fuse = 3 tahy. Hráč na tahu, když fuse dojde → −2 životy. Bomba se zamíchá zpět.
- Zneškodni: hoď během svého tahu, bomba se zamíchá zpět (kam chceš, jako u Koťátek – v1 náhodně).
- Odpal: bomba zůstává, fuse se nastaví na 1 a tah přeskočí na zvolený cíl.

**Reakce** (kdykoliv v cizím tahu, swipe do strany na avatar)
- **Ne!** – zruší poslední zahranou akční kartu. Dva Ne! → platí první (host timestamp), druhý propadá.
- **Kradež** – když hráč na tahu váhá > 2,0 s, ukradneš mu tah; on dobere 2.
- **Štít** – hoď do 1,0 s od zahájení animace ztráty života → život zachráněn.

**Konec**
- Hráč s 0 životy = duch: zůstává, 1× za kolo může hodit Ne!.
- Poslední živý vyhrává.

**Deck v1 (72)**
| Karta | Počet | Pozn. |
|---|---|---|
| Základ 4 barvy × 1–10 | 40 | |
| Bomba | 4 | |
| Zneškodni | 6 | |
| Odpal | 4 | vybírá cíl |
| Ne! | 6 | reakce |
| Štít | 4 | reakce |
| Kradež | 4 | reakce |
| Otoč | 2 | shoda = ±1 číslo, barva ignorována |
| Slepá | 2 | vrch skrytý 2 tahy |

---

## 3. Technologie
- **Flutter**, čistý widget tree (bez Flame). Důvod: hra je UI-heavy (ruka, avatary, lobby), fyziku
  nepotřebujeme, swipe a animace zvládne `GestureDetector` + `AnimationController`.
- **Herní logika = čistý Dart package** `fuse_core` bez Flutter závislostí → testovatelná unit testy,
  spustitelná v CLI simulaci.
- Stav: `Riverpod` (nebo co používáš); engine je jediný zdroj pravdy.
- Síť (fáze 3): `MultipeerConnectivity` přes plugin nebo vlastní platform channel (Swift).
  Android až později (Nearby Connections), architektura na to připravená přes `Transport` abstrakci.

---

## 4. Architektura

```
fuse_core/            čistý Dart
  model/              Card, Hand, Deck, Player, GameState (immutable)
  rules/              MatchRule, TurnReward, BombFuse, Reactions
  engine/             GameEngine: apply(Command) -> (GameState, [Event])
  commands.dart       PlayCard, Reaction, TimerExpired, ...  (s clientTimestamp)
  events.dart         CardPlayed, LifeLost, BombSurfaced, TurnStarted, ...
  clock/              GameClock (injektovatelný, zrychlitelný / zpomalitelný)
  bots/               Bot: (GameState, myId) -> Command?  s nastavitelnou reakční dobou
  replay/             Log commandů + seed → deterministické přehrání

app/                  Flutter
  transport/          Transport interface
                        LoopbackTransport   (in-process, N hráčů v jednom procesu)
                        MpcTransport        (fáze 3)
  session/            HostSession (drží engine, rozhodčí) / ClientSession (posílá commandy, přijímá state)
  ui/
    lobby/            create / join / ready
    table/            deck, hráči po obvodu, timer ring
    hand/             vějíř, swipe-to-throw, swipe-to-target
    debug/            DebugPanel (viz §6)
```

**Klíčové principy**
- **Host je autoritativní vždy**, i lokálně/singleplayer. Klient posílá `Command(clientTs)`,
  host přiřadí `serverTs` a rozhodne. UI hraje optimisticky animaci, ale nikdy nemění stav sám.
- **Timer žije na hostu.** Klienti zobrazují odhad (start tahu + limit − odhad latence).
  `TimerExpired` je command generovaný hostem, ne klientem.
- **Remízové okno** 80 ms pro reakce: dva Ne! v okně → rozhodne normalizovaný čas
  (`clientTs − lastMeasuredOffset`), fallback pořadí příchodu.
- **Determinismus**: deck seed + log commandů = kompletní replay. Základ pro testování i bug reporty.

---

## 5. Gesto a UI ruky
- Ruka: vějíř, karty se překrývají max z 50 %, aktuálně "vybraná" karta se zvedne při dotyku.
- **Hod na deck**: swipe nahoru; karta sleduje prst; platí až po překročení **čáry** (y < deckLine).
  Krátký/šikmý swipe → karta se vrátí (bez penalizace).
  Čas hodu = `crossLineTs − turnStartTs`.
- **Reakce**: swipe do strany, karta "letí" na avatar; drop zóna = avatar cíle. Cíl nutný jen u
  Odpal/Kradež; Ne! a Štít mají cíl implicitní.
- Timer: kruh kolem decku, barva zelená (≤1 s) → žlutá → červená; haptika na 1 s a na vypršení.
- Neplatný hod: karta se odrazí zpět + haptic error, hned viditelná ztráta života.

---

## 6. Testovací flow — hraju sám za víc hráčů

Tři úrovně, každá pokrývá jinou věc.

### 6.1 Unit + CLI simulace (`fuse_core`, žádné UI)
- Testy pravidel: každé pravidlo z §2 má test.
- `dart run fuse_core:sim --players 4 --games 500 --seed 1` — boty proti sobě, výstup:
  průměrná délka partie, rozložení ztrát životů podle příčiny (timeout / neplatný / bomba),
  jak často rozhoduje Kradež. **Tohle je primární nástroj pro balancování** limitu a decku.

### 6.2 Hot-seat na jednom telefonu ("puppet mode")
Jedna aplikace, `LoopbackTransport`, N hráčů v jednom procesu. Já ovládám všechny.
- **Přepínač pohledu**: horní lišta s avatary; tap = přepnu, čí ruku vidím a za koho házím.
  Hráč na tahu je zvýrazněn a lze nastavit **auto-follow** (pohled se sám přepne na hráče na tahu).
- **Boti pro zbytek**: každý hráč má režim `human / bot / paused`. Typicky: já = 1 hráč,
  ostatní boti s nastavitelnou reakcí (0,5 s / 1,5 s / náhodně) a "IQ" (hraje první platnou / hraje
  chytře / dělá chyby 20 %).
- **DebugPanel** (swipe z pravého okraje):
  - `clock speed` slider 0,1×–2× (zpomalím si hru, abych stihl reagovat za více hráčů)
  - `pause` / `step` (krokování po commandech)
  - vnutit kartu do ruky libovolného hráče (otestuji Ne! vs Ne!, Štít okno atd.)
  - vnutit bombu na vrch, nastavit fuse
  - přepsat `turnLimit` za běhu
  - zobrazit event log + serverTs
  - `export replay` (JSON) / `load replay`
- **Scénáře** (`scenarios/*.json`): předpřipravené stavy – "bomba fuse 1 na mně, mám Štít",
  "dva hráči mají Ne!", "duch v kole" – jedním tapem načtu a hraju.

### 6.3 Více instancí (síť, fáze 3)
- iOS Simulator × N + fyzický iPhone; MPC běží mezi simulátory a Macem na stejné síti
  (ověřit hned na začátku fáze 3 – pokud ne, zůstává `LoopbackTransport` + jen 2 fyzická zařízení).
- Host ve `puppet` režimu může stále ovládat boty; klienti jsou ostatní zařízení.
- **Latency injector** v `Transport`: umělé zpoždění/jitter 0–300 ms, abych viděl remízová okna
  bez skutečné špatné sítě.
- Lobby test: join/leave během lobby, host odejde → hra skončí s hláškou (v1 bez migrace hosta).

---

## 7. Fáze a milníky

**Fáze 0 – core (bez UI)**
- [x] model + engine + pravidla v1, unit testy
- [x] GameClock injektovatelný
- [x] boti (basic) + CLI sim
- [x] replay log
- ➡️ `fuse_core/` – interpretace nejasných pravidel viz `fuse_core/README.md`

**Fáze 1 – feel na jednom telefonu**
- [ ] table UI, ruka, swipe-to-throw s čárou, timer ring, haptika
- [ ] LoopbackTransport + HostSession
- [ ] puppet mode: přepínač pohledu, human/bot/paused
- [ ] DebugPanel (clock speed, pause/step, vnucení karty, replay)
- [ ] scénáře
- ✅ Výstup: rozhodnutí o `turnLimit`, odstupňování dobírání, zda Kradež zůstává

**Fáze 2 – akční karty a reakce**
- [ ] swipe-to-target, animace letu na avatar
- [ ] Ne!/Štít/Kradež okna, remízové okno
- [ ] duch, Slepá, Otoč
- [ ] balanc přes CLI sim

**Fáze 3 – síť**
- [ ] MpcTransport (Swift platform channel nebo plugin), advertise/browse
- [ ] lobby: create/join/ready, jména, avatary
- [ ] clock sync (ping-pong offset), latency injector
- [ ] resync celého stavu při reconnectu
- [ ] test na 2–3 fyzických zařízeních

**Fáze 4 – polish**
- [ ] zvuky, vizuál karet, onboarding první partie
- [ ] Android transport (Nearby Connections)

---

## 8. Otevřené otázky (dořešit během fáze 1)
- Zneškodni: bomba náhodně zpět, nebo výběr pozice jako u Koťátek?
- Má se ruka při ≥ 10 kartách nějak trestat (např. kratší limit)?
- Kradež: 2,0 s práh vs. 3,0 s limit – je okno 1 s dost?
- Zkracování limitu po kolech – lineárně, nebo skokově po každé eliminaci?
- Migrace hosta při odpojení – v1 ne, ale nechat dveře otevřené (stav je serializovatelný).
