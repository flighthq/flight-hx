# window-native — the one real end-to-end app (native)

This executable Haxe sample enters the current pinned flight-cpp `Flight::HostSdlGl` package through
a direct hxcpp extern, initializes SDL3, creates a real hidden OpenGL window/context, clears it, and
presents it. It proves the installed Haxelib, Haxe-to-C++, static host libraries, SDL3, GL procedure
adapter, and presentation path compose. It deliberately does not claim that Flight's generated
cross-platform renderer contract is fully exposed to Haxe yet.

The repeatable installed-package proof is:

```sh
npm run setup
npm run rehydrate
npm run gate:cross-target
```

The gate configures the pinned flight-cpp development preset with `FLIGHT_CPP_BUILD_HOST_SDL=ON`
and Vulkan disabled, builds `flight_host_sdl_gl`, installs a freshly packaged `flight` Haxelib into
an isolated repository, compiles this source, and runs it with SDL's offscreen driver on Linux. It
requires CMake, Ninja, and SDL 3.2 or newer development files.

`flight.HostSdlGl.runHostSdlGlSmoke` is a manifest-recorded native platform extension, separate from
the generated portable `flight.*` contract. That boundary lets this real host proof advance now
without inventing a false web equivalent or hiding the remaining renderer work.
