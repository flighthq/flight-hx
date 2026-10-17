# window-native — the one real end-to-end app (native)

**Stub.** The direct `_cpp` pipeline now works for the representative host-free Math slice in
[`../cross-target-math/`](../cross-target-math/). This windowed follow-up is blocked on expanding the
manifest-recorded native surface to the required host and rendering APIs in
[flight-cpp](https://github.com/flighthq/flight-cpp), not on basic hxcpp/C++ integration.

A real windowed render loop using **Flight's own host** (the platform layer flight-cpp links — SDL/
etc.), compiled `cpp` → `_cpp`. This is the *representative* whole-stack app: it proves the host
binding + render + the full pipeline compose, not just that individual functions bind — the teeth
behind the **behavioral gate**. One app chosen for surface coverage, not a port of Flight's catalog.

When it lands: static-link flight-cpp from source, `-ffunction-sections`/`--gc-sections` (and/or LTO)
so linker DCE proves pay-per-use survives, then run it under the behavioral gate.
