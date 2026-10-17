# window-native — the one real end-to-end app (native)

**Stub.** The installed-package `_cpp` pipeline now works for all ten compile-proven scalar Math and
Color bindings in [`../cross-target-math/`](../cross-target-math/). flight-cpp also contains a real
SDL3 lifecycle/window/surface host, but its own `docs/host-sdl.md` explicitly records the generated
types and GL/WGPU renderer adapter as unfinished. This sample is blocked on that upstream surface
(and an SDL 3.2+ development package), not on haxelib, hxcpp, or basic direct C++ integration.

A real windowed render loop using **Flight's own host** (the platform layer flight-cpp links — SDL/
etc.), compiled `cpp` → `_cpp`. This is the *representative* whole-stack app: it proves the host
binding + render + the full pipeline compose, not just that individual functions bind — the teeth
behind the **behavioral gate**. One app chosen for surface coverage, not a port of Flight's catalog.

When it lands: static-link flight-cpp from source, `-ffunction-sections`/`--gc-sections` (and/or LTO)
so linker DCE proves pay-per-use survives, then run it under the behavioral gate.
