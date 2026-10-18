# Cross-target scalar SDK slice

`CrossTargetMath.hx` is one host-free Haxe program compiled for the two current production backends
from an isolated `-lib flight` consumer:

- web uses the complete generated Flight ESM extern surface and the static-import bundler pipeline;
- desktop uses hxcpp for all 82 manifest-recorded, compile-proven functions across Audio, Color,
  Effects, Entity, Input, Math, Path, Power, and Protocol: 62 compiler-planned direct calls, four
  compiler-emitted UTF-8 String adapters, and 16 explicit dependency-complete Effects overrides;
- `CrossTargetFallback.hx` separately keeps the legacy-pinned compiler-emitted Haxe subset honest
  on ordinary Haxe-to-JS without adding target branches to the production sample.

Run the reproducible compile, link, and behavioral proof for both targets:

```sh
npm run setup
npm run rehydrate
npm run gate:cross-target
```

That gate also compiles and runs [`../window-native/`](../window-native/) from the same isolated
Haxelib install against the current flight-cpp SDL3/OpenGL host. The scalar program is the unchanged
web/desktop source proof; the window program is a deliberately native extension until the portable
generated renderer contract is ready.

The native proof is an exact supported partition, not a claim of complete native parity. The exact
available functions, required C++ standard, flight-cpp revision, headers, and downstream corrections
are recorded in `src-cpp/manifest.json`. Add native bindings there only when the pinned flight-cpp
SDK actually provides them; unsupported calls should remain compile-time unavailable.
