# Cross-target Math

`CrossTargetMath.hx` is one host-free Haxe program compiled two ways:

- web uses the complete generated Flight ESM extern surface and the static-import bundler pipeline;
- desktop uses hxcpp and direct C++ calls into the pinned flight-cpp generated headers.

Run the reproducible compile, link, and behavioral proof for both targets:

```sh
npm run setup
npm run rehydrate
npm run gate:cross-target
```

The native proof is intentionally representative, not a claim of complete native parity. The exact
available functions, required C++ standard, flight-cpp revision, headers, and downstream corrections
are recorded in `src-cpp/manifest.json`. Add native bindings there only when the pinned flight-cpp
SDK actually provides them; unsupported calls should remain compile-time unavailable.
