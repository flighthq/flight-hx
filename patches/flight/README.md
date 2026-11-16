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
