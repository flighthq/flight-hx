# flight-hx

Haxe **bindings** for the [Flight SDK](https://github.com/flighthq/flight) — one `flight.*` surface that resolves, by compile define, to compiled Flight: C++ (via [flight-cpp](https://github.com/flighthq/flight-cpp)) on native, ESM on web, and an optional transpiled-Haxe fallback for pure-VM targets.

This is not a Haxe reimplementation of Flight; it binds to it. See [AGENTS.md](AGENTS.md) for the architecture, the rationale, and the decisions behind every part.

## Layout

- `src/flight/` — maintained runtime shim + the `flight.*` backend selectors.
- `generated/js` — compiler-emitted ESM externs; `generated/hx` — compiler-emitted transpiled fallback.
- `tools/backend-hx/` — deterministic flight-compiler integration, compatibility, and provenance.
- `tools/esm/` — the vendored ESM generator (web pay-per-use).
- `tests/gates/` — behavioral, backend-parity, and web-DCE gates.
- `dependencies.lock.json` + `scripts/` — pins `flight`/`flight-compiler`/`flight-cpp`, rehydrated into a gitignored `.dependencies/`.

## Develop

```sh
npm ci && npm run setup     # provision the pinned Haxe (4.3.7)
npm run rehydrate           # materialize pinned flight / flight-compiler / flight-cpp
npm install --prefix .dependencies/flight-compiler && npm run generate
npm run proof               # compile + run the proof-of-shape on the flight_hx backend
npm run gate:proof          # behavioral gate: proof runs, and no-backend fails loud
npm run gate:surface        # type-check every emitted extern and public type alias
npm run gate:bindings       # verify every extern function against built real Flight ESM
npm run gate:transpile      # compile all emitted TS-to-Haxe sources and execute one
npm run generate:check      # regenerate both modes in memory and reject drift
```

The pinned compiler scans the complete 154-package Flight SDK graph. Extern generation accepts 1,635 of 2,855 production modules, emits 2,096 compiler files plus 2,016 public type aliases, and binds 2,584 functions whose existence is checked against real Flight ESM. Transpilation accepts 1,110 of 2,866 non-test modules. Unsupported modules remain explicit in each mode's `refusals.json`; generated files are never silent stubs. Both complete emitted trees compile under pinned Haxe 4.3.7, and the transpiled gate executes compiler-emitted implementation code.
