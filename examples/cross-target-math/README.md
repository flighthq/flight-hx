# Cross-target scalar SDK slice

`CrossTargetMath.hx` is one host-free Haxe program compiled three ways from an isolated `-lib flight`
consumer:

- web uses the complete generated Flight ESM extern surface and the static-import bundler pipeline;
- desktop uses hxcpp and direct C++ calls into every compile-proven scalar Math/Color function in
  the pinned flight-cpp generated headers;
- fallback uses the compiler-emitted pure-Haxe implementation subset on ordinary Haxe-to-JS.

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
