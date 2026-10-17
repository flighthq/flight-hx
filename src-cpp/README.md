# Native flight-cpp binding boundary

This directory is the exact downstream support partition, not a promise that every header emitted
by flight-cpp is usable. `manifest.json` pins the flight-cpp checkout, its generated SDK's distinct
Flight/compiler revisions, C++20, downstream corrections, public Haxe names, native symbols, and
headers. Public facade overrides deliberately expose nothing outside that manifest.

## Current compile audit

The current pin's generated SDK uses the same Flight and flight-compiler revisions as this repo. It
reports 2,563 emitted and 588 refused modules from 3,151 profile inputs across 153 packages. The
exact general-purpose Haxe-callable partition remains intentionally smaller: ten scalar functions
from `flight/math/clamp.hpp`, `flight/math/interpolation.hpp`, and
`flight/color/srgb_transfer.hpp`. They are compared with the current web extern signatures and
compiled and executed from one Haxe source in the cross-target gate. Expanding that partition must
remain manifest-first and compile-proven; the much larger generated C++ inventory is not silently
claimed as Haxe support.

The bridges do not reimplement Flight. They include the generated headers and forward directly to
their functions. Their only semantic correction renames flight-cpp's `flight::null` helper while the
headers are parsed, because hxcpp generates unqualified `null()` calls inside namespace `flight`.
The haxelib initialization macro also suppresses hxcpp's trailing C++11 flag so flight-cpp remains a
C++20 build.

## Window/render status

The current flight-cpp pin contains the real optional SDL3 host and its OpenGL adapter. The
manifest-recorded `flight.HostSdlGl` extension now lets `examples/window-native` construct that host,
create a hidden SDL OpenGL window/context, issue a clear through flight-cpp's WebGL-shaped adapter,
and present. The installed-package cross-target gate builds and runs this path offscreen.

This is a real host/window/GL/presentation proof, but not a claim that every generated Flight
renderer contract is available through Haxe. Keep the native extension separate from the generated
portable surface until that mapping is complete. Building it requires CMake, Ninja, and external SDL
3.2+ development files; the Haxelib packages bridge source, not SDL or prebuilt flight-cpp binaries.
