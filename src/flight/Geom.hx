package flight;

// Public function facade: module-level FREE functions (so `import flight.Geom.*`
// yields unqualified, globally-searchable calls) whose `inline` bodies `#if`-dispatch
// to the active backend's hidden extern class. Types unify by typedef; functions
// unify by forwarder — the asymmetry is inherent (Haxe can alias a type, not a
// free function). `inline` makes the forwarder zero-cost.

inline function addVector2(a:Vector2, b:Vector2):Vector2 {
  #if flight_hx
  return flight._hx.Geom.addVector2(a, b);
  #elseif cpp
  return flight._cpp.Geom.addVector2(a, b);
  #elseif js
  return flight._js.Geom.addVector2(a, b);
  #else
  #error "flight: no backend";
  #end
}

inline function lengthVector2(a:Vector2):Float {
  #if flight_hx
  return flight._hx.Geom.lengthVector2(a);
  #elseif cpp
  return flight._cpp.Geom.lengthVector2(a);
  #elseif js
  return flight._js.Geom.lengthVector2(a);
  #else
  #error "flight: no backend";
  #end
}
