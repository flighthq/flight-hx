package flight;

#if hl

typedef CollisionHeightfield3D = flight._hl.CollisionHeightfield3D;

#elseif cpp

typedef CollisionHeightfield3D = flight._cpp.CollisionHeightfield3D;

#elseif (js && flight_esm)

typedef CollisionHeightfield3D = flight._js.CollisionHeightfield3D;

#elseif js

#error "flight.CollisionHeightfield3D on js requires flight_esm."

#else

#error "flight.CollisionHeightfield3D: no backend for this target."

#end
