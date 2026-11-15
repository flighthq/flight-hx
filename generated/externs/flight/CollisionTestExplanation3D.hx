package flight;

#if hl

typedef CollisionTestExplanation3D = flight._hl.CollisionTestExplanation3D;

#elseif cpp

typedef CollisionTestExplanation3D = flight._cpp.CollisionTestExplanation3D;

#elseif (js && flight_esm)

typedef CollisionTestExplanation3D = flight._js.CollisionTestExplanation3D;

#elseif js

#error "flight.CollisionTestExplanation3D on js requires flight_esm."

#else

#error "flight.CollisionTestExplanation3D: no backend for this target."

#end
