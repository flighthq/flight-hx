package flight;

#if hl

typedef MorphShapeAnimationTarget = flight._hl.MorphShapeAnimationTarget;

#elseif cpp

typedef MorphShapeAnimationTarget = flight._cpp.MorphShapeAnimationTarget;

#elseif (js && flight_esm)

typedef MorphShapeAnimationTarget = flight._js.MorphShapeAnimationTarget;

#elseif js

#error "flight.MorphShapeAnimationTarget on js requires flight_esm."

#else

#error "flight.MorphShapeAnimationTarget: no backend for this target."

#end
