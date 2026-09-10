package flight;

// Public value type, unified over the active backend by conditional typedef.
// Structural where the backend is structural — Vector2 is never forced into a
// nominal class.
//
// The backend is chosen by *packaging pipeline*, not by raw target, because a
// host that owns its own output (Lime/Clay on web) reaches the `js` target
// without granting us the ESM-generator+bundler pipeline the `_js` binding
// assumes. So `js` alone never auto-selects `_js`:
//   flight_hx            -> transpiled Flight  (pure-VM targets; Lime/Clay web)
//   js && flight_esm     -> ESM Flight         (hostWeb: our ESM gen + bundler)
//   cpp                  -> flight-cpp externs (native; unambiguous)
// A bare `js` (no pipeline define) fails loud with the two web choices, rather
// than silently emitting non-tree-shakeable require()s into a foreign bundle.
#if flight_hx
typedef Vector2 = flight._hx.Vector2;
#elseif (js && flight_esm)
typedef Vector2 = flight._js.Vector2;
#elseif cpp
typedef Vector2 = flight._cpp.Vector2;
#elseif js
#error "flight on js: define flight_esm for the hostWeb ESM pipeline, or flight_hx for the transpiled fallback (e.g. Lime/Clay web)."
#else
#error "flight: no backend for this target — define flight_hx (transpiled), or target cpp / (js + flight_esm)."
#end
