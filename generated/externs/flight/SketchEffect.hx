package flight;

#if hl

typedef SketchEffect = flight._hl.SketchEffect;

#elseif cpp

typedef SketchEffect = flight._cpp.SketchEffect;

#elseif (js && flight_esm)

typedef SketchEffect = flight._js.SketchEffect;

#elseif js

#error "flight.SketchEffect on js requires flight_esm."

#else

#error "flight.SketchEffect: no backend for this target."

#end
