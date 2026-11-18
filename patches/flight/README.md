# Flight producer patches

The manifest lists the patches applied to Flight `5e1121e4cfdfde289b5373693dd285a2035dd285` in order.
`tools/flight-source.mjs` applies them in an isolated checkout and records their hashes in the extern and native artifact provenance.

- `0004-hl-packed-floats.patch` packs calls with more than six floating-point arguments into a HashLink array. The C ABI and public Haxe signatures retain their original argument lists.
- `0006-ref-handles.patch` registers owned Ref handles and supplies typed node views for upcasting. Node receivers acquire the correct Rust lock, and `flight.Entity.freeRef` releases a registered handle and all its views. The exact upstream free functions also accept the registered handles.
- `0007-byte-buffer-results.patch` preserves the Haxe `NativeByteBuffer` API over owned byte results. Upstream's per-result length, element and free functions use the same storage.
- `0008-exported-struct-fields.patch` exposes public scalar and UTF-8 string fields of exported structs. Haxe copies string results and releases the temporary native buffers.
- `0009-develop-compatibility.patch` preserves caller ownership of bitmap inputs when building regions.
- `0010-haxe-owned-carriers.patch` connects Flight's owned byte readers and command-history unit signals to Haxe. It also supplies string-field ownership metadata, handles empty Rust structs in field discovery, and reads the text-layout enum definitions used by the native ABI.

- `0011-stable-free-function-modules.patch` places generated free functions in the defining crate’s Haxe facade whenever the type has a unique owner. For example, `freeRectangle` stays in `flight.Geometry` when other crates start returning rectangles.
- `0012-inherited-node-properties.patch` declares shared node properties with their trait, ABI carrier, and invalidation policy. The native producer uses the same Rust node-family discovery as the Ref registry, and bindgen projects properties onto each generated type with the matching native accessors.

- `0013-web-host-seams.patch` adds explicit ESM signatures for Flight’s browser Canvas and input-target capabilities and opaque handles. The bindings import the public `@flighthq/host-web` and `@flighthq/surface` exports.

Flight now includes native artifact emission, direct JS/ESM bindings, and case-safe Haxe module names. Apply the current manifest in order on a clean Flight checkout at the pinned revision. Use Rust 1.96.0 and Haxe 4.3.7 to verify the emitted bindings.
