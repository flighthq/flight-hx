package flight;

// Public function facade: module-level FREE functions (so a bare `import flight.Geom`
// yields unqualified, globally-searchable calls) whose `inline` bodies `#if`-dispatch
// to the active backend's hidden extern class. Types unify by typedef; functions
// unify by forwarder — the asymmetry is inherent (Haxe can alias a type, not a
// free function). `inline` makes the forwarder zero-cost.
//
// Backend selection is by packaging pipeline, mirroring flight.Vector2: flight_hx
// (transpiled), js+flight_esm (hostWeb ESM), cpp (flight-cpp). A bare js fails loud.

inline function addVector2(a:Vector2, b:Vector2):Vector2 {
  #if flight_hx
  return flight._hx.Geom.addVector2(a, b);
  #elseif (js && flight_esm)
  return flight._js.Geom.addVector2(a, b);
  #elseif cpp
  return flight._cpp.Geom.addVector2(a, b);
  #else
  #error "flight.Geom: no backend — define flight_hx, or js+flight_esm, or target cpp.";
  #end
}

inline function lengthVector2(a:Vector2):Float {
  #if flight_hx
  return flight._hx.Geom.lengthVector2(a);
  #elseif (js && flight_esm)
  return flight._js.Geom.lengthVector2(a);
  #elseif cpp
  return flight._cpp.Geom.lengthVector2(a);
  #else
  #error "flight.Geom: no backend — define flight_hx, or js+flight_esm, or target cpp.";
  #end
}
