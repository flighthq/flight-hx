package flight;

#if hl

typedef CollisionTestExplanation2D = flight._hl.CollisionTestExplanation2D;

#elseif cpp

typedef CollisionTestExplanation2D = flight._cpp.CollisionTestExplanation2D;

#elseif (js && flight_esm)

typedef CollisionTestExplanation2D = flight._js.CollisionTestExplanation2D;

#elseif js

#error "flight.CollisionTestExplanation2D on js requires flight_esm."

#else

#error "flight.CollisionTestExplanation2D: no backend for this target."

#end
