# flight-hx

Haxe **bindings** for the [Flight SDK](https://github.com/flighthq/flight) — one `flight.*` surface
that resolves, by compile define, to compiled Flight: C++ (via [flight-cpp](https://github.com/flighthq/flight-cpp))
on native, ESM on web, and an optional transpiled-Haxe fallback for pure-VM targets.

This is not a Haxe reimplementation of Flight; it binds to it. See [AGENTS.md](AGENTS.md) for the
architecture, the rationale, and the decisions behind every part.

## Layout

- `src/flight/` — maintained runtime shim + a hand-written proof-of-shape (`Vector2`, `Geom`) across
  the `flight.*` / `_cpp` / `_js` / `_hx` structure.
- `generated/{hx,cpp,js}` — checked-in generated bindings (empty until the backend lands).
- `tools/backend-hx/` — skunkworks bindings backend (promotes to flight-compiler later).
- `tools/esm/` — the vendored ESM generator (web pay-per-use).
- `tests/gates/` — behavioral, backend-parity, and web-DCE gates.
- `dependencies.lock.json` + `scripts/` — pins `flight`/`flight-compiler`/`flight-cpp`, rehydrated
  into a gitignored `.dependencies/`.

## Develop

```sh
npm ci && npm run setup     # provision the pinned Haxe (4.3.7)
npm run rehydrate           # materialize pinned flight / flight-compiler / flight-cpp
npm run proof               # compile + run the proof-of-shape on the flight_hx backend
npm run gate:proof          # behavioral gate: proof runs, and no-backend fails loud
```

Status: greenfield restart. The proof-of-shape compiles and runs; the bindings backend and ESM
generator are next. The previous transpile-based flight-hx is archived as `flight-hx-archive`.
