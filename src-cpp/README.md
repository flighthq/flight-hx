# Native flight-cpp binding boundary

This directory is the exact downstream support partition, not a promise that every header emitted
by flight-cpp is usable. `manifest.json` pins the flight-cpp checkout, its generated SDK's distinct
Flight/compiler revisions, C++20, downstream corrections, public Haxe names, native symbols, and
headers. Public facade overrides deliberately expose nothing outside that manifest.

## Current compile audit

The pinned flight-cpp SDK reports 314 emitted and 2,537 refused modules from its older pinned Flight
graph. A standalone C++20 syntax audit found callable functions in 30 generated headers. Only four
of those headers compile unchanged against the pinned runtime:

- `flight/math/clamp.hpp`
- `flight/math/interpolation.hpp`
- `flight/color/srgb_transfer.hpp`
- `flight/geometry/geometry_pool_guards.hpp`

The first three have current extern-compatible scalar signatures and form the ten-function native
partition. The geometry header installs a process-global callback; it stays unbound until ownership,
threading, and callback lifetime are specified for Haxe. The remaining 26 callable headers fail
standalone compilation because of compiler/runtime gaps such as missing helpers, declaration order,
an invalid `cmath.exp` qualifier, a constant/function name collision, or stale runtime member names.
This is the concrete golden reference for future flight-compiler and flight-cpp improvements.

The bridges do not reimplement Flight. They include the generated headers and forward directly to
their functions. Their only semantic correction renames flight-cpp's `flight::null` helper while the
headers are parsed, because hxcpp generates unqualified `null()` calls inside namespace `flight`.
The haxelib initialization macro also suppresses hxcpp's trailing C++11 flag so flight-cpp remains a
C++20 build.

## Window/render status

flight-cpp contains a real optional SDL3 host that owns lifecycle, events, windows, and graphics
surface acquisition. It intentionally does not yet wire the generated Flight renderer contracts;
`flight-cpp/docs/host-sdl.md` identifies that adapter and a compilable types package as remaining
work. Consequently `examples/window-native` cannot honestly become a Flight-rendering sample from
the current SDK. The host additionally requires an external SDL 3.2+ development package. Keep the
window example fail-loud until both the upstream adapter surface and its native dependency are
available; do not replace it with a local renderer or a fake window.
