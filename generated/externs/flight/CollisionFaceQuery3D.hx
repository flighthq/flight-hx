package flight;

#if hl

typedef CollisionFaceQuery3D = flight._hl.CollisionFaceQuery3D;

#elseif cpp

typedef CollisionFaceQuery3D = flight._cpp.CollisionFaceQuery3D;

#elseif (js && flight_esm)

typedef CollisionFaceQuery3D = flight._js.CollisionFaceQuery3D;

#elseif js

#error "flight.CollisionFaceQuery3D on js requires flight_esm."

#else

#error "flight.CollisionFaceQuery3D: no backend for this target."

#end
