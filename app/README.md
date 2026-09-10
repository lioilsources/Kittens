# Kittens – aplikace (fáze 1)

Flutter appka nad [`fuse_core`](../fuse_core/). Cíl fáze 1 je vyzkoušet *feel* na jednom telefonu:
limit tahu, swipe a tresty. Hru ovládáš za všechny hráče, nebo hraješ proti botům.

```sh
flutter pub get
flutter test
flutter run                                          # úvodní obrazovka
flutter run --dart-define=FUSE_AUTOSTART=bots        # rovnou partie čtyř botů
flutter run --dart-define=FUSE_AUTOSTART=02_dve_ne   # rovnou scénář (název souboru)
```
## Jak se hraje

- **Hod na balíček:** karta jde za prstem. Počítá se ve chvíli, kdy překročí čáru pod doutnákem po
  tahu nahoru, případně po rychlém švihnutí nahoru. Krátký nebo šikmý tah kartu vrátí bez trestu.
- **Ne! a Štít:** táhni je do strany (okraj se rozsvítí), na hráče nebo na balíček.
- **Odpal a Kradež:** táhni je na avatar cíle. Vhodné cíle se při tažení rozsvítí.
- **Doutnák** kolem balíčku ukazuje, co tě čeká. Zelená je rychlý hod bez dobírání, žlutá normální
  hod a v červené ti může kdokoliv ukrást tah. Haptika se ozve na konci zeleného úseku, při vypršení
  času a při neplatné kartě.
- **Duch** má u svého jména tlačítko *Ne! ducha*, jednou za kolo.

## Puppet mode a ladění

- **Lišta nahoře:** klepnutím na hráče vidíš jeho ruku a házíš za něj. Tečka značí hráče na tahu.
- **Ladění** (ikona vpravo nahoře):
  - čas: pauza, krok na další událost, rychlost 0,1–2×, umělá latence
  - místa u stolu: člověk / bot / pauza, IQ a reakce botů, životy ±
  - vnucení karty do ruky, bomba s fuse, limit tahu, cíl
  - replay: kopírování do schránky a načtení ze schránky, hra pokračuje od konce replaye
  - scénáře a log událostí s herním časem
- **Scénáře** v `assets/scenarios/*.json`: místa u stolu, seed, rychlost a debug commandy aplikované na
  začátku hry. Nový scénář = nový JSON soubor, žádný kód.

## Architektura

| Soubor | Co dělá |
|---|---|
| `lib/transport/transport.dart` | rozhraní `HostTransport` / `ClientTransport` (MPC ve fázi 3) |
| `lib/transport/loopback_transport.dart` | host a klienti v jednom procesu, volitelná latence a jitter |
| `lib/session/host_session.dart` | autoritativní host: `HostLoop` + `ScaledClock` + časovač na další deadline nebo tah bota |
| `lib/session/client_session.dart` | jedno místo u stolu: přijímá `PlayerView`, posílá commandy, stav nikdy nemění |
| `lib/session/puppet_session.dart` | lokální hra = host + klient pro každé místo |
| `lib/session/scenario.dart`, `seat.dart` | scénáře a nastavení míst (člověk / bot / pauza) |
| `lib/state/providers.dart` | Riverpod: běžící hra, snapshot hosta, pohled místa, puppet stav |
| `lib/ui/table/` | stůl: rozmístění hráčů, balíček s doutnákem, zóny pro puštění karty, hlášky |
| `lib/ui/hand/hand_view.dart` | vějíř karet a gesta (čára, švihnutí, cíl, návrat) |
| `lib/ui/debug/debug_panel.dart` | ladicí panel |
| `lib/autostart.dart` | `FUSE_AUTOSTART` |

UI nikdy nemění herní stav samo. Zahraná karta zůstane schovaná, dokud host neodpoví. Neplatná karta
se pak vrátí do ruky a ruka se zatřese.

Písmo *Alfa Slab One* je pod licencí SIL OFL (`assets/fonts/OFL.txt`).
