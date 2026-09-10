package flight;

// Public value type, unified over the active backend by conditional typedef.
// Structural where the backend is structural — Vector2 is never forced into a
// nominal class. The selector fails loud on an unsupported target.
#if flight_hx
typedef Vector2 = flight._hx.Vector2;
#elseif cpp
typedef Vector2 = flight._cpp.Vector2;
#elseif js
typedef Vector2 = flight._js.Vector2;
#else
#error "flight: no backend for this target — define flight_hx for the transpiled source, or target cpp/js."
#end
