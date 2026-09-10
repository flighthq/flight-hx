# window-native — the one real end-to-end app (native)

**Stub.** Blocked on the `_cpp` backend + the native co-compile against
[flight-cpp](https://github.com/flighthq/flight-cpp).

A real windowed render loop using **Flight's own host** (the platform layer flight-cpp links — SDL/
etc.), compiled `cpp` → `_cpp`. This is the *representative* whole-stack app: it proves the host
binding + render + the full pipeline compose, not just that individual functions bind — the teeth
behind the **behavioral gate**. One app chosen for surface coverage, not a port of Flight's catalog.

When it lands: static-link flight-cpp from source, `-ffunction-sections`/`--gc-sections` (and/or LTO)
so linker DCE proves pay-per-use survives, then run it under the behavioral gate.
