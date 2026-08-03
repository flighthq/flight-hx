# Upstream `7333e825` Native Indexed-Read Bounds

Status: implemented and locally verified; independent native validation remains with review.

## Root cause and policy

The portable C++ smoke isolated a target-semantic mismatch in indexed reads. JavaScript returns `undefined` when an Array or typed-array index is outside its storage bounds, but hxcpp's raw `Array<Dynamic>` access returned a non-null default for the same read. The inherited `StaticIndexSmoke` therefore failed at `array out-of-bounds read was not nullish` after C++ had compiled and linked the complete corpus.

The repair is receiver-wide rather than fixture-specific:

- JavaScript keeps raw `source[key]` reads, including its property-key and fractional-index behavior.
- Every non-JavaScript `_StaticIndex` reader first applies the existing portable `Std.int` key conversion, then requires `0 <= index < length`. An invalid index returns `_Runtime.UNDEFINED`; native storage access occurs only after the check.
- The rule covers Array, Float32Array, Float64Array, Int8Array, Int16Array, Int32Array, Uint8Array, Uint8ClampedArray, Uint16Array, Uint32Array, and both admitted mixed receiver families.
- Dynamic `_Runtime.getIndex` applies the same bound before String, Array, maintained typed-array, or raw Lime typed-array access. Numeric key conversion remains inside those receiver branches, so ordinary string-keyed object reflection is unchanged.
- Writes are unchanged. This item repairs read semantics only.

Checked readers stay inline on hxcpp and the other portable production targets. Neko alone uses non-inline checked `_StaticIndex` readers: expanding the additional checks at all 6,249 static read sites exceeded the loader's function-scope stack limit in the full generated `CoreSmoke` module. The non-inline Neko form loads and passes; it does not change hxcpp's fast-path shape.

Negative smoke fixtures exercise high, negative, and dynamic indices across every reader, including the currently zero-production Int8Array endpoint. They also cover Array/Float32Array and Uint16Array/Uint32Array mixed receivers plus dynamic Array, typed-array, and String reads. Existing fractional-key, setter-result, storage-coercion, and evaluation-order fixtures remain active.

## Complete final-output census

Schema 10 records 6,249 statically lowered reads and 3,261 writes. Static reads route through the checked receiver endpoint unless the emitter itself owns an immediately dominating length guard.

| Receiver                   | Reads | Writes |
| -------------------------- | ----: | -----: |
| Array                      | 3,857 |    599 |
| Array or Float32Array      |     8 |     39 |
| Float32Array               | 1,568 |  2,078 |
| Float64Array               |    70 |     57 |
| Int16Array                 |     5 |      4 |
| Int32Array                 |    23 |     16 |
| Int8Array                  |     0 |      0 |
| Uint16Array                |    45 |     32 |
| Uint16Array or Uint32Array |    29 |      0 |
| Uint32Array                |    20 |     26 |
| Uint8Array                 |   267 |     35 |
| Uint8ClampedArray          |   357 |    375 |

The generated tree additionally contains 595 dynamic `_Runtime.getIndex` calls and 45 optional-index calls. Synthetic Array reads comprise 112 iteration bindings and 27 packed high-arity arguments; these remain checked because missing destructuring and argument elements must retain undefined semantics.

Exactly eight raw Array reads remain, all async-flow `for...of` value loads. Each is mechanically emitted after a same-block `index >= values.length` break guard, begins at index zero, and increments only in the guarded load. Schema 10 records these as `guardedArrayReads.asyncFlowForOfValues = 8`; the parallel guarded `for...in` key count is zero. Generator fixtures require the guard/read adjacency, direct syntax, and exact counters for both loop forms, so an unguarded new raw read cannot silently enter this class.

## Artifacts and verification

The runtime repair changes no generated Haxe file. Two complete generations and `npm run generate:check` retain the generated-tree hash. The JavaScript-only branches are also byte-identical to the inherited bundle.

| Artifact                   | SHA-256                                                            |
| -------------------------- | ------------------------------------------------------------------ |
| Generated `.hx` tree       | `60aee396833ef0875ff684ce4e2d23afc6d609f28886cb7585cd0c179dac2a3f` |
| `build/haxe-js/flight.cjs` | `92b23961a050e242265d361741f9c1627f5bdebade10c078a2aa3960aaf43c59` |

- The baseline `npm run test:portable:cpp` compiled and linked the full namespace, then failed the inherited out-of-bounds Array assertion with status 255.
- The candidate C++ run compiles, links, and passes `CoreSmoke`, including every new negative fixture.
- Full Neko `CoreSmoke` compiles and passes with the Neko-only non-inline reader form.
- Generator tests pass all 118 maintained cases, including positive and negative guarded-fast-path fixtures.
- Eval, JavaScript, Python, repository checks, and the secondary focused parity gate are recorded after the combined final verification.
