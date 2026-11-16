# Flight native producer patch

`manifest.json` pins the unmodified Flight base and ordered patches. These are
changes for review in Flight's Rust producer; they have not been merged upstream.
`tools/flight-source.mjs` applies them in an isolated checkout, verifies its exact
diff, and records patch SHA-256 identities in extern/native provenance.

`0001-native-artifacts.patch` makes the pinned producer usable by native Haxe:

- `flight-ffi` parses its generated Rust ABI with `syn` and emits a C header and
  HashLink registration/wrapper source. Both use the actual exported signatures;
  native SDK values cross the boundary as opaque pointers.
- Field getter and setter emission checks each symbol independently. A custom
  getter must not suppress a missing generated setter.
- The binding parser handles callback arrows without corrupting generic depth,
  fixed arrays of structs, optional integer sentinel widths, existing clock
  aliases, and opaque carriers for enums without `repr(u32)`. Four Rust tests
  protect the parser cases exposed during native integration.
- HL opaque handles and explicit callback/context carriers use `hl.Bytes`.
  cpp forwarding helpers use `extern inline`, and setter helpers return the
  supplied value after calling the native void setter.

The resulting Haxe files are copied unchanged. The consumer-side hxcpp macro
adds the generated header and disables reflection of raw pointer helpers.
There is no replacement Haxe implementation, local SDK, or CFFI bridge.

`0002-js-esm.patch` replaces the C ABI-shaped JS target with direct Flight ESM
bindings. It exposes and reuses `flight-compiler`'s TypeScript name conversion,
preserves original SDK names through native monomorphization, emits direct object
field access, and gives JS its logical arrays/callbacks/options in dispatch and
type methods. Synthetic native frees become GC no-ops. Three Rust tests cover
these changes, and `gate:web` executes real Flight modules from the pinned tree.

`0003-portable-module-names.patch` fixes nine case-only dispatch/type filename
collisions, including `Textureatlas`/`TextureAtlas` and `Motionpath`/`MotionPath`.
Windows and default macOS filesystems overwrite one file with the other, causing
the missing-type failures reported by both CI jobs. The producer consistently
uses the SDK type's canonical case in all backends and emits one dispatch module
containing its typedef and functions. Public facade imports now use `TextureAtlas`,
`MotionPath`, `MovieClip`, `Physics2DAbi`, `Physics3DAbi`, `QuadBatch`, `Scene2D`,
`Skeleton2D`, and `TextSegment`. FFI symbol names and native ABI are unchanged.
Two Rust regressions cover canonical names and the combined dispatch module;
intake, surface and ZIP checks also reject case-insensitive path collisions.

`0004-hl-packed-floats.patch` protects calls with more than six floating-point
arguments from HashLink's native argument spilling corruption. The producer
keeps the public Haxe API and core C ABI, but passes those values to the HL shim
in a `hl.NativeArray<Float>`. The shim unpacks them before calling the core FFI.
Both the matrix constructor and setter are exercised by installed hxcpp, HL and
Lime consumers; producer tests also cover the six-argument boundary.

`0005-bitmap-ownership.patch` clones an owned `Bitmap` argument from its borrowed
FFI handle before passing it into the SDK. `ptr::read` duplicated the bitmap's
pixel-buffer owner while leaving the caller's handle live. Region construction
and replacement now own independent storage, and releasing a region leaves the
caller's bitmap readable, writable and independently releasable. C and Haxe
smoke tests cover that lifetime sequence.

`0006-ref-handles.patch` gives every returned `Ref<T>` one owning handle with
typed views, including correctly coerced `Node`, `Node2D` and `Node3D` references.
Borrowed concrete receivers and runtime field access retain the appropriate
`RwLock` guard. The adapter distinguishes handles from ordinary owned value
pointers, and HL uses native accessors for fields of Ref-backed types.
`flight.Entity.freeRef` drops the handle and all its Arc views; its JS form is a
GC no-op. Rust tests verify hierarchy results, concrete receiver access and
weak-reference expiry after destruction. This changes native handle encoding;
regenerate externs and rebuild native binaries together.

`0007-byte-buffer-results.patch` gives owned `Vec<u8>` and `Box<[u8]>` results
an explicit data/length/copy/free ABI and emits `NativeByteBuffer` for cpp/HL.
Compression output can be fed back into decoders or copied to `haxe.io.Bytes`,
then disposed. Nullable decoder failures remain null. Empty borrowed slices
accept a null data pointer with length zero. Rust and consumer tests cover
binary round-trips, empty buffers, failure results and release; JS continues
to use the SDK's logical byte arrays.

`0008-exported-struct-fields.patch` includes types declared directly in a
glob-re-exported module and exposes public scalar and `String` fields. Native
string getters return owned UTF-8 byte buffers; generated Haxe accessors copy
and release them. Setters copy borrowed UTF-8 bytes into Rust. Ref-backed fields
keep their lock guards, and HL never reads Rust string layouts by offset.
Raw Rust identifiers and Haxe keyword field names retain their SDK spelling.
Tests cover `FontResource.family` mutation, getter copies surviving source
destruction, `ColorScaleBias` channels, glob discovery and JS keyword fields.
This does not add optional/nested field access, data-enum constructors, or the
generic signal callback ABI described in the main README.

## Applying upstream

Use Rust 1.96.0 and Haxe 4.3.7 on PATH, and a clean Flight checkout at the
manifest's exact base revision. Apply the
patches in order; later patches depend on the preceding producer changes:

```sh
git checkout 49c510e875461a9235b24ee846015ec1b47acd2a
git apply /path/to/flight-hx/patches/flight/0001-native-artifacts.patch
git apply /path/to/flight-hx/patches/flight/0002-js-esm.patch
git apply /path/to/flight-hx/patches/flight/0003-portable-module-names.patch
git apply /path/to/flight-hx/patches/flight/0004-hl-packed-floats.patch
git apply /path/to/flight-hx/patches/flight/0005-bitmap-ownership.patch
git apply /path/to/flight-hx/patches/flight/0006-ref-handles.patch
git apply /path/to/flight-hx/patches/flight/0007-byte-buffer-results.patch
git apply /path/to/flight-hx/patches/flight/0008-exported-struct-fields.patch
cargo test -p flight-bindgen --bin flight-bindgen
scripts/check-haxe-bindings.sh
```

The first patch covers native artifact emission and ABI correctness; the second
selects direct SDK ESM bindings rather than a C ABI-shaped JS module; the third
fixes portable naming for every target. Keep those review topics distinct.
Once changes land upstream, advance the pinned revision and remove the patches
that are included there. The local stack records reviewable producer work, not
a claim that upstream has already integrated it.
