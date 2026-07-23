# Examples

Haxe programs written directly against the generated Flight Haxe surface (`flighthq.*`) — no TypeScript and no JavaScript bridge. Their purpose is the reason this port exists: a user writes Haxe over Flight and ships it to a native cross-platform target. Each example therefore stays headless (logic and simulation, no rendering) so it compiles and runs on every Haxe target, not just JavaScript.

Rendering is intentionally out of scope here: it is platform-specific and belongs behind target adapters, whereas these examples exercise the portable API surface.

## Layout

Each example is a directory with a `Main` class:

```
examples/<name>/Main.hx   // class Main { static function main() { … } }
```

## Running

```
npm run example <name> [eval|js|python|cpp]   # default target: eval
```

For example:

```
npm run example clock          # run on the Eval interpreter
npm run example clock cpp      # compile to native C++ and run the binary
```

The runner compiles the example against the maintained `src` and generated `generated` classpaths and executes it on the chosen target. `cpp` requires a C++ compiler; `python` requires Python 3.

## Examples

- `clock` — a hierarchy of scaled, pausable clocks (`flighthq.ClockApi`), asserting elapsed-time composition, pause semantics, and effective-scale propagation.
