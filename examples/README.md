# examples

These demonstrate **the flight-hx binding layer** — that the `flight.*` surface is faithful,
ergonomic, and pays-per-use — **not** "what Flight can do." Capability demos belong upstream in
[Flight](https://github.com/flighthq/flight); see the *Examples* section of [../AGENTS.md](../AGENTS.md)
for the reasoning and the litmus test.

Core examples use **no host** or **Flight's own host** — never Lime/Clay, which are on-top
integrations that consume flight-hx as a `haxelib`.

| tier | host | pipeline | status |
|---|---|---|---|
| [`headless/`](headless/) | none | any backend | ✅ runnable now (`flight_hx`) |
| [`fallback-hx/`](fallback-hx/) | none | `js` + `flight_hx` | ✅ covered by the proof gate |
| [`window-native/`](window-native/) | Flight's own | `cpp` → `_cpp` | ⏳ stub (awaits `_cpp` backend) |
| [`window-web/`](window-web/) | Flight's own | `js` + `flight_esm` → `_js` | ⏳ stub (awaits `_js` + `tools/esm`) |

Run the headless example:

```sh
node tools/haxe.mjs examples/headless/build.hxml
```
